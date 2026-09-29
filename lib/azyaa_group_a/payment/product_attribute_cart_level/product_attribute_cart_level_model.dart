import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_attribute_cart_level_widget.dart'
    show ProductAttributeCartLevelWidget;
import 'package:flutter/material.dart';

class ProductAttributeCartLevelModel
    extends FlutterFlowModel<ProductAttributeCartLevelWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductsRecord? normalProductResult;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  InventoryRecord? normalInventoryResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapResultNew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
