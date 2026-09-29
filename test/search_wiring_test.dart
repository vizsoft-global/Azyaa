// Ratchets for the search rewrite and the out-of-stock grey-out.
//
// These are SOURCE-level guards: they read lib/ and fail if the specific
// mistakes they describe come back. They are deliberately narrow -- each one
// names the exact defect it prevents, so a failure tells you what regressed
// rather than just that a line moved.
//
// WHY SOURCE-LEVEL
// ----------------
// A behavioural test here would need a device, Firebase and a populated
// catalogue. These defects are structural (a guard that is always false, a
// network call where a local one belongs, a debounce ten times too long), so
// asserting on the source is both cheap and precise.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const String _shopPage = 'lib/azyaa_group_a/home/main/shop/shop_widget.dart';
const String _creatorsPage =
    'lib/azyaa_group_b/creator/creators/creators_widget.dart';
const String _productCard =
    'lib/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
const String _productRow =
    'lib/azyaa_group_a/home/components/product_listview/product_listview_widget.dart';
const String _homeSearchPage =
    'lib/azyaa_group_a/home/main/home_search/home_search_widget.dart';
const String _filterPopup =
    'lib/azyaa_group_a/home/components/product_filter_popup/product_filter_popup_widget.dart';
const String _resultsView = 'lib/custom_code/widgets/azy_search_results.dart';

String _read(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: '$path is missing');
  return file.readAsStringSync();
}

/// [read] with full-line `//` comments removed.
///
/// The files intentionally document what was replaced -- e.g. "Was:
/// `ProductsRecord.search(...)`" -- so asserting absence against raw text would
/// fail on the prose rather than on the code. Only whole-line comments are
/// dropped, so a trailing `//` in real code (or a `https://` string) is left
/// alone and cannot hide a regression.
String _readCode(String path) => _read(path)
    .split('\n')
    .where((line) => !line.trimLeft().startsWith('//'))
    .join('\n');

/// The FlutterFlow helper returns `false` for every breakpoint when called with
/// all four flags false, so anything guarded by it is dead code.
final RegExp _alwaysFalseVisibility = RegExp(
  r'responsiveVisibility\(\s*context:\s*context,\s*'
  r'phone:\s*false,\s*tablet:\s*false,\s*tabletLandscape:\s*false,\s*'
  r'desktop:\s*false,?\s*\)',
  multiLine: true,
  dotAll: true,
);

void main() {
  group('out-of-stock grey-out', () {
    test('the scrim exists and fills the image rather than the screen', () {
      final body = _read(_productCard);

      expect(
        body.contains('Positioned.fill'),
        isTrue,
        reason: 'The out-of-stock scrim must be a Positioned.fill child of the '
            'image Stack. The previous version hard-coded '
            'MediaQuery.sizeOf(context).width * 1.0 by height * 1.0, i.e. the '
            'whole screen, which would have overflowed the grid cell.',
      );
      expect(
        body.contains('stock <= 0'),
        isTrue,
        reason: 'The scrim must be conditional on actual stock.',
      );
    });

    test('the scrim is no longer dead code', () {
      final body = _read(_productCard);

      expect(
        body.contains('0xD3B9B4B4'),
        isFalse,
        reason: 'The 83%-opaque grey overlay is gone.',
      );
      expect(
        body.contains('0x8CB9B4B4'),
        isFalse,
        reason: 'The grey scrim was replaced by a pink wash (0x8CF8BBD0), '
            'which reads as "unavailable" without draining the photograph.',
      );
      expect(
        body.contains('0x8CF8BBD0'),
        isTrue,
        reason: 'The pink out-of-stock wash is missing.',
      );

      // The scrim itself must not sit behind an always-false visibility guard.
      // Two such guards pre-date this change and are NOT touched here, because
      // enabling either would add UI nobody asked for:
      //   * the wishlist checkbox  (`stock > 0 && checkboxStatus == 'show'`), and
      //   * a price-row `RichText`.
      // This asserts the count did not grow, so a third one cannot creep in.
      expect(
        _alwaysFalseVisibility.allMatches(body).length,
        lessThanOrEqualTo(2),
        reason: 'A new always-false responsiveVisibility guard appeared in the '
            'product card. Anything inside it can never render. Baseline is 2 '
            '(wishlist checkbox, price-row RichText); lower this if those are '
            'ever fixed.',
      );
    });

    test('both card layouts wash the image and badge it', () {
      // A grid and a list card present stock differently, and a fix applied to
      // only one of them is invisible on whichever page uses the other.
      for (final path in [_productCard, _productRow]) {
        final body = _read(path);
        expect(
          body.contains('0x8CF8BBD0'),
          isTrue,
          reason: '$path does not tint a sold-out image pink.',
        );
        expect(
          body.contains('0xFFF7A8C4'),
          isTrue,
          reason: '$path has no out-of-stock badge, so the tint is unexplained.',
        );
      }
    });

    test('the badge is not behind the signed-in test', () {
      // The label used to be rendered only for signed-in shoppers, so the
      // people most likely to meet a sold-out item were the only ones not told
      // about it. The badge block must not carry a `loggedIn &&` guard.
      final body = _read(_productCard);
      expect(
        body.contains('loggedIn && (columnInventoryRecord.stock <= 0)'),
        isFalse,
        reason: 'The out-of-stock text is still gated on being signed in.',
      );
    });
  });

  group('search no longer depends on Algolia on the wired pages', () {
    test('the shop page does not call ProductsRecord.search', () {
      final code = _readCode(_shopPage);
      expect(
        code.contains('ProductsRecord.search('),
        isFalse,
        reason: 'The shop page must use AzySearchService, which reads '
            'Firestore directly. ProductsRecord.search hits the Algolia '
            '"products" index and returns nothing when that index is stale.',
      );
      expect(code.contains('AzySearchService.instance.search'), isTrue);
    });

    test('the creators page does not call UsersRecord.search', () {
      final code = _readCode(_creatorsPage);
      expect(
        code.contains('UsersRecord.search('),
        isFalse,
        reason: 'The creators hub is a posts feed and has no search box.',
      );
    });

    test('neither page debounces at 2 seconds', () {
      for (final path in [_shopPage, _creatorsPage]) {
        expect(
          _readCode(path).contains('Duration(milliseconds: 2000)'),
          isFalse,
          reason: '$path still waits 2000ms before searching, which is what '
              'made search feel broken. It should be ~180ms.',
        );
      }
    });

    test('the creators page renders real results, not placeholder boxes', () {
      expect(
        _readCode(_creatorsPage).contains('color: Colors.green'),
        isFalse,
        reason: 'The creator search results were literal green rectangles. '
            'Search now narrows the existing creator list instead.',
      );
    });

    test('the home search bar searches the shared index, not Algolia', () {
      final code = _readCode(_homeSearchPage);
      expect(
        code.contains('ProductsRecord.search('),
        isFalse,
        reason: 'The home bar must read the same on-device index the shop page '
            'reads, so both give identical answers for the same term.',
      );
      expect(
        code.contains('AzySearchService.instance'),
        isTrue,
        reason: 'The home bar does not consult the shared search service, so it '
            'is still going somewhere else for results.',
      );
      expect(
        code.contains('Duration(milliseconds: 2000)'),
        isFalse,
        reason: 'The home bar waited two seconds per keystroke before asking '
            'for results, which is what made search feel broken.',
      );
    });

    test('the filter popup searches its own categories and brands locally',
        () {
      final code = _readCode(_filterPopup);
      for (final call in ['CategoryRecord.search(', 'BrandsRecord.search(']) {
        expect(
          code.contains(call),
          isFalse,
          reason: '$call is a network round-trip per keystroke. Both boxes now '
              'filter lists the popup already holds in memory.',
        );
      }
      expect(
        code.contains('Duration(milliseconds: 2000)'),
        isFalse,
        reason: 'The category and brand boxes still debounce at 2000ms.',
      );
    });

    test('every wired search box enforces the three-character floor', () {
      // Two characters of a catalogue this size match too much to be a filter,
      // and the pages have to agree on that or one of them will show "no
      // results" for a query the other simply has not run yet.
      for (final path in [_shopPage, _homeSearchPage]) {
        expect(
          _readCode(path).contains('AzyMatch.meetsMinimumLength'),
          isTrue,
          reason: '$path does not check the minimum query length, so a '
              'one-letter query is still searched.',
        );
      }
    });
  });

  group('grouped results view', () {
    test('renders all three kinds and reuses the product card', () {
      final body = _read(_resultsView);
      for (final kind in [
        'AzySearchKind.product',
        'AzySearchKind.shop',
        'AzySearchKind.creator',
      ]) {
        expect(
          body.contains(kind),
          isTrue,
          reason: 'The grouped results view does not handle $kind, so that '
              'section can never appear.',
        );
      }
      expect(
        body.contains('ProductGridWidget'),
        isTrue,
        reason: 'Product hits must reuse ProductGridWidget so search results '
            'look and behave like browsed ones (including the grey-out).',
      );
    });

    test('does not reintroduce a cache-bypassing Image.network', () {
      expect(
        _read(_resultsView).contains('Image.network('),
        isFalse,
        reason: 'Use CachedNetworkImage, or every scroll re-downloads.',
      );
    });
  });
}
