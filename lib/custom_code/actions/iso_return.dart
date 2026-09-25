// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String?> isoReturn(
  List<String>? mainList,
  List<String>? isoList,
  String? name,
) async {
  // Add your function code here!
  for (int i = 0; i < mainList!.length; i++) {
    if (mainList[i].toLowerCase() == name?.toLowerCase()) {
      return isoList?[i]; // Return the matching ISO code
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
