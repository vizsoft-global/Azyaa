// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future copyToClipboard(String textToCopy) async {
  // Add your function code here!
  await Clipboard.setData(ClipboardData(text: textToCopy));
}
