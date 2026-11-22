import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// "Organize in Profile" (P1-25): the Shortlist screen gathers every saved
/// product, designer and creator. Its only way in used to be a Home button that
/// is switched off on every screen size, so nobody could open it.
void main() {
  final profile = File(
          'lib/azyaa_group_a/customer/zone/profile/profile_widget.dart')
      .readAsStringSync();
  final nav = File('lib/flutter_flow/nav/nav.dart').readAsStringSync();

  test('the profile has a Shortlist row that opens the Shortlist screen', () {
    final row = RegExp(
      r"ShortlistWidget\s*\.routeName[\s\S]{0,2500}?enText:\s*'Shortlist'",
    );
    expect(row.hasMatch(profile), isTrue);
    expect(profile.contains("arText: 'قائمة مختصرة'"), isTrue);
  });

  test('the row is not behind a switched-off visibility check', () {
    final at = profile.indexOf('ShortlistWidget.routeName');
    expect(at, greaterThan(0));
    // The Home button sits inside responsiveVisibility(... all false). The
    // profile row must not: look back over the widgets that wrap it.
    final before = profile.substring(at - 1200 < 0 ? 0 : at - 1200, at);
    expect(before.contains('responsiveVisibility'), isFalse);
    expect(before.contains('if (false)'), isFalse);
  });

  test('the row sits in the list with Refer a friend, before it', () {
    final shortlist = profile.indexOf('ShortlistWidget.routeName');
    final refer = profile.indexOf('ReferFriendWidget.routeName');
    expect(shortlist, lessThan(refer));
    expect(refer - shortlist, lessThan(4000));
  });

  test('the Shortlist screen is a signed-in route', () {
    final route = RegExp(
      r'name:\s*ShortlistWidget\.routeName,[\s\S]{0,160}?requireAuth:\s*true',
    );
    expect(route.hasMatch(nav), isTrue);
  });
}
