// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';

Future<String> getUserAddress(LatLng userCurrentLocation) async {
  // Add your function code here!
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        userCurrentLocation.latitude, userCurrentLocation.longitude);

    // Check if placemarks list is not empty and the first placemark is not null
    if (placemarks.isNotEmpty) {
      // Access placemark properties safely
      String address = (placemarks[0].street ?? '') +
          ", " +
          (placemarks[0].subLocality ?? '') +
          ", " +
          (placemarks[0].locality ?? '') +
          ", " +
          (placemarks[0].administrativeArea ?? '') +
          ", " +
          (placemarks[0].country ?? '');
      return address;
    } else {
      return 'No address found';
    }
  } catch (e) {
    return 'Error: $e';
  }
}
