// Plain pattern matching for Azyaa's on-device search.
//
// WHY THIS REPLACED THE FUZZY SCORER
// ----------------------------------
// The previous engine answered typo-tolerant queries: `drees` matched "dress"
// at one edit, `flauers` matched "flowers" at two, and `gfd` matched "Green
// Flower Dress" as an ordered subsequence. That is the wrong trade for a
// catalogue. It returns rows for terms the shopper never typed, and it makes
// ranking depend on edit distance instead of on what was asked for.
//
// So matching is literal now. A term matches only text that really contains it,
// in that order, at any position:
//
//   1.00  the field is exactly the query
//   0.90  the field starts with the query
//   0.80  a word inside the field starts with it
//   0.70  the field contains it anywhere, including mid-word
//   none  everything else -- no edit distance, no bigrams, no initialisms
//
// Every tier is a substring property, so "red", "velvet" and "jacket" each find
// "Red Velvet Jacket", and so does "elvet" (mid-word), while "velvit" and
// "redjac" find nothing.
//
// MULTI-WORD QUERIES
// ------------------
// Every word typed must appear somewhere in the field, in any order. "red
// jacket" therefore finds "Red Velvet Jacket", while "red shoes" does not,
// because "shoes" is absent. The score is the weakest word's tier, so a query
// is only ever as good as its least-matching word.
//
// MINIMUM LENGTH
// --------------
// Queries shorter than [AzyMatch.minQueryLength] are not searched at all. Two
// characters of a catalogue this size match far too many rows to be a filter;
// [AzyMatch.meetsMinimumLength] is what callers check before querying.
//
// NORMALIZATION STAYS
// -------------------
// Folding case, accents, punctuation and Arabic letter variants (أ/ا, ة/ه, ى/ي)
// is not fuzziness -- it is what makes a phone keyboard's output comparable to
// stored text at all, since the same word can be typed several ways.
//
// Pure Dart, no Flutter imports: unit-testable on the Dart VM.

/// Unicode-aware text helpers.
///
/// Everything funnels through [normalize], so matching is accent-, case-,
/// punctuation- and Arabic-variant-insensitive.
abstract final class AzyText {
  /// Accented or variant characters folded to their base form.
  ///
  /// Arabic first: users type on phone keyboards that emit whichever
  /// alef/ya/ta-marbuta variant the layout happens to offer, so "أحمد" and
  /// "احمد" must match.
  ///
  /// Latin follows, and is needed because [normalize]'s combining-mark strip
  /// only catches *decomposed* forms — a precomposed "é" is a single code point
  /// (U+00E9) and would otherwise survive untouched. Product names in imported
  /// catalogues routinely carry these.
  static const Map<String, String> _folds = {
    // Arabic
    '\u0622': '\u0627', // آ -> ا
    '\u0623': '\u0627', // أ -> ا
    '\u0625': '\u0627', // إ -> ا
    '\u0671': '\u0627', // ٱ -> ا
    '\u0649': '\u064A', // ى -> ي
    '\u0626': '\u064A', // ئ -> ي
    '\u0629': '\u0647', // ة -> ه
    '\u0624': '\u0648', // ؤ -> و
    // Latin
    'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a', 'å': 'a',
    'è': 'e', 'é': 'e', 'ê': 'e', 'ë': 'e',
    'ì': 'i', 'í': 'i', 'î': 'i', 'ï': 'i',
    'ò': 'o', 'ó': 'o', 'ô': 'o', 'õ': 'o', 'ö': 'o', 'ø': 'o',
    'ù': 'u', 'ú': 'u', 'û': 'u', 'ü': 'u',
    'ç': 'c', 'ñ': 'n', 'ý': 'y', 'ÿ': 'y',
    'æ': 'ae', 'œ': 'oe', 'ß': 'ss',
  };

  static final RegExp _arabicDiacritics =
      RegExp('[\u064B-\u0652\u0640\u0670]');
  static final RegExp _combiningMarks = RegExp('[\u0300-\u036f]');
  static final RegExp _notWord = RegExp('[^\\p{L}\\p{N}]+', unicode: true);
  static final RegExp _spaces = RegExp('\\s+');

  /// Lower-cases, strips accents/diacritics, folds Arabic variants and
  /// collapses every run of punctuation or whitespace into a single space.
  ///
  /// The result is safe to compare with `==` and to tokenize on ' '.
  static String normalize(String input) {
    if (input.isEmpty) {
      return '';
    }
    var s = input.toLowerCase();
    s = s.replaceAll(_combiningMarks, '');
    s = s.replaceAll(_arabicDiacritics, '');
    final buffer = StringBuffer();
    for (final rune in s.runes) {
      final ch = String.fromCharCode(rune);
      buffer.write(_folds[ch] ?? ch);
    }
    s = buffer.toString();
    s = s.replaceAll(_notWord, ' ');
    s = s.replaceAll(_spaces, ' ');
    return s.trim();
  }

  /// [normalize], then split on spaces. Empty tokens are dropped.
  static List<String> tokenize(String input) {
    final normalized = normalize(input);
    if (normalized.isEmpty) {
      return const [];
    }
    return normalized
        .split(' ')
        .where((t) => t.isNotEmpty)
        .toList(growable: false);
  }
}

/// A field's normalized form, computed once and reused across every query.
///
/// THE HOT PATH PROBLEM
/// --------------------
/// The obvious implementation re-normalizes and re-splits the *field* on every
/// comparison. Across a 5,000-document catalogue that is 5,000 normalizations
/// and 5,000 `split(' ')` calls **per keystroke**, which measured ~14.7ms per
/// query — an entire frame's budget spent before anything is even drawn.
///
/// So the field is normalized and split once, when the document is indexed, and
/// the query is built into one of these too so both sides of a comparison are
/// the same shape.
class MatchField {
  MatchField.fromNormalized(this.normalized) : words = _split(normalized);

  /// Normalizes [raw] and precomputes its derived forms.
  factory MatchField.of(String raw) =>
      MatchField.fromNormalized(AzyText.normalize(raw));

  /// The normalized text, safe to compare with `==`.
  final String normalized;

  /// [normalized] split on spaces. Never contains an empty entry, because
  /// [AzyText.normalize] collapses whitespace runs.
  final List<String> words;

  bool get isEmpty => normalized.isEmpty;
  bool get isNotEmpty => normalized.isNotEmpty;

  /// True when the field holds more than one word, i.e. a query has both a
  /// phrase reading and a per-word reading to choose between.
  bool get isMultiWord => words.length > 1;

  static List<String> _split(String normalized) =>
      normalized.isEmpty ? const [] : List.unmodifiable(normalized.split(' '));
}

/// Literal pattern matcher. See the file header for the tier ladder.
abstract final class AzyMatch {
  /// Shortest query worth running. Below this, matching is not selective
  /// enough to be a filter, so callers ask for more characters instead.
  static const int minQueryLength = 3;

  /// The field is exactly the query.
  static const double kExact = 1.0;

  /// The field starts with the query.
  static const double kFieldPrefix = 0.90;

  /// A word *inside* the field starts with the query.
  static const double kWordStart = 0.80;

  /// The field contains the query somewhere, mid-word included.
  static const double kContains = 0.70;

  /// Scores below this are reported as "no match". Every real tier sits above
  /// it, so this only has to separate a match from the `0.0` returned for none.
  static const double kMatchThreshold = 0.50;

  /// True when [rawQuery] is long enough to search.
  ///
  /// Measured on the normalized form with spaces removed, because that is what
  /// matching sees: punctuation collapses away, and counting the spaces would
  /// let "a b" pass as three characters while actually matching a one-letter
  /// word against the whole catalogue.
  static bool meetsMinimumLength(String rawQuery) =>
      AzyText.normalize(rawQuery).replaceAll(' ', '').length >= minQueryLength;

  /// Scores one pre-normalized [query] against one pre-normalized [field].
  ///
  /// This is the hot path, so both arguments are [MatchField]s: nothing is
  /// normalized or split per comparison. Use [score] when you only have raw
  /// strings.
  static double scoreField(MatchField query, MatchField field) {
    if (query.isEmpty || field.isEmpty) {
      return 0.0;
    }
    final queryText = query.normalized;
    final fieldText = field.normalized;
    if (queryText == fieldText) {
      return kExact;
    }
    if (fieldText.startsWith(queryText)) {
      return kFieldPrefix;
    }
    for (final word in field.words) {
      if (word.startsWith(queryText)) {
        return kWordStart;
      }
    }
    if (fieldText.contains(queryText)) {
      return kContains;
    }
    return 0.0;
  }

  /// Scores [query] against [field], normalizing both first.
  ///
  /// Fine for a one-off check, but NOT for scoring a whole catalogue: it builds
  /// both [MatchField]s on every call. The index uses [scoreQueryFields] with
  /// precomputed fields instead.
  static double score(String query, String field) =>
      scoreField(MatchField.of(query), MatchField.of(field));

  /// Scores a possibly multi-word [query] against [field], normalizing both.
  static double scoreQuery(String query, String field) =>
      scoreQueryFields(MatchField.of(query), MatchField.of(field));

  /// [scoreQuery] for precomputed fields — the catalogue-wide hot path.
  ///
  /// Takes the better of two readings:
  ///   * the query as a phrase ("green dress" inside "green dress large"), and
  ///   * every query word matching somewhere, in any order.
  ///
  /// The second reading is all-or-nothing: one absent word fails the document,
  /// and the score is the weakest word's tier. A partial match is not a match,
  /// which is the whole point of dropping typo tolerance.
  static double scoreQueryFields(MatchField query, MatchField field) {
    if (query.isEmpty || field.isEmpty) {
      return 0.0;
    }

    final phraseScore = scoreField(query, field);
    if (!query.isMultiWord) {
      return phraseScore;
    }

    // Both sides are precomputed, so the inner loop allocates nothing.
    var weakest = kExact;
    for (final word in query.words) {
      final wordScore = _scoreWord(word, field);
      if (wordScore == 0.0) {
        return 0.0;
      }
      if (wordScore < weakest) {
        weakest = wordScore;
      }
    }
    return weakest > phraseScore ? weakest : phraseScore;
  }

  /// Best tier [word] earns inside [field], or `0.0` when it is absent.
  ///
  /// A word that equals a field word scores [kWordStart], not [kExact]: the
  /// exact tier is reserved for the whole field matching the whole query, so
  /// adding a second word to a query can never raise its score above the
  /// single-word case.
  static double _scoreWord(String word, MatchField field) {
    if (word.isEmpty) {
      return 0.0;
    }
    for (final candidate in field.words) {
      if (candidate.startsWith(word)) {
        return kWordStart;
      }
    }
    return field.normalized.contains(word) ? kContains : 0.0;
  }
}
