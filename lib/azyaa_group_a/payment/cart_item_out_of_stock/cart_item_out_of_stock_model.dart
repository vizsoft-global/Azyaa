import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cart_item_out_of_stock_widget.dart' show CartItemOutOfStockWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItemOutOfStockModel
    extends FlutterFlowModel<CartItemOutOfStockWidget> {
  ///  Local state fields for this component.

  int? refresh = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
