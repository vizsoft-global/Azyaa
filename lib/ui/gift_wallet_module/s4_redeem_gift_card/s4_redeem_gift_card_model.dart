import '/flutter_flow/flutter_flow_util.dart';
import 's4_redeem_gift_card_widget.dart' show S4RedeemGiftCardWidget;
import 'package:flutter/material.dart';

class S4RedeemGiftCardModel extends FlutterFlowModel<S4RedeemGiftCardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
