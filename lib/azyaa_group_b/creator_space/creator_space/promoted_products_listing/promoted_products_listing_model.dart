import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'promoted_products_listing_widget.dart'
    show PromotedProductsListingWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PromotedProductsListingModel
    extends FlutterFlowModel<PromotedProductsListingWidget> {
  ///  Local state fields for this page.

  String photoUploadStatus = 'notYet';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
  }
}
