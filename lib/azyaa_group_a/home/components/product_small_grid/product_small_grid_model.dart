import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'product_small_grid_widget.dart' show ProductSmallGridWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductSmallGridModel extends FlutterFlowModel<ProductSmallGridWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for User-Wishlist component.
  late UserWishlistModel userWishlistModel;

  @override
  void initState(BuildContext context) {
    userWishlistModel = createModel(context, () => UserWishlistModel());
  }

  @override
  void dispose() {
    userWishlistModel.dispose();
  }
}
