import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_body_add_widget.dart' show ProfileBodyAddWidget;
import 'package:flutter/material.dart';

class ProfileBodyAddModel extends FlutterFlowModel<ProfileBodyAddWidget> {
  ///  Local state fields for this component.

  int? count;

  List<UserBodyStruct> bodyList = [];
  void addToBodyList(UserBodyStruct item) => bodyList.add(item);
  void removeFromBodyList(UserBodyStruct item) => bodyList.remove(item);
  void removeAtIndexFromBodyList(int index) => bodyList.removeAt(index);
  void insertAtIndexInBodyList(int index, UserBodyStruct item) =>
      bodyList.insert(index, item);
  void updateBodyListAtIndex(int index, Function(UserBodyStruct) updateFn) =>
      bodyList[index] = updateFn(bodyList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'meopz8eh' /* Please enter name. */,
      );
    }

    return null;
  }

  // State field(s) for Relation widget.
  FocusNode? relationFocusNode;
  TextEditingController? relationTextController;
  String? Function(BuildContext, String?)? relationTextControllerValidator;
  // State field(s) for hieght widget.
  FocusNode? hieghtFocusNode;
  TextEditingController? hieghtTextController;
  String? Function(BuildContext, String?)? hieghtTextControllerValidator;
  String? _hieghtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ad6u5qpk' /* Field is required */,
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
        '8jvr0y89' /* Field is required */,
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
        '3wzzjwb2' /* Field is required */,
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
        'i9lrffkg' /* Field is required */,
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
        'yx7mu4gz' /* Field is required */,
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
        'mh4l4v0t' /* Field is required */,
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
        '5ut6r5mk' /* Field is required */,
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
        'whnjyzw5' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for unit_arm widget.
  String? unitArmValue;
  FormFieldController<String>? unitArmValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapResult;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
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
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    relationFocusNode?.dispose();
    relationTextController?.dispose();

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
