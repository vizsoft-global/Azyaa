import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'designers_list_widget.dart' show DesignersListWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DesignersListModel extends FlutterFlowModel<DesignersListWidget> {
  ///  Local state fields for this page.

  String categoryName = 'Formal';

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // Model for App_Update_Checker component.
  late AppUpdateCheckerModel appUpdateCheckerModel;
  // State field(s) for Designers widget.
  TabController? designersController;
  int get designersCurrentIndex =>
      designersController != null ? designersController!.index : 0;
  int get designersPreviousIndex =>
      designersController != null ? designersController!.previousIndex : 0;

  // State field(s) for AllDesignerChoiceChips widget.
  FormFieldController<List<String>>? allDesignerChoiceChipsValueController;
  String? get allDesignerChoiceChipsValue =>
      allDesignerChoiceChipsValueController?.value?.firstOrNull;
  set allDesignerChoiceChipsValue(String? val) =>
      allDesignerChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for StoreDesignerChoiceChips widget.
  FormFieldController<List<String>>? storeDesignerChoiceChipsValueController;
  String? get storeDesignerChoiceChipsValue =>
      storeDesignerChoiceChipsValueController?.value?.firstOrNull;
  set storeDesignerChoiceChipsValue(String? val) =>
      storeDesignerChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Formal-DesignerChoiceChips widget.
  FormFieldController<List<String>>? formalDesignerChoiceChipsValueController1;
  String? get formalDesignerChoiceChipsValue1 =>
      formalDesignerChoiceChipsValueController1?.value?.firstOrNull;
  set formalDesignerChoiceChipsValue1(String? val) =>
      formalDesignerChoiceChipsValueController1?.value =
          val != null ? [val] : [];
  // State field(s) for Formal-DesignerChoiceChips widget.
  FormFieldController<List<String>>? formalDesignerChoiceChipsValueController2;
  String? get formalDesignerChoiceChipsValue2 =>
      formalDesignerChoiceChipsValueController2?.value?.firstOrNull;
  set formalDesignerChoiceChipsValue2(String? val) =>
      formalDesignerChoiceChipsValueController2?.value =
          val != null ? [val] : [];
  // State field(s) for party-DesignerChoiceChips widget.
  FormFieldController<List<String>>? partyDesignerChoiceChipsValueController;
  String? get partyDesignerChoiceChipsValue =>
      partyDesignerChoiceChipsValueController?.value?.firstOrNull;
  set partyDesignerChoiceChipsValue(String? val) =>
      partyDesignerChoiceChipsValueController?.value = val != null ? [val] : [];
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
    designersController?.dispose();
    universalNavigationBarModel.dispose();
  }
}
