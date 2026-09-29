import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'default_cart_button_widget.dart' show DefaultCartButtonWidget;
import 'package:flutter/material.dart';

class DefaultCartButtonModel extends FlutterFlowModel<DefaultCartButtonWidget> {
  ///  Local state fields for this component.

  List<ProductAttributesNewStruct> attributeList = [];
  void addToAttributeList(ProductAttributesNewStruct item) =>
      attributeList.add(item);
  void removeFromAttributeList(ProductAttributesNewStruct item) =>
      attributeList.remove(item);
  void removeAtIndexFromAttributeList(int index) =>
      attributeList.removeAt(index);
  void insertAtIndexInAttributeList(
          int index, ProductAttributesNewStruct item) =>
      attributeList.insert(index, item);
  void updateAttributeListAtIndex(
          int index, Function(ProductAttributesNewStruct) updateFn) =>
      attributeList[index] = updateFn(attributeList[index]);

  List<UserCartItemsStruct> inappCartItems = [];
  void addToInappCartItems(UserCartItemsStruct item) =>
      inappCartItems.add(item);
  void removeFromInappCartItems(UserCartItemsStruct item) =>
      inappCartItems.remove(item);
  void removeAtIndexFromInappCartItems(int index) =>
      inappCartItems.removeAt(index);
  void insertAtIndexInInappCartItems(int index, UserCartItemsStruct item) =>
      inappCartItems.insert(index, item);
  void updateInappCartItemsAtIndex(
          int index, Function(UserCartItemsStruct) updateFn) =>
      inappCartItems[index] = updateFn(inappCartItems[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in NormalButton widget.
  ProductsRecord? normalProductResult;
  // Stores action output result for [Backend Call - Read Document] action in NormalButton widget.
  InventoryRecord? normalInventoryResult;
  // Stores action output result for [Firestore Query - Query a collection] action in NormalButton widget.
  IdMapRecord? idMapResultNew;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProductsRecord? iconProductResult;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  InventoryRecord? iconInventoryResult;
  // Stores action output result for [RevenueCat - Purchase] action in ios_inapp_purchase widget.
  bool? didPurchasedTab1;
  // Stores action output result for [Firestore Query - Query a collection] action in ios_inapp_purchase widget.
  IdMapRecord? idMapResultInapp;
  // Stores action output result for [Backend Call - Read Document] action in ios_inapp_purchase widget.
  ProductsRecord? normalProductInappResult;
  // Stores action output result for [Backend Call - Create Document] action in ios_inapp_purchase widget.
  OrdersRecord? orderUpaymentInapp;
  // Stores action output result for [Firestore Query - Query a collection] action in ios_inapp_purchase widget.
  ProductsRecord? myfatoorahCartProductResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
