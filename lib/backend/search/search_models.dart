// Value types for Azyaa search. Pure Dart — no Flutter, no Firestore.
//
// Keeping these dependency-free is deliberate: the index and the scorer can
// then be unit-tested on the Dart VM with no Firebase binding, which is where
// the ranking bugs actually live. `search_service.dart` is the only layer that
// knows about Firestore records, and it carries them in [AzySearchDocument.payload].

/// What a search hit points at. Also the grouping key in the results list.
enum AzySearchKind {
  /// A `products/{id}` document.
  product,

  /// A `brands/{id}` document, i.e. a shop.
  shop,

  /// A `users/{id}` document whose role is Creator.
  creator,
}

/// One searchable thing, flattened for indexing.
class AzySearchDocument {
  const AzySearchDocument({
    required this.kind,
    required this.id,
    required this.title,
    this.subtitle = '',
    this.imageUrl = '',
    this.keywords = const [],
    this.inStock = true,
    this.stockCount,
    this.payload,
  });

  /// Backing Firestore path, used to look the record up again for navigation.
  final String id;

  final AzySearchKind kind;

  /// The primary thing a user searches for: product name, shop name, handle.
  final String title;

  /// Secondary line, e.g. the shop a product belongs to or a creator's handle.
  final String subtitle;

  final String imageUrl;

  /// Extra searchable text that never gets displayed: category, tags, brand,
  /// creator name. Matching here is what lets "zara" find that brand's
  /// products without the name containing "zara".
  final List<String> keywords;

  /// False only for products that are genuinely unavailable.
  final bool inStock;

  /// Units on hand when known, for the "Last N stocks" / "Out of stock" line.
  final int? stockCount;

  /// The originating record (`ProductsRecord`, `UsersRecord`, `BrandsRecord`)
  /// so the existing cards can render it without a second fetch.
  final Object? payload;

  /// `kind:id`, stable across rebuilds and usable as a widget key.
  String get key => '${kind.name}:$id';

  @override
  String toString() =>
      'AzySearchDocument(${kind.name}, $id, "$title", inStock: $inStock)';
}

/// A [AzySearchDocument] plus the score it earned for one query.
class AzySearchHit {
  const AzySearchHit({required this.document, required this.score});

  final AzySearchDocument document;

  /// 0..1, from [AzyMatch]. Higher is better.
  final double score;

  AzySearchKind get kind => document.kind;
  String get title => document.title;
  String get subtitle => document.subtitle;
  String get imageUrl => document.imageUrl;
  bool get inStock => document.inStock;
  int? get stockCount => document.stockCount;

  @override
  String toString() =>
      'AzySearchHit(${document.key}, ${score.toStringAsFixed(3)})';
}

/// All hits of one [AzySearchKind], in rank order.
class AzySearchGroup {
  const AzySearchGroup({required this.kind, required this.hits});

  final AzySearchKind kind;
  final List<AzySearchHit> hits;

  int get count => hits.length;
  bool get isEmpty => hits.isEmpty;
}

/// The full result of one query, already split into display sections.
class AzySearchResults {
  const AzySearchResults({
    required this.query,
    required this.groups,
    this.took = Duration.zero,
    this.candidateCount = 0,
    this.indexReady = true,
  });

  /// The raw query, echoed back so a stale async result can be discarded.
  final String query;

  /// Only non-empty groups, in [AzySearchKind] declaration order.
  final List<AzySearchGroup> groups;

  /// How long scoring took. Surfaced so the debug overlay can prove the index
  /// is fast enough to run on every keystroke.
  final Duration took;

  /// Size of the candidate set that was scanned.
  final int candidateCount;

  /// False while the backing index is still loading from Firestore.
  final bool indexReady;

  /// Nothing matched. Distinct from [indexReady] being false.
  bool get isEmpty => total == 0;

  int get total {
    var sum = 0;
    for (final group in groups) {
      sum += group.count;
    }
    return sum;
  }

  /// The hits of one kind, or an empty list.
  List<AzySearchHit> of(AzySearchKind kind) {
    for (final group in groups) {
      if (group.kind == kind) {
        return group.hits;
      }
    }
    return const [];
  }

  static const AzySearchResults empty = AzySearchResults(
    query: '',
    groups: [],
  );

  @override
  String toString() => 'AzySearchResults("$query", total: $total, '
      'candidates: $candidateCount, took: ${took.inMicroseconds}us)';
}
