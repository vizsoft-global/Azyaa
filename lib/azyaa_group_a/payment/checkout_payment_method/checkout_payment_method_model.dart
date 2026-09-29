import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_payment_method_widget.dart' show CheckoutPaymentMethodWidget;
import 'package:flutter/material.dart';

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
