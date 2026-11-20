// Tests for the Phase 1 sign-in buttons and the "Refer a friend" screen.
//
// Two halves, like the other tests here:
//   * a pure half for the settings record that switches the buttons on and off,
//   * a source half for the wiring, because the defects this fixes compiled and
//     ran: the Facebook button opened Apple sign-in, and the referral step
//     compared a translated word against an English one.
//
// Run with: flutter test test/social_signin_referral_test.dart

import 'dart:io';

import 'package:azyaa/backend/schema/structs/social_login_struct.dart';
import 'package:flutter_test/flutter_test.dart';

const String _socialFile =
    'lib/azyaa_group_a/customer/sign/register/social/social_widget.dart';
const String _appleFile = 'lib/auth/firebase_auth/apple_auth.dart';
const String _facebookFile = 'lib/auth/firebase_auth/facebook_auth.dart';
const String _step4File =
    'lib/azyaa_group_a/customer/steps/step4_referral_code/step4_referral_code_widget.dart';
const String _profileFile =
    'lib/azyaa_group_a/customer/zone/profile/profile_widget.dart';
const String _referFile =
    'lib/azyaa_group_a/customer/zone/refer_friend/refer_friend_widget.dart';
const String _navFile = 'lib/flutter_flow/nav/nav.dart';
const String _androidStrings = 'android/app/src/main/res/values/strings.xml';
const String _androidManifest = 'android/app/src/main/AndroidManifest.xml';
const String _iosPlist = 'ios/Runner/Info.plist';

/// Placeholder Facebook app ID shipped until the real Meta app exists.
const String _tempFacebookAppId = '000000000000000';

String _stringResource(String xml, String name) {
  final match =
      RegExp('<string name="$name">([^<]*)</string>').firstMatch(xml);
  expect(match, isNotNull, reason: '$name is missing from strings.xml');
  return match!.group(1)!;
}

String _plistString(String plist, String key) {
  final match = RegExp('<key>$key</key>\\s*<string>([^<]*)</string>')
      .firstMatch(plist);
  expect(match, isNotNull, reason: '$key is missing from Info.plist');
  return match!.group(1)!;
}

String _read(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: '$path is missing');
  return file.readAsStringSync();
}

void main() {
  group('SocialLoginStruct', () {
    test('reads the Apple on Android switch', () {
      final struct = SocialLoginStruct.fromMap({
        'google_login': true,
        'apple_login': true,
        'apple_login_android': true,
        'facebook_login': false,
      });
      expect(struct.appleLoginAndroid, isTrue);
      expect(struct.toMap()['apple_login_android'], isTrue);
    });

    test('Apple on Android is off for records saved before the switch existed',
        () {
      final struct = SocialLoginStruct.fromMap({
        'google_login': true,
        'apple_login': true,
        'facebook_login': false,
      });
      expect(struct.appleLoginAndroid, isFalse);
      expect(struct.toMap().containsKey('apple_login_android'), isFalse);
    });
  });

  group('sign-in buttons', () {
    test('only the Apple button starts Apple sign-in', () {
      final source = _read(_socialFile);
      expect('authManager.signInWithApple('.allMatches(source).length, 1);
      expect('authManager.signInWithFacebook('.allMatches(source).length, 1);
    });

    test('the Facebook button stays hidden until the build supports it', () {
      final source = _read(_socialFile);
      expect(source, contains('if (kFacebookSignInAvailable &&'));
      expect(_read(_facebookFile), contains('if (!kFacebookSignInAvailable)'));
    });

    test('Facebook uses the same app ID on Android and iPhone', () {
      final strings = _read(_androidStrings);
      final plist = _read(_iosPlist);
      final appId = _stringResource(strings, 'facebook_app_id');
      expect(_stringResource(strings, 'fb_login_protocol_scheme'), 'fb$appId');
      expect(_plistString(plist, 'FacebookAppID'), appId);
      expect(plist, contains('<string>fb$appId</string>'));
      expect(_plistString(plist, 'FacebookClientToken'),
          _stringResource(strings, 'facebook_client_token'));
    });

    test('Facebook does not report usage or advertising IDs', () {
      final manifest = _read(_androidManifest);
      expect(
          manifest,
          contains(
              'com.facebook.sdk.AutoLogAppEventsEnabled" android:value="false"'));
      expect(
          manifest,
          contains(
              'com.facebook.sdk.AdvertiserIDCollectionEnabled" android:value="false"'));
      final plist = _read(_iosPlist);
      expect(
          plist,
          matches(RegExp(
              r'<key>FacebookAutoLogAppEventsEnabled</key>\s*<false/>')));
      expect(
          plist,
          matches(RegExp(
              r'<key>FacebookAdvertiserIDCollectionEnabled</key>\s*<false/>')));
    });

    test('the Facebook button cannot be switched on while the ID is temporary',
        () {
      final appId =
          _stringResource(_read(_androidStrings), 'facebook_app_id');
      final available = _read(_facebookFile)
          .contains('const bool kFacebookSignInAvailable = true;');
      if (appId == _tempFacebookAppId) {
        expect(available, isFalse,
            reason: 'Put the real Meta app ID in before showing the button.');
      }
    });

    test('Apple shows on Android only behind its own switch', () {
      final source = _read(_socialFile);
      expect(source, contains('isAndroid == true'));
      expect(source, contains('settingsSocialLogin.appleLoginAndroid'));
      expect(_read(_appleFile), contains('TargetPlatform.android'));
      expect(_read(_appleFile), contains('signInWithProvider(provider)'));
    });
  });

  group('referral', () {
    test('the referral step never compares against a translated status', () {
      final source = _read(_step4File);
      expect(source, isNot(contains("enText: 'Referred'")));
      expect(source, isNot(contains("enText: 'notYet'")));
      expect(source, contains("_model.referralStatys == 'Referred'"));
    });

    test('Profile opens the Refer a friend screen and the route exists', () {
      expect(_read(_profileFile), contains('ReferFriendWidget.routeName'));
      expect(_read(_navFile), contains('const ReferFriendWidget()'));
    });

    test('the screen shows the code and can copy and share it', () {
      final source = _read(_referFile);
      expect(source, contains('currentUserDocument?.referralCode'));
      expect(source, contains('Clipboard.setData'));
      expect(source, contains('Share.share('));
    });
  });
}
