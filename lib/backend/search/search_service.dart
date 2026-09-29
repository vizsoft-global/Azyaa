// Loads the searchable catalogue from Firestore and answers queries locally.
//
// REPLACES THE ALGOLIA PATH
// -------------------------
// `ProductsRecord.search` / `UsersRecord.search` only return rows when the
// Algolia indices are populated and in sync with Firestore. When they are not,
// search silently returns an empty list and the UI looks broken — which is the
// state this replaces. Everything here reads Firestore directly and scores in
// memory, so there is no index to fall out of sync and no network round-trip
// per keystroke.
//
// LOADING IS BEST-EFFORT PER SOURCE
// ---------------------------------
// Each of products / shops / creators loads in its own try block. A permission
// error or a missing composite index on one of them must not take the other two
// down, so a failure logs and yields an empty list. Search then returns whatever
// did load rather than nothing at all.

import 'dart:async';
import 'dart:developer';

import '/backend/backend.dart';
import 'search_index.dart';
import 'search_models.dart';

/// Loads, caches and queries the on-device search index.
class AzySearchService {
  AzySearchService._();

  static final AzySearchService instance = AzySearchService._();

  /// Caps on how much of each collection is pulled into memory.
  ///
  /// Search is only instant because the candidates are local, so these bound
  /// the memory and first-load cost. They are deliberately generous compared
  /// with the old `maxResults: 10` Algolia calls; raise them if the catalogue
  /// grows past them, and the index will simply search more.
  static const int productLimit = 300;
  static const int shopLimit = 150;
  static const int creatorLimit = 300;

  /// How long a loaded index is reused before a refresh is allowed.
  static const Duration cacheTtl = Duration(minutes: 10);

  /// `whereIn` accepts at most 30 values, so inventory lookups batch at this.
  static const int _whereInChunk = 30;

  final AzySearchIndex _index = AzySearchIndex();

  Future<void>? _inFlight;
  DateTime? _loadedAt;
  Object? _lastError;

  /// The live index. Safe to read before [ensureLoaded]; it is just empty.
  AzySearchIndex get index => _index;

  /// True once at least one source has produced documents.
  bool get isReady => _index.isNotEmpty;

  /// True while a load is running.
  bool get isLoading => _inFlight != null;

  /// The last load error, if any source failed. For diagnostics only.
  Object? get lastError => _lastError;

  /// True when the cache is fresh enough to reuse.
  bool get isFresh {
    final loadedAt = _loadedAt;
    if (loadedAt == null) {
      return false;
    }
    return DateTime.now().difference(loadedAt) < cacheTtl;
  }

  /// Loads the catalogue if needed, deduplicating concurrent callers.
  ///
  /// Call this from `initState`, then poll [isReady] / rebuild on completion.
  /// Awaiting it on every keystroke is fine: after the first call it returns
  /// immediately unless the cache has expired.
  Future<void> ensureLoaded({bool force = false}) {
    if (!force && isFresh) {
      return Future<void>.value();
    }
    final inFlight = _inFlight;
    if (inFlight != null) {
      return inFlight;
    }
    final future = _load().whenComplete(() => _inFlight = null);
    _inFlight = future;
    return future;
  }

  /// Discards the cache so the next [ensureLoaded] refetches.
  void invalidate() {
    _loadedAt = null;
    _index.clear();
  }

  /// Runs [query] against the loaded index.
  ///
  /// Synchronous on purpose: at ~4ms for 5,000 documents this is comfortably
  /// inside a frame, so it can run on every keystroke with no `FutureBuilder`
  /// flicker and no out-of-order results to reconcile.
  AzySearchResults search(
    String query, {
    Set<AzySearchKind>? kinds,
    int perKind = 20,
    int overall = 60,
  }) =>
      _index.search(
        query,
        kinds: kinds,
        perKind: perKind,
        overall: overall,
      );

  Future<void> _load() async {
    _lastError = null;
    final products = await _loadProducts();
    final shops = await _loadShops();
    final creators = await _loadCreators();
    final brandByProductId = _brandNameByProductId(shops);

    final documents = <AzySearchDocument>[
      ...products.documents,
      ...shops.documents,
      ...creators.documents,
    ];

    // Products get their shop's name as a subtitle and a searchable keyword, so
    // searching a shop finds the products it sells.
    final withBrands = <AzySearchDocument>[];
    for (final document in documents) {
      final brandName = brandByProductId[document.id];
      if (brandName == null || document.kind != AzySearchKind.product) {
        withBrands.add(document);
        continue;
      }
      withBrands.add(
        AzySearchDocument(
          kind: document.kind,
          id: document.id,
          title: document.title,
          subtitle: document.subtitle.isEmpty ? brandName : document.subtitle,
          imageUrl: document.imageUrl,
          keywords: [...document.keywords, brandName],
          inStock: document.inStock,
          stockCount: document.stockCount,
          payload: document.payload,
        ),
      );
    }

    _index
      ..clear()
      ..addAll(withBrands);
    _loadedAt = DateTime.now();
    log('AzySearch: indexed ${_index.length} documents '
        '(${products.documents.length} products, '
        '${shops.documents.length} shops, '
        '${creators.documents.length} creators)');
  }

  Future<_Loaded> _loadProducts() async {
    try {
      final records = await queryProductsRecordOnce(
        queryBuilder: (query) => query.where('status', isEqualTo: 'active'),
        limit: productLimit,
      );
      final stock = await _loadStockByInventoryId(records);
      return _Loaded(
        records.map((record) => _productDocument(record, stock)).toList(),
      );
    } catch (error, stackTrace) {
      log('AzySearch: product load failed: $error\n$stackTrace');
      _lastError = error;
      return _Loaded.empty;
    }
  }

  /// Stock, keyed by `inventory_id`.
  ///
  /// Best-effort: stock only affects *ranking* here, because the product card
  /// resolves its own inventory stream for the greyed-out treatment. So if this
  /// fails or an index is missing, search still works and just stops preferring
  /// in-stock items.
  Future<Map<String, int>> _loadStockByInventoryId(
    List<ProductsRecord> products,
  ) async {
    final inventoryIds = <String>{
      for (final product in products)
        if (product.product.inventoryId.isNotEmpty) product.product.inventoryId,
    }.toList(growable: false);
    if (inventoryIds.isEmpty) {
      return const {};
    }

    final stock = <String, int>{};
    for (var start = 0; start < inventoryIds.length; start += _whereInChunk) {
      var end = start + _whereInChunk;
      if (end > inventoryIds.length) {
        end = inventoryIds.length;
      }
      final chunk = inventoryIds.sublist(start, end);
      try {
        final records = await queryInventoryRecordOnce(
          queryBuilder: (query) => query.whereIn('inventory_id', chunk),
          limit: chunk.length,
        );
        for (final record in records) {
          stock[record.inventoryId] = record.stock;
        }
      } catch (error) {
        log('AzySearch: inventory lookup failed, stock will be unknown: $error');
        return stock;
      }
    }
    return stock;
  }

  AzySearchDocument _productDocument(
    ProductsRecord record,
    Map<String, int> stockByInventoryId,
  ) {
    final info = record.productInfo;
    final translate = record.productInfoTranslate;
    final customTranslate = record.productInfoCustomTranslate;

    final keywords = <String>[
      info.slug,
      info.shortDescription,
      translate.name.en,
      translate.name.ar,
      customTranslate.name.en,
      record.productType,
      record.product.productSku,
    ]..removeWhere((value) => value.trim().isEmpty);

    final stockCount = stockByInventoryId[record.product.inventoryId];

    return AzySearchDocument(
      kind: AzySearchKind.product,
      // Keyed on the business id so it lines up with `brand_product_id`, which
      // is how brands reference their products. Falls back to the doc id when
      // the business id is missing.
      id: record.productId.isNotEmpty ? record.productId : record.reference.id,
      title: _firstNonEmpty([
        info.name,
        translate.name.en,
        translate.name.ar,
        customTranslate.name.en,
        info.slug,
      ]),
      // Filled in from the brand map in _load().
      subtitle: '',
      imageUrl: _bestImage(info),
      keywords: keywords,
      // Unknown stock is treated as available, so a missing inventory document
      // does not silently bury every product behind "Out of stock".
      inStock: stockCount == null ? true : stockCount > 0,
      stockCount: stockCount,
      payload: record,
    );
  }

  /// Featured image, then icon, then the first gallery image.
  ///
  /// Mirrors the fallback order the product grid already uses.
  static String _bestImage(InfoStruct info) {
    if (info.featureImage.isNotEmpty) {
      return info.featureImage;
    }
    if (info.iconImage.isNotEmpty) {
      return info.iconImage;
    }
    if (info.galleryImage.isNotEmpty) {
      return info.galleryImage.first;
    }
    return '';
  }

  static String _firstNonEmpty(List<String> candidates) {
    for (final candidate in candidates) {
      final trimmed = candidate.trim();
      if (trimmed.isNotEmpty) {
        return trimmed;
      }
    }
    return '';
  }

  Future<_Loaded> _loadShops() async {
    try {
      final records = await queryBrandsRecordOnce(limit: shopLimit);
      return _Loaded(records.map(_shopDocument).toList());
    } catch (error, stackTrace) {
      log('AzySearch: shop load failed: $error\n$stackTrace');
      _lastError = error;
      return _Loaded.empty;
    }
  }

  AzySearchDocument _shopDocument(BrandsRecord record) {
    final info = record.brandInfo;
    final translate = record.brandInfoTranslate;
    final keywords = <String>[
      info.slug,
      info.shortDescription,
      translate.name.en,
      translate.name.ar,
    ]..removeWhere((value) => value.trim().isEmpty);

    return AzySearchDocument(
      kind: AzySearchKind.shop,
      id: record.brandId.isNotEmpty ? record.brandId : record.reference.id,
      title: _firstNonEmpty([info.name, translate.name.en, info.slug]),
      subtitle: info.shortDescription,
      imageUrl: _bestImage(info),
      keywords: keywords,
      payload: record,
    );
  }

  Future<_Loaded> _loadCreators() async {
    try {
      final records = await queryUsersRecordOnce(
        queryBuilder: (query) => query
            .where('status', isEqualTo: 'Published')
            .where('user_role', isEqualTo: 'Creator'),
        limit: creatorLimit,
      );
      return _Loaded(records.map(_creatorDocument).toList());
    } catch (error, stackTrace) {
      log('AzySearch: creator load failed: $error\n$stackTrace');
      _lastError = error;
      return _Loaded.empty;
    }
  }

  AzySearchDocument _creatorDocument(UsersRecord record) {
    final info = record.creatorMainInfo.creatorInfo;

    // Handles and category names matter here: people search creators by the
    // @handle they saw on Instagram or TikTok, not by their display name.
    final keywords = <String>[
      record.userName,
      info.name,
      info.bio,
      info.instagramProfile,
      info.tiktokHandle,
      info.youtubeChannel,
      info.location,
      ...info.contentCategory,
    ]..removeWhere((value) => value.trim().isEmpty);

    return AzySearchDocument(
      kind: AzySearchKind.creator,
      id: record.uid.isNotEmpty ? record.uid : record.reference.id,
      title: _firstNonEmpty([
        record.displayName,
        info.name,
        record.userName,
      ]),
      subtitle: record.userName.isNotEmpty ? '@${record.userName}' : info.bio,
      imageUrl: record.photoUrl.isNotEmpty ? record.photoUrl : info.brandPhoto,
      keywords: keywords,
      payload: record,
    );
  }

  /// Shop name per product id, built from each brand's `brand_product_id`.
  ///
  /// This is what lets one query return a shop *and* the products it sells.
  static Map<String, String> _brandNameByProductId(_Loaded shops) {
    final byProductId = <String, String>{};
    for (final document in shops.documents) {
      final payload = document.payload;
      if (payload is! BrandsRecord || document.title.isEmpty) {
        continue;
      }
      for (final productId in payload.brandProductId) {
        if (productId.isNotEmpty) {
          byProductId.putIfAbsent(productId, () => document.title);
        }
      }
    }
    return byProductId;
  }
}

/// Documents produced by one catalogue source load.
class _Loaded {
  const _Loaded(this.documents);

  static const _Loaded empty = _Loaded([]);

  final List<AzySearchDocument> documents;
}
