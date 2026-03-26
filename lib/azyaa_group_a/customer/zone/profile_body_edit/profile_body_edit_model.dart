import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'profile_body_edit_widget.dart' show ProfileBodyEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfileBodyEditModel extends FlutterFlowModel<ProfileBodyEditWidget> {
  ///  Local state fields for this component.

  List<UserBodyStruct> all = [];
  void addToAll(UserBodyStruct item) => all.add(item);
  void removeFromAll(UserBodyStruct item) => all.remove(item);
  void removeAtIndexFromAll(int index) => all.removeAt(index);
  void insertAtIndexInAll(int index, UserBodyStruct item) =>
      all.insert(index, item);
  void updateAllAtIndex(int index, Function(UserBodyStruct) updateFn) =>
      all[index] = updateFn(all[index]);

  int count = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mcvgmrkm' /* Please enter name */,
      );
    }

    return null;
  }

  // State field(s) for Relation widget.
  FocusNode? relationFocusNode;
  TextEditingController? relationTextController;
  String? Function(BuildContext, String?)? relationTextControllerValidator;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  String? _heightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'elatkcmr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_height widget.
  String? unitHeightValue;
  FormFieldController<String>? unitHeightValueController;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h7ss27bo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_weight widget.
  String? unitWeightValue;
  FormFieldController<String>? unitWeightValueController;
  // State field(s) for chest widget.
  FocusNode? chestFocusNode;
  TextEditingController? chestTextController;
  String? Function(BuildContext, String?)? chestTextControllerValidator;
  String? _chestTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bylgtlyx' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_chest widget.
  String? unitChestValue;
  FormFieldController<String>? unitChestValueController;
  // State field(s) for waist widget.
  FocusNode? waistFocusNode;
  TextEditingController? waistTextController;
  String? Function(BuildContext, String?)? waistTextControllerValidator;
  String? _waistTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1jafwueb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_waist widget.
  String? unitWaistValue;
  FormFieldController<String>? unitWaistValueController;
  // State field(s) for hip widget.
  FocusNode? hipFocusNode;
  TextEditingController? hipTextController;
  String? Function(BuildContext, String?)? hipTextControllerValidator;
  String? _hipTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2qvi4nts' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_hip widget.
  String? unitHipValue;
  FormFieldController<String>? unitHipValueController;
  // State field(s) for inseam widget.
  FocusNode? inseamFocusNode;
  TextEditingController? inseamTextController;
  String? Function(BuildContext, String?)? inseamTextControllerValidator;
  String? _inseamTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fw2bsp8d' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_inseam widget.
  String? unitInseamValue;
  FormFieldController<String>? unitInseamValueController;
  // State field(s) for shoulder widget.
  FocusNode? shoulderFocusNode;
  TextEditingController? shoulderTextController;
  String? Function(BuildContext, String?)? shoulderTextControllerValidator;
  String? _shoulderTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'u4chm1mp' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_shoulder widget.
  String? unitShoulderValue;
  FormFieldController<String>? unitShoulderValueController;
  // State field(s) for arm widget.
  FocusNode? armFocusNode;
  TextEditingController? armTextController;
  String? Function(BuildContext, String?)? armTextControllerValidator;
  String? _armTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ls8q671n' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_arm widget.
  String? unitArmValue;
  FormFieldController<String>? unitArmValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    heightTextControllerValidator = _heightTextControllerValidator;
    weightTextControllerValidator = _weightTextControllerValidator;
    chestTextControllerValidator = _chestTextControllerValidator;
    waistTextControllerValidator = _waistTextControllerValidator;
    hipTextControllerValidator = _hipTextControllerValidator;
    inseamTextControllerValidator = _inseamTextControllerValidator;
    shoulderTextControllerValidator = _shoulderTextControllerValidator;
    armTextControllerValidator = _armTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    relationFocusNode?.dispose();
    relationTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    chestFocusNode?.dispose();
    chestTextController?.dispose();

    waistFocusNode?.dispose();
    waistTextController?.dispose();

    hipFocusNode?.dispose();
    hipTextController?.dispose();

    inseamFocusNode?.dispose();
    inseamTextController?.dispose();

    shoulderFocusNode?.dispose();
    shoulderTextController?.dispose();

    armFocusNode?.dispose();
    armTextController?.dispose();
  }
}
