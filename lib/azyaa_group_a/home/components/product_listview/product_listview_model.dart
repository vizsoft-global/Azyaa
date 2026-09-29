import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_listview_widget.dart' show ProductListviewWidget;
import 'package:flutter/material.dart';

class ProductListviewModel extends FlutterFlowModel<ProductListviewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for User-Wishlist component.
  late UserWishlistModel userWishlistModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  IdMapRecord? idMapResultNew;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ProductsRecord? iconProductResult;
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
