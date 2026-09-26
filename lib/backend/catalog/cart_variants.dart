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
}
