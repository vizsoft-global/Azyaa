import 'dart:io';

import 'package:azyaa/backend/shortlist/shortlist_content.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AzyShortlistKind kind(String? chosen) => azyShortlistKindFor(
        chosen,
        designerLabel: 'Designer',
        creatorLabel: 'Creator',
        productLabel: 'Product',
      );

  group('which chip is picked', () {
    test('matches the translated label, not a fixed English word', () {
      expect(kind('Designer'), AzyShortlistKind.designer);
      expect(kind('Creator'), AzyShortlistKind.creator);
      expect(kind('Product'), AzyShortlistKind.product);
      expect(
        azyShortlistKindFor('مصمّم',
            designerLabel: 'مصمّم',
            creatorLabel: 'المبدعين',
            productLabel: 'المنتج'),
        AzyShortlistKind.designer,
      );
      expect(
        azyShortlistKindFor('المنتج',
            designerLabel: 'مصمّم',
            creatorLabel: 'المبدعين',
            productLabel: 'المنتج'),
        AzyShortlistKind.product,
      );
    });

    test('All, nothing picked and anything unknown show everything', () {
      expect(kind('All'), AzyShortlistKind.all);
      expect(kind(null), AzyShortlistKind.all);
      expect(kind('  '), AzyShortlistKind.all);
      expect(kind('الكل'), AzyShortlistKind.all);
    });
  });

  group('what is shown', () {
    const saved = <AzySavedItem>[
      (id: 'AZYPRD1', type: 'product'),
      (id: 'AZYPRD2', type: null),
      (id: 'AZYPRD1', type: 'product'),
      (id: '', type: 'product'),
      (id: 'x', type: 'designer'),
    ];

    test('All shows saved products and followed designers and creators', () {
      final content = azyShortlistContent(
        kind: AzyShortlistKind.all,
        saved: saved,
        followedDesigners: ['d1', 'd2', 'd1', null, ''],
        followedCreators: ['c1'],
      );
      expect(content.productIds, ['AZYPRD1', 'AZYPRD2']);
      expect(content.designerIds, ['d1', 'd2']);
      expect(content.creatorIds, ['c1']);
      expect(content.isEmpty, isFalse);
    });

    test('each chip shows only its own kind', () {
      AzyShortlistContent only(AzyShortlistKind k) => azyShortlistContent(
            kind: k,
            saved: saved,
            followedDesigners: ['d1'],
            followedCreators: ['c1'],
          );
      expect(only(AzyShortlistKind.product).designerIds, isEmpty);
      expect(only(AzyShortlistKind.product).creatorIds, isEmpty);
      expect(only(AzyShortlistKind.product).productIds, hasLength(2));
      expect(only(AzyShortlistKind.designer).designerIds, ['d1']);
      expect(only(AzyShortlistKind.designer).productIds, isEmpty);
      expect(only(AzyShortlistKind.creator).creatorIds, ['c1']);
      expect(only(AzyShortlistKind.creator).designerIds, isEmpty);
    });

    test('nothing saved is empty', () {
      final content = azyShortlistContent(
        kind: AzyShortlistKind.all,
        saved: const [],
        followedDesigners: const [],
        followedCreators: const [],
      );
      expect(content.isEmpty, isTrue);
    });
  });

  group('loading', () {
    test('ids are looked up in groups of thirty', () {
      final ids = [for (var i = 0; i < 65; i++) 'p$i'];
      final chunks = azyChunks(ids);
      expect(chunks.map((c) => c.length), [30, 30, 5]);
      expect(chunks.expand((c) => c), ids);
      expect(azyChunks(const []), isEmpty);
    });

    test('found items keep the saved order and missing ones leave no gap', () {
      expect(
        azyInSavedOrder(['a', 'b', 'c', 'd'], {'d': 4, 'b': 2}),
        [2, 4],
      );
      expect(azyInSavedOrder<int>(['a'], const {}), isEmpty);
    });
  });

  group('wiring', () {
    final page = File(
            'lib/azyaa_group_a/customer/zone/shortlist/shortlist_widget.dart')
        .readAsStringSync();
    final body =
        File('lib/custom_code/widgets/azy_shortlist_body.dart').readAsStringSync();

    test('the screen renders the shortlist body and reloads on pull', () {
      expect(page.contains('AzyShortlistBody('), isTrue);
      expect(page.contains('refreshTick: _azyRefreshTick'), isTrue);
      expect(page.contains('_azyRefreshTick++'), isTrue);
    });

    test('the mock designer tile and fixed English chip words are gone', () {
      expect(page.contains('DesignerGridWidget'), isFalse);
      expect(page.contains("'Product') {"), isFalse);
      expect(page.contains("== 'designer'"), isFalse);
    });

    test('designers and creators come from the follow lists', () {
      expect(body.contains('userDesignerFollowing'), isTrue);
      expect(body.contains('userCreatorFollowing'), isTrue);
      expect(body.contains('DesignerWidget.routeName'), isTrue);
      expect(body.contains('CreatorsIndividualWidget.routeName'), isTrue);
    });

    test('only products that are on sale are shown', () {
      expect(body.contains("row.status == 'active'"), isTrue);
    });
  });
}
