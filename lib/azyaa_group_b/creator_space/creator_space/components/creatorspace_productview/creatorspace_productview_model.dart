import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'creatorspace_productview_widget.dart'
    show CreatorspaceProductviewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatorspaceProductviewModel
    extends FlutterFlowModel<CreatorspaceProductviewWidget> {
  ///  Local state fields for this component.

  int count = 0;

  double totalCommission = 0.0;

  int sold = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in creatorspaceProductview widget.
  ProductsRecord? productresult1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
