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

Future<String?> generateLink(
  BuildContext context,
  String canonicalIdentifier,
  String title,
  String? description,
  dynamic metadata,
  dynamic linkProperties,
) async {
  // Add your function code here!
  try {
    // Step 1: Build metadata object
    final contentMetaData = BranchContentMetaData();
    if (metadata is Map<String, dynamic>) {
      metadata.forEach((key, value) {
        contentMetaData.addCustomMetadata(key, value);
      });
    }

    // Step 2: Create BranchUniversalObject
    final buo = BranchUniversalObject(
      canonicalIdentifier: canonicalIdentifier,
      title: title,
      contentDescription: description ?? '',
      contentMetadata: contentMetaData,
    );

    // Step 3: Build BranchLinkProperties
    final props = BranchLinkProperties(
      channel: linkProperties['channel']?.toString() ?? '',
      feature: linkProperties['feature']?.toString() ?? '',
      campaign: linkProperties['campaign']?.toString() ?? '',
      stage: linkProperties['stage']?.toString() ?? '',
    );

    // Step 4: Add custom control parameters
    if (linkProperties is Map) {
      linkProperties.forEach((key, value) {
        if (!['channel', 'feature', 'campaign', 'stage'].contains(key)) {
          props.addControlParam(key.toString(), value.toString());
        }
      });
    }

    // Step 5: Generate short link
    final response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: props,
    );

    if (response.success) {
      return response.result;
    } else {
      // SHOW ERROR DIALOG
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: Text('Branch Link Error'),
            content: Text(response.errorMessage ?? 'Unknown SDK Error'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
      return null;
    }
  } catch (e) {
    // SHOW EXCEPTION DIALOG
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('System Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    return null;
  }
}
