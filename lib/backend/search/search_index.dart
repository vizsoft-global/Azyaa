// In-memory scored index over Azyaa's catalogue.
//
// WHY NOT ALGOLIA / FIRESTORE
// ---------------------------
// Instantly filtering a page as the user types needs the candidate set to be
// local. A network round-trip per keystroke is what makes the current search
// feel broken, and Algolia only answers if its indices are populated — which
// is exactly what is unreliable here. So we hold the catalogue in memory and
// score it on the device, and `search_service.dart` decides how much to load.
//
// NORMALIZATION COST
// ------------------
// Every document's searchable fields are normalized ONCE in [_IndexedDocument],
// so a keystroke only ever runs comparison, never normalization, across the
// whole catalogue.

import 'search_matcher.dart';
import 'search_models.dart';

/// How much each field contributes to a document's score.
///
/// A hit in the title is worth far more than a hit in a hidden keyword, so a
/// product named "Silk Saree" outranks a product merely tagged `saree`.
abstract final class AzyFieldWeights {
  static const double title = 1.0;
  static const double subtitle = 0.85;
  static const double keyword = 0.70;
}

/// A document plus its precomputed, pre-normalized searchable fields.
class _IndexedDocument {
  _IndexedDocument._(this.document, this.title, this.subtitle, this.keywords);

  factory _IndexedDocument(AzySearchDocument document) => _IndexedDocument._(
        document,
        MatchField.of(document.title),
        MatchField.of(document.subtitle),
        _buildKeywords(document.keywords),
      );

  static List<MatchField> _buildKeywords(List<String> raw) {
    if (raw.isEmpty) {
      return const [];
    }
    final out = <MatchField>[];
    for (final value in raw) {
      final field = MatchField.of(value);
      if (field.isNotEmpty) {
        out.add(field);
      }
    }
    return List.unmodifiable(out);
  }

  final AzySearchDocument document;

  /// Precomputed so scoring never normalizes, splits or allocates per query.
  final MatchField title;
  final MatchField subtitle;
  final List<MatchField> keywords;
}

/// Scored, groupable index over [AzySearchDocument]s.
class AzySearchIndex {
  final List<_IndexedDocument> _documents = [];

  /// When true (the default), in-stock hits rank above out-of-stock hits that
  /// scored the same.
  ///
  /// The brief asked for out-of-stock items to be "given priority"; that reads
  /// two ways, and getting it backwards is very visible, so it is a switch
  /// rather than a buried assumption. The default is the conventional
  /// e-commerce order (available stock first), with out-of-stock items still
  /// listed and visibly greyed. Set it to false to pin them to the top instead.
  static bool preferInStockFirst = true;

  int get length => _documents.length;
  bool get isEmpty => _documents.isEmpty;
  bool get isNotEmpty => _documents.isNotEmpty;

  void clear() => _documents.clear();

  void add(AzySearchDocument document) =>
      _documents.add(_IndexedDocument(document));

  void addAll(Iterable<AzySearchDocument> documents) {
    for (final document in documents) {
      add(document);
    }
  }

  /// Every document currently indexed, in insertion order.
  Iterable<AzySearchDocument> get documents =>
      _documents.map((indexed) => indexed.document);

  /// Scores [query] across the index and returns it grouped by kind.
  ///
  /// [kinds] restricts the search to some kinds; omit it to search everything.
  /// [perKind] caps each returned group, [overall] caps the total.
  AzySearchResults search(
    String query, {
    Set<AzySearchKind>? kinds,
    int perKind = 20,
    int overall = 60,
  }) {
    final stopwatch = Stopwatch()..start();
    // Built once per search, not once per document.
    final queryField = MatchField.of(query);
    // Shorter queries are refused outright rather than matched loosely: a
    // two-character query of a catalogue this size is not a filter.
    if (!AzyMatch.meetsMinimumLength(query) ||
        queryField.isEmpty ||
        _documents.isEmpty) {
      stopwatch.stop();
      return AzySearchResults(
        query: query,
        groups: const [],
        took: stopwatch.elapsed,
        candidateCount: _documents.length,
      );
    }

    final perKindHits = <AzySearchKind, List<AzySearchHit>>{};
    for (final indexed in _documents) {
      final kind = indexed.document.kind;
      if (kinds != null && !kinds.contains(kind)) {
        continue;
      }
      final score = _score(indexed, queryField);
      if (score < AzyMatch.kMatchThreshold) {
        continue;
      }
      (perKindHits[kind] ??= <AzySearchHit>[])
          .add(AzySearchHit(document: indexed.document, score: score));
    }

    // Emit groups in enum declaration order so the UI sections stay put rather
    // than reshuffling position as counts change between keystrokes.
    final groups = <AzySearchGroup>[];
    var emitted = 0;
    for (final kind in AzySearchKind.values) {
      final hits = perKindHits[kind];
      if (hits == null || hits.isEmpty) {
        continue;
      }
      hits.sort(_compareHits);
      final remaining = overall - emitted;
      if (remaining <= 0) {
        break;
      }
      var take = hits.length;
      if (take > perKind) {
        take = perKind;
      }
      if (take > remaining) {
        take = remaining;
      }
      final kept = List<AzySearchHit>.unmodifiable(hits.take(take));
      groups.add(AzySearchGroup(kind: kind, hits: kept));
      emitted += kept.length;
    }

    stopwatch.stop();
    return AzySearchResults(
      query: query,
      groups: groups,
      took: stopwatch.elapsed,
      candidateCount: _documents.length,
    );
  }

  /// Rank order: score, then stock, then shorter title, then title text.
  ///
  /// The final text comparison keeps ordering deterministic when everything
  /// else ties, because a list that reshuffles between identical queries looks
  /// broken even though the result set is the same.
  int _compareHits(AzySearchHit a, AzySearchHit b) {
    final byScore = b.score.compareTo(a.score);
    if (byScore != 0) {
      return byScore;
    }
    if (a.inStock != b.inStock) {
      // Checked here rather than folded into the score, so flipping the
      // preference never changes any hit's reported relevance.
      final inStockRanksFirst = preferInStockFirst ? b.inStock : a.inStock;
      return inStockRanksFirst ? 1 : -1;
    }
    final aLength = a.title.length;
    final bLength = b.title.length;
    if (aLength != bLength) {
      return aLength.compareTo(bLength);
    }
    return a.title.compareTo(b.title);
  }

  /// Best weighted field score for one document.
  ///
  /// No smoothing and no bonus: the score is one of [AzyMatch]'s tiers times the
  /// field's weight, so a document's rank is explained entirely by which tier it
  /// matched and where. Ties fall through to stock and then title length in
  /// [_compareHits].
  double _score(_IndexedDocument indexed, MatchField query) {
    var best = AzyMatch.scoreQueryFields(query, indexed.title) *
        AzyFieldWeights.title;

    if (indexed.subtitle.isNotEmpty) {
      final subtitleScore = AzyMatch.scoreQueryFields(query, indexed.subtitle) *
          AzyFieldWeights.subtitle;
      if (subtitleScore > best) {
        best = subtitleScore;
      }
    }

    for (final keyword in indexed.keywords) {
      final keywordScore =
          AzyMatch.scoreQueryFields(query, keyword) * AzyFieldWeights.keyword;
      if (keywordScore > best) {
        best = keywordScore;
      }
    }

    return best <= 0 ? 0 : best;
  }
}
