import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'step2_measurements_widget.dart' show Step2MeasurementsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Step2MeasurementsModel extends FlutterFlowModel<Step2MeasurementsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for hieght widget.
  FocusNode? hieghtFocusNode;
  TextEditingController? hieghtTextController;
  String? Function(BuildContext, String?)? hieghtTextControllerValidator;
  String? _hieghtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8grnqxjb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_hieght widget.
  String? unitHieghtValue;
  FormFieldController<String>? unitHieghtValueController;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4i6uvje9' /* Field is required */,
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
        'jnddmard' /* Field is required */,
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
        '96iwa9uo' /* Field is required */,
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
        'wubc0dbt' /* Field is required */,
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
        'x70pwqhx' /* Field is required */,
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
        'faeifuk4' /* Field is required */,
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
        'phxwe0ny' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_arm widget.
  String? unitArmValue;
  FormFieldController<String>? unitArmValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  IdMapRecord? idMapResult1;

  @override
  void initState(BuildContext context) {
    hieghtTextControllerValidator = _hieghtTextControllerValidator;
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
    hieghtFocusNode?.dispose();
    hieghtTextController?.dispose();

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
