import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/payment/payment_checker/payment_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'payment_widget.dart' show PaymentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PaymentModel extends FlutterFlowModel<PaymentWidget> {
  ///  Local state fields for this page.

  String processes = 'initial';

  ///  State fields for stateful widgets in this page.

  // Model for Payment_Checker component.
  late PaymentCheckerModel paymentCheckerModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Back-Button widget.
  OrdersRecord? orderCancelForBack;

  @override
  void initState(BuildContext context) {
    paymentCheckerModel = createModel(context, () => PaymentCheckerModel());
    userInitialModel = createModel(context, () => UserInitialModel());
  }

  @override
  void dispose() {
    paymentCheckerModel.dispose();
    userInitialModel.dispose();
  }
}
