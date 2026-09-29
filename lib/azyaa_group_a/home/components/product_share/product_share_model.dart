import '/flutter_flow/flutter_flow_util.dart';
import 'product_share_widget.dart' show ProductShareWidget;
import 'package:flutter/material.dart';

class ProductShareModel extends FlutterFlowModel<ProductShareWidget> {
  ///  Local state fields for this component.

  String copyText = 'copy';

  ///  State fields for stateful widgets in this component.

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
