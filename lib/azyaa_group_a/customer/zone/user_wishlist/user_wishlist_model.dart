import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'user_wishlist_widget.dart' show UserWishlistWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserWishlistModel extends FlutterFlowModel<UserWishlistWidget> {
  ///  Local state fields for this component.

  int? count;

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

  int? refresh = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
