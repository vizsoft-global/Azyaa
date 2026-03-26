import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'orders_rate_widget.dart' show OrdersRateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersRateModel extends FlutterFlowModel<OrdersRateWidget> {
  ///  Local state fields for this component.

  int? rating = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // Stores action output result for [Firestore Query - Query a collection] action in RatingBar widget.
  IdMapRecord? iDMapResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
