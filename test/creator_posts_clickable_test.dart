// Source-level guard: creator posts open the promotion, not a view-only image.
// The hub does that from the reels feed; the creator page does it from Posts.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final path in [
    'lib/azyaa_group_b/creator/creator_reels_feed/creator_reels_feed.dart',
    'lib/azyaa_group_b/creator/creators_individual/creators_individual_widget.dart',
  ]) {
    test('$path opens promotions from posts', () {
      final src = File(path).readAsStringSync();
      expect(RegExp(r'CreatorPromotionWidget\s*\.open\(').hasMatch(src), isTrue);
    });
  }
}
