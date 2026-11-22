/// What the Shortlist screen shows: the products a customer has saved and the
/// designers and creators they follow, filtered by the chip they picked.
///
/// Kept free of Flutter and Firestore so it can be tested on its own.
library;

enum AzyShortlistKind { all, designer, creator, product }

/// The chip's text is the translated label, so it is matched against the
/// labels of the current language. Anything else (including "All" and nothing
/// picked yet) shows everything.
AzyShortlistKind azyShortlistKindFor(
  String? chosen, {
  required String designerLabel,
  required String creatorLabel,
  required String productLabel,
}) {
  final value = (chosen ?? '').trim();
  if (value.isEmpty) return AzyShortlistKind.all;
  if (value == designerLabel.trim()) return AzyShortlistKind.designer;
  if (value == creatorLabel.trim()) return AzyShortlistKind.creator;
  if (value == productLabel.trim()) return AzyShortlistKind.product;
  return AzyShortlistKind.all;
}

/// One saved item as stored on the customer's record (`user_wishlist_item`).
typedef AzySavedItem = ({String? id, String? type});

class AzyShortlistContent {
  const AzyShortlistContent({
    required this.productIds,
    required this.designerIds,
    required this.creatorIds,
  });

  /// `product_id` of each saved product, in the order they were saved.
  final List<String> productIds;

  /// Document ids of the followed designers' and creators' user records.
  final List<String> designerIds;
  final List<String> creatorIds;

  bool get isEmpty =>
      productIds.isEmpty && designerIds.isEmpty && creatorIds.isEmpty;
}

List<String> _distinct(Iterable<String?> values) {
  final seen = <String>{};
  final out = <String>[];
  for (final raw in values) {
    final value = (raw ?? '').trim();
    if (value.isNotEmpty && seen.add(value)) out.add(value);
  }
  return out;
}

/// The saved things to show for [kind].
///
/// A saved item counts as a product when its type is `product`, or is missing
/// (the app has only ever saved products there). Designers and creators come
/// from the follow lists, because that is where the app keeps them.
AzyShortlistContent azyShortlistContent({
  required AzyShortlistKind kind,
  required Iterable<AzySavedItem> saved,
  required Iterable<String?> followedDesigners,
  required Iterable<String?> followedCreators,
}) {
  bool shows(AzyShortlistKind wanted) =>
      kind == AzyShortlistKind.all || kind == wanted;
  bool isProduct(AzySavedItem item) {
    final type = (item.type ?? '').trim().toLowerCase();
    return type.isEmpty || type == 'product';
  }

  return AzyShortlistContent(
    productIds: shows(AzyShortlistKind.product)
        ? _distinct(saved.where(isProduct).map((item) => item.id))
        : const [],
    designerIds:
        shows(AzyShortlistKind.designer) ? _distinct(followedDesigners) : const [],
    creatorIds:
        shows(AzyShortlistKind.creator) ? _distinct(followedCreators) : const [],
  );
}

/// Splits [ids] into groups Firestore can look up in one `whereIn` query.
List<List<String>> azyChunks(List<String> ids, [int size = 30]) {
  final out = <List<String>>[];
  for (var at = 0; at < ids.length; at += size) {
    out.add(ids.sublist(at, at + size > ids.length ? ids.length : at + size));
  }
  return out;
}

/// Puts the loaded things back into the order their ids were saved in, and
/// drops ids that were not found (a product that is no longer on sale, an
/// account that was removed), so the screen has no empty slots.
List<T> azyInSavedOrder<T>(List<String> ids, Map<String, T> found) => [
      for (final id in ids)
        if (found[id] != null) found[id] as T,
    ];
