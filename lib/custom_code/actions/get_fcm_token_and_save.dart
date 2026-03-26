// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getFcmTokenAndSave(String userId) async {
  // Add your function code here!
  try {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (!userDoc.exists) {
      print("User not found");
      return '';
    }

    final token = userDoc.data()?['fcm_token'] ?? '';
    print("Retrieved FCM token: $token");
    return token;
  } catch (e) {
    print("Error fetching FCM token: $e");
    return '';
  }
}
