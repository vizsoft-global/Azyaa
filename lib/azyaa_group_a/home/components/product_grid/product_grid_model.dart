import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_grid_widget.dart' show ProductGridWidget;
import 'package:flutter/material.dart';

class ProductGridModel extends FlutterFlowModel<ProductGridWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for User-Wishlist component.
  late UserWishlistModel userWishlistModel;
  // Model for DefaultCartButton component.
  late DefaultCartButtonModel defaultCartButtonModel;

  @override
  void initState(BuildContext context) {
    userWishlistModel = createModel(context, () => UserWishlistModel());
    defaultCartButtonModel =
        createModel(context, () => DefaultCartButtonModel());
  }

  @override
  void dispose() {
    userWishlistModel.dispose();
    defaultCartButtonModel.dispose();
  }
}
