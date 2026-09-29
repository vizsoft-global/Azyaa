// Source guards for the shared product frame, the address-edit crash, the
// compact checkout address, and the Creators Hub reels feed.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('product grids and galleries share one frame', () {
    const grids = [
      'lib/azyaa_group_a/home/main/product/product_widget.dart',
      'lib/product_copy/product_copy_widget.dart',
      'lib/azyaa_group_b/designer/designer/designer_widget.dart',
      'lib/azyaa_group_a/home/main/home_search/home_search_widget.dart',
      'lib/azyaa_group_b/creator/creators_individual_promo/creators_individual_promo_widget.dart',
      'lib/azyaa_group_a/home/main/shop/shop_widget.dart',
      'lib/azyaa_group_a/home/main/home/home_widget.dart',
      'lib/custom_code/widgets/azy_search_results.dart',
    ];
    for (final path in grids) {
      expect(
        File(path).readAsStringSync().contains('AzyProductFrame.cardAspectRatio'),
        isTrue,
        reason: path,
      );
    }
    for (final path in [
      'lib/azyaa_group_a/home/main/product/product_widget.dart',
      'lib/product_copy/product_copy_widget.dart',
    ]) {
      final src = File(path).readAsStringSync();
      expect(src.contains('AzyProductFrame.galleryHeight('), isTrue, reason: path);
      expect(src.contains('? 450'), isFalse, reason: path);
    }
  });

  test('address edit does not force-unwrap a missing country flag', () {
    final src = File(
      'lib/azyaa_group_a/customer/zone/profile_address_edit/profile_address_edit_widget.dart',
    ).readAsStringSync();
    expect(RegExp(r'getCountryFlag\([^;]*\)!').hasMatch(src), isFalse);
    expect(RegExp(r'getDailCode\([^;]*\)!').hasMatch(src), isFalse);
  });

  test('checkout shows the full address list only after Change', () {
    final src = File(
      'lib/azyaa_group_a/payment/checkout/checkout_widget.dart',
    ).readAsStringSync();
    expect(src.contains('_showAllAddresses'), isTrue);
    expect(src.contains("enText: 'Change'"), isTrue);
    expect(src.contains('settingsDocResult2!'), isFalse);
    expect(src.contains('settingsDocResult1!'), isFalse);
  });

  test('creators hub is the reels feed', () {
    final src = File(
      'lib/azyaa_group_b/creator/creators/creators_widget.dart',
    ).readAsStringSync();
    expect(src.contains('CreatorReelsFeed('), isTrue);
  });
}
