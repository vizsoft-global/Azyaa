import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'virtual_try_on_widget.dart' show VirtualTryOnWidget;
import 'package:flutter/material.dart';

class VirtualTryOnModel extends FlutterFlowModel<VirtualTryOnWidget> {
  ///  Local state fields for this page.

  String defaultView = 'grid';

  bool menuStatus = false;

  int? index;

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
    userInitialModel = createModel(context, () => UserInitialModel());
    appUpdateCheckerModel = createModel(context, () => AppUpdateCheckerModel());
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
    userInitialModel.dispose();
    appUpdateCheckerModel.dispose();
  }
}
