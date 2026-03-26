import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/profile_address_add/profile_address_add_widget.dart';
import '/azyaa_group_a/customer/zone/profile_address_edit/profile_address_edit_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/payment/apply_coupon/apply_coupon_widget.dart';
import '/azyaa_group_a/payment/cart_item_list/cart_item_list_widget.dart';
import '/azyaa_group_a/payment/checkout_payment_method/checkout_payment_method_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  String payClickStatus = 'clickable';

  String? orderInfo;

  int? orderCount;

  String iconStatus = 'show';

  double? discountedTotal;

  CouponCartInfoStruct? couponInfo;
  void updateCouponInfoStruct(Function(CouponCartInfoStruct) updateFn) {
    updateFn(couponInfo ??= CouponCartInfoStruct());
  }

  double shippingCharge = 0.0;

  double weight = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Checkout widget.
  SettingsRecord? settingsDocResult1;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // State field(s) for Address widget.
  late ExpandableController addressExpandableController;

  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  SettingsRecord? settingsDocResult2;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController1;
  List<String>? get checkboxGroupValues1 =>
      checkboxGroupValueController1?.value;
  set checkboxGroupValues1(List<String>? v) =>
      checkboxGroupValueController1?.value = v;

  // State field(s) for DeliveryMethod widget.
  late ExpandableController deliveryMethodExpandableController;

  // State field(s) for PaymentMethod widget.
  late ExpandableController paymentMethodExpandableController;

  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController2;
  List<String>? get checkboxGroupValues2 =>
      checkboxGroupValueController2?.value;
  set checkboxGroupValues2(List<String>? v) =>
      checkboxGroupValueController2?.value = v;

  // State field(s) for coupon widget.
  FocusNode? couponFocusNode;
  TextEditingController? couponTextController;
  String? Function(BuildContext, String?)? couponTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in apply widget.
  CouponRecord? couponResult;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  UserMembershipPlansRecord? membershipPlanResult;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  ProductsRecord? productResult;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  SettingsRecord? forPaymentResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  IdMapRecord? idMapResultOrder1;
  // Stores action output result for [Backend Call - API (Charge)] action in save widget.
  ApiCallResponse? paymentUpaymentResult1;
  // Stores action output result for [Backend Call - Create Document] action in save widget.
  OrdersRecord? orderUpaymentNew;
  // Stores action output result for [Backend Call - API (ChargeAPI)] action in save widget.
  ApiCallResponse? tapPaymentResult1;
  // Stores action output result for [Backend Call - Create Document] action in save widget.
  OrdersRecord? orderTappaymentNew;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
  }

  @override
  void dispose() {
    userInitialModel.dispose();
    addressExpandableController.dispose();
    deliveryMethodExpandableController.dispose();
    paymentMethodExpandableController.dispose();
    couponFocusNode?.dispose();
    couponTextController?.dispose();
  }
}
