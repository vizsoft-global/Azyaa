import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui/salebanner/salebanner_widget.dart';
import '/index.dart';
import 'dart:async';
import 'shop_widget.dart' show ShopWidget;
import 'package:flutter/material.dart';

class ShopModel extends FlutterFlowModel<ShopWidget> {
  ///  Local state fields for this page.

  bool searchStatus = false;

  ///  State fields for stateful widgets in this page.

  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for SearchFileds widget.
  FocusNode? searchFiledsFocusNode;
  TextEditingController? searchFiledsTextController;
  String? Function(BuildContext, String?)? searchFiledsTextControllerValidator;
  // Algolia Search Results from action on SearchFileds
  List<ProductsRecord>? algoliaSearchResults = [];
  // Model for Salebanner component.
  late SalebannerModel salebannerModel;
  Completer<List<CategoryRecord>>? firestoreRequestCompleter1;
  Completer<List<ProductsRecord>>? firestoreRequestCompleter2;
  // Model for Universal_NavigationBar component.
  late UniversalNavigationBarModel universalNavigationBarModel;
  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
    appUpdateCheckerModel = createModel(context, () => AppUpdateCheckerModel());
    salebannerModel = createModel(context, () => SalebannerModel());
    universalNavigationBarModel =
        createModel(context, () => UniversalNavigationBarModel());
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
  }

  @override
  void dispose() {
    userInitialModel.dispose();
    appUpdateCheckerModel.dispose();
    searchFiledsFocusNode?.dispose();
    searchFiledsTextController?.dispose();

    salebannerModel.dispose();
    universalNavigationBarModel.dispose();
    universalAppBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
