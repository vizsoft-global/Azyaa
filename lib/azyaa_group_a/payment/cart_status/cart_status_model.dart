import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'cart_status_widget.dart' show CartStatusWidget;
import 'package:flutter/material.dart';

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
