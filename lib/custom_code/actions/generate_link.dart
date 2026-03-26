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
    // Guard: canonicalIdentifier must not be empty
    if (canonicalIdentifier.isEmpty) return null;

    // Init SDK
    FlutterBranchSdk.init();
    await Future.delayed(const Duration(milliseconds: 300));

    // Metadata
    final contentMetaData = BranchContentMetaData();
    if (metadata is Map<String, dynamic>) {
      metadata.forEach((key, value) {
        contentMetaData.addCustomMetadata(key, value.toString());
      });
    }

    // BranchUniversalObject
    final buo = BranchUniversalObject(
      canonicalIdentifier: canonicalIdentifier,
      title: title,
      contentDescription: description ?? '',
      contentMetadata: contentMetaData,
    );

    // BranchLinkProperties — set individually, safer across SDK versions
    final props = BranchLinkProperties(
      channel: linkProperties is Map
          ? linkProperties['channel']?.toString() ?? ''
          : '',
      feature: linkProperties is Map
          ? linkProperties['feature']?.toString() ?? ''
          : '',
      campaign: linkProperties is Map
          ? linkProperties['campaign']?.toString() ?? ''
          : '',
      stage: linkProperties is Map
          ? linkProperties['stage']?.toString() ?? ''
          : '',
    );
    if (linkProperties is Map) {
      linkProperties.forEach((key, value) {
        if (!['channel', 'feature', 'campaign', 'stage'].contains(key)) {
          props.addControlParam(key.toString(), value.toString());
        }
      });
    }

    // Generate link
    final response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: props,
    );

    debugPrint(
        'Branch response: ${response.success} | ${response.result} | ${response.errorMessage}');

    if (response.success) {
      return response.result;
    } else {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Branch Link Error'),
          content: Text(response.errorMessage ?? 'Unknown SDK Error'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return null;
    }
  } catch (e) {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('System Error'),
        content: Text(e.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
    return null;
  }
}
