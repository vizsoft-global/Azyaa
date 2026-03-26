import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/virtual_try_on/v_t_o_begin/v_t_o_begin_widget.dart';
import '/azyaa_group_a/customer/virtual_try_on/v_t_o_final/v_t_o_final_widget.dart';
import '/azyaa_group_a/customer/virtual_try_on/virtual_try_on_points/virtual_try_on_points_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_attribute/product_attribute_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_a/home/components/product_small_grid/product_small_grid_widget.dart';
import '/azyaa_group_a/home/components/size_chart_default/size_chart_default_widget.dart';
import '/azyaa_group_a/home/main/product_measurement_popup/product_measurement_popup_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/azyaa_group_b/components/unfollow_confirm_popup/unfollow_confirm_popup_widget.dart';
import '/azyaa_group_b/creator_space/creator_space/c1_share_promotion/c1_share_promotion_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui/reviewgrid/reviewgrid_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'product_widget.dart' show ProductWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductModel extends FlutterFlowModel<ProductWidget> {
  ///  Local state fields for this page.

  String? productUrl;

  CreatorPromotionsStruct? promotion;
  void updatePromotionStruct(Function(CreatorPromotionsStruct) updateFn) {
    updateFn(promotion ??= CreatorPromotionsStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for Gallery widget.
  CarouselSliderController? galleryController;
  int galleryCurrentIndex = 0;

  // Model for User-Wishlist component.
  late UserWishlistModel userWishlistModel;
  // Stores action output result for [Custom Action - generateLink] action in IconButton widget.
  String? sharelink;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Model for DefaultCartButton component.
  late DefaultCartButtonModel defaultCartButtonModel1;
  // Stores action output result for [Firestore Query - Query a collection] action in Promote widget.
  IdMapRecord? iDMapResultOne;
  // Stores action output result for [Firestore Query - Query a collection] action in CartOLD widget.
  IdMapRecord? idMapResult;
  // Stores action output result for [Firestore Query - Query a collection] action in CartNEW widget.
  IdMapRecord? idMapResultNew;
  // Model for DefaultCartButton component.
  late DefaultCartButtonModel defaultCartButtonModel2;
  // Stores action output result for [Firestore Query - Query a collection] action in Promote widget.
  IdMapRecord? iDMapResultCustomOne;

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
    userInitialModel = createModel(context, () => UserInitialModel());
    appUpdateCheckerModel = createModel(context, () => AppUpdateCheckerModel());
    userWishlistModel = createModel(context, () => UserWishlistModel());
    defaultCartButtonModel1 =
        createModel(context, () => DefaultCartButtonModel());
    defaultCartButtonModel2 =
        createModel(context, () => DefaultCartButtonModel());
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
    userInitialModel.dispose();
    appUpdateCheckerModel.dispose();
    userWishlistModel.dispose();
    defaultCartButtonModel1.dispose();
    defaultCartButtonModel2.dispose();
  }
}
