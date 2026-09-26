// Whether a bag line and the product page's current choice are the same thing.
//
// WHY THIS EXISTS
// ---------------
// Adding a dress in red and then again in blue bumped the red line's quantity
// instead of adding a blue one, so a shopper could only ever hold one variant of
// a product. The old check walked the attributes comparing terms and flipped a
// found/not-found flag on EVERY comparison, so whichever attribute happened to be
// compared last (size) decided the whole answer -- a colour that differed was
// never noticed.
//
// The rule is now the obvious one: the same number of options, with the same term
// chosen for each. Both sides are written in the product's stored option order --
// the bag line is a copy of the shopper's selection, and the selection is written
// by position -- so comparing position by position compares like with like.
//
// The decision is a pure function over two lists, so it is testable without
// Firebase, a widget or a device.

import '/backend/backend.dart';

abstract final class AzyCartVariants {
  /// True when [line] and [selection] describe the same variant of a product.
  ///
  /// Option ids are compared alongside the terms, because a catalogue that stores
  /// its options out of id order can have a term written into another option's
  /// slot; matching ids keeps such a line from being read as a different variant.
  /// An id that is empty on either side is ignored rather than treated as a
  /// mismatch, since older bag lines predate the id being stored.
  static bool isSameVariant({
    required List<ProductAttributesNewStruct> line,
    required List<ProductAttributesNewStruct> selection,
  }) {
    if (line.length != selection.length) {
      return false;
    }

    for (var i = 0; i < selection.length; i++) {
      final lineOption = line[i];
      final chosenOption = selection[i];

      if (lineOption.attributesDefaultTermId !=
          chosenOption.attributesDefaultTermId) {
        return false;
      }

      final lineOptionId = lineOption.attributesId;
      final chosenOptionId = chosenOption.attributesId;
      if (lineOptionId.isNotEmpty &&
          chosenOptionId.isNotEmpty &&
          lineOptionId != chosenOptionId) {
        return false;
      }
    }

    return true;
  }

  /// An independent copy of [selection] to store on a bag line.
  ///
  /// The line struct keeps whatever list it is given, and the page's selection
  /// is edited in place as chips are tapped, so storing it directly would let a
  /// later choice rewrite a line that is already in the bag.
  ///
  /// With no [selection] the shopper was asked nothing, so the line is built
  /// from the product's [options], taking each one-term option's only term.
  /// The options' own default term is not used: it can name a term the
  /// product does not offer.
  static List<ProductAttributesNewStruct> copyForLine(
    List<ProductAttributesNewStruct>? selection, {
    List<ProductAttributesNewStruct>? options,
  }) {
    if (selection == null || selection.isEmpty) {
      return [
        for (final option in options ?? const <ProductAttributesNewStruct>[])
          ProductAttributesNewStruct(
            attributesId: option.attributesId,
            attributesDefaultTermId: option.attributesBrandTermIds.length == 1
                ? option.attributesBrandTermIds.first
                : null,
            attributesBrandTermIds: option.attributesBrandTermIds.toList(),
          ),
      ];
    }
    return [
      for (final option in selection)
        ProductAttributesNewStruct(
          attributesId: option.attributesId,
          attributesDefaultTermId: option.attributesDefaultTermId,
          attributesBrandTermIds: option.attributesBrandTermIds.toList(),
        ),
    ];
  }

  /// How many of this exact variant of [productId] are already in the bag.
  static int quantityInBag({
    required List<UserCartItemsStruct> lines,
    required String productId,
    required List<ProductAttributesNewStruct> selection,
  }) {
    var total = 0;
    for (final line in lines) {
      if (line.productType != 'product' || line.productId != productId) {
        continue;
      }
      if (isSameVariant(
          line: line.cartItemAttribute.toList(), selection: selection)) {
        total += line.quantity;
      }
    }
    return total;
  }
}
