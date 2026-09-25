import '/azyaa_group_a/payment/cart_item_out_of_stock/cart_item_out_of_stock_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_item_list_widget.dart' show CartItemListWidget;
import 'package:flutter/material.dart';

class CartItemListModel extends FlutterFlowModel<CartItemListWidget> {
  ///  Local state fields for this component.

  int? refresh = 1;

  ///  State fields for stateful widgets in this component.

  // Model for Cart_Item_OutOfStock component.
  late CartItemOutOfStockModel cartItemOutOfStockModel1;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // Model for Cart_Item_OutOfStock component.
  late CartItemOutOfStockModel cartItemOutOfStockModel2;
  // State field(s) for CountController widget.
  int? countControllerValue2;

  @override
  void initState(BuildContext context) {
    cartItemOutOfStockModel1 =
        createModel(context, () => CartItemOutOfStockModel());
    cartItemOutOfStockModel2 =
        createModel(context, () => CartItemOutOfStockModel());
  }

  @override
  void dispose() {
    cartItemOutOfStockModel1.dispose();
    cartItemOutOfStockModel2.dispose();
  }
}
