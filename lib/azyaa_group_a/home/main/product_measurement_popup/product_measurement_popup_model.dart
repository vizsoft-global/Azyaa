import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/profile_body_add/profile_body_add_widget.dart';
import '/azyaa_group_a/customer/zone/profile_body_edit/profile_body_edit_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'product_measurement_popup_widget.dart'
    show ProductMeasurementPopupWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductMeasurementPopupModel
    extends FlutterFlowModel<ProductMeasurementPopupWidget> {
  ///  Local state fields for this component.

  int? measurement;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<UserBodyStruct, bool> checkboxValueMap = {};
  List<UserBodyStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
