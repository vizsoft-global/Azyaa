import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'phone_widget.dart' show PhoneWidget;
import 'package:flutter/material.dart';

class PhoneModel extends FlutterFlowModel<PhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
        '4gzjut67' /* Please enter mobile number */,
      );
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in verification_page widget.
  UsersRecord? userPhoneRegisteredValidation;
  // Stores action output result for [Firestore Query - Query a collection] action in verification_page widget.
  SettingsRecord? settingsResultPhoneOtpType;
  // Stores action output result for [Backend Call - API (SendSMS)] action in verification_page widget.
  ApiCallResponse? otpSmsSendApiStatus;
  // Stores action output result for [Backend Call - API (Send)] action in verification_page widget.
  ApiCallResponse? otpSendApiStatus;

  @override
  void initState(BuildContext context) {
    phonenumberTextControllerValidator = _phonenumberTextControllerValidator;
  }

  @override
  void dispose() {
    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();
  }
}
