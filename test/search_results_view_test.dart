// Render tests for the grouped search results view.
//
// These pump the real widget with synthetic results, so the section layout,
// ordering, callbacks and empty states are exercised without Firebase.
//
// The product section is NOT rendered here: ProductGridWidget depends on
// Firestore and FFAppState, so pumping it would test the mock setup rather than
// the grouping logic. What is asserted instead is that a product hit whose
// payload is not a ProductsRecord degrades to an empty box rather than
// throwing, which is the guard that section relies on.

import 'package:azyaa/backend/search/search.dart';
import 'package:azyaa/custom_code/widgets/azy_search_results.dart';
import 'package:azyaa/flutter_flow/internationalization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

AzySearchHit _hit(
  AzySearchKind kind,
  String id,
  String title, {
  String subtitle = '',
  Object? payload,
}) =>
    AzySearchHit(
      document: AzySearchDocument(
        kind: kind,
        id: id,
        title: title,
        subtitle: subtitle,
        payload: payload,
      ),
      score: 1.0,
    );

AzySearchResults _results(List<AzySearchGroup> groups) =>
    AzySearchResults(query: 'x', groups: groups);

Future<void> _pump(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: const [FFLocalizationsDelegate()],
      supportedLocales: const [Locale('en')],
      home: Scaffold(body: SingleChildScrollView(child: child)),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('recent searches', () {
    testWidgets('shows chips when the query is empty', (tester) async {
      await _pump(
        tester,
        AzySearchResultsView(
          results: AzySearchResults.empty,
          query: '',
          recent: const ['silk saree', 'green dress'],
        ),
      );

      expect(find.text('silk saree'), findsOneWidget);
      expect(find.text('green dress'), findsOneWidget);
    });

    testWidgets('renders nothing when there is no history', (tester) async {
      await _pump(
        tester,
        AzySearchResultsView(results: AzySearchResults.empty, query: ''),
      );

      expect(find.byType(InputChip), findsNothing);
      expect(find.byIcon(Icons.history), findsNothing);
    });

    testWidgets('tapping a chip reports the term', (tester) async {
      String? tapped;
      await _pump(
        tester,
        AzySearchResultsView(
          results: AzySearchResults.empty,
          query: '',
          recent: const ['silk'],
          onRecentSelected: (term) => tapped = term,
        ),
      );

      await tester.tap(find.text('silk'));
      await tester.pump();
      expect(tapped, 'silk');
    });
  });

  group('grouping', () {
    testWidgets('renders only the groups that have hits', (tester) async {
      await _pump(
        tester,
        AzySearchResultsView(
          results: _results([
            AzySearchGroup(
              kind: AzySearchKind.shop,
              hits: [_hit(AzySearchKind.shop, 's1', 'Zara', subtitle: 'Brand')],
            ),
          ]),
          query: 'zara',
        ),
      );

      expect(find.text('Shops'), findsOneWidget);
      expect(find.text('Zara'), findsOneWidget);
      // No products or creators in this result, so neither header may appear.
      expect(find.text('Products'), findsNothing);
      expect(find.text('Creators'), findsNothing);
    });

    testWidgets('orders sections Shops before Creators', (tester) async {
      await _pump(
        tester,
        AzySearchResultsView(
          results: _results([
            AzySearchGroup(
              kind: AzySearchKind.shop,
              hits: [_hit(AzySearchKind.shop, 's1', 'Zara')],
            ),
            AzySearchGroup(
              kind: AzySearchKind.creator,
              hits: [_hit(AzySearchKind.creator, 'c1', 'Amina')],
            ),
          ]),
          query: 'a',
        ),
      );

      expect(
        tester.getTopLeft(find.text('Shops')).dy,
        lessThan(tester.getTopLeft(find.text('Creators')).dy),
        reason: 'Shops must render above Creators.',
      );
    });

    testWidgets('shows the hit count beside each heading', (tester) async {
      await _pump(
        tester,
        AzySearchResultsView(
          results: _results([
            AzySearchGroup(
              kind: AzySearchKind.shop,
              hits: [
                _hit(AzySearchKind.shop, 's1', 'Zara'),
                _hit(AzySearchKind.shop, 's2', 'H and M'),
              ],
            ),
          ]),
          query: 'a',
        ),
      );

      expect(find.text('Shops'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('tapping a shop narrows rather than navigating',
        (tester) async {
      String? chosen;
      await _pump(
        tester,
        AzySearchResultsView(
          results: _results([
            AzySearchGroup(
              kind: AzySearchKind.shop,
              hits: [_hit(AzySearchKind.shop, 's1', 'Zara')],
            ),
          ]),
          query: 'zara',
          onShopSelected: (name) => chosen = name,
        ),
      );

      await tester.tap(find.text('Zara'));
      await tester.pump();
      expect(chosen, 'Zara');
    });
  });

  group('degraded input', () {
    testWidgets('a product hit without a record does not throw',
        (tester) async {
      await _pump(
        tester,
        AzySearchResultsView(
          results: _results([
            AzySearchGroup(
              kind: AzySearchKind.product,
              hits: [_hit(AzySearchKind.product, 'p1', 'Silk Saree')],
            ),
          ]),
          query: 'silk',
        ),
      );

      // The section header still renders even though the card cannot.
      expect(find.text('Products'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('no matches explains itself and echoes the query',
        (tester) async {
      await _pump(
        tester,
        AzySearchResultsView(
          results: AzySearchResults.empty,
          query: 'zzzz',
        ),
      );

      expect(find.textContaining('zzzz'), findsWidgets);
      expect(find.byIcon(Icons.search_off), findsOneWidget);
    });
  });
}
