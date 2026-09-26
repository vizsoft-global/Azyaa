// Ratchets for the bottom-bar option pickers and same-variant bag adds.
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
  group('the option pickers live in the bottom bar', () {
    test('the product page renders them there', () {
      final page = _readCode(_productPage);

      expect(
        page,
        contains('ProductOptionsBarWidget('),
        reason: 'the bottom bar no longer renders the option pickers, so the '
            'shopper has to scroll back up through the description to answer '
            'them',
      );
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

    test('each row still saves the pick and still opens the sheet', () {
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
        contains('ProductAttributeWidget('),
        reason: 'the row no longer opens the option sheet, so a product with '
            'too many terms to fit on a row cannot be answered at all',
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
