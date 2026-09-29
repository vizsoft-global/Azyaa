// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

// Global variables for warm starts and the 5-second cooldown feature
bool _isBranchListening = false;
BuildContext? _latestContext;
String? _lastLinkHandled;
DateTime? _lastHandledTime;
const Duration _cooldown = Duration(seconds: 5);

Future handleBranchRoutingNew(BuildContext context) async {
  _latestContext = context;

  // --- HELPER FUNCTION: Pushes logs to your App State List ---
  void logToEvent(String msg) {
    debugPrint('[Branch] $msg');
    FFAppState().update(() {
      FFAppState().branchDebugLogs.add(msg);
    });
  }

  if (_isBranchListening) {
    logToEvent('Warm Start: Listener already running. Context updated.');
    return;
  }

  _isBranchListening = true;
  logToEvent('Cold Start: Initialized Branch listener stream.');

  FlutterBranchSdk.listSession().listen((data) {
    logToEvent('RECEIVED DATA:\n$data');

    // Ignore if not a clicked Branch deep link
    if (!data.containsKey('+clicked_branch_link') ||
        data['+clicked_branch_link'] != true) {
      logToEvent('IGNORED: Not a clicked Branch deep link.');
      return;
    }

    // ✅ Fix 1: Correct key with $ prefix
    final linkId =
        data['~referring_link'] ?? data['\$deeplink_path'] ?? 'unknown_link';
    final now = DateTime.now();

    if (_lastLinkHandled == linkId &&
        _lastHandledTime != null &&
        now.difference(_lastHandledTime!) < _cooldown) {
      logToEvent('IGNORED: Duplicate link click blocked (5s cooldown).');
      return;
    }

    _lastLinkHandled = linkId;
    _lastHandledTime = now;
    logToEvent('Link passed cooldown. Processing...');

    final String? pageName = data['page_name']?.toString();
    final String? pageParameterString = data['page_parameter']?.toString();

    if (pageName == null || pageName.isEmpty) {
      logToEvent('ERROR: No "page_name" found. Aborting.');
      return;
    }

    logToEvent(
        'EXTRACTED:\nPage: $pageName\nParam String: $pageParameterString');

    final Map<String, String> queryParams = {};

    // ✅ Fix 2: Pass full Firestore path so FlutterFlow can reconstruct
    //           the DocumentReference via getParam(..., ParamType.DocumentReference)
    if (pageParameterString != null && pageParameterString.isNotEmpty) {
      // Map page_name to its collection and query param key
      if (pageName == 'Product') {
        queryParams['product'] = 'products/$pageParameterString';
      }
      // Add more pages here as needed:
      // if (pageName == 'Order') {
      //   queryParams['order'] = 'orders/$pageParameterString';
      // }
    }

    // ✅ Fix 3: Removed refresh_key — it interferes with FlutterFlow param parsing

    logToEvent('GOROUTER PARAMS:\n$queryParams');

    Future.delayed(const Duration(milliseconds: 500), () {
      if (_latestContext != null && _latestContext!.mounted) {
        logToEvent('Navigating to "$pageName"...');
        try {
          _latestContext!.pushNamed(
            pageName, // 'Product' matches ProductWidget.routeName
            queryParameters: queryParams,
          );
          logToEvent('SUCCESS! pushNamed executed.');
        } catch (e) {
          logToEvent('CRITICAL ERROR:\n$e');
        }
      } else {
        logToEvent('CRITICAL ERROR: BuildContext is null/unmounted.');
      }
    });
  }, onError: (error) {
    logToEvent('FATAL STREAM ERROR:\n$error');
  });
}
