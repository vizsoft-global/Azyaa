import '/custom_code/widgets/azy_scroll_refresh.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/home_app_bar/home_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui/shortlist_icon/shortlist_icon_widget.dart';
import '/index.dart';
import 'dart:async';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Home_AppBar component.
  late HomeAppBarModel homeAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for BannerList widget.
  PageController? bannerListController;

  int get bannerListCurrentIndex => bannerListController != null &&
          bannerListController!.hasClients &&
          bannerListController!.page != null
      ? bannerListController!.page!.round()
      : 0;
  Completer<List<ProductsRecord>>? firestoreRequestCompleter;

  /// How many popular products the home page asks for. Starts at one page and
  /// grows by a page each time the scroll nears the end.
  int popularLimit = kAzyPageSize;

  /// How many the last popular query returned. Fewer than [popularLimit] means
  /// the server has no more.
  int popularLoaded = 0;

  /// True while a popular query is still on its way.
  bool popularFetching = false;
  // Model for Universal_NavigationBar component.
  late UniversalNavigationBarModel universalNavigationBarModel;
  // Model for shortlist_icon component.
  late ShortlistIconModel shortlistIconModel;

  @override
  void initState(BuildContext context) {
    homeAppBarModel = createModel(context, () => HomeAppBarModel());
    userInitialModel = createModel(context, () => UserInitialModel());
    appUpdateCheckerModel = createModel(context, () => AppUpdateCheckerModel());
    universalNavigationBarModel =
        createModel(context, () => UniversalNavigationBarModel());
    shortlistIconModel = createModel(context, () => ShortlistIconModel());
  }

  @override
  void dispose() {
    homeAppBarModel.dispose();
    userInitialModel.dispose();
    appUpdateCheckerModel.dispose();
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    universalNavigationBarModel.dispose();
    shortlistIconModel.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
