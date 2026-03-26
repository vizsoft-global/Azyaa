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

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:go_router/go_router.dart';

Future handleBranchRouting(BuildContext context) async {
  // Add your function code here!
  // Listen for deep links when the app is in the foreground or opened from background
  FlutterBranchSdk.listSession().listen((data) {
    // 1. Verify the app was opened via a Branch link
    if (data.containsKey('+clicked_branch_link') &&
        data['+clicked_branch_link'] == true) {
      // 2. Extract our custom parameters
      String? pageName = data['page_name'];
      String? pageParameterString =
          data['page_parameter']; // e.g., "product=6QRpj1Z5QjjCVkbbeZJ5"

      // 3. If we have a target page, we navigate
      if (pageName != null && pageName.isNotEmpty) {
        Map<String, String> queryParams = {};

        // 4. Split the clever string into a Key and Value for GoRouter
        if (pageParameterString != null && pageParameterString.contains('=')) {
          List<String> parts = pageParameterString.split('=');
          if (parts.length == 2) {
            String paramKey = parts[0]; // Gets "product"
            String paramValue = parts[1]; // Gets "6QRpj1Z5QjjCVkbbeZJ5"

            queryParams[paramKey] = paramValue;
          }
        }

        // 5. Execute the navigation!
        // This pushes the page exactly as if they clicked a button inside FlutterFlow
        context.pushNamed(
          pageName,
          queryParameters: queryParams,
        );
      }
    }
  }, onError: (error) {
    print('Branch listening error: $error');
  });
}
