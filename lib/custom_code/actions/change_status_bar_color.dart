// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:flutter/services.dart';

Future<void> changeStatusBarColor() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(
          255, 255, 255, 255), // Custom status bar background color
      statusBarIconBrightness: Brightness.dark, // White icons
      statusBarBrightness: Brightness.dark, // iOS compatibility
    ),
  );
}
