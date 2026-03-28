import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/profile_body_add/profile_body_add_widget.dart';
import '/azyaa_group_a/customer/zone/profile_body_edit/profile_body_edit_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/category_small_grid/category_small_grid_widget.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'profile_edit_widget.dart' show ProfileEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfileEditModel extends FlutterFlowModel<ProfileEditWidget> {
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

  final formKey = GlobalKey<FormState>();
  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  bool isDataUploading_userPhotoUpload2 = false;
  FFUploadedFile uploadedLocalFile_userPhotoUpload2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_userPhotoUpload2 = '';

  // State field(s) for First widget.
  FocusNode? firstFocusNode;
  TextEditingController? firstTextController;
  String? Function(BuildContext, String?)? firstTextControllerValidator;
  String? _firstTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7n8a14jb' /* Please enter first name */,
      );
    }

    return null;
  }

  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nvunjvhu' /* Please enter last name */,
      );
    }

    if (!RegExp('^[A-Za-z][A-Za-z\\s\'-]*\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'wh6wyg0c' /* Invalid input */,
      );
    }
    return null;
  }

  // State field(s) for Gender widget.
  FormFieldController<String>? genderValueController;
  DateTime? datePicked;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w51wdtel' /* Please provide a valid email */,
      );
    }

    return null;
  }

  // State field(s) for phone1 widget.
  FocusNode? phone1FocusNode;
  TextEditingController? phone1TextController;
  String? Function(BuildContext, String?)? phone1TextControllerValidator;
  String? _phone1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xrufxojj' /* Please enter mobile number */,
      );
    }

    return null;
  }

  // State field(s) for alternativephone widget.
  FocusNode? alternativephoneFocusNode;
  TextEditingController? alternativephoneTextController;
  String? Function(BuildContext, String?)?
      alternativephoneTextControllerValidator;
  // State field(s) for Checkbox widget.
  Map<UserBodyStruct, bool> checkboxValueMap = {};
  List<UserBodyStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
    userInitialModel = createModel(context, () => UserInitialModel());
    firstTextControllerValidator = _firstTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phone1TextControllerValidator = _phone1TextControllerValidator;
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
    userInitialModel.dispose();
    tabBarController?.dispose();
    firstFocusNode?.dispose();
    firstTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phone1FocusNode?.dispose();
    phone1TextController?.dispose();

    alternativephoneFocusNode?.dispose();
    alternativephoneTextController?.dispose();
  }

  /// Additional helper methods.
  String? get genderValue => genderValueController?.value;
}
