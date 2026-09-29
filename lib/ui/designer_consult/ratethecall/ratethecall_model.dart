import '/flutter_flow/flutter_flow_util.dart';
import 'ratethecall_widget.dart' show RatethecallWidget;
import 'package:flutter/material.dart';

class RatethecallModel extends FlutterFlowModel<RatethecallWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
