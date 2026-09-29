import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'waitlist_form_widget.dart' show WaitlistFormWidget;
import 'package:flutter/material.dart';

class WaitlistFormModel extends FlutterFlowModel<WaitlistFormWidget> {
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

  int? adminCount;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8e2ebsih' /* Enter your full name is requir... */,
      );
    }

    return null;
  }

  // State field(s) for CountryList widget.
  String? countryListValue;
  FormFieldController<String>? countryListValueController;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  String? _phonenumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lhdbxknp' /* Enter your mobile number is re... */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gnk02zb1' /* Enter your email is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in send widget.
  int? userused;
  // Stores action output result for [Firestore Query - Query a collection] action in send widget.
  UserWaitlistRecord? userWaiterResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in send widget.
  UserWaitlistRecord? userWaiterResult;
  // Stores action output result for [Firestore Query - Query a collection] action in send widget.
  UserWaitlistRecord? userWaiterResultEmail;
  // Stores action output result for [Firestore Query - Query a collection] action in send widget.
  UserWaitlistRecord? userWaiterResultPhone;
  // Stores action output result for [Firestore Query - Query a collection] action in send widget.
  IdMapRecord? idMapWaitlistResult;
  // Stores action output result for [Backend Call - Create Document] action in send widget.
  UserWaitlistRecord? newUserWaiterResult;
  // Stores action output result for [Firestore Query - Query a collection] action in send widget.
  IdMapRecord? idmapresult3;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    phonenumberTextControllerValidator = _phonenumberTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
