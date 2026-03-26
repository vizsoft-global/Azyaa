import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'v_t_o_delete_confirm_widget.dart' show VTODeleteConfirmWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VTODeleteConfirmModel extends FlutterFlowModel<VTODeleteConfirmWidget> {
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
