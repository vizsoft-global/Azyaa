// Tests for pull to refresh and load more on scroll (plan item "Scroll
// Refresh").
//
// Three halves:
//   * a pure half for AzyPager, which decides how much of a list is shown,
//   * a render half that pumps AzyScrollRefresh and performs the gestures,
//   * a source half for the wiring. The Shop page already had a
//     RefreshIndicator, but around a shrink-wrapped grid nested inside the
//     page's scroll view, where it can never fire. That compiled and ran, so
//     the wiring is asserted here rather than left to the analyzer.
//
// Run with: flutter test test/scroll_refresh_test.dart

import 'dart:async';
import 'dart:io';

import 'package:azyaa/custom_code/widgets/azy_scroll_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Every page that got pull to refresh, with how many scroll views it wraps
/// (one per tab on the tabbed pages).
const Map<String, int> _refreshPages = {
  'lib/azyaa_group_a/home/main/home/home_widget.dart': 1,
  'lib/azyaa_group_a/home/main/shop/shop_widget.dart': 1,
  'lib/azyaa_group_a/home/main/product_list/product_list_widget.dart': 1,
  'lib/azyaa_group_a/home/main/home_search/home_search_widget.dart': 1,
  'lib/azyaa_group_a/customer/zone/wishlist/wishlist_widget.dart': 1,
  'lib/azyaa_group_a/customer/zone/shortlist/shortlist_widget.dart': 1,
  'lib/azyaa_group_a/customer/order/orders/orders_widget.dart': 3,
  'lib/azyaa_group_b/designer/designers_list/designers_list_widget.dart': 5,
  'lib/azyaa_group_b/designer/stores_list/stores_list_widget.dart': 1,
  'lib/azyaa_group_b/creator/creators/creators_widget.dart': 1,
  'lib/azyaa_group_b/designer/designer/designer_widget.dart': 1,
};

/// Pages whose product list is shown a page at a time, with how many list
/// variants read the pager.
const Map<String, int> _pagedPages = {
  'lib/azyaa_group_a/home/main/product_list/product_list_widget.dart': 8,
  'lib/azyaa_group_a/home/main/shop/shop_widget.dart': 1,
  'lib/azyaa_group_b/designer/designer/designer_widget.dart': 1,
};

const String _homeFile = 'lib/azyaa_group_a/home/main/home/home_widget.dart';

String _read(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: '$path is missing');
  return file.readAsStringSync();
}

int _count(String source, String needle) => needle.allMatches(source).length;

/// A page-like scroll view with [rows] rows of 100 px inside the wrapper.
Widget _page({
  required Future<void> Function() onRefresh,
  VoidCallback? onNearEnd,
  int rows = 30,
  Widget? extra,
}) {
  return MaterialApp(
    home: Scaffold(
      body: AzyScrollRefresh(
        onRefresh: onRefresh,
        onNearEnd: onNearEnd,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              if (extra != null) extra,
              for (var i = 0; i < rows; i++)
                SizedBox(height: 100.0, child: Text('row $i')),
            ],
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('AzyPager', () {
    test('shows one page of a long list', () {
      final pager = AzyPager(pageSize: 20);
      final all = List<int>.generate(55, (i) => i);
      expect(pager.window(all), all.sublist(0, 20));
      expect(pager.total, 55);
      expect(pager.hasMore, isTrue);
    });

    test('a short list comes back whole, with nothing more to load', () {
      final pager = AzyPager(pageSize: 20);
      final all = List<int>.generate(7, (i) => i);
      expect(pager.window(all), all);
      expect(pager.hasMore, isFalse);
      expect(pager.loadMore(), isFalse);
      expect(pager.shown, 20);
    });

    test('an empty list stays empty', () {
      final pager = AzyPager();
      expect(pager.window(const <int>[]), isEmpty);
      expect(pager.hasMore, isFalse);
    });

    test('load more adds a page at a time until everything is shown', () {
      final pager = AzyPager(pageSize: 20);
      final all = List<int>.generate(55, (i) => i);
      pager.window(all);

      expect(pager.loadMore(), isTrue);
      expect(pager.window(all).length, 40);
      expect(pager.loadMore(), isTrue);
      expect(pager.window(all).length, 55);
      expect(pager.hasMore, isFalse);
      expect(pager.loadMore(), isFalse);
    });

    test('keeps the order it was given and does not change the list', () {
      final pager = AzyPager(pageSize: 2);
      final all = <String>['c', 'a', 'b'];
      expect(pager.window(all), ['c', 'a']);
      expect(all, ['c', 'a', 'b']);
    });

    test('follows a list that shrinks, such as after a filter', () {
      final pager = AzyPager(pageSize: 20);
      pager.window(List<int>.generate(100, (i) => i));
      pager.loadMore();
      expect(pager.shown, 40);

      final filtered = List<int>.generate(5, (i) => i);
      expect(pager.window(filtered), filtered);
      expect(pager.hasMore, isFalse);
    });

    test('reset goes back to the first page', () {
      final pager = AzyPager(pageSize: 20);
      final all = List<int>.generate(100, (i) => i);
      pager.window(all);
      pager.loadMore();
      pager.reset();
      expect(pager.window(all).length, 20);
    });

    test('the default page size is the shared constant', () {
      expect(AzyPager().pageSize, kAzyPageSize);
    });
  });

  group('azyRefreshHold', () {
    test('waits at least the minimum when there is no work', () async {
      final watch = Stopwatch()..start();
      await azyRefreshHold(null, const Duration(milliseconds: 60));
      expect(watch.elapsedMilliseconds, greaterThanOrEqualTo(55));
    });

    test('waits for the work when it takes longer than the minimum', () async {
      var done = false;
      final work = Future<void>.delayed(
        const Duration(milliseconds: 80),
        () => done = true,
      );
      await azyRefreshHold(work, const Duration(milliseconds: 10));
      expect(done, isTrue);
    });

    test('gives up on work that takes longer than the maximum', () async {
      final never = Completer<void>().future;
      final watch = Stopwatch()..start();
      await azyRefreshHold(
        never,
        const Duration(milliseconds: 10),
        const Duration(milliseconds: 60),
      );
      expect(watch.elapsedMilliseconds, lessThan(1000));
    });

    test('a failed refresh does not throw', () async {
      await azyRefreshHold(
        Future<void>.error(StateError('offline')),
        const Duration(milliseconds: 10),
      );
    });
  });

  group('AzyScrollRefresh', () {
    testWidgets('pulling down at the top runs the refresh', (tester) async {
      var refreshed = 0;
      await tester.pumpWidget(_page(onRefresh: () async => refreshed++));

      await tester.fling(find.text('row 0'), const Offset(0.0, 400.0), 1000.0);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(refreshed, 1);
    });

    testWidgets('a page shorter than the screen can still be pulled',
        (tester) async {
      var refreshed = 0;
      await tester.pumpWidget(
        _page(onRefresh: () async => refreshed++, rows: 2),
      );

      await tester.fling(find.text('row 0'), const Offset(0.0, 400.0), 1000.0);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(refreshed, 1);
    });

    testWidgets('pulling on a shrink-wrapped list inside the page refreshes',
        (tester) async {
      var refreshed = 0;
      await tester.pumpWidget(
        _page(
          onRefresh: () async => refreshed++,
          rows: 0,
          extra: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context, i) =>
                SizedBox(height: 100.0, child: Text('item $i')),
          ),
        ),
      );

      await tester.fling(find.text('item 0'), const Offset(0.0, 400.0), 1000.0);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      expect(refreshed, 1);
    });

    testWidgets('swiping a carousel sideways does not refresh or load more',
        (tester) async {
      var refreshed = 0;
      var nearEnd = 0;
      await tester.pumpWidget(
        _page(
          onRefresh: () async => refreshed++,
          onNearEnd: () => nearEnd++,
          extra: SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, i) =>
                  SizedBox(width: 120.0, child: Text('card $i')),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final before = nearEnd;

      await tester.fling(find.text('card 0'), const Offset(-600.0, 0.0), 1500.0);
      await tester.pumpAndSettle();

      expect(refreshed, 0);
      expect(nearEnd, before);
    });

    testWidgets('a long page does not ask for more until scrolled near the end',
        (tester) async {
      var nearEnd = 0;
      await tester.pumpWidget(
        _page(onRefresh: () async {}, onNearEnd: () => nearEnd++, rows: 40),
      );
      await tester.pumpAndSettle();
      expect(nearEnd, 0);

      // A short scroll: far more than the load-more distance is still below.
      await tester.drag(find.text('row 0'), const Offset(0.0, -200.0));
      await tester.pumpAndSettle();
      expect(nearEnd, 0);

      await tester.fling(find.text('row 2'), const Offset(0.0, -500.0), 8000.0);
      await tester.pumpAndSettle();
      expect(nearEnd, greaterThan(0));
    });

    testWidgets('a first page that does not fill the screen asks for more',
        (tester) async {
      var nearEnd = 0;
      await tester.pumpWidget(
        _page(onRefresh: () async {}, onNearEnd: () => nearEnd++, rows: 3),
      );
      await tester.pumpAndSettle();
      expect(nearEnd, greaterThan(0));
    });

    testWidgets('scrolling grows a paged list until everything is shown',
        (tester) async {
      final pager = AzyPager(pageSize: 20);
      final all = List<int>.generate(50, (i) => i);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                final shown = pager.window(all);
                return AzyScrollRefresh(
                  onRefresh: () async {},
                  onNearEnd: () {
                    if (pager.loadMore()) {
                      setState(() {});
                    }
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        for (final i in shown)
                          SizedBox(height: 100.0, child: Text('p$i')),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(pager.shown, 20);
      expect(find.text('p20', skipOffstage: false), findsNothing);

      for (var i = 0; i < 6 && pager.hasMore; i++) {
        await tester.fling(
          find.byType(SingleChildScrollView),
          const Offset(0.0, -600.0),
          9000.0,
        );
        await tester.pumpAndSettle();
      }

      expect(pager.hasMore, isFalse);
      expect(find.text('p49', skipOffstage: false), findsOneWidget);
    });

    testWidgets('the load more footer shows only while there is more',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: AzyLoadMoreFooter(visible: true)),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpWidget(
        const MaterialApp(home: AzyLoadMoreFooter(visible: false)),
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });

  group('pull to refresh wiring', () {
    for (final entry in _refreshPages.entries) {
      test('${entry.key.split('/').last} wraps its page scroll view', () {
        final source = _read(entry.key);
        expect(
          _count(source, 'AzyScrollRefresh('),
          entry.value,
          reason: 'one wrapper per page scroll view',
        );
        // The wrapper sits directly on the page scroll view, and that scroll
        // view can be pulled even when its content is short.
        expect(
          RegExp(
            r'AzyScrollRefresh\(\s*onRefresh: _azyRefresh,\s*'
            r'(?:onNearEnd: _azyLoadMore,\s*)?'
            r'child: SingleChildScrollView\(\s*'
            r'physics: const AlwaysScrollableScrollPhysics\(\),',
          ).allMatches(source).length,
          entry.value,
        );
        expect(source, contains('Future<void> _azyRefresh() async {'));
        expect(source, contains('AzyInventoryStock.instance.refresh()'));
      });
    }

    test('refresh on Shop and Home drops the cached queries', () {
      final shop = _read('lib/azyaa_group_a/home/main/shop/shop_widget.dart');
      final refresh = shop.substring(
        shop.indexOf('Future<void> _azyRefresh() async {'),
        shop.indexOf('void _azyLoadMore()'),
      );
      expect(refresh, contains('_model.firestoreRequestCompleter1 = null;'));
      expect(refresh, contains('_model.firestoreRequestCompleter2 = null;'));

      final home = _read(_homeFile);
      final homeRefresh = home.substring(
        home.indexOf('Future<void> _azyRefresh() async {'),
        home.indexOf('void _azyLoadMore()'),
      );
      expect(homeRefresh, contains('_model.firestoreRequestCompleter = null;'));
      expect(homeRefresh, contains('_model.popularLimit = kAzyPageSize;'));
    });
  });

  group('load more wiring', () {
    for (final entry in _pagedPages.entries) {
      test('${entry.key.split('/').last} shows its products a page at a time',
          () {
        final source = _read(entry.key);
        expect(_count(source, '_model.pager.window('), entry.value);
        expect(source, contains('onNearEnd: _azyLoadMore,'));
        expect(source, contains('if (_model.pager.loadMore()) {'));
      });
    }

    test('Home asks the server for one more page of popular products', () {
      final home = _read(_homeFile);
      expect(home, contains('limit: _model.popularLimit,'));
      expect(home, contains('.take(_model.popularLimit)'));
      expect(home, contains('onNearEnd: _azyLoadMore,'));
      expect(home, contains('_model.popularLimit += kAzyPageSize;'));
      // No more requests once a query comes back short, or while one is
      // already on its way.
      expect(
        home,
        contains('_model.popularLoaded < _model.popularLimit'),
      );
      expect(home, contains('if (_model.popularFetching ||'));
    });

    test('the stock cache can be refreshed without being emptied first', () {
      final stock = _read('lib/backend/inventory/stock_service.dart');
      final refresh = stock.substring(
        stock.indexOf('Future<void> refresh() {'),
        stock.indexOf('void invalidate() {'),
      );
      expect(refresh, contains('_load(ids)'));
      expect(refresh, isNot(contains('_stock.clear()')));
    });
  });
}
