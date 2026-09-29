import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'stores_list_widget.dart' show StoresListWidget;
import 'package:flutter/material.dart';

class StoresListModel extends FlutterFlowModel<StoresListWidget> {
  ///  Local state fields for this page.

  String categoryName = 'Formal';

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for StoreDesignerChoiceChips widget.
  FormFieldController<List<String>>? storeDesignerChoiceChipsValueController;
  String? get storeDesignerChoiceChipsValue =>
      storeDesignerChoiceChipsValueController?.value?.firstOrNull;
  set storeDesignerChoiceChipsValue(String? val) =>
      storeDesignerChoiceChipsValueController?.value = val != null ? [val] : [];
  // Model for Universal_NavigationBar component.
  late UniversalNavigationBarModel universalNavigationBarModel;

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
    userInitialModel = createModel(context, () => UserInitialModel());
    appUpdateCheckerModel = createModel(context, () => AppUpdateCheckerModel());
    universalNavigationBarModel =
        createModel(context, () => UniversalNavigationBarModel());
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
    userInitialModel.dispose();
    appUpdateCheckerModel.dispose();
    universalNavigationBarModel.dispose();
  }
}
