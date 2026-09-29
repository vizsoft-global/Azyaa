import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'payment_checker_widget.dart' show PaymentCheckerWidget;
import 'package:flutter/material.dart';

class PaymentCheckerModel extends FlutterFlowModel<PaymentCheckerWidget> {
  ///  Local state fields for this component.

  int? refresh = 0;

  int? count;

  List<EmailProductDataStruct> items = [];
  void addToItems(EmailProductDataStruct item) => items.add(item);
  void removeFromItems(EmailProductDataStruct item) => items.remove(item);
  void removeAtIndexFromItems(int index) => items.removeAt(index);
  void insertAtIndexInItems(int index, EmailProductDataStruct item) =>
      items.insert(index, item);
  void updateItemsAtIndex(
          int index, Function(EmailProductDataStruct) updateFn) =>
      items[index] = updateFn(items[index]);

  int? cartAttCount;

  List<String> brandIds = [];
  void addToBrandIds(String item) => brandIds.add(item);
  void removeFromBrandIds(String item) => brandIds.remove(item);
  void removeAtIndexFromBrandIds(int index) => brandIds.removeAt(index);
  void insertAtIndexInBrandIds(int index, String item) =>
      brandIds.insert(index, item);
  void updateBrandIdsAtIndex(int index, Function(String) updateFn) =>
      brandIds[index] = updateFn(brandIds[index]);

  String? colorName;

  String? sizeName;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  PaymentResponseRecord? paymentResponseResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  OrdersRecord? presentOrderResult;
  // Stores action output result for [Backend Call - API (Status)] action in Payment_Checker widget.
  ApiCallResponse? upaymentApiResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  OrdersRecord? updatedPresentOrderResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  IdMapRecord? idMapResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  ProductsRecord? upayCartProductResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  SalesHistoryRecord? upaymentdesignerSalesDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  SalesHistoryRecord? upaymentcreatorSalesDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  IdMapRecord? notiificationIdmap3;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  BrandsRecord? brandCartResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  AttributesRecord? attributeCartResult;
  // Stores action output result for [Backend Call - API (StatusAPI)] action in Payment_Checker widget.
  ApiCallResponse? tappaymentApiResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  OrdersRecord? tapUpdatedPresentOrderResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  IdMapRecord? tapIdMapResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  ProductsRecord? tapCartProductResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  SalesHistoryRecord? tapdesignerSalesDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  SalesHistoryRecord? tapcreatorSalesDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  IdMapRecord? notiificationIdmap2;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  BrandsRecord? brandCartResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  AttributesRecord? attributeCartResult1;
  // Stores action output result for [Backend Call - API (Invoice Status)] action in Payment_Checker widget.
  ApiCallResponse? myfatoorahpaymentApiResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  OrdersRecord? myfatoorahUpdatedPresentOrderResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  IdMapRecord? myfatoorahIdMapResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  ProductsRecord? myfatoorahCartProductResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  SalesHistoryRecord? myfatoorahdesignerSalesDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  SalesHistoryRecord? myfatoorahcreatorSalesDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  IdMapRecord? notiificationIdmap1;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  BrandsRecord? brandCartResult2;
  // Stores action output result for [Firestore Query - Query a collection] action in Payment_Checker widget.
  AttributesRecord? attributeCartResult2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
