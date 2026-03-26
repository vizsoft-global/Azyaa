import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_status_widget.dart' show CartStatusWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartStatusModel extends FlutterFlowModel<CartStatusWidget> {
  ///  Local state fields for this component.

  int? refresh = 1;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in Cart_Status widget.
  ProductsRecord? productResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in Cart_Status widget.
  InventoryRecord? inventoryResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in Cart_Status widget.
  UserMembershipPlansRecord? membershipResult1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
