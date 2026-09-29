// Automatic FlutterFlow imports
import 'dart:developer';
import '/backend/backend.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future registerFcmTokenIfMissing() async {
  // Add your function code here!
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      log("No logged-in user");
      return;
    }

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    final userSnap = await userRef.get();
    final existingToken = userSnap.data()?['fcm_token'];

    if (existingToken != null &&
        existingToken is String &&
        existingToken.isNotEmpty) {
      log("FCM token already exists: $existingToken");
      return;
    }

    // Request permission (for iOS)
    await FirebaseMessaging.instance.requestPermission();

    // Get new FCM token
    final newToken = await FirebaseMessaging.instance.getToken();

    if (newToken == null || newToken.isEmpty) {
      log("Failed to generate FCM token");
      return;
    }

    // Save to Firestore
    await userRef.set({'fcm_token': newToken}, SetOptions(merge: true));
    log("New FCM token saved: $newToken");
  } catch (e) {
    log("Error registering FCM token: $e");
  }
}
