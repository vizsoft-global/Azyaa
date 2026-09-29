import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 's3_quick_stats_widget.dart' show S3QuickStatsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class S3QuickStatsModel extends FlutterFlowModel<S3QuickStatsWidget> {
  ///  Local state fields for this page.

  String photoUploadStatus = 'notYet';

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
