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
}
