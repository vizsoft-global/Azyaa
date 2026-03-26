import '/azyaa_group_a/payment/cart_item_list/cart_item_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'cart_popup_widget.dart' show CartPopupWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPopupModel extends FlutterFlowModel<CartPopupWidget> {
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
