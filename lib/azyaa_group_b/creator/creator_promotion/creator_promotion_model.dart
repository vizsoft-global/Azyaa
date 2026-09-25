import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'creator_promotion_widget.dart' show CreatorPromotionWidget;
import 'package:flutter/material.dart';

class CreatorPromotionModel extends FlutterFlowModel<CreatorPromotionWidget> {
  ///  Local state fields for this component.

  int count = 0;

  double total = 0.0;

  String priceStatus = 'hide';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Creator-Promotion widget.
  ProductsRecord? indPromotionProductResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
