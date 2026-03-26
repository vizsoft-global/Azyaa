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

Future<String> generateBranchLink(
  String pagename,
  String? image,
  String? pageparameter,
  String? title,
  String? description,
) async {
  // Add your function code here!
  // 1. Create the Universal Object
  // We use a fallback "general" identifier if no parameter is provided
  BranchUniversalObject buo = BranchUniversalObject(
    canonicalIdentifier: 'content/${pageparameter ?? "general"}',
    title: title ?? 'Check this out!',
    contentDescription: description ?? 'Shared from the app',
    imageUrl: image ?? '', // If image is null, pass an empty string
    publiclyIndex: true,
    locallyIndex: true,
  );

  // 2. Add your routing parameters to the link properties
  BranchLinkProperties lp = BranchLinkProperties()
    ..addControlParam('page_name', pagename);

  // Safely add the page_parameter only if it exists
  if (pageparameter != null && pageparameter.isNotEmpty) {
    lp.addControlParam('page_parameter', pageparameter);
  }

  // 3. Generate the short URL
  BranchResponse response =
      await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);

  if (response.success) {
    return response.result; // Returns your https://v2qlt.test-app.link/... URL
  } else {
    return 'Error generating link';
  }
}
