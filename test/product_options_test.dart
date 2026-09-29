// Unit tests for the option-completeness rule behind Add to Bag.
//
// Pure Dart: no Firebase, no binding, no network. Run with
//   flutter test test/product_options_test.dart
//
// The rule being pinned: Add to Bag stays locked while an option that offers a
// real choice (more than one term) has no term chosen for it, and the product's
// own attributes_default_term_id never counts as the shopper's answer -- reading
// it that way is what left the button live on every product.

import 'package:azyaa/backend/catalog/product_options.dart';
import 'package:azyaa/backend/schema/structs/product_attributes_new_struct.dart';
import 'package:azyaa/backend/schema/structs/user_recent_viewed_list_struct.dart';
import 'package:flutter_test/flutter_test.dart';

const _size = '1000';
const _color = '1001';

ProductAttributesNewStruct _option(
  String id,
  List<String> terms, {
  String? productDefaultTerm,
}) =>
    ProductAttributesNewStruct(
      attributesId: id,
      attributesBrandTermIds: terms,
      attributesDefaultTermId: productDefaultTerm,
    );

UserRecentViewedListStruct _selection(
  String productId,
  List<ProductAttributesNewStruct> chosen,
) =>
    UserRecentViewedListStruct(
      viewedItemId: productId,
      productAttribute: chosen,
      viewedEntityType: 'product',
    );

/// Size (S/M/L) and colour (Gold/black), stored the way the live catalogue
/// stores them -- including the product-side default term that made the old
/// rule inert.
List<ProductAttributesNewStruct> _sizeAndColour() => [
      _option(_size, ['1017', '1019', '1018'], productDefaultTerm: '1017'),
      _option(_color, ['1014', '1044'], productDefaultTerm: '1000'),
    ];

List<ProductAttributesNewStruct> _picked(String sizeTerm, String colourTerm) =>
    [
      _option(_size, ['1017', '1019', '1018'], productDefaultTerm: sizeTerm),
      _option(_color, ['1014', '1044'], productDefaultTerm: colourTerm),
    ];

void main() {
  group('requiredOptionIds', () {
    test('an option offering two terms or more needs a choice', () {
      expect(
        AzyProductOptions.requiredOptionIds(_sizeAndColour()),
        [_size, _color],
      );
    });

    test('a one-term option asks nothing', () {
      expect(
        AzyProductOptions.requiredOptionIds([
          _option(_size, ['1017', '1019']),
          _option(_color, ['1036']),
        ]),
        [_size],
      );
    });

    test('an option with no id is skipped', () {
      expect(
        AzyProductOptions.requiredOptionIds([
          _option('', ['a', 'b']),
        ]),
        isEmpty,
      );
    });

    test('a product-side default term does not drop the requirement', () {
      expect(
        AzyProductOptions.requiredOptionIds([
          _option(_size, ['1017', '1019'], productDefaultTerm: '1017'),
        ]),
        [_size],
      );
    });
  });

  group('chosenOptionIds', () {
    test('only entries carrying a term count', () {
      expect(
        AzyProductOptions.chosenOptionIds([
          _option(_size, ['1017', '1019'], productDefaultTerm: '1017'),
          _option(_color, ['1014']),
        ]),
        {_size},
      );
    });
  });

  group('isComplete', () {
    test('a product with no options stays buyable', () {
      expect(
        AzyProductOptions.isComplete(
          options: const [],
          selections: const [],
          productId: 'P1',
        ),
        isTrue,
      );
    });

    test('a single-term product stays buyable before anything is picked', () {
      expect(
        AzyProductOptions.isComplete(
          options: [_option(_color, ['1036'])],
          selections: const [],
          productId: 'P1',
        ),
        isTrue,
      );
    });

    test('nothing picked blocks the button', () {
      expect(
        AzyProductOptions.isComplete(
          options: _sizeAndColour(),
          selections: [_selection('P1', _picked('', ''))],
          productId: 'P1',
        ),
        isFalse,
      );
    });

    test('no selection for this product blocks the button', () {
      expect(
        AzyProductOptions.isComplete(
          options: _sizeAndColour(),
          selections: [_selection('OTHER', _picked('1017', '1014'))],
          productId: 'P1',
        ),
        isFalse,
      );
    });

    test('one option still missing blocks the button', () {
      expect(
        AzyProductOptions.isComplete(
          options: _sizeAndColour(),
          selections: [_selection('P1', _picked('1017', ''))],
          productId: 'P1',
        ),
        isFalse,
      );
    });

    test('both options picked unlocks the button', () {
      expect(
        AzyProductOptions.isComplete(
          options: _sizeAndColour(),
          selections: [_selection('P1', _picked('1019', '1044'))],
          productId: 'P1',
        ),
        isTrue,
      );
    });

    test("the catalogue's own default terms do not unlock the button", () {
      // Regression: every live product carries attributes_default_term_id on
      // the record, so a rule that trusted it read "already answered" and the
      // button never locked.
      expect(
        AzyProductOptions.isComplete(
          options: _sizeAndColour(),
          selections: const [],
          productId: 'P1',
        ),
        isFalse,
      );
    });
  });
}
