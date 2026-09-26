// Unit tests for the literal pattern matcher.
//
// Pure Dart: no Flutter binding, no Firebase, no network. Run with
//   flutter test test/search_matcher_test.dart
//
// The cases the brief called out by name -- "red", "velvet", "jacket" finding
// "Red Velvet Jacket", and the three-character floor -- are asserted verbatim
// in `the brief's own examples` below.

import 'package:azyaa/backend/search/search_matcher.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AzyText.normalize', () {
    test('lower-cases and collapses punctuation and whitespace', () {
      expect(AzyText.normalize('  Green   DRESS!! '), 'green dress');
      expect(AzyText.normalize('Silk-Saree/Blue'), 'silk saree blue');
    });

    test('folds precomposed Latin accents', () {
      expect(AzyText.normalize('Café'), 'cafe');
      expect(AzyText.normalize('Crème Brûlée'), 'creme brulee');
      expect(AzyText.normalize('Straße'), 'strasse');
    });

    test('folds Arabic letter variants, so either keyboard layout matches', () {
      expect(AzyText.normalize('أحمد'), 'احمد');
      expect(AzyText.normalize('إحمد'), 'احمد');
      expect(AzyText.normalize('آحمد'), 'احمد');
      expect(AzyText.normalize('مدرسة'), 'مدرسه');
      expect(AzyText.normalize('مصطفى'), 'مصطفي');
    });

    test('strips Arabic diacritics and tatweel', () {
      expect(AzyText.normalize('كِتاب'), 'كتاب');
      expect(AzyText.normalize('مُحَمَّد'), 'محمد');
      expect(AzyText.normalize('كــتاب'), 'كتاب');
    });

    test('is idempotent', () {
      const raw = '  Silk   Saree!! Blue ';
      final once = AzyText.normalize(raw);
      expect(AzyText.normalize(once), once);
    });
  });

  group('AzyText.tokenize', () {
    test('splits normalized text and drops empties', () {
      expect(AzyText.tokenize('  Green   Dress '), ['green', 'dress']);
      expect(AzyText.tokenize('   '), isEmpty);
    });
  });

  group('minimum query length', () {
    test('refuses fewer than three characters', () {
      expect(AzyMatch.meetsMinimumLength('ab'), isFalse);
      expect(AzyMatch.meetsMinimumLength('a'), isFalse);
      expect(AzyMatch.meetsMinimumLength(''), isFalse);
      expect(AzyMatch.meetsMinimumLength('   '), isFalse);
    });

    test('accepts three or more', () {
      expect(AzyMatch.meetsMinimumLength('red'), isTrue);
      expect(AzyMatch.meetsMinimumLength('  red  '), isTrue);
      expect(AzyMatch.meetsMinimumLength('velvet jacket'), isTrue);
    });

    test('counts the normalized form, so punctuation cannot pad a query', () {
      expect(AzyMatch.meetsMinimumLength('a-b'), isFalse);
      expect(AzyMatch.meetsMinimumLength('a--b--c'), isTrue);
    });
  });

  group('tier ladder', () {
    test('exact match is the top tier', () {
      expect(AzyMatch.score('green dress', 'Green Dress'), AzyMatch.kExact);
    });

    test('field prefix', () {
      expect(
        AzyMatch.score('gree', 'Green Dress'),
        greaterThan(AzyMatch.kWordStart),
      );
      expect(AzyMatch.score('green dr', 'Green Dress'), AzyMatch.kFieldPrefix);
    });

    test('a word inside the field starting with the query', () {
      expect(AzyMatch.score('dre', 'Green Dress'), AzyMatch.kWordStart);
    });

    test('containment anywhere, mid-word included', () {
      expect(AzyMatch.score('een dr', 'Green Dress'), AzyMatch.kContains);
      expect(AzyMatch.score('reen', 'Green Dress'), AzyMatch.kContains);
      expect(AzyMatch.score('ress', 'Green Dress'), AzyMatch.kContains);
    });

    test('the tiers are strictly ordered', () {
      const ladder = [
        AzyMatch.kExact,
        AzyMatch.kFieldPrefix,
        AzyMatch.kWordStart,
        AzyMatch.kContains,
        AzyMatch.kMatchThreshold,
      ];
      for (var i = 1; i < ladder.length; i++) {
        expect(ladder[i], lessThan(ladder[i - 1]));
      }
    });

    test('unrelated text does not match', () {
      expect(AzyMatch.score('zzzz', 'Green Dress'), 0.0);
    });

    test('an empty field never matches', () {
      expect(AzyMatch.score('anything', ''), 0.0);
    });
  });

  group('no typo tolerance', () {
    test('a misspelling is not a match', () {
      // These are the exact shapes the fuzzy engine used to return as hits.
      expect(AzyMatch.score('drees', 'dress'), 0.0);
      expect(AzyMatch.score('flauers', 'flowers'), 0.0);
      expect(AzyMatch.score('velvit', 'Red Velvet Jacket'), 0.0);
    });

    test('an initialism is not a match', () {
      expect(AzyMatch.score('gfd', 'Green Flower Dress'), 0.0);
    });

    test('transposed characters are not a match', () {
      expect(AzyMatch.score('gern', 'green'), 0.0);
    });
  });

  group("the brief's own examples", () {
    const jacket = 'Red Velvet Jacket';

    test('any single word matches, wherever it sits', () {
      for (final term in ['red', 'velvet', 'jacket']) {
        expect(
          AzyMatch.scoreQuery(term, jacket),
          greaterThanOrEqualTo(AzyMatch.kMatchThreshold),
          reason: '"$term" should find "$jacket"',
        );
      }
    });

    test('a mid-word fragment matches', () {
      expect(AzyMatch.scoreQuery('elvet', jacket), AzyMatch.kContains);
      expect(AzyMatch.scoreQuery('acke', jacket), AzyMatch.kContains);
    });

    test('the beginning, middle and end of a name all match', () {
      const name = 'Olive Flowly';
      expect(AzyMatch.scoreQuery('oli', name), greaterThan(0));
      expect(AzyMatch.scoreQuery('ive', name), AzyMatch.kContains);
      expect(AzyMatch.scoreQuery('flow', name), greaterThan(0));
    });

    test('words may be given in any order', () {
      expect(
        AzyMatch.scoreQuery('jacket red', jacket),
        greaterThanOrEqualTo(AzyMatch.kMatchThreshold),
      );
      expect(
        AzyMatch.scoreQuery('red jacket', jacket),
        greaterThanOrEqualTo(AzyMatch.kMatchThreshold),
      );
    });

    test('a word the name does not contain fails the whole query', () {
      expect(AzyMatch.scoreQuery('red shoes', jacket), 0.0);
      expect(AzyMatch.scoreQuery('velvet jeans', jacket), 0.0);
    });

    test('matching ignores case and punctuation', () {
      expect(AzyMatch.scoreQuery('RED', jacket), greaterThan(0));
      expect(AzyMatch.scoreQuery('red-velvet', jacket), greaterThan(0));
    });

    test('a multi-word query scores as its weakest word', () {
      // "red" and "jacket" both start words in the name, so both are 0.80.
      expect(AzyMatch.scoreQuery('red jacket', jacket), AzyMatch.kWordStart);
    });
  });

  group('Arabic search', () {
    test('a variant spelling finds the stored form', () {
      expect(
        AzyMatch.scoreQuery('احمد', 'أحمد علي'),
        greaterThanOrEqualTo(AzyMatch.kMatchThreshold),
      );
    });

    test('a mid-word fragment of an Arabic name matches', () {
      expect(AzyMatch.scoreQuery('حمد', 'أحمد علي'), AzyMatch.kContains);
    });
  });

  group('MatchField', () {
    test('splits on spaces and reports emptiness', () {
      expect(MatchField.of('  Two  Words ').words, ['two', 'words']);
      expect(MatchField.of('   ').isEmpty, isTrue);
      expect(MatchField.of('one').isMultiWord, isFalse);
      expect(MatchField.of('one two').isMultiWord, isTrue);
    });
  });
}
