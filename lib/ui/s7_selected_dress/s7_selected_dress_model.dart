import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 's7_selected_dress_widget.dart' show S7SelectedDressWidget;
import 'package:flutter/material.dart';

class S7SelectedDressModel extends FlutterFlowModel<S7SelectedDressWidget> {
  ///  Local state fields for this page.

  String photoUploadStatus = 'notYet';

  ///  State fields for stateful widgets in this page.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for Checkbox widget.
  Map<ProductsRecord, bool> checkboxValueMap1 = {};
  List<ProductsRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<ProductsRecord, bool> checkboxValueMap2 = {};
  List<ProductsRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<ProductsRecord, bool> checkboxValueMap3 = {};
  List<ProductsRecord> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }
}
