import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'addresstest_widget.dart' show AddresstestWidget;
import 'package:flutter/material.dart';

class AddresstestModel extends FlutterFlowModel<AddresstestWidget> {
  ///  Local state fields for this page.

  LatLng? addresslatlng;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
