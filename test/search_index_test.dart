// Unit tests for the scored search index.
//
// Pure Dart: no Flutter binding, no Firebase, no network. Run with
//   flutter test test/search_index_test.dart

import 'package:azyaa/backend/search/search_index.dart';
import 'package:azyaa/backend/search/search_models.dart';
import 'package:flutter_test/flutter_test.dart';

AzySearchDocument _product(
  String id,
  String title, {
  List<String> keywords = const [],
  bool inStock = true,
  int? stockCount,
  String subtitle = '',
}) =>
    AzySearchDocument(
      kind: AzySearchKind.product,
      id: id,
      title: title,
      subtitle: subtitle,
      keywords: keywords,
      inStock: inStock,
      stockCount: stockCount,
    );

AzySearchDocument _creator(String id, String title) => AzySearchDocument(
      kind: AzySearchKind.creator,
      id: id,
      title: title,
    );

AzySearchDocument _shop(String id, String title) => AzySearchDocument(
      kind: AzySearchKind.shop,
      id: id,
      title: title,
    );

void main() {
  // preferInStockFirst is global; never let one test leak into the next.
  setUp(() => AzySearchIndex.preferInStockFirst = true);
  tearDown(() => AzySearchIndex.preferInStockFirst = true);

  group('index basics', () {
    test('starts empty', () {
      final index = AzySearchIndex();
      expect(index.isEmpty, isTrue);
      expect(index.length, 0);
    });

    test('addAll and clear', () {
      final index = AzySearchIndex()
        ..addAll([_product('a', 'One'), _product('b', 'Two')]);
      expect(index.length, 2);
      index.clear();
      expect(index.isEmpty, isTrue);
    });

    test('an empty query returns nothing', () {
      final index = AzySearchIndex()..add(_product('a', 'Green Dress'));
      expect(index.search('').isEmpty, isTrue);
      expect(index.search('   ').isEmpty, isTrue);
    });

    test('an unrelated query returns nothing', () {
      final index = AzySearchIndex()..add(_product('a', 'Green Dress'));
      expect(index.search('zzzz').isEmpty, isTrue);
    });

    test('reports the candidate count it scanned', () {
      final index = AzySearchIndex()
        ..addAll([_product('a', 'Green Dress'), _product('b', 'Blue Top')]);
      expect(index.search('green').candidateCount, 2);
    });
  });

  group('grouping', () {
    test('splits hits by kind in enum order', () {
      final index = AzySearchIndex()
        ..add(_creator('c1', 'Green Studio'))
        ..add(_product('p1', 'Green Dress'))
        ..add(_shop('s1', 'Green Boutique'));

      final results = index.search('green');

      expect(results.groups.map((g) => g.kind).toList(), [
        AzySearchKind.product,
        AzySearchKind.shop,
        AzySearchKind.creator,
      ]);
      expect(results.of(AzySearchKind.product).single.title, 'Green Dress');
      expect(results.of(AzySearchKind.shop).single.title, 'Green Boutique');
      expect(results.of(AzySearchKind.creator).single.title, 'Green Studio');
      expect(results.total, 3);
    });

    test('omits kinds that produced no hits', () {
      final index = AzySearchIndex()..add(_product('p1', 'Green Dress'));
      final results = index.search('green');
      expect(results.groups, hasLength(1));
      expect(results.of(AzySearchKind.shop), isEmpty);
    });

    test('kinds filter restricts the search', () {
      final index = AzySearchIndex()
        ..add(_product('p1', 'Green Dress'))
        ..add(_creator('c1', 'Green Studio'));

      final results = index.search('green', kinds: {AzySearchKind.creator});

      expect(results.total, 1);
      expect(results.groups.single.kind, AzySearchKind.creator);
    });

    test('perKind caps each group', () {
      final index = AzySearchIndex()
        ..addAll(List.generate(5, (i) => _product('p$i', 'Dress $i')));

      expect(index.search('dress', perKind: 2).total, 2);
    });

    test('overall caps the total across groups', () {
      final index = AzySearchIndex()
        ..addAll(List.generate(5, (i) => _product('p$i', 'Dress $i')))
        ..addAll(List.generate(5, (i) => _shop('s$i', 'Dress Shop $i')));

      expect(index.search('dress', perKind: 5, overall: 3).total, 3);
    });
  });

  group('ranking', () {
    test('a title match outranks a keyword-only match', () {
      final index = AzySearchIndex()
        ..add(_product('byKeyword', 'Cotton Kurta', keywords: ['silk saree']))
        ..add(_product('byTitle', 'Silk Saree'));

      final hits = index.search('silk saree').of(AzySearchKind.product);

      expect(hits, hasLength(2));
      expect(hits.first.document.id, 'byTitle');
    });

    test('a shorter title wins an otherwise equal match', () {
      final index = AzySearchIndex()
        ..add(_product('long', 'Green Dress With Long Sleeves'))
        ..add(_product('short', 'Green Dress'));

      final hits = index.search('green dress').of(AzySearchKind.product);
      expect(hits.first.document.id, 'short');
    });

    test('a typo finds nothing, by design', () {
      // The engine used to answer this from one edit away. Typo tolerance was
      // removed on purpose: it returned rows for terms nobody typed.
      final index = AzySearchIndex()..add(_product('p1', 'Green Dress'));
      expect(index.search('drees').total, 0);
    });

    test('queries under three characters are refused', () {
      final index = AzySearchIndex()..add(_product('p1', 'Green Dress'));
      expect(index.search('gr').total, 0);
      expect(index.search('g').total, 0);
      expect(index.search('gree').total, 1);
    });

    test('a mid-word fragment finds the product', () {
      // "reen" and "ress" sit inside "green" and "dress" respectively.
      final index = AzySearchIndex()..add(_product('p1', 'Green Dress'));
      expect(index.search('reen').total, 1);
      expect(index.search('ress').total, 1);
    });

    test('a hidden keyword can find a product the name would not', () {
      final index = AzySearchIndex()
        ..add(_product('p1', 'Cotton Kurta', keywords: ['Zara']));
      expect(index.search('zara').total, 1);
    });

    test('results are deterministic across identical queries', () {
      final index = AzySearchIndex()
        ..addAll([
          _product('a', 'Dress A'),
          _product('b', 'Dress B'),
          _product('c', 'Dress C'),
        ]);

      final first = index.search('dress').of(AzySearchKind.product);
      final second = index.search('dress').of(AzySearchKind.product);
      expect(
        first.map((h) => h.document.id).toList(),
        second.map((h) => h.document.id).toList(),
      );
    });

    test('hits are ordered by descending score', () {
      final index = AzySearchIndex()
        ..add(_product('weak', 'Dress', keywords: ['x']))
        ..add(_product('strong', 'Dress'))
        ..add(_product('mid', 'A Dress'));

      final hits = index.search('dress').of(AzySearchKind.product);
      for (var i = 1; i < hits.length; i++) {
        expect(hits[i].score, lessThanOrEqualTo(hits[i - 1].score));
      }
    });
  });

  group('out-of-stock handling', () {
    AzySearchIndex build() => AzySearchIndex()
      ..add(_product('inStock', 'Green Dress', inStock: true, stockCount: 4))
      ..add(_product('soldOut', 'Green Dress', inStock: false, stockCount: 0));

    test('in-stock items rank first by default', () {
      final hits = build().search('green dress').of(AzySearchKind.product);
      expect(hits.first.document.id, 'inStock');
      expect(hits.last.document.id, 'soldOut');
    });

    test('out-of-stock items are still returned, not hidden', () {
      // Greying them out is the affordance; dropping them loses the sale once
      // the item is restocked.
      expect(build().search('green dress').total, 2);
    });

    test('preferInStockFirst = false pins them to the top instead', () {
      AzySearchIndex.preferInStockFirst = false;
      final hits = build().search('green dress').of(AzySearchKind.product);
      expect(hits.first.document.id, 'soldOut');
    });

    test('flipping the preference does not change any reported score', () {
      final before = build().search('green dress').of(AzySearchKind.product);
      final beforeScores = {
        for (final hit in before) hit.document.id: hit.score,
      };

      AzySearchIndex.preferInStockFirst = false;
      final after = build().search('green dress').of(AzySearchKind.product);
      final afterScores = {
        for (final hit in after) hit.document.id: hit.score,
      };

      expect(afterScores, beforeScores);
    });
  });

  group('performance', () {
    test('answers a 5,000-document index fast enough for per-keystroke use',
        () {
      final index = AzySearchIndex();
      const words = [
        'green', 'silk', 'cotton', 'dress', 'saree', 'kurta', 'shirt',
        'lehenga', 'jacket', 'blue', 'red', 'black', 'linen', 'wool', 'shawl',
      ];
      for (var i = 0; i < 5000; i++) {
        index.add(_product(
          'p$i',
          '${words[i % words.length]} ${words[(i * 7) % words.length]} '
          '${words[(i * 13) % words.length]} $i',
        ));
      }
      expect(index.length, 5000);

      const queries = ['green', 'silk dress', 'saree', 'linen shawl', 'gr'];

      // Warm up, so we measure steady-state scoring rather than first-call JIT.
      for (var i = 0; i < 3; i++) {
        for (final query in queries) {
          index.search(query);
        }
      }

      const rounds = 10;
      final stopwatch = Stopwatch()..start();
      for (var r = 0; r < rounds; r++) {
        for (final query in queries) {
          index.search(query);
        }
      }
      stopwatch.stop();

      final perQueryMicros =
          stopwatch.elapsedMicroseconds / (rounds * queries.length);
      // Reported so a regression shows up as a number, not just a red test.
      // ignore: avoid_print
      print('search_index: avg ${perQueryMicros.toStringAsFixed(0)}us/query '
          'over 5,000 documents');

      // Measured 3,970us here. The first implementation -- which re-normalized
      // and re-split every field, and allocated a Map plus a substring per
      // bigram -- measured 14,682us, i.e. a whole 60fps frame per keystroke.
      // 8,000us keeps ~2x headroom for slower devices while still failing
      // loudly if anyone reintroduces per-document allocation in the hot path.
      expect(
        perQueryMicros,
        lessThan(8000),
        reason: 'avg ${perQueryMicros.toStringAsFixed(0)}us/query over 5,000 '
            'documents; per-keystroke search must stay a small slice of a '
            '16.7ms frame',
      );
    });
  });
}
