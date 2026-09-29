import '/azyaa_group_a/payment/cart_item_non_refund/cart_item_non_refund_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'non_returnable_item_widget.dart' show NonReturnableItemWidget;
import 'package:flutter/material.dart';

class NonReturnableItemModel extends FlutterFlowModel<NonReturnableItemWidget> {
  ///  Local state fields for this component.

  List<UserWishlistItemStruct> wishlistItems = [];
  void addToWishlistItems(UserWishlistItemStruct item) =>
      wishlistItems.add(item);
  void removeFromWishlistItems(UserWishlistItemStruct item) =>
      wishlistItems.remove(item);
  void removeAtIndexFromWishlistItems(int index) =>
      wishlistItems.removeAt(index);
  void insertAtIndexInWishlistItems(int index, UserWishlistItemStruct item) =>
      wishlistItems.insert(index, item);
  void updateWishlistItemsAtIndex(
          int index, Function(UserWishlistItemStruct) updateFn) =>
      wishlistItems[index] = updateFn(wishlistItems[index]);

  int? count;

  ///  State fields for stateful widgets in this component.

  // Model for Cart_Item_Non-refund component.
  late CartItemNonRefundModel cartItemNonRefundModel;

  @override
  void initState(BuildContext context) {
    cartItemNonRefundModel =
        createModel(context, () => CartItemNonRefundModel());
  }

  @override
  void dispose() {
    cartItemNonRefundModel.dispose();
  }
}
