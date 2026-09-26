import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'creators_widget.dart' show CreatorsWidget;
import 'package:flutter/material.dart';

class CreatorsModel extends FlutterFlowModel<CreatorsWidget> {
  ///  Local state fields for this page.

  /// Live text of the creator search box.
  ///
  /// Kept separate from the controller so the list can be filtered without
  /// reading (and rebuilding on) the raw controller value.
  String creatorSearchQuery = '';

  /// Recent creator searches, loaded from local storage on first build.
  List<String> recentCreatorSearches = const [];

  /// True while a search is narrowing the creator list.
  bool get isCreatorSearching => creatorSearchQuery.trim().isNotEmpty;

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for SearchFileds widget.
  FocusNode? searchFiledsFocusNode;
  TextEditingController? searchFiledsTextController;
  String? Function(BuildContext, String?)? searchFiledsTextControllerValidator;
  // Algolia Search Results from action on SearchFileds
  List<UsersRecord>? algoliaSearchResults = [];
  // State field(s) for ChoiceChipslogin widget.
  FormFieldController<List<String>>? choiceChipsloginValueController1;
  String? get choiceChipsloginValue1 =>
      choiceChipsloginValueController1?.value?.firstOrNull;
  set choiceChipsloginValue1(String? val) =>
      choiceChipsloginValueController1?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChipslogout widget.
  FormFieldController<List<String>>? choiceChipslogoutValueController1;
  String? get choiceChipslogoutValue1 =>
      choiceChipslogoutValueController1?.value?.firstOrNull;
  set choiceChipslogoutValue1(String? val) =>
      choiceChipslogoutValueController1?.value = val != null ? [val] : [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for ChoiceChipslogin widget.
  FormFieldController<List<String>>? choiceChipsloginValueController2;
  String? get choiceChipsloginValue2 =>
      choiceChipsloginValueController2?.value?.firstOrNull;
  set choiceChipsloginValue2(String? val) =>
      choiceChipsloginValueController2?.value = val != null ? [val] : [];
  // State field(s) for ChoiceChipslogout widget.
  FormFieldController<List<String>>? choiceChipslogoutValueController2;
  String? get choiceChipslogoutValue2 =>
      choiceChipslogoutValueController2?.value?.firstOrNull;
  set choiceChipslogoutValue2(String? val) =>
      choiceChipslogoutValueController2?.value = val != null ? [val] : [];
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
    searchFiledsFocusNode?.dispose();
    searchFiledsTextController?.dispose();

    tabBarController?.dispose();
    universalNavigationBarModel.dispose();
  }
}
