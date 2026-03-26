import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/azyaa_group_b/creator/product_attribute_promo_level/product_attribute_promo_level_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'product_grid_widget.dart' show ProductGridWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
