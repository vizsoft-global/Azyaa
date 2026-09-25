import '/flutter_flow/flutter_flow_util.dart';
import 's3_gift_cardcustomamount_widget.dart' show S3GiftCardcustomamountWidget;
import 'package:flutter/material.dart';

class S3GiftCardcustomamountModel
    extends FlutterFlowModel<S3GiftCardcustomamountWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for amount-field widget.
  FocusNode? amountFieldFocusNode;
  TextEditingController? amountFieldTextController;
  String? Function(BuildContext, String?)? amountFieldTextControllerValidator;
  // State field(s) for name-field widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  // State field(s) for message-field widget.
  FocusNode? messageFieldFocusNode;
  TextEditingController? messageFieldTextController;
  String? Function(BuildContext, String?)? messageFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountFieldFocusNode?.dispose();
    amountFieldTextController?.dispose();

    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    messageFieldFocusNode?.dispose();
    messageFieldTextController?.dispose();
  }
}
