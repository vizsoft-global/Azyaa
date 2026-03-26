import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'checkout_payment_method_widget.dart' show CheckoutPaymentMethodWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutPaymentMethodModel
    extends FlutterFlowModel<CheckoutPaymentMethodWidget> {
  ///  Local state fields for this component.

  String payStatus = 'clickable';

  String? selectedMethod;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (Execute)] action in save widget.
  ApiCallResponse? myfatoorahPaymentResult1;
  // Stores action output result for [Backend Call - Create Document] action in save widget.
  OrdersRecord? orderMyfatoorahpaymentNew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
