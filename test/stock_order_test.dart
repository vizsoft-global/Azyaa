// Unit tests for the in-stock-first listing order.
//
// Pure Dart: no Flutter binding, no Firebase, no network. Run with
//   flutter test test/stock_order_test.dart
//
// The rule being pinned is the one the brief asked for: in-stock items come
// first on every listing, and sold-out items follow in their original order.

import 'package:azyaa/backend/inventory/stock_order.dart';
import 'package:flutter_test/flutter_test.dart';

/// Stand-in for a product, so the ordering rule can be tested without a
/// Firebase record.
class _Item {
  const _Item(this.id, this.inventoryId);

  final String id;
  final String inventoryId;
}

String _idOf(_Item item) => item.inventoryId;
List<String> _ids(List<_Item> items) => items.map((i) => i.id).toList();

void main() {
  const a = _Item('a', 'inv-a');
  const b = _Item('b', 'inv-b');
  const c = _Item('c', 'inv-c');
  const d = _Item('d', 'inv-d');

  group('isSoldOut', () {
    test('zero and negative stock are sold out', () {
      expect(AzyStockOrder.isSoldOut(0), isTrue);
      expect(AzyStockOrder.isSoldOut(-3), isTrue);
    });

    test('positive stock is available', () {
      expect(AzyStockOrder.isSoldOut(1), isFalse);
      expect(AzyStockOrder.isSoldOut(99), isFalse);
    });

    test('unknown stock is treated as available, not sold out', () {
      // Inventory documents are not guaranteed to exist for every product, so
      // "unknown" must not bury the catalogue.
      expect(AzyStockOrder.isSoldOut(null), isFalse);
    });
  });

  group('inStockFirst', () {
    test('moves sold-out items to the end', () {
      final ordered = AzyStockOrder.inStockFirst(
        [a, b, c],
        _idOf,
        {'inv-a': 3, 'inv-b': 0, 'inv-c': 7},
      );
      expect(_ids(ordered), ['a', 'c', 'b']);
    });

    test('keeps the order it was given within each group', () {
      // b and d are sold out; a, c, e are not. A stable pass must not disturb
      // the incoming order (here: newest first) inside either group.
      const e = _Item('e', 'inv-e');
      final ordered = AzyStockOrder.inStockFirst(
        [a, b, c, d, e],
        _idOf,
        {'inv-a': 1, 'inv-b': 0, 'inv-c': 1, 'inv-d': 0, 'inv-e': 1},
      );
      expect(_ids(ordered), ['a', 'c', 'e', 'b', 'd']);
    });

    test('an item whose stock is unknown stays with the available ones', () {
      final ordered = AzyStockOrder.inStockFirst(
        [a, b, c],
        _idOf,
        // inv-b missing entirely.
        {'inv-a': 0, 'inv-c': 2},
      );
      expect(_ids(ordered), ['b', 'c', 'a']);
    });

    test('a list with no sold-out items is returned as-is', () {
      final ordered = AzyStockOrder.inStockFirst(
        [a, b, c],
        _idOf,
        {'inv-a': 5, 'inv-b': 5, 'inv-c': 5},
      );
      expect(_ids(ordered), ['a', 'b', 'c']);
    });

    test('an all sold-out list keeps its order', () {
      final ordered = AzyStockOrder.inStockFirst(
        [a, b, c],
        _idOf,
        {'inv-a': 0, 'inv-b': 0, 'inv-c': 0},
      );
      expect(_ids(ordered), ['a', 'b', 'c']);
    });

    test('empty and single-item lists survive', () {
      expect(AzyStockOrder.inStockFirst(<_Item>[], _idOf, {}), isEmpty);
      expect(
        _ids(AzyStockOrder.inStockFirst([a], _idOf, {'inv-a': 0})),
        ['a'],
      );
    });

    test('does not mutate the list it was given', () {
      final input = [a, b, c];
      AzyStockOrder.inStockFirst(input, _idOf, {'inv-b': 0});
      expect(_ids(input), ['a', 'b', 'c']);
    });
  });

  group('inventoryIdsOf', () {
    test('deduplicates and drops empty ids', () {
      const noInventory = _Item('x', '');
      const alsoA = _Item('a2', 'inv-a');
      expect(
        AzyStockOrder.inventoryIdsOf([a, alsoA, noInventory, b], _idOf),
        ['inv-a', 'inv-b'],
      );
    });

    test('returns nothing for an empty list', () {
      expect(AzyStockOrder.inventoryIdsOf(<_Item>[], _idOf), isEmpty);
    });
  });

  group('inStockOnly', () {
    test('drops sold-out items and keeps the rest in order', () {
      // This is what the home page's rails do: a tile nobody can buy must not
      // take a slot from one they can.
      final kept = AzyStockOrder.inStockOnly(
        [a, b, c, d],
        _idOf,
        {'inv-a': 2, 'inv-b': 0, 'inv-c': 5, 'inv-d': -1},
      );
      expect(_ids(kept), ['a', 'c']);
    });

    test('keeps items whose stock is unknown', () {
      // No inventory document is not evidence of an empty shelf. Dropping these
      // would empty the rails of stock the app simply cannot see.
      final kept = AzyStockOrder.inStockOnly([a, b], _idOf, {'inv-a': 0});
      expect(_ids(kept), ['b']);
    });

    test('an all-in-stock list comes back whole', () {
      final kept = AzyStockOrder.inStockOnly(
        [a, b],
        _idOf,
        {'inv-a': 1, 'inv-b': 1},
      );
      expect(_ids(kept), ['a', 'b']);
    });

    test('does not mutate the list it was given', () {
      final input = [a, b];
      AzyStockOrder.inStockOnly(input, _idOf, {'inv-a': 0});
      expect(_ids(input), ['a', 'b']);
    });
  });
}
