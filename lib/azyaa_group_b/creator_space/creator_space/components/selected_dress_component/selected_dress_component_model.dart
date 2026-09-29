import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selected_dress_component_widget.dart' show SelectedDressComponentWidget;
import 'package:flutter/material.dart';

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
