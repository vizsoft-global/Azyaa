// Unit tests for recent-search persistence.
//
// Uses shared_preferences' in-memory mock, so the full read/write lifecycle is
// exercised with no platform channel and no device storage.

import 'package:azyaa/backend/search/search_history.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('clean', () {
    test('trims and collapses internal whitespace', () {
      expect(AzySearchHistory.clean('  silk   saree  '), 'silk saree');
      expect(AzySearchHistory.clean('a\t\nb'), 'a b');
    });

    test('caps the length', () {
      final long = 'x' * 200;
      expect(
        AzySearchHistory.clean(long).length,
        AzySearchHistory.maxTermLength,
      );
    });

    test('an all-whitespace term becomes empty', () {
      expect(AzySearchHistory.clean('   '), '');
    });
  });

  group('matching', () {
    test('filters case-insensitively as a substring', () {
      const stored = ['Silk Saree', 'Green Dress', 'Lehenga'];
      expect(AzySearchHistory.matching(stored, 'dr'), ['Green Dress']);
      expect(AzySearchHistory.matching(stored, 'SILK'), ['Silk Saree']);
    });

    test('an empty query matches nothing', () {
      expect(AzySearchHistory.matching(const ['Silk'], '  '), isEmpty);
    });
  });

  group('scopeForCreator', () {
    test('isolates each creator', () {
      expect(
        AzySearchHistory.scopeForCreator('abc'),
        isNot(AzySearchHistory.scopeForCreator('xyz')),
      );
      // And never collides with the listing-level scopes.
      expect(
        AzySearchHistory.keyFor(AzySearchHistory.scopeForCreator('abc')),
        isNot(AzySearchHistory.keyFor(AzySearchHistory.scopeCreators)),
      );
    });
  });

  group('persistence', () {
    test('starts empty', () async {
      expect(await AzySearchHistory.recent(AzySearchHistory.scopeShop), isEmpty);
    });

    test('records most recent first', () async {
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'silk');
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'linen');
      expect(
        await AzySearchHistory.recent(AzySearchHistory.scopeShop),
        ['linen', 'silk'],
      );
    });

    test('repeating a term moves it to the front instead of duplicating',
        () async {
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'silk');
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'linen');
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'silk');
      expect(
        await AzySearchHistory.recent(AzySearchHistory.scopeShop),
        ['silk', 'linen'],
      );
    });

    test('deduplicates case-insensitively', () async {
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'Silk');
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'silk');
      expect(await AzySearchHistory.recent(AzySearchHistory.scopeShop),
          hasLength(1));
    });

    test('ignores blank terms', () async {
      await AzySearchHistory.record(AzySearchHistory.scopeShop, '   ');
      expect(await AzySearchHistory.recent(AzySearchHistory.scopeShop), isEmpty);
    });

    test('caps the list at maxEntries, keeping the newest', () async {
      for (var i = 0; i < AzySearchHistory.maxEntries + 5; i++) {
        await AzySearchHistory.record(AzySearchHistory.scopeShop, 'term$i');
      }
      final stored = await AzySearchHistory.recent(AzySearchHistory.scopeShop);
      expect(stored, hasLength(AzySearchHistory.maxEntries));
      expect(stored.first, 'term${AzySearchHistory.maxEntries + 4}');
      expect(stored.contains('term0'), isFalse);
    });

    test('removes one term', () async {
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'silk');
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'linen');
      await AzySearchHistory.remove(AzySearchHistory.scopeShop, 'SILK');
      expect(
        await AzySearchHistory.recent(AzySearchHistory.scopeShop),
        ['linen'],
      );
    });

    test('clears a scope', () async {
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'silk');
      await AzySearchHistory.clear(AzySearchHistory.scopeShop);
      expect(await AzySearchHistory.recent(AzySearchHistory.scopeShop), isEmpty);
    });

    test('scopes do not leak into each other', () async {
      await AzySearchHistory.record(AzySearchHistory.scopeShop, 'silk');
      await AzySearchHistory.record(AzySearchHistory.scopeCreators, 'amina');
      expect(
        await AzySearchHistory.recent(AzySearchHistory.scopeShop),
        ['silk'],
      );
      expect(
        await AzySearchHistory.recent(AzySearchHistory.scopeCreators),
        ['amina'],
      );
    });
  });
}
