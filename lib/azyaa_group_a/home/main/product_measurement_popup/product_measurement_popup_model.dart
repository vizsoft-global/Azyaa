import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_measurement_popup_widget.dart'
    show ProductMeasurementPopupWidget;
import 'package:flutter/material.dart';

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
