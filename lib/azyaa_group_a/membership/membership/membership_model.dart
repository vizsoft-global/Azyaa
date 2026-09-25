import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'membership_widget.dart' show MembershipWidget;
import 'package:flutter/material.dart';

class MembershipModel extends FlutterFlowModel<MembershipWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
    appUpdateCheckerModel = createModel(context, () => AppUpdateCheckerModel());
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
  }

  @override
  void dispose() {
    userInitialModel.dispose();
    appUpdateCheckerModel.dispose();
    universalAppBarModel.dispose();
  }
}
