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

String _buildManualLongUrl({
  required String title,
  required String description,
  required String canonicalIdentifier,
  required String channel,
  required String feature,
  required dynamic metadata,
}) {
  const baseUrl =
      'https://v2qlt.test-app.link'; // 🔁 replace with your Branch domain

  final params = <String, String>{
    '\$canonical_identifier': canonicalIdentifier,
    '\$og_title': title,
    '\$og_description': description,
    'channel': channel,
    'feature': feature,
  };

  if (metadata is Map) {
    metadata.forEach((key, value) {
      params[key.toString()] = value.toString();
    });
  }

  final queryString = params.entries
      .where((e) => e.value.isNotEmpty)
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');

  return '$baseUrl?$queryString';
}

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
    if (canonicalIdentifier.isEmpty) return null;

    // Step 1: Metadata
    final contentMetaData = BranchContentMetaData();
    if (metadata is Map<String, dynamic>) {
      metadata.forEach((key, value) {
        contentMetaData.addCustomMetadata(key, value.toString());
      });
    }

    // Step 2: BranchUniversalObject
    final buo = BranchUniversalObject(
      canonicalIdentifier: canonicalIdentifier,
      title: title,
      contentDescription: description ?? '',
      contentMetadata: contentMetaData,
    );

    // Step 3: BranchLinkProperties
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

    // Step 4: Custom control params
    if (linkProperties is Map) {
      linkProperties.forEach((key, value) {
        if (!['channel', 'feature', 'campaign', 'stage'].contains(key)) {
          props.addControlParam(key.toString(), value.toString());
        }
      });
    }

    // Step 5: Try short URL
    final response = await FlutterBranchSdk.getShortUrl(
      buo: buo,
      linkProperties: props,
    );

    debugPrint(
        'Branch response: success=${response.success}, error=${response.errorMessage}');

    if (response.success) {
      return response.result;
    }

    // Step 6: Fallback to manually built long URL
    debugPrint('Falling back to manual long URL');
    return _buildManualLongUrl(
      title: title,
      description: description ?? '',
      canonicalIdentifier: canonicalIdentifier,
      channel: linkProperties is Map
          ? linkProperties['channel']?.toString() ?? ''
          : '',
      feature: linkProperties is Map
          ? linkProperties['feature']?.toString() ?? ''
          : '',
      metadata: metadata,
    );
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
