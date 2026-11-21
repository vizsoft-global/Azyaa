// Tests for share links and creator sale figures (plan item "Blogger Product
// Related").
//
// Two halves, like the other tests here:
//   * a pure half for the link builder and the money sums,
//   * a source half for the wiring. The defects this fixes all compiled and
//     ran: a promotion link built without a separator on a host nothing
//     serves, share links Android never opened in the app, and sale records
//     saved with no amount.
//
// Run with: flutter test test/creator_links_sales_test.dart

import 'dart:convert';
import 'dart:io';

import 'package:azyaa/backend/creator/creator_sales.dart';
import 'package:azyaa/backend/links/azy_links.dart';
import 'package:flutter_test/flutter_test.dart';

const String _navFile = 'lib/flutter_flow/nav/nav.dart';
const String _manifest = 'android/app/src/main/AndroidManifest.xml';
const String _entitlements = 'ios/Runner/Runner.entitlements';
const String _paymentChecker =
    'lib/azyaa_group_a/payment/payment_checker/payment_checker_widget.dart';
const String _quickStats =
    'lib/azyaa_group_b/creator_space/creator_space/s3_quick_stats/s3_quick_stats_widget.dart';
const String _customPromotion =
    'lib/azyaa_group_b/creator_space/creator_space/create_promotion_custom/create_promotion_custom_widget.dart';
const String _promotionDetails =
    'lib/azyaa_group_b/creator_space/creator_space/s5_promotiondetails/s5_promotiondetails_widget.dart';
const String _sharePromotion =
    'lib/azyaa_group_b/creator_space/creator_space/c1_share_promotion/c1_share_promotion_widget.dart';

/// Every screen with a share button, and the link it must share.
const Map<String, String> _shareScreens = {
  'lib/azyaa_group_a/home/main/product/product_widget.dart':
      'AzyLinks.productOrNull(stackProductsRecord.productId)',
  'lib/product_copy/product_copy_widget.dart':
      'AzyLinks.productOrNull(stackProductsRecord.productId)',
  'lib/azyaa_group_b/designer/designer/designer_widget.dart':
      'AzyLinks.designerOrNull(widget.designerUid)',
  'lib/azyaa_group_b/creator/creators_individual/creators_individual_widget.dart':
      'AzyLinks.creatorOrNull(widget.creatorUid)',
  'lib/azyaa_group_b/creator/creators_individual_promo/creators_individual_promo_widget.dart':
      'AzyLinks.promoOrNull(widget.creatorUid, widget.promo)',
};

String _read(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: '$path is missing');
  return file.readAsStringSync();
}

AzyCreatorLine _line({
  double? totalPrice,
  double? price,
  int? quantity,
  double? rate,
}) =>
    (
      totalPrice: totalPrice,
      price: price,
      quantity: quantity,
      ratePercent: rate,
    );

void main() {
  group('AzyLinks', () {
    test('builds the four link shapes', () {
      expect(AzyLinks.product('AZYPRD1141'),
          'https://azyaa-link.pages.dev/p/AZYPRD1141');
      expect(AzyLinks.creator('u_1-A'),
          'https://azyaa-link.pages.dev/creator/u_1-A');
      expect(AzyLinks.designer('u2'),
          'https://azyaa-link.pages.dev/designer/u2');
      expect(AzyLinks.promo('u1', 'PROMP7'),
          'https://azyaa-link.pages.dev/promo/u1/PROMP7');
    });

    test('the paths are the ones the app routes on', () {
      // "/p/:productID" with the id filled in is the shared link's path.
      String fill(String pattern, Map<String, String> ids) => pattern
          .split('/')
          .map((part) => part.startsWith(':') ? ids[part.substring(1)]! : part)
          .join('/');

      expect(Uri.parse(AzyLinks.product('X1')).path,
          fill(AzyLinks.productPath, {'productID': 'X1'}));
      expect(Uri.parse(AzyLinks.creator('u1')).path,
          fill(AzyLinks.creatorPath, {'creatorUid': 'u1'}));
      expect(Uri.parse(AzyLinks.designer('u1')).path,
          fill(AzyLinks.designerPath, {'designerUid': 'u1'}));
      expect(Uri.parse(AzyLinks.promo('u1', 'PR1')).path,
          fill(AzyLinks.promoPath, {'creatorUid': 'u1', 'promo': 'PR1'}));
    });

    test('refuses to build a link from a missing or malformed id', () {
      for (final bad in <String?>[null, '', ' ', 'a b', 'a/b', '../x', 'null?']) {
        expect(AzyLinks.productOrNull(bad), isNull, reason: '$bad');
        expect(AzyLinks.creatorOrNull(bad), isNull, reason: '$bad');
        expect(AzyLinks.designerOrNull(bad), isNull, reason: '$bad');
        expect(AzyLinks.promoOrNull('u1', bad), isNull, reason: '$bad');
        expect(AzyLinks.promoOrNull(bad, 'PR1'), isNull, reason: '$bad');
      }
      expect(AzyLinks.promoOrNull('u1', 'PROMOC12'), isNotNull);
    });

    test('new links use the first host the app opens', () {
      expect(AzyLinks.hosts.first, AzyLinks.host);
    });
  });

  group('sale figures', () {
    test('the amount is the line total', () {
      expect(azySaleAmount(totalPrice: 150.0, price: 75.0, quantity: 2), 150.0);
    });

    test('falls back to price times quantity when the total is missing', () {
      expect(azySaleAmount(price: 12.5, quantity: 3), 37.5);
      expect(azySaleAmount(totalPrice: 0.0, price: 12.5, quantity: 3), 37.5);
    });

    test('nothing sensible to add up gives zero, never a negative', () {
      expect(azySaleAmount(), 0.0);
      expect(azySaleAmount(price: 10.0), 0.0);
      expect(azySaleAmount(price: -10.0, quantity: 2), 0.0);
      expect(azySaleAmount(totalPrice: -5.0, price: 10.0, quantity: -1), 0.0);
    });

    test('commission is the rate as a percentage of the amount', () {
      expect(azyCreatorCommission(200.0, 10.0), 20.0);
      expect(azyCreatorCommission(55.0, 7.5), 4.125);
      // Three decimals, as Kuwaiti dinar has.
      expect(azyCreatorCommission(33.333, 10.0), 3.333);
    });

    test('a missing or impossible rate earns nothing', () {
      expect(azyCreatorCommission(200.0, null), 0.0);
      expect(azyCreatorCommission(200.0, 0.0), 0.0);
      expect(azyCreatorCommission(200.0, -5.0), 0.0);
      expect(azyCreatorCommission(200.0, 150.0), 0.0);
      expect(azyCreatorCommission(0.0, 10.0), 0.0);
    });

    test('totals add up units, sales and earnings across lines', () {
      final totals = azyCreatorTotals([
        _line(totalPrice: 100.0, quantity: 2, rate: 10.0),
        _line(price: 20.0, quantity: 1, rate: 5.0),
        _line(totalPrice: 50.0, quantity: 1),
      ]);
      expect(totals.units, 4);
      expect(totals.sales, 170.0);
      expect(totals.earnings, 11.0);
      expect(totals.withdrawals, 0.0);
      expect(totals.balance, 11.0);
    });

    test('balance is earnings less what was paid out, never below zero', () {
      final lines = [_line(totalPrice: 100.0, quantity: 1, rate: 10.0)];
      expect(azyCreatorTotals(lines, withdrawals: 4.0).balance, 6.0);
      expect(azyCreatorTotals(lines, withdrawals: 25.0).balance, 0.0);
      expect(azyCreatorTotals(lines, withdrawals: -3.0).withdrawals, 0.0);
    });

    test('no lines means all zeros', () {
      final totals = azyCreatorTotals(const <AzyCreatorLine>[]);
      expect(totals.units, 0);
      expect(totals.sales, 0.0);
      expect(totals.earnings, 0.0);
      expect(totals.balance, 0.0);
    });

    test('money is shown with three decimals', () {
      expect(azyKd(12.5), '12.500');
      expect(azyKd(0.0), '0.000');
    });
  });

  group('share link wiring', () {
    for (final entry in _shareScreens.entries) {
      test('${entry.key.split('/').last} shares a link the app opens', () {
        final source = _read(entry.key);
        expect(source, contains(entry.value));
        // No link made through the third-party short-link service, and none
        // through Branch.
        expect(source, isNot(contains('DuoDeeplinkGroup')));
        expect(source, isNot(contains('generateLinkNew(')));
      });
    }

    test('the creator promotion link is built from ids, not glued together',
        () {
      for (final path in [
        'lib/azyaa_group_a/home/main/product/product_widget.dart',
        'lib/product_copy/product_copy_widget.dart',
      ]) {
        final source = _read(path);
        expect(source, isNot(contains('azyaa.kw')), reason: path);
        expect(
          'AzyLinks.promoOrNull(currentUserUid, _model.promotion?.promotionId)'
              .allMatches(source)
              .length,
          2,
          reason: path,
        );
      }
      expect(_read(_customPromotion), contains('promotionUrl: AzyLinks.promoOrNull('));
      // Promotions saved with the old link still show one that works.
      final details = _read(_promotionDetails);
      expect(details, contains('String get _azyPromotionLink =>'));
      expect(details, isNot(contains('widget.promotionInfo!.promotionUrl')));
    });

    test('links handed to other apps are encoded', () {
      final source = _read(_sharePromotion);
      expect(
        "Uri.encodeComponent(widget.promotionURL ?? '')"
            .allMatches(source)
            .length,
        4,
      );
      expect(source, isNot(contains('widget.promotionURL!')));
    });

    test('every link shape has a route in the app', () {
      final nav = _read(_navFile);
      for (final path in [
        'AzyLinks.productPath',
        'AzyLinks.creatorPath',
        'AzyLinks.designerPath',
        'AzyLinks.promoPath',
      ]) {
        expect(nav, contains('path: $path,'));
      }
    });

    test('Android and iOS open the link hosts in the app', () {
      final manifest = _read(_manifest);
      final entitlements = _read(_entitlements);
      for (final host in AzyLinks.hosts) {
        expect(manifest, contains('<data android:host="$host"/>'));
        expect(entitlements, contains('<string>applinks:$host</string>'));
      }
      for (final prefix in ['/p/', '/creator/', '/designer/', '/promo/']) {
        expect(
          '<data android:pathPrefix="$prefix"/>'.allMatches(manifest).length,
          AzyLinks.hosts.length,
        );
      }
      // The custom scheme the link site falls back to.
      expect(manifest,
          contains('<data android:scheme="azyaa" android:host="open"/>'));
    });

    test('the link site serves the same paths and names this app', () {
      final routes =
          jsonDecode(_read('deeplink/public/_routes.json')) as Map<String, dynamic>;
      expect(routes['include'], ['/p/*', '/creator/*', '/designer/*', '/promo/*']);

      final assetlinks =
          jsonDecode(_read('deeplink/public/.well-known/assetlinks.json')) as List;
      expect(assetlinks.first['target']['package_name'], 'com.azya.app');

      final aasa = jsonDecode(
        _read('deeplink/public/.well-known/apple-app-site-association'),
      ) as Map<String, dynamic>;
      expect(
        aasa['applinks']['details'][0]['appIDs'],
        ['85BP76L773.com.azya.app'],
      );
    });
  });

  group('sale record wiring', () {
    test('every sale record carries its amount, and creator ones a commission',
        () {
      final source = _read(_paymentChecker);
      // Three gateways, each recording a designer sale and a creator sale.
      expect('createSaleInfoStruct('.allMatches(source).length, 6);
      expect('saleAmount: azySaleAmount('.allMatches(source).length, 6);
      expect(
        'saleCommission: azyCreatorCommission('.allMatches(source).length,
        3,
      );
      expect(
        '_azySaleLine?.promotionCommisionRate,'.allMatches(source).length,
        3,
      );
    });

    test('the sale record has a commission field', () {
      final struct =
          _read('lib/backend/schema/structs/sale_info_struct.dart');
      expect(struct, contains("'sale_commission': _saleCommission,"));
      expect(struct, contains("castToType<double>(data['sale_commission'])"));
    });

    test('quick stats show real figures, not the placeholders', () {
      final source = _read(_quickStats);
      expect(source, contains('final azyTotals = azyCreatorTotals('));
      for (final figure in [
        'azyKd(azyTotals.earnings)',
        'azyKd(azyTotals.withdrawals)',
        'azyKd(azyTotals.balance)',
      ]) {
        expect(source, contains(figure));
      }
      // The translation keys that held "400", "40" and "20".
      for (final key in ['5pzyzgxc', '6zys7q66', 'emxdq7qp']) {
        expect(source, isNot(contains(key)));
      }
    });

    test('the promotion video button is shown and says what happened', () {
      final source = _read(_customPromotion);
      final picker = source.indexOf('allowVideo: true,');
      expect(picker, greaterThan(0));
      // No hide-everywhere guard in the lines leading up to the picker.
      final before = source.substring(picker - 700, picker);
      expect(before, isNot(contains('responsiveVisibility(')));
      expect(source, contains("enText: 'Video added. Tap to replace',"));
    });
  });
}
