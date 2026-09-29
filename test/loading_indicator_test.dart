// Ratchets for the loading indicator.
//
// The custom loader was a 200x200 animated WebP that ignored the space it was
// placed in, so inside a 150-tall placeholder it was clipped. It is now a plain
// built-in spinner. These assertions exist because the swap is easy to undo by
// accident: the old widget's API (and the asset) would still look legitimate.
//
// Source-level on purpose: a behavioural test would need a widget binding and
// would only prove one call site renders, whereas the defect was about *all* of
// them rendering something that fits.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

const String _loadingWidget =
    'lib/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
const String _loadingAsset = 'assets/images/loading_animation.webp';

void main() {
  group('the loading indicator', () {
    test('is Flutter\'s own spinner', () {
      final source = File(_loadingWidget).readAsStringSync();
      expect(
        source.contains('CircularProgressIndicator'),
        isTrue,
        reason: 'The loading widget no longer renders a built-in spinner.',
      );
    });

    test('no longer renders the custom animation', () {
      final source = File(_loadingWidget).readAsStringSync();
      expect(
        source.contains('loading_animation.webp'),
        isFalse,
        reason: 'The animated WebP is back. It hard-coded 200x200 regardless '
            'of the space it was given, which is what made it look wrong.',
      );
      expect(
        source.contains('Image.asset'),
        isFalse,
        reason: 'The loader is drawing an image again instead of a spinner.',
      );
    });

    test('sizes itself rather than ignoring its container', () {
      final source = File(_loadingWidget).readAsStringSync();
      expect(
        source.contains('widget.size'),
        isTrue,
        reason: 'The spinner must take a size, or it will overflow the small '
            'placeholders it is used in.',
      );
    });

    test('the orphaned animation asset is gone', () {
      expect(
        File(_loadingAsset).existsSync(),
        isFalse,
        reason: 'The 275KB animation is still bundled although nothing '
            'references it. Remove the file, or restore the reference.',
      );
    });
  });
}
