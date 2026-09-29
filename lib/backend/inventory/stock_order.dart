// In-stock-first ordering for every listing outside the home page.
//
// WHY THIS IS SEPARATE FROM THE CARDS
// -----------------------------------
// A product card resolves its own inventory document (it streams
// `inventory_id == product.product.inventoryId`) so it can grey itself out. The
// pages that assemble lists have no such luxury: they hold `ProductsRecord`s
// from a Firestore stream or from the search index and know nothing about
// stock. Ordering therefore has to happen where the list is built, which is
// what [AzyStockOrder] and `stock_service.dart` provide.
//
// Pure Dart, no Flutter and no Firebase imports: the ordering rule is the part
// worth testing, and it can be tested on the Dart VM without a binding.
// `stock_service.dart` is the file that talks to Firestore.

/// Orders listings so that available stock comes first.
abstract final class AzyStockOrder {
  /// True when [stock] units means the product cannot be bought.
  ///
  /// `null` is *not* sold out. Inventory documents are not guaranteed to exist
  /// for every product, and treating "unknown" as "sold out" would push the
  /// whole catalogue below the few products that happen to have one.
  static bool isSoldOut(int? stock) => stock != null && stock <= 0;

  /// [items] reordered in-stock first, sold-out last.
  ///
  /// STABLE, deliberately. Items inside each group keep the order they arrived
  /// in, so a listing that was already sorted by, say, `created_at` descending
  /// still reads newest-first within the available stock; only the sold-out
  /// rows move. A full re-sort here would silently discard whatever ordering
  /// the page had chosen.
  ///
  /// [inventoryIdOf] pulls the inventory key out of an item and
  /// [stockByInventoryId] maps those keys to units on hand. A key missing from
  /// the map counts as in stock — see [isSoldOut].
  static List<T> inStockFirst<T>(
    List<T> items,
    String Function(T) inventoryIdOf,
    Map<String, int> stockByInventoryId,
  ) {
    if (items.length < 2) {
      return List<T>.of(items);
    }

    final available = <T>[];
    final soldOut = <T>[];
    for (final item in items) {
      if (isSoldOut(stockByInventoryId[inventoryIdOf(item)])) {
        soldOut.add(item);
      } else {
        available.add(item);
      }
    }

    // Nothing to move, so hand back an untouched copy rather than a rebuild.
    if (soldOut.isEmpty) {
      return List<T>.of(items);
    }
    return <T>[...available, ...soldOut];
  }

  /// The inventory ids of [items], for a caller that needs to fetch stock.
  static List<String> inventoryIdsOf<T>(
    Iterable<T> items,
    String Function(T) inventoryIdOf,
  ) =>
      <String>{
        for (final item in items)
          if (inventoryIdOf(item).isNotEmpty) inventoryIdOf(item),
      }.toList(growable: false);

  /// [items] with the sold-out ones removed, order otherwise untouched.
  ///
  /// Used by the home page's rails, which hide what cannot be bought instead of
  /// greying it. An item whose stock is unknown is kept, for the same reason
  /// [isSoldOut] reports false for `null`: a missing inventory document is not
  /// evidence of an empty shelf.
  static List<T> inStockOnly<T>(
    List<T> items,
    String Function(T) inventoryIdOf,
    Map<String, int> stockByInventoryId,
  ) {
    final kept = <T>[];
    for (final item in items) {
      if (!isSoldOut(stockByInventoryId[inventoryIdOf(item)])) {
        kept.add(item);
      }
    }
    return kept;
  }
}
