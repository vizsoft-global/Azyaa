import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'apple_auth.dart' show generateNonce, sha256ofString;

/// Whether this build can sign in with Facebook.
///
/// Facebook sign-in on phones only works through Facebook's own SDK, and the
/// SDK reads the Facebook app ID from files that are fixed when the app is
/// built. It cannot be changed from the admin panel or from the database.
///
/// The app currently ships with a TEMPORARY app ID, so this stays false and
/// the Facebook button is hidden, whatever the `facebook_login` switch in the
/// admin panel says.
///
/// To go live, once the Meta developer app for Azyaa exists:
///  1. Replace the temporary ID and client token in
///     `android/app/src/main/res/values/strings.xml` (three values) and in
///     `ios/Runner/Info.plist` (`fb<ID>` URL scheme, `FacebookAppID`,
///     `FacebookClientToken`).
///  2. In the Meta app, add the Android package `com.azya.app` with its key
///     hashes and the iOS bundle ID.
///  3. In Firebase Authentication, enable the Facebook provider with the same
///     app ID and its app secret, and copy Firebase's redirect link into the
///     Meta app's Facebook Login settings.
///  4. Set this to true, release the app, then turn on Facebook under
///     Settings > Login options in the admin panel.
const bool kFacebookSignInAvailable = false;

Future<UserCredential?> facebookSignIn() async {
  if (!kFacebookSignInAvailable) {
    throw FirebaseAuthException(
      code: 'operation-not-allowed',
      message: 'Facebook sign-in is not available yet.',
    );
  }
  if (kIsWeb) {
    return await FirebaseAuth.instance.signInWithPopup(FacebookAuthProvider());
  }

  // On iPhone, Facebook gives a full token only to apps that ask to track the
  // user. Azyaa does not, so it uses Facebook's Limited Login there, which
  // returns a signed ID token tied to a one-time nonce (same idea as Apple).
  final useLimitedLogin = defaultTargetPlatform == TargetPlatform.iOS;
  final rawNonce = generateNonce();

  final result = await FacebookAuth.instance.login(
    permissions: const ['email', 'public_profile'],
    loginTracking:
        useLimitedLogin ? LoginTracking.limited : LoginTracking.enabled,
    nonce: useLimitedLogin ? sha256ofString(rawNonce) : null,
  );

  switch (result.status) {
    case LoginStatus.cancelled:
      return null;
    case LoginStatus.success:
      break;
    case LoginStatus.failed:
    case LoginStatus.operationInProgress:
      throw FirebaseAuthException(
        code: 'facebook-login-failed',
        message: result.message ?? 'Facebook sign-in did not finish.',
      );
  }

  final token = result.accessToken;
  if (token == null) {
    throw FirebaseAuthException(
      code: 'facebook-login-failed',
      message: 'Facebook did not return a sign-in token.',
    );
  }

  final credential = token.type == AccessTokenType.limited
      ? OAuthProvider('facebook.com').credential(
          idToken: token.tokenString,
          rawNonce: rawNonce,
        )
      : FacebookAuthProvider.credential(token.tokenString);

  return FirebaseAuth.instance.signInWithCredential(credential);
}
