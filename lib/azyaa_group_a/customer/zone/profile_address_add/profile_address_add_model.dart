import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profile_address_add_widget.dart' show ProfileAddressAddWidget;
import 'package:flutter/material.dart';

class ProfileAddressAddModel extends FlutterFlowModel<ProfileAddressAddWidget> {
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
  // State field(s) for Region widget.
  FocusNode? regionFocusNode;
  TextEditingController? regionTextController;
  String? Function(BuildContext, String?)? regionTextControllerValidator;
  String? _regionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jp1sezvz' /* Please enter region */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'h074ilwa' /* Minimum 2 characters are requi... */,
      );
    }
    if (val.length > 100) {
      return FFLocalizations.of(context).getText(
        's6vunooi' /* Maximum 100 characters are req... */,
      );
    }
    if (!RegExp('^[A-Za-z\\s\\-]+\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'f2phudcc' /* Invalid format. */,
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
        'nsit16sq' /* Please enter name */,
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
  String? _phonenumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm1cmv6b7' /* Please enter mobile number */,
      );
    }

    return null;
  }

  // State field(s) for phonenumbernew widget.
  FocusNode? phonenumbernewFocusNode;
  TextEditingController? phonenumbernewTextController;
  String? Function(BuildContext, String?)?
      phonenumbernewTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gq1arwwy' /* Please provide a valid email */,
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
        'qephrx5q' /* Please enter street address 1  */,
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
        'amif6yh7' /* Please enter city */,
      );
    }

    return null;
  }

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
        'po1zs7z0' /* Please enter postal code */,
      );
    }

    if (!RegExp('^[0-9]{4,6}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'rkfozaot' /* Invalid postal code. */,
      );
    }
    return null;
  }

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  IdMapRecord? idMapResult;

  @override
  void initState(BuildContext context) {
    regionTextControllerValidator = _regionTextControllerValidator;
    nameTextControllerValidator = _nameTextControllerValidator;
    phonenumberTextControllerValidator = _phonenumberTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    streetAddress1TextControllerValidator =
        _streetAddress1TextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    postalCodeTextControllerValidator = _postalCodeTextControllerValidator;
  }

  @override
  void dispose() {
    regionFocusNode?.dispose();
    regionTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    relationFocusNode?.dispose();
    relationTextController?.dispose();

    phonenumberFocusNode?.dispose();
    phonenumberTextController?.dispose();

    phonenumbernewFocusNode?.dispose();
    phonenumbernewTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    streetAddress1FocusNode?.dispose();
    streetAddress1TextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeTextController?.dispose();
  }
}
