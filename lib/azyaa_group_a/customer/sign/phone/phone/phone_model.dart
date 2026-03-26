import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'phone_widget.dart' show PhoneWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
