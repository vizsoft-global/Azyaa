import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'creator_promotion_widget.dart' show CreatorPromotionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatorPromotionModel extends FlutterFlowModel<CreatorPromotionWidget> {
  ///  Local state fields for this component.

  int count = 0;

  double total = 0.0;

  String priceStatus = 'hide';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Creator-Promotion widget.
  ProductsRecord? indPromotionProductResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
