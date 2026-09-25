import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'order_return_widget.dart' show OrderReturnWidget;
import 'package:flutter/material.dart';

class OrderReturnModel extends FlutterFlowModel<OrderReturnWidget> {
  ///  Local state fields for this page.

  List<UserCartItemsStruct> returnProduct = [];
  void addToReturnProduct(UserCartItemsStruct item) => returnProduct.add(item);
  void removeFromReturnProduct(UserCartItemsStruct item) =>
      returnProduct.remove(item);
  void removeAtIndexFromReturnProduct(int index) =>
      returnProduct.removeAt(index);
  void insertAtIndexInReturnProduct(int index, UserCartItemsStruct item) =>
      returnProduct.insert(index, item);
  void updateReturnProductAtIndex(
          int index, Function(UserCartItemsStruct) updateFn) =>
      returnProduct[index] = updateFn(returnProduct[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<UserCartItemsStruct, bool> checkboxValueMap = {};
  List<UserCartItemsStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for ReasonforReturn-field widget.
  String? reasonforReturnFieldValue;
  FormFieldController<String>? reasonforReturnFieldValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idmapResult;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReturnRequestsRecord? newDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
