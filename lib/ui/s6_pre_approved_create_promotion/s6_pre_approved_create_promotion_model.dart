import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 's6_pre_approved_create_promotion_widget.dart'
    show S6PreApprovedCreatePromotionWidget;
import 'package:flutter/material.dart';

class S6PreApprovedCreatePromotionModel
    extends FlutterFlowModel<S6PreApprovedCreatePromotionWidget> {
  ///  Local state fields for this page.

  String photoUploadStatus = 'notYet';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue7;
  // State field(s) for Checkbox widget.
  bool? checkboxValue8;
  // State field(s) for add-caption-field widget.
  FocusNode? addCaptionFieldFocusNode;
  TextEditingController? addCaptionFieldTextController;
  String? Function(BuildContext, String?)?
      addCaptionFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addCaptionFieldFocusNode?.dispose();
    addCaptionFieldTextController?.dispose();
  }
}
