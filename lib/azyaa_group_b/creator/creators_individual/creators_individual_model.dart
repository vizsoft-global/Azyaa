import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creators_individual_widget.dart' show CreatorsIndividualWidget;
import 'package:flutter/material.dart';

class CreatorsIndividualModel
    extends FlutterFlowModel<CreatorsIndividualWidget> {
  ///  Local state fields for this page.

  String unfollow = 'hide';

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Stores action output result for [Firestore Query - Query a collection] action in sharecon widget.
  IdMapRecord? idmapDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in sharecon widget.
  UsersRecord? creatorDoc;
  // Stores action output result for [Backend Call - API (Create Link)] action in sharecon widget.
  ApiCallResponse? dubshortlink;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for Promotion widget.
  TabController? promotionController;
  int get promotionCurrentIndex =>
      promotionController != null ? promotionController!.index : 0;
  int get promotionPreviousIndex =>
      promotionController != null ? promotionController!.previousIndex : 0;

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
    promotionController?.dispose();
  }
}
