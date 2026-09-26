// Ratchets for the sticky purchase panel and same-variant bag adds.
//
// These are SOURCE-level guards: they read lib/ and fail if the specific mistakes
// they describe come back. They are deliberately narrow -- each one names the
// exact defect it prevents, so a failure tells you what regressed rather than
// just that a line moved.
//
// WHY SOURCE-LEVEL
// ----------------
// A behavioural test would need a device, Firebase and a populated catalogue.
// These defects are structural (pickers living in the wrong part of the page, a
// button that goes live before the shopper chose anything, a variant comparison
// that lets one option excuse another), so asserting on the source is both cheap
// and precise.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const String _productPage =
    'lib/azyaa_group_a/home/main/product/product_widget.dart';
const String _optionsBar =
    'lib/azyaa_group_a/home/components/product_options_bar/product_options_bar_widget.dart';
const String _cartButton =
    'lib/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
const String _variantRule = 'lib/backend/catalog/cart_variants.dart';
const String _panel =
    'lib/azyaa_group_a/home/components/product_purchase_panel/product_purchase_panel_widget.dart';
const String _deepLinkPage = 'lib/product_copy/product_copy_widget.dart';
const String _cartLevel =
    'lib/azyaa_group_a/payment/product_attribute_cart_level/product_attribute_cart_level_widget.dart';

String _read(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: '$path is missing');
  return file.readAsStringSync();
}

/// [read] with full-line `//` comments removed.
///
/// The files intentionally document what was replaced, so asserting absence
/// against raw text would fail on the prose rather than on the code. Only
/// whole-line comments are dropped, so a trailing `//` in real code is left
/// alone and cannot hide a regression.
String _readCode(String path) => _read(path)
    .split('\n')
    .where((line) => !line.trimLeft().startsWith('//'))
    .join('\n');

void main() {
  group('the option pickers live in the sticky purchase panel', () {
    test('both product pages render the panel, and the panel the chips', () {
      for (final path in [_productPage, _deepLinkPage]) {
        expect(
          _readCode(path),
          contains('ProductPurchasePanelWidget('),
          reason: '$path no longer renders the purchase panel, so the shopper '
              'has to scroll back up through the description to answer the '
              'options',
        );
      }
      expect(_readCode(_panel), contains('ProductOptionsBarWidget('));
    });

    test('the deep-link page no longer builds its own sorted copy', () {
      expect(
        _readCode(_deepLinkPage),
        isNot(contains('queryAttributesRecord(')),
        reason: 'the deep-link page lists the options in the body again, '
            'sorted by id, out of step with the stored order the pick is '
            'written in',
      );
    });

    test('the page is dimmed until every option is chosen', () {
      for (final path in [_productPage, _deepLinkPage]) {
        final page = _readCode(path);
        expect(page, contains('ProductPurchasePanelWidget.remainingFor('));
        expect(
          page,
          contains('IgnorePointer('),
          reason: 'the dim layer must not swallow scrolls and taps on the page',
        );
      }
    });

    test('the page body no longer builds its own copy of them', () {
      final page = _readCode(_productPage);

      expect(
        page,
        isNot(contains('queryAttributesRecord(')),
        reason: 'the option rows are back in the page body as well as the bar, '
            'so there are two pickers to keep in step',
      );
    });

    test('the rows are written in the product\'s stored option order', () {
      final bar = _readCode(_optionsBar);

      expect(
        bar,
        contains('product.productAttribute.toList()'),
        reason: 'the rows must be listed in the order ProductAttributeWidget '
            'seeds and writes them, or the term chosen for one option is saved '
            'under another',
      );
      expect(
        bar,
        isNot(contains('sortedList')),
        reason: 'sorting the rows by option id put the row index out of step '
            'with the seeded selection -- the "Green Gown" mismatch',
      );
    });

    test('each row saves the pick inline, without a popup', () {
      final bar = _readCode(_optionsBar);

      expect(
        bar,
        contains('..attributesDefaultTermId = termListItem'),
        reason: 'tapping a size no longer saves it into the shopper\'s '
            'selection, so the chip would look chosen while Add to Bag stayed '
            'locked',
      );
      expect(
        bar,
        contains('userProductSwatchesList'),
        reason: 'the rows read their selected state from somewhere other than '
            'the selection the Add to Bag gate reads',
      );
      expect(
        bar,
        isNot(contains('ProductAttributeWidget(')),
        reason: 'the chips open the option sheet again; picking is meant to '
            'happen inline in the panel',
      );
      expect(
        bar,
        contains('Axis.horizontal'),
        reason: 'the chips no longer scroll sideways, so a product with many '
            'terms cannot show them all',
      );
    });
  });

  group('Add to Bag waits for the last option', () {
    test('the page asks the option rule', () {
      expect(
        _readCode(_productPage),
        contains('AzyProductOptions.isCompleteForSelection('),
        reason: 'the bar decides for itself whether the shopper has answered '
            'every option, so it can drift from the Add to Bag gate',
      );
    });

    test('the button and its quantity stepper are hidden, not just disabled', () {
      final page = _readCode(_productPage);

      expect(
        page,
        contains('if (!productOptionsReady) {'),
        reason: 'Add to Bag is rendered while an option is still unanswered, so '
            'a shopper can try to add a dress with no size',
      );
      expect(
        page,
        contains('productOptionsReady)'),
        reason: 'the quantity stepper is no longer tied to the options being '
            'answered',
      );
    });
  });

  group('a second colour of the same product is a new bag line', () {
    test('the bag line is matched as a whole variant', () {
      expect(
        _readCode(_cartButton),
        contains('AzyCartVariants.isSameVariant('),
        reason: 'Add to Bag went back to matching bag lines by hand',
      );
    });

    test('the last attribute compared no longer decides the match', () {
      expect(
        _readCode(_cartButton),
        isNot(contains("..userCartItemPAFound = 'found',")),
        reason: 'the found/not-found flag is set inside the attribute '
            'comparison again, so the last option compared -- size -- excuses a '
            'different colour and the add becomes a quantity bump',
      );
    });

    test('a new bag line stores a copy of the selection', () {
      final button = _readCode(_cartButton);
      expect(button, contains('AzyCartVariants.copyForLine('));
      expect(
        button,
        isNot(contains(RegExp(r'cartItemAttribute:\s*widget\.defaultTerms'))),
        reason: 'a bag line holds the live selection again, so the next chip '
            'tap rewrites a line that is already in the bag',
      );
    });

    test('the label counts the exact variant, not the product', () {
      final button = _readCode(_cartButton);
      expect(button, contains('AzyCartVariants.quantityInBag('));
      expect(
        button,
        isNot(contains("'Go to Bag'")),
        reason: 'the button says "Go to Bag" when any colour of the product '
            'is in the bag, so shoppers think another colour cannot be added',
      );
    });

    test('adding stays on the page, without the choose-option popup', () {
      final button = _readCode(_cartButton);
      expect(button, contains("'Added to bag'"));
      expect(button, isNot(contains('ChosseoptionPopupWidget(')));
    });

    test('the cart-level picker matches whole variants too', () {
      final picker = _readCode(_cartLevel);
      expect(picker, contains('AzyCartVariants.isSameVariant('));
      expect(picker, isNot(contains("..userCartItemPAFound = 'found',")));
    });

    test('the hidden product-only bag buttons are gone', () {
      for (final path in [_productPage, _deepLinkPage]) {
        expect(
          _readCode(path),
          isNot(contains("'Update Bag'")),
          reason: '$path carries the old buttons that add by product id '
              'alone, ignoring the chosen colour and size',
        );
      }
    });

    test('the rule is a pure function with its own home', () {
      final rule = _readCode(_variantRule);

      expect(rule, contains('isSameVariant'));
      expect(
        rule,
        isNot(contains('FFAppState()')),
        reason: 'the rule reads shared state, so it can only be exercised on a '
            'device with a populated bag',
      );
    });
  });
}
