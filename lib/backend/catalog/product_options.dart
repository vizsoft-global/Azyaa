// Whether a product's required options have been chosen yet.
//
// WHY THIS EXISTS
// ---------------
// "Add to Bag" used to be live the moment the product page opened, so a shopper
// could add a shirt with no size and only find out at checkout. The button now
// stays disabled until every option that genuinely needs a choice has one.
//
// WHAT COUNTS AS REQUIRED
// -----------------------
// A product's options are its `productAttribute` entries. An option that offers
// a single term asks the shopper nothing, so an option is required only when it
// offers more than one term, and it is satisfied only when the shopper's stored
// selection for this product carries a term for it.
//
// Note what is deliberately NOT used: the product's own
// `attributesDefaultTermId`. Every product carries one -- sometimes pointing at
// a term the product does not even offer -- and the product page seeds the
// shopper's selection with it nulled out. Reading it as "already answered" left
// Add to Bag enabled on every product.
//
// The decision is deliberately a pure function over two lists, so it can be
// tested without Firebase, a widget or a device.

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

abstract final class AzyProductOptions {
  /// An option offering this many terms or more is a real choice.
  static const _choiceIsOfferedFrom = 2;

  /// Option ids the shopper still has to choose.
  ///
  /// A one-term option asks nothing: the shopper would be forced to confirm the
  /// only thing on offer.
  static List<String> requiredOptionIds(
    List<ProductAttributesNewStruct> options,
  ) =>
      <String>[
        for (final option in options)
          if (option.attributesId.isNotEmpty &&
              option.attributesBrandTermIds.length >= _choiceIsOfferedFrom)
            option.attributesId,
      ];

  /// Option ids the shopper has chosen something for.
  static Set<String> chosenOptionIds(
    List<ProductAttributesNewStruct> selection,
  ) =>
      <String>{
        for (final chosen in selection)
          if (chosen.attributesId.isNotEmpty &&
              chosen.attributesDefaultTermId.isNotEmpty)
            chosen.attributesId,
      };

  /// True when every id in [requiredIds] appears in [chosenIds].
  static bool allChosen(
    Iterable<String> requiredIds,
    Set<String> chosenIds,
  ) =>
      requiredIds.every(chosenIds.contains);

  /// True when [product] has nothing left for the shopper to pick.
  static bool isCompleteFor(ProductsRecord product, FFAppState appState) =>
      isComplete(
        options: product.productAttribute,
        selections: appState.UserDataFlow.userProductSwatchesList,
        productId: product.productId,
      );

  /// [isCompleteFor] over plain lists, so the rule is testable without Firebase.
  static bool isComplete({
    required List<ProductAttributesNewStruct> options,
    required List<UserRecentViewedListStruct> selections,
    required String productId,
  }) {
    final required = requiredOptionIds(options);

    // Nothing to choose -- do not make the shopper hunt for a selection that
    // does not exist.
    if (required.isEmpty) {
      return true;
    }

    for (final entry in selections) {
      if (entry.viewedItemId == productId) {
        return allChosen(required, chosenOptionIds(entry.productAttribute));
      }
    }
    return false;
  }

  /// [isComplete] when the caller already holds the shopper's selection for the
  /// product, so the product id never has to be matched up again.
  ///
  /// A null or empty [selection] means the shopper has not answered anything
  /// yet, which is only complete when the product asks nothing.
  static bool isCompleteForSelection({
    required List<ProductAttributesNewStruct> options,
    required List<ProductAttributesNewStruct>? selection,
  }) {
    final required = requiredOptionIds(options);
    if (required.isEmpty) {
      return true;
    }
    return allChosen(required, chosenOptionIds(selection ?? const []));
  }
}
