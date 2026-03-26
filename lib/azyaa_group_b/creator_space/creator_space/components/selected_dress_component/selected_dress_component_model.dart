import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'selected_dress_component_widget.dart' show SelectedDressComponentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SelectedDressComponentModel
    extends FlutterFlowModel<SelectedDressComponentWidget> {
  ///  Local state fields for this component.

  int count = 0;

  CreatorPromotionsStruct? promotion;
  void updatePromotionStruct(Function(CreatorPromotionsStruct) updateFn) {
    updateFn(promotion ??= CreatorPromotionsStruct());
  }

  int? addCount;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<String, bool> checkboxValueMap = {};
  List<String> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
