import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 's2_creator_wallet_widget.dart' show S2CreatorWalletWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class S2CreatorWalletModel extends FlutterFlowModel<S2CreatorWalletWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for designstyle-field widget.
  String? designstyleFieldValue;
  FormFieldController<String>? designstyleFieldValueController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }
}
