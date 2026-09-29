import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_item_list_delete_confirm_widget.dart'
    show CartItemListDeleteConfirmWidget;
import 'package:flutter/material.dart';

class CartItemListDeleteConfirmModel
    extends FlutterFlowModel<CartItemListDeleteConfirmWidget> {
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

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
