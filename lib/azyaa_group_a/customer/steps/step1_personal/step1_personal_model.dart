import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'step1_personal_widget.dart' show Step1PersonalWidget;
import 'package:flutter/material.dart';

class Step1PersonalModel extends FlutterFlowModel<Step1PersonalWidget> {
  ///  Local state fields for this page.

  String userPhotoUploadStatus = 'notyet';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_userPhotoUpload = false;
  FFUploadedFile uploadedLocalFile_userPhotoUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_userPhotoUpload = '';

  // State field(s) for First widget.
  FocusNode? firstFocusNode;
  TextEditingController? firstTextController;
  String? Function(BuildContext, String?)? firstTextControllerValidator;
  String? _firstTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fxe363tj' /* Please enter first name */,
      );
    }

    return null;
  }

  // State field(s) for Last widget.
  FocusNode? lastFocusNode;
  TextEditingController? lastTextController;
  String? Function(BuildContext, String?)? lastTextControllerValidator;
  String? _lastTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xf9sfm1i' /* Please enter last name */,
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
        'wosvewvn' /* Please provide a valid email  */,
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
        'b1hqx6re' /* Please enter mobile number */,
      );
    }

    return null;
  }

  // State field(s) for CountryList widget.
  String? countryListValue1;
  FormFieldController<String>? countryListValueController1;
  // State field(s) for alternativephone widget.
  FocusNode? alternativephoneFocusNode;
  TextEditingController? alternativephoneTextController;
  String? Function(BuildContext, String?)?
      alternativephoneTextControllerValidator;
  // State field(s) for CountryList widget.
  String? countryListValue2;
  FormFieldController<String>? countryListValueController2;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;

  @override
  void initState(BuildContext context) {
    firstTextControllerValidator = _firstTextControllerValidator;
    lastTextControllerValidator = _lastTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phone1TextControllerValidator = _phone1TextControllerValidator;
  }

  @override
  void dispose() {
    firstFocusNode?.dispose();
    firstTextController?.dispose();

    lastFocusNode?.dispose();
    lastTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phone1FocusNode?.dispose();
    phone1TextController?.dispose();

    alternativephoneFocusNode?.dispose();
    alternativephoneTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();
  }

  /// Additional helper methods.
  String? get genderValue => genderValueController?.value;
}
