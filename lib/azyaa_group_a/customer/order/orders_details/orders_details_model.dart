import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/order/orders_single_comp/orders_single_comp_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'orders_details_widget.dart' show OrdersDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OrdersDetailsModel extends FlutterFlowModel<OrdersDetailsWidget> {
  ///  Local state fields for this page.

  int? count;

  bool? returnStatus;

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for OrderItemList widget.
  late ExpandableController orderItemListExpandableController;

  // Model for Orders_Single_Comp component.
  late OrdersSingleCompModel ordersSingleCompModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ReturnRequestsRecord? ticketRiseStatus;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ProductsRecord? cartItemProductResult;

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
    userInitialModel = createModel(context, () => UserInitialModel());
    appUpdateCheckerModel = createModel(context, () => AppUpdateCheckerModel());
    ordersSingleCompModel = createModel(context, () => OrdersSingleCompModel());
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
    userInitialModel.dispose();
    appUpdateCheckerModel.dispose();
    orderItemListExpandableController.dispose();
    ordersSingleCompModel.dispose();
  }
}
