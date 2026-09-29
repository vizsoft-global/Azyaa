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

Future handleBranchRouting(BuildContext context) async {
  // Add your function code here!
  // Listen for deep links when the app is in the foreground or opened from background
  _latestContext = context;

  // --- HELPER FUNCTION: Pushes logs to your App State List ---
  void logToEvent(String msg) {
    debugPrint('[Branch] $msg'); // Keeps console log for standard debugging
    FFAppState().update(() {
      // Adds the newest log to the end of the list
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

    if (!data.containsKey('+clicked_branch_link') ||
        data['+clicked_branch_link'] != true) {
      logToEvent('IGNORED: Not a clicked Branch deep link.');
      return;
    }

    final linkId =
        data['~referring_link'] ?? data['deeplink_path'] ?? 'unknown_link';
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
    if (pageParameterString != null && pageParameterString.contains('=')) {
      final List<String> parts = pageParameterString.split('=');
      if (parts.length == 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
        queryParams[parts[0]] = parts[1];
      }
    }

    // Forces GoRouter to build a fresh page (solves same-page warm starts)
    queryParams['refresh_key'] =
        DateTime.now().millisecondsSinceEpoch.toString();

    logToEvent('GOROUTER PARAMS:\n$queryParams');

    Future.delayed(const Duration(milliseconds: 500), () {
      if (_latestContext != null && _latestContext!.mounted) {
        logToEvent('Navigating to "$pageName"...');
        try {
          _latestContext!.pushNamed(
            pageName,
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
