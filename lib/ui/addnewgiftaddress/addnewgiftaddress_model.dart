import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'addnewgiftaddress_widget.dart' show AddnewgiftaddressWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddnewgiftaddressModel extends FlutterFlowModel<AddnewgiftaddressWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Orderingforsomeoneelseasagift widget.
  FormFieldController<List<String>>?
      orderingforsomeoneelseasagiftValueController;
  List<String>? get orderingforsomeoneelseasagiftValues =>
      orderingforsomeoneelseasagiftValueController?.value;
  set orderingforsomeoneelseasagiftValues(List<String>? v) =>
      orderingforsomeoneelseasagiftValueController?.value = v;

  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  String? _countryTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g8iao1fj' /* country is required */,
      );
    }

    return null;
  }

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hsawcd5l' /* name is required */,
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
        '8iyae10v' /* mobile number is required */,
      );
    }

    return null;
  }

  // State field(s) for Iknowtheaddress widget.
  FormFieldController<List<String>>? iknowtheaddressValueController;
  List<String>? get iknowtheaddressValues =>
      iknowtheaddressValueController?.value;
  set iknowtheaddressValues(List<String>? v) =>
      iknowtheaddressValueController?.value = v;

  @override
  void initState(BuildContext context) {
    countryTextControllerValidator = _countryTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
    phonenumberTextControllerValidator = _phonenumberTextControllerValidator;
  }

  @override
  void dispose() {
    countryFocusNode?.dispose();
    countryTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();
  }
}
