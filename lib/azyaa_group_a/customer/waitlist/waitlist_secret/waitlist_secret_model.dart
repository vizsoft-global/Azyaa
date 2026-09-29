import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'waitlist_secret_widget.dart' show WaitlistSecretWidget;
import 'package:flutter/material.dart';

class WaitlistSecretModel extends FlutterFlowModel<WaitlistSecretWidget> {
  ///  Local state fields for this page.

  int? count;

  List<SettingsAppAccessDataStruct> accessList = [];
  void addToAccessList(SettingsAppAccessDataStruct item) =>
      accessList.add(item);
  void removeFromAccessList(SettingsAppAccessDataStruct item) =>
      accessList.remove(item);
  void removeAtIndexFromAccessList(int index) => accessList.removeAt(index);
  void insertAtIndexInAccessList(int index, SettingsAppAccessDataStruct item) =>
      accessList.insert(index, item);
  void updateAccessListAtIndex(
          int index, Function(SettingsAppAccessDataStruct) updateFn) =>
      accessList[index] = updateFn(accessList[index]);

  SettingsAppAccessDataStruct? waiterAccess;
  void updateWaiterAccessStruct(
      Function(SettingsAppAccessDataStruct) updateFn) {
    updateFn(waiterAccess ??= SettingsAppAccessDataStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CountryList widget.
  String? countryListValue;
  FormFieldController<String>? countryListValueController;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5bany6gw' /* PIN code is required */,
      );
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in submit widget.
  SettingsRecord? settingsSecretFeatureResult;
  // Stores action output result for [Firestore Query - Query a collection] action in submit widget.
  UserWaitlistRecord? userWaiterResult1;
  // Stores action output result for [Backend Call - API (VerifySMS)] action in submit widget.
  ApiCallResponse? verifyOTPResult;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
