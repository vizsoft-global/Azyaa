import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/profile_body_add/profile_body_add_widget.dart';
import '/azyaa_group_a/customer/zone/profile_body_edit/profile_body_edit_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'measurement_widget.dart' show MeasurementWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MeasurementModel extends FlutterFlowModel<MeasurementWidget> {
  ///  Local state fields for this page.

  List<UserBodyStruct> allMeasurements = [];
  void addToAllMeasurements(UserBodyStruct item) => allMeasurements.add(item);
  void removeFromAllMeasurements(UserBodyStruct item) =>
      allMeasurements.remove(item);
  void removeAtIndexFromAllMeasurements(int index) =>
      allMeasurements.removeAt(index);
  void insertAtIndexInAllMeasurements(int index, UserBodyStruct item) =>
      allMeasurements.insert(index, item);
  void updateAllMeasurementsAtIndex(
          int index, Function(UserBodyStruct) updateFn) =>
      allMeasurements[index] = updateFn(allMeasurements[index]);

  UserRelatedInfoStruct? singleMeasurement;
  void updateSingleMeasurementStruct(Function(UserRelatedInfoStruct) updateFn) {
    updateFn(singleMeasurement ??= UserRelatedInfoStruct());
  }

  String userPhotoUploadStatus = 'notYet';

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // State field(s) for Checkbox widget.
  Map<UserBodyStruct, bool> checkboxValueMap = {};
  List<UserBodyStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
    userInitialModel = createModel(context, () => UserInitialModel());
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
    userInitialModel.dispose();
  }
}
