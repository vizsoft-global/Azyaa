// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // Import this for JSON parsing

Future<dynamic> jsonformat(String? input) async {
  // Add your function code here!
  if (input == null) {
    return {'error': 'Input is null'};
  }

  try {
    // Remove backticks and newlines from the input
    String cleanedInput = input
        .replaceAll(RegExp(r'```json'), '')
        .replaceAll(RegExp(r'```'), '')
        .trim();

    // Parsing the cleaned input string to JSON
    Map<String, dynamic> jsonData = jsonDecode(cleanedInput);
    return jsonData;
  } catch (e) {
    // Return an error message in case of invalid JSON format
    return {'error': 'Invalid JSON format: $e'};
  }
}
