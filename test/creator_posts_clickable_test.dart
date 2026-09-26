// Source-level guard: creator post thumbnails (Creators Hub cards and the
// creator page's Posts tab) must open the promotion, not be view-only.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final path in [
    'lib/azyaa_group_b/creator/creators/creators_widget.dart',
    'lib/azyaa_group_b/creator/creators_individual/creators_individual_widget.dart',
  ]) {
    test('$path opens promotions from post thumbnails', () {
      final src = File(path).readAsStringSync();
      expect(RegExp(r'CreatorPromotionWidget\s*\.open\(').hasMatch(src), isTrue);
    });
  }
}
