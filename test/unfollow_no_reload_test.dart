// Source-level guard: unfollowing must not re-push the creator/designer page
// (that reloaded the whole page and stacked a duplicate route).

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('unfollow popup only pops, never pushes a page', () {
    final src = File(
      'lib/azyaa_group_b/components/unfollow_confirm_popup/unfollow_confirm_popup_widget.dart',
    ).readAsStringSync();
    expect(src.contains('pushNamed('), isFalse);
    expect(src.contains('Navigator.pop(context);'), isTrue);
  });
}
