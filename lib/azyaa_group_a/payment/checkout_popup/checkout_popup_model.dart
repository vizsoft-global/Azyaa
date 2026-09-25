import '/azyaa_group_a/payment/cart_item_list/cart_item_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkout_popup_widget.dart' show CheckoutPopupWidget;
import 'package:flutter/material.dart';

class CheckoutPopupModel extends FlutterFlowModel<CheckoutPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Cart_Item_List component.
  late CartItemListModel cartItemListModel;

  @override
  void initState(BuildContext context) {
    cartItemListModel = createModel(context, () => CartItemListModel());
  }

  @override
  void dispose() {
    cartItemListModel.dispose();
  }
}
