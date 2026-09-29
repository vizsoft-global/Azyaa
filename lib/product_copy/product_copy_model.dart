import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'product_copy_widget.dart' show ProductCopyWidget;
import 'package:flutter/material.dart';

class ProductCopyModel extends FlutterFlowModel<ProductCopyWidget> {
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
  // Stores action output result for [Custom Action - generateLinkNew] action in IconButton widget.
  String? newlink;
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
