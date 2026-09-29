// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

Future notificationRedirect(BuildContext context) async {
  // Add your function code here!

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    final page = message.data['initialPage'];
    if (page == null) return;

    // Add routing logic for supported pages
    if (page == 'Profile') {
      Navigator.pushNamed(context, '/azyaa-my-dashboard');
    }

    // Add more mappings if needed (e.g., OrderDetails, ChatPage, etc.)
  });
}
