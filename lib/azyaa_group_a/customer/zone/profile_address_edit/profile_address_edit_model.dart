import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_address_edit_widget.dart' show ProfileAddressEditWidget;
import 'package:flutter/material.dart';

class ProfileAddressEditModel
    extends FlutterFlowModel<ProfileAddressEditWidget> {
  ///  Local state fields for this component.

  int? count;

  List<UserShippingaddressStruct> all = [];
  void addToAll(UserShippingaddressStruct item) => all.add(item);
  void removeFromAll(UserShippingaddressStruct item) => all.remove(item);
  void removeAtIndexFromAll(int index) => all.removeAt(index);
  void insertAtIndexInAll(int index, UserShippingaddressStruct item) =>
      all.insert(index, item);
  void updateAllAtIndex(
          int index, Function(UserShippingaddressStruct) updateFn) =>
      all[index] = updateFn(all[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nn4ylfj7' /* Please enter name */,
      );
    }

    return null;
  }

  // State field(s) for Relation widget.
  FocusNode? relationFocusNode;
  TextEditingController? relationTextController;
  String? Function(BuildContext, String?)? relationTextControllerValidator;
  // State field(s) for CountryList widget.
  String? countryListValue;
  FormFieldController<String>? countryListValueController;
  // State field(s) for phonenumber widget.
  FocusNode? phonenumberFocusNode;
  TextEditingController? phonenumberTextController;
  String? Function(BuildContext, String?)? phonenumberTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hpyl8vrj' /* Please provide a valid email */,
      );
    }

    return null;
  }

  // State field(s) for StreetAddress1 widget.
  FocusNode? streetAddress1FocusNode;
  TextEditingController? streetAddress1TextController;
  String? Function(BuildContext, String?)?
      streetAddress1TextControllerValidator;
  String? _streetAddress1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '23l8thf6' /* Please enter street address 1  */,
      );
    }

    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ajssqa6n' /* Please enter city */,
      );
    }

    return null;
  }

  // State field(s) for Region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  // State field(s) for CountryGCC widget.
  String? countryGCCValue;
  FormFieldController<String>? countryGCCValueController;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for PostalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeTextController;
  String? Function(BuildContext, String?)? postalCodeTextControllerValidator;
  String? _postalCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'y5boqi07' /* Please enter postal code */,
      );
    }

    return null;
  }

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    streetAddress1TextControllerValidator =
        _streetAddress1TextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    postalCodeTextControllerValidator = _postalCodeTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    relationFocusNode?.dispose();
    relationTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    streetAddress1FocusNode?.dispose();
    streetAddress1TextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    regionFocusNode?.dispose();
    regionTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeTextController?.dispose();
  }
}
