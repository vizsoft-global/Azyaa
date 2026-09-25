import '/flutter_flow/flutter_flow_util.dart';
import 's5_promotiondetails_widget.dart' show S5PromotiondetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class S5PromotiondetailsModel
    extends FlutterFlowModel<S5PromotiondetailsWidget> {
  ///  Local state fields for this page.

  String photoUploadStatus = 'notYet';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
