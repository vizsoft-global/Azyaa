// Caches product stock so listings can be ordered in-stock first.
//
// WHY A CACHE
// -----------
// Ordering a listing means knowing the stock of every product in it, and the
// cards cannot supply that: each card streams only its own inventory document.
// So the page reads them in one batched lookup, keyed by `inventory_id`, and
// this holds the result across rebuilds and across pages so scrolling a grid
// does not issue a query per frame.
//
// `whereIn` accepts at most 30 values, so requests are chunked.
//
// STALENESS IS ACCEPTABLE HERE
// ----------------------------
// A card greys itself out from a live stream of its own inventory document, so
// the "out of stock" treatment is always current. This cache only decides a
// product's *position* in a list, and a product that sells out while a page is
// open can sit one row too high until the next load — not worth a query per
// rebuild.

import 'dart:developer';

import 'package:flutter/widgets.dart';

import '/backend/backend.dart';
import 'stock_order.dart';

/// Looks up and caches stock by `inventory_id`.
///
/// Listenable, deliberately: a listing that orders or filters by stock has to
/// rebuild when the lookup lands, and a Firestore stream will not re-emit just
/// because stock was learned. Listeners are notified at most once per frame
/// while new stock arrives, so a grid learning twenty products does not rebuild
/// twenty times.
class AzyInventoryStock extends ChangeNotifier {
  AzyInventoryStock._();

  static final AzyInventoryStock instance = AzyInventoryStock._();

  /// `whereIn` accepts at most 30 values.
  static const int _whereInChunk = 30;

  /// How long a lookup is reused before the next [ensureLoaded] refetches.
  static const Duration cacheTtl = Duration(minutes: 5);

  final Map<String, int> _stock = {};

  /// Ids already looked up, so a product with no inventory document is not
  /// re-queried on every rebuild.
  final Set<String> _known = {};

  Future<void>? _inFlight;
  DateTime? _loadedAt;
  bool _notifyScheduled = false;

  /// Stock by `inventory_id`. Safe to read at any time; starts empty.
  ///
  /// Handed out directly rather than copied, because list builders read it on
  /// every rebuild and copying would allocate the whole map per frame. Treat it
  /// as read-only.
  Map<String, int> get snapshot => _stock;

  /// True when the cache is young enough to keep using.
  bool get isFresh {
    final loadedAt = _loadedAt;
    if (loadedAt == null) {
      return false;
    }
    return DateTime.now().difference(loadedAt) < cacheTtl;
  }

  /// Makes sure every id in [inventoryIds] has been looked up.
  ///
  /// Deduplicates concurrent callers, so several pages opening at once share
  /// one round of queries rather than racing.
  Future<void> ensureLoaded(Iterable<String> inventoryIds) {
    final wanted = <String>[
      for (final id in inventoryIds)
        if (id.isNotEmpty && !_known.contains(id)) id,
    ];
    if (wanted.isEmpty) {
      return Future<void>.value();
    }

    final inFlight = _inFlight;
    if (inFlight != null) {
      return inFlight;
    }
    final future = _load(wanted).whenComplete(() => _inFlight = null);
    _inFlight = future;
    return future;
  }

  /// Discards everything, so the next [ensureLoaded] refetches.
  void invalidate() {
    _stock.clear();
    _known.clear();
    _loadedAt = null;
  }

  /// [items] ordered in-stock first, starting a lookup for anything unknown.
  ///
  /// One call for a list built during a build pass: [ensureLoaded] warms the
  /// cache for the next rebuild, and whatever is already known is applied now.
  /// The cards rendering these same products publish their stock through
  /// [noteStock], so most of the cache is populated without a query at all.
  ///
  /// Items whose stock is still unknown keep their position, because
  /// [AzyStockOrder.isSoldOut] reports false for `null`.
  List<T> orderInStockFirst<T>(
    List<T> items,
    String Function(T) inventoryId,
  ) {
    ensureLoaded(AzyStockOrder.inventoryIdsOf(items, inventoryId));
    return AzyStockOrder.inStockFirst(items, inventoryId, _stock);
  }

  /// Records stock a card has already streamed for itself.
  ///
  /// This is how the cache fills at no extra cost: every card subscribes to its
  /// own inventory document for its tint and badge, so a page-level filter can
  /// read what those subscriptions have already learned instead of issuing a
  /// query of its own.
  ///
  /// Deliberately does NOT notify listeners. It is called from `build`, during a
  /// frame, and notifying there would schedule a rebuild from inside one. A
  /// `null` [stock] means "no inventory document" and is ignored, which leaves
  /// the id unknown and therefore treated as available.
  void noteStock(String inventoryId, int? stock) {
    if (inventoryId.isEmpty || stock == null) {
      return;
    }
    _stock[inventoryId] = stock;
    _known.add(inventoryId);
    _scheduleNotify();
  }

  /// Coalesces a listener notification to the end of the current frame.
  ///
  /// [noteStock] is called from `build`, where notifying would mean scheduling a
  /// rebuild from inside one. Deferring to after the frame is both legal and
  /// cheaper: a grid that learns twenty products' stock in one frame notifies
  /// its listeners once, not twenty times.
  void _scheduleNotify() {
    if (_notifyScheduled) {
      return;
    }
    _notifyScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyScheduled = false;
      notifyListeners();
    });
  }

  Future<void> _load(List<String> wanted) async {
    for (var start = 0; start < wanted.length; start += _whereInChunk) {
      var end = start + _whereInChunk;
      if (end > wanted.length) {
        end = wanted.length;
      }
      final chunk = wanted.sublist(start, end);
      try {
        final records = await queryInventoryRecordOnce(
          queryBuilder: (query) => query.whereIn('inventory_id', chunk),
          limit: chunk.length,
        );
        for (final record in records) {
          _stock[record.inventoryId] = record.stock;
        }
      } catch (error) {
        // Ranking only. A failed lookup leaves those products counted as in
        // stock (see AzyStockOrder.isSoldOut) rather than failing the page, and
        // they are not marked known, so the next call retries them.
        log('AzyInventoryStock: lookup failed, stock will be unknown: $error');
        return;
      }
      // Marked known even when no document came back, so a product with no
      // inventory row is not queried again forever.
      _known.addAll(chunk);
    }
    _loadedAt = DateTime.now();
    _scheduleNotify();
  }
}

/// Waits for the stock of [products], then returns them unchanged.
///
/// Use it to gate a page's product query: `queryProductsRecordOnce(...)
/// .then(azyWithStockLoaded)`. Ordering and hiding happen while the list is
/// built, so the lookup has to finish first.
///
/// WITHOUT THIS THERE IS AN EMPTY SLOT. The rail paints with every product, the
/// sold-out cards hide themselves, and the parent keeps the cells those cards
/// reserved -- a hole in the row that nothing ever fills, because no rebuild
/// reaches the parent once the stock arrives. Filtering a list that is already
/// laid out cannot put a cell back.
Future<List<ProductsRecord>> azyWithStockLoaded(
  List<ProductsRecord> products,
) async {
  await AzyInventoryStock.instance.ensureLoaded(
    AzyStockOrder.inventoryIdsOf(products, (p) => p.product.inventoryId),
  );
  return products;
}
