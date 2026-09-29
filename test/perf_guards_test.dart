// Ratchet guards for the anti-jank / anti-regression rules.
//
// These are source-level tests: they read lib/ and fail if a known
// performance anti-pattern count goes UP. They run on the Dart VM (no
// browser, no Firebase), so `flutter test` is a usable safety net.
//
// WHEN YOU FIX SOMETHING: lower the matching constant below and commit.
// NEVER raise a constant to make a test pass — fix the code instead.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// `Image.network` writes nothing to disk and re-downloads + re-decodes on
/// every rebuild. Use `CachedNetworkImage` instead (dependency is already in
/// pubspec.yaml). Started at 110, now fully converted -> 0. Keep it at 0.
const int _maxUncachedNetworkImages = 0;

/// `shrinkWrap: true` forces a list to build ALL children eagerly.
/// Counted at start: 111. Lower this as files are fixed; never raise it.
const int _maxShrinkWrap = 111;

/// Files that have been fully converted to cached images.
const List<String> _imageCacheFixed = [
  'lib/azyaa_group_b/designer/designers_list/designers_list_widget.dart',
  'lib/azyaa_group_a/home/main/product/product_widget.dart',
];

/// PITFALL (learned the hard way 2026-09-20): `CachedNetworkImage` is a
/// widget, NOT an `Image`. It has no `.image` ImageProvider getter, so
/// `CachedNetworkImage(url).image` does not compile. Where a
/// `DecorationImage` needs a provider, use `CachedNetworkImageProvider(url)`.
/// The analyzer catches this as `undefined_getter`, so it is deliberately not
/// duplicated as a weaker test here.

List<File> _dartFilesUnder(String dir) {
  final d = Directory(dir);
  if (!d.existsSync()) return const [];
  return d
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .toList();
}

int _countOccurrences(String needle) {
  var total = 0;
  for (final f in _dartFilesUnder('lib')) {
    total += RegExp(RegExp.escape(needle)).allMatches(f.readAsStringSync()).length;
  }
  return total;
}

void main() {
  test('lib/ exists and is readable by the guard harness', () {
    expect(Directory('lib').existsSync(), isTrue,
        reason: 'run `flutter test` from the package root (azyaa-app/)');
    expect(_dartFilesUnder('lib').length, greaterThan(400));
  });

  test('uncached Image.network usages do not increase', () {
    final actual = _countOccurrences('Image.network');
    expect(
      actual,
      lessThanOrEqualTo(_maxUncachedNetworkImages),
      reason: 'Found $actual `Image.network`. New image loads must use '
          'CachedNetworkImage. If you fixed some, lower '
          '_maxUncachedNetworkImages to $actual.',
    );
  });

  test('eager shrinkWrap lists do not increase', () {
    final actual = _countOccurrences('shrinkWrap: true');
    expect(
      actual,
      lessThanOrEqualTo(_maxShrinkWrap),
      reason: 'Found $actual `shrinkWrap: true`. On long lists this builds '
          'every child eagerly. If you fixed some, lower _maxShrinkWrap to '
          '$actual.',
    );
  });

  test('files marked image-cache-fixed contain no Image.network', () {
    for (final path in _imageCacheFixed) {
      final file = File(path);
      expect(file.existsSync(), isTrue, reason: '$path is missing');
      final body = file.readAsStringSync();
      expect(
        RegExp(RegExp.escape('Image.network')).allMatches(body).length,
        0,
        reason: '$path is on the fixed list but still uses Image.network.',
      );
      expect(
        body.contains('cached_network_image/cached_network_image.dart'),
        isTrue,
        reason: '$path must import cached_network_image.',
      );
    }
  });
}
