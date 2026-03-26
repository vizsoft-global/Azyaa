import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 's1_f_a_q_contactus_widget.dart' show S1FAQContactusWidget;
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class S1FAQContactusModel extends FlutterFlowModel<S1FAQContactusWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Q1 widget.
  late ExpandableController q1ExpandableController;

  // State field(s) for Q2 widget.
  late ExpandableController q2ExpandableController;

  // State field(s) for Q3 widget.
  late ExpandableController q3ExpandableController;

  // State field(s) for Q4 widget.
  late ExpandableController q4ExpandableController;

  // State field(s) for Q5 widget.
  late ExpandableController q5ExpandableController;

  // State field(s) for Q6 widget.
  late ExpandableController q6ExpandableController;

  // State field(s) for Q7 widget.
  late ExpandableController q7ExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    q1ExpandableController.dispose();
    q2ExpandableController.dispose();
    q3ExpandableController.dispose();
    q4ExpandableController.dispose();
    q5ExpandableController.dispose();
    q6ExpandableController.dispose();
    q7ExpandableController.dispose();
  }
}
