import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/payment/cart_item_list_delete_confirm/cart_item_list_delete_confirm_widget.dart';
import '/azyaa_group_a/payment/cart_item_out_of_stock/cart_item_out_of_stock_widget.dart';
import '/azyaa_group_a/payment/product_attribute_cart_level/product_attribute_cart_level_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_item_list_widget.dart' show CartItemListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
