// Unit tests for the "is this the same variant?" rule behind Add to Bag.
//
// Pure Dart: no Firebase, no binding, no network. Run with
//   flutter test test/cart_variants_test.dart
//
// The rule being pinned: a bag line and the product page's current choice are the
// same variant only when EVERY option matches. The check this replaces flipped
// its found/not-found answer on each comparison in turn, so the attribute
// compared last (size) decided the whole answer -- a dress added in red and then
// in blue bumped the red line's quantity instead of adding a blue line, which is
// why a shopper could only ever hold one variant of a product.

import 'package:azyaa/backend/catalog/cart_variants.dart';
import 'package:azyaa/backend/schema/structs/product_attributes_new_struct.dart';
import 'package:azyaa/backend/schema/structs/user_cart_items_struct.dart';
import 'package:flutter_test/flutter_test.dart';

const _size = '1000';
const _color = '1001';

ProductAttributesNewStruct _picked(String optionId, String termId) =>
    ProductAttributesNewStruct(
      attributesId: optionId,
      attributesDefaultTermId: termId,
    );

/// The bag line for a medium, red dress, and the page's choice for the same
/// dress -- the two lists the rule compares.
List<ProductAttributesNewStruct> _line(String sizeTerm, String colorTerm) => [
      _picked(_size, sizeTerm),
      _picked(_color, colorTerm),
    ];

void main() {
  group('AzyCartVariants.isSameVariant', () {
    test('the same size and colour is the same variant', () {
      expect(
        AzyCartVariants.isSameVariant(
          line: _line('1019', '1014'),
          selection: _line('1019', '1014'),
        ),
        isTrue,
      );
    });

    test('a different colour is a different variant', () {
      // The reported bug: same size, other colour, went in as a quantity bump.
      expect(
        AzyCartVariants.isSameVariant(
          line: _line('1019', '1014'),
          selection: _line('1019', '1044'),
        ),
        isFalse,
      );
    });

    test('a different size is a different variant', () {
      expect(
        AzyCartVariants.isSameVariant(
          line: _line('1019', '1014'),
          selection: _line('1017', '1014'),
        ),
        isFalse,
      );
    });

    test('the last option cannot excuse an earlier mismatch', () {
      // The old loop answered with whichever option it compared last. Size is the
      // last option here and it matches, so the old code called this the same
      // variant even though the colour did not.
      expect(
        AzyCartVariants.isSameVariant(
          line: _line('1019', '1014'),
          selection: _line('1019', '1044'),
        ),
        isFalse,
      );
    });

    test('a different number of options is a different variant', () {
      expect(
        AzyCartVariants.isSameVariant(
          line: _line('1019', '1014'),
          selection: [_picked(_size, '1019')],
        ),
        isFalse,
      );
    });

    test('options that disagree on which option they are, are different', () {
      expect(
        AzyCartVariants.isSameVariant(
          line: _line('1019', '1014'),
          selection: [
            _picked(_color, '1019'),
            _picked(_size, '1014'),
          ],
        ),
        isFalse,
      );
    });

    test('a product with no options matches a line with no options', () {
      expect(
        AzyCartVariants.isSameVariant(line: const [], selection: const []),
        isTrue,
      );
    });

    test('an option id missing on either side is not a mismatch', () {
      // Older bag lines predate the option id being stored, and the term alone is
      // what the shopper chose.
      expect(
        AzyCartVariants.isSameVariant(
          line: [
            ProductAttributesNewStruct(attributesDefaultTermId: '1019'),
            _picked(_color, '1014'),
          ],
          selection: _line('1019', '1014'),
        ),
        isTrue,
      );
    });
  });

  group('AzyCartVariants.copyForLine', () {
    test('a bag line built from the raw selection shares it', () {
      // The cause of lines changing behind the shopper's back: the struct keeps
      // the list it is given, so the line and the page's choice are one object.
      final selection = _line('1019', '1014');
      final line = UserCartItemsStruct(cartItemAttribute: selection);
      selection[1].attributesDefaultTermId = '1044';
      expect(line.cartItemAttribute[1].attributesDefaultTermId, '1044');
    });

    test('changing the selection after adding leaves the line alone', () {
      final selection = _line('1019', '1014');
      final line = UserCartItemsStruct(
        cartItemAttribute: AzyCartVariants.copyForLine(selection),
      );

      selection[1].attributesDefaultTermId = '1044';
      selection.add(_picked('1002', '1050'));

      expect(line.cartItemAttribute, hasLength(2));
      expect(line.cartItemAttribute[1].attributesDefaultTermId, '1014');
    });

    test('the copy keeps the option ids and term lists', () {
      final selection = [
        ProductAttributesNewStruct(
          attributesId: _color,
          attributesDefaultTermId: '1014',
          attributesBrandTermIds: ['1014', '1044'],
        ),
      ];
      final copy = AzyCartVariants.copyForLine(selection);
      selection[0].attributesBrandTermIds.add('1099');

      expect(copy[0].attributesId, _color);
      expect(copy[0].attributesDefaultTermId, '1014');
      expect(copy[0].attributesBrandTermIds, ['1014', '1044']);
    });

    test('with no selection, one-term options are taken as chosen', () {
      // A product whose options each offer one term asks the shopper nothing,
      // so there is no stored selection; the line still records the terms.
      final options = [
        ProductAttributesNewStruct(
          attributesId: _size,
          attributesDefaultTermId: '9999',
          attributesBrandTermIds: ['1019'],
        ),
        ProductAttributesNewStruct(
          attributesId: _color,
          attributesBrandTermIds: ['1014', '1044'],
        ),
      ];
      final copy = AzyCartVariants.copyForLine(null, options: options);

      expect(copy.map((o) => o.attributesId), [_size, _color]);
      expect(copy[0].attributesDefaultTermId, '1019');
      expect(copy[1].attributesDefaultTermId, '');
    });
  });

  group('AzyCartVariants.quantityInBag', () {
    UserCartItemsStruct bagLine(String productId, String color, int qty) =>
        UserCartItemsStruct(
          productId: productId,
          productType: 'product',
          quantity: qty,
          cartItemAttribute: _line('1019', color),
        );

    final bag = [
      bagLine('p1', '1014', 2),
      bagLine('p2', '1044', 5),
    ];

    test('counts the exact variant', () {
      expect(
        AzyCartVariants.quantityInBag(
          lines: bag,
          productId: 'p1',
          selection: _line('1019', '1014'),
        ),
        2,
      );
    });

    test('another colour of a product in the bag is not in the bag', () {
      // The page said "Go to Bag" here, so a shopper who had red in the bag
      // believed blue could not be added.
      expect(
        AzyCartVariants.quantityInBag(
          lines: bag,
          productId: 'p1',
          selection: _line('1019', '1044'),
        ),
        0,
      );
    });

    test('the same variant of another product does not count', () {
      expect(
        AzyCartVariants.quantityInBag(
          lines: bag,
          productId: 'p3',
          selection: _line('1019', '1044'),
        ),
        0,
      );
    });
  });
}
