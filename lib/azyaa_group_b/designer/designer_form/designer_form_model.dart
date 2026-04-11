import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'designer_form_widget.dart' show DesignerFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DesignerFormModel extends FlutterFlowModel<DesignerFormWidget> {
  ///  Local state fields for this page.

  String photoupload = 'notyet';

  List<String> styles = [];
  void addToStyles(String item) => styles.add(item);
  void removeFromStyles(String item) => styles.remove(item);
  void removeAtIndexFromStyles(int index) => styles.removeAt(index);
  void insertAtIndexInStyles(int index, String item) =>
      styles.insert(index, item);
  void updateStylesAtIndex(int index, Function(String) updateFn) =>
      styles[index] = updateFn(styles[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  bool isDataUploading_uploadDataWif = false;
  FFUploadedFile uploadedLocalFile_uploadDataWif =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataWif = '';

  // State field(s) for Fullname-field widget.
  FocusNode? fullnameFieldFocusNode;
  TextEditingController? fullnameFieldTextController;
  String? Function(BuildContext, String?)? fullnameFieldTextControllerValidator;
  String? _fullnameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3xninvl3' /* Please enter name / brand */,
      );
    }

    return null;
  }

  // State field(s) for Checkbox-store widget.
  bool? checkboxStoreValue;
  // State field(s) for AllDesignerChoiceChips widget.
  FormFieldController<List<String>>? allDesignerChoiceChipsValueController;
  String? get allDesignerChoiceChipsValue =>
      allDesignerChoiceChipsValueController?.value?.firstOrNull;
  set allDesignerChoiceChipsValue(String? val) =>
      allDesignerChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for alternative-email widget.
  FocusNode? alternativeEmailFocusNode;
  TextEditingController? alternativeEmailTextController;
  String? Function(BuildContext, String?)?
      alternativeEmailTextControllerValidator;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode1;
  TextEditingController? phonenumberTextController1;
  String? Function(BuildContext, String?)? phonenumberTextController1Validator;
  // State field(s) for CountryList widget.
  String? countryListValue;
  FormFieldController<String>? countryListValueController;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode2;
  TextEditingController? phonenumberTextController2;
  String? Function(BuildContext, String?)? phonenumberTextController2Validator;
  // State field(s) for PortfolioWebsiteLink-fiels widget.
  FocusNode? portfolioWebsiteLinkFielsFocusNode;
  TextEditingController? portfolioWebsiteLinkFielsTextController;
  String? Function(BuildContext, String?)?
      portfolioWebsiteLinkFielsTextControllerValidator;
  String? _portfolioWebsiteLinkFielsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3tvpo4e6' /* Please provide portfolio / web... */,
      );
    }

    return null;
  }

  // State field(s) for about-yourself-field widget.
  FocusNode? aboutYourselfFieldFocusNode;
  TextEditingController? aboutYourselfFieldTextController;
  String? Function(BuildContext, String?)?
      aboutYourselfFieldTextControllerValidator;
  String? _aboutYourselfFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iito5zro' /* Please enter brief bio */,
      );
    }

    return null;
  }

  // State field(s) for designstyle-field widget.
  List<String>? designstyleFieldValue;
  FormFieldController<List<String>>? designstyleFieldValueController;
  // State field(s) for Experience-field widget.
  FocusNode? experienceFieldFocusNode;
  TextEditingController? experienceFieldTextController;
  String? Function(BuildContext, String?)?
      experienceFieldTextControllerValidator;
  String? _experienceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1sinmrr7' /* Please enter year of experienc... */,
      );
    }

    return null;
  }

  // State field(s) for Production-fiels widget.
  FocusNode? productionFielsFocusNode;
  TextEditingController? productionFielsTextController;
  String? Function(BuildContext, String?)?
      productionFielsTextControllerValidator;
  String? _productionFielsTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tyai15fr' /* Please add production capacity... */,
      );
    }

    return null;
  }

  // State field(s) for Checkbox-cusstomOrder widget.
  bool? checkboxCusstomOrderValue;
  // State field(s) for LocationCity-field widget.
  FocusNode? locationCityFieldFocusNode;
  TextEditingController? locationCityFieldTextController;
  String? Function(BuildContext, String?)?
      locationCityFieldTextControllerValidator;
  String? _locationCityFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'l45a7krt' /* Please enter location / city  */,
      );
    }

    return null;
  }

  // State field(s) for References-field widget.
  FocusNode? referencesFieldFocusNode;
  TextEditingController? referencesFieldTextController;
  String? Function(BuildContext, String?)?
      referencesFieldTextControllerValidator;
  // State field(s) for Checkbox-Events widget.
  bool? checkboxEventsValue;
  // State field(s) for Checkbox-Terms widget.
  bool? checkboxTermsValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Next widget.
  IdMapRecord? idmapResult;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
    fullnameFieldTextControllerValidator =
        _fullnameFieldTextControllerValidator;
    portfolioWebsiteLinkFielsTextControllerValidator =
        _portfolioWebsiteLinkFielsTextControllerValidator;
    aboutYourselfFieldTextControllerValidator =
        _aboutYourselfFieldTextControllerValidator;
    experienceFieldTextControllerValidator =
        _experienceFieldTextControllerValidator;
    productionFielsTextControllerValidator =
        _productionFielsTextControllerValidator;
    locationCityFieldTextControllerValidator =
        _locationCityFieldTextControllerValidator;
  }

  @override
  void dispose() {
    userInitialModel.dispose();
    fullnameFieldFocusNode?.dispose();
    fullnameFieldTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    alternativeEmailFocusNode?.dispose();
    alternativeEmailTextController?.dispose();

    phonenumberFocusNode1?.dispose();
    phonenumberTextController1?.dispose();

    phonenumberFocusNode2?.dispose();
    phonenumberTextController2?.dispose();

    portfolioWebsiteLinkFielsFocusNode?.dispose();
    portfolioWebsiteLinkFielsTextController?.dispose();

    aboutYourselfFieldFocusNode?.dispose();
    aboutYourselfFieldTextController?.dispose();

    experienceFieldFocusNode?.dispose();
    experienceFieldTextController?.dispose();

    productionFielsFocusNode?.dispose();
    productionFielsTextController?.dispose();

    locationCityFieldFocusNode?.dispose();
    locationCityFieldTextController?.dispose();

    referencesFieldFocusNode?.dispose();
    referencesFieldTextController?.dispose();
  }
}
