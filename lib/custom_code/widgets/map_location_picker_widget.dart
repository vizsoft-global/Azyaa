// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;

class MapLocationPickerWidget extends StatefulWidget {
  const MapLocationPickerWidget({
    super.key,
    this.width,
    this.height,
    required this.initialLocation,
    this.onLocationPicked,
    required this.pickedLat,
    required this.pickedLng,
  });

  final double? width;
  final double? height;
  final LatLng initialLocation;
  final Future Function()? onLocationPicked;
  final double pickedLat;
  final double pickedLng;

  // Static variables to hold picked values
  static double lastPickedLat = 0.0;
  static double lastPickedLng = 0.0;

  @override
  State<MapLocationPickerWidget> createState() =>
      _MapLocationPickerWidgetState();
}

class _MapLocationPickerWidgetState extends State<MapLocationPickerWidget> {
  gmap.GoogleMapController? _controller;
  late gmap.LatLng _pickedLocation;

  @override
  void initState() {
    super.initState();
    _pickedLocation = gmap.LatLng(
      widget.initialLocation.latitude,
      widget.initialLocation.longitude,
    );
    // Set app state on init
    FFAppState().pickedLat = widget.initialLocation.latitude;
    FFAppState().pickedLng = widget.initialLocation.longitude;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _handleLocationPicked(gmap.LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
    // Update app state directly
    FFAppState().pickedLat = position.latitude;
    FFAppState().pickedLng = position.longitude;

    if (widget.onLocationPicked != null) {
      widget.onLocationPicked!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 200,
      child: Stack(
        children: [
          gmap.GoogleMap(
            initialCameraPosition: gmap.CameraPosition(
              target: _pickedLocation,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              setState(() {
                _controller = controller;
              });
            },
            onTap: (gmap.LatLng tappedPoint) {
              _handleLocationPicked(tappedPoint);
            },
            markers: {
              gmap.Marker(
                markerId: gmap.MarkerId('picked_location'),
                position: _pickedLocation,
                draggable: true,
                onDragEnd: (gmap.LatLng newPosition) {
                  _handleLocationPicked(newPosition);
                },
              ),
            },
            zoomControlsEnabled: true,
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            trafficEnabled: false,
            compassEnabled: false,
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  'Tap or drag pin to set location',
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
