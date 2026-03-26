import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/payment/chosseoption_popup/chosseoption_popup_widget.dart';
import '/azyaa_group_a/payment/product_attribute_cart_level/product_attribute_cart_level_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'default_cart_button_widget.dart' show DefaultCartButtonWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
