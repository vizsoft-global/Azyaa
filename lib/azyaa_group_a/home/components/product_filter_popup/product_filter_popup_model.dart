import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'product_filter_popup_widget.dart' show ProductFilterPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductFilterPopupModel
    extends FlutterFlowModel<ProductFilterPopupWidget> {
  ///  Local state fields for this component.

  String navigationName = 'default';

  List<String> brandLists = [];
  void addToBrandLists(String item) => brandLists.add(item);
  void removeFromBrandLists(String item) => brandLists.remove(item);
  void removeAtIndexFromBrandLists(int index) => brandLists.removeAt(index);
  void insertAtIndexInBrandLists(int index, String item) =>
      brandLists.insert(index, item);
  void updateBrandListsAtIndex(int index, Function(String) updateFn) =>
      brandLists[index] = updateFn(brandLists[index]);

  int? count;

  bool categorySerach = false;

  bool attrSearch = false;

  List<String> productIds = [];
  void addToProductIds(String item) => productIds.add(item);
  void removeFromProductIds(String item) => productIds.remove(item);
  void removeAtIndexFromProductIds(int index) => productIds.removeAt(index);
  void insertAtIndexInProductIds(int index, String item) =>
      productIds.insert(index, item);
  void updateProductIdsAtIndex(int index, Function(String) updateFn) =>
      productIds[index] = updateFn(productIds[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Category-Search widget.
  FocusNode? categorySearchFocusNode;
  TextEditingController? categorySearchTextController;
  String? Function(BuildContext, String?)?
      categorySearchTextControllerValidator;
  // Algolia Search Results from action on Category-Search
  List<CategoryRecord>? algoliaSearchResults1 = [];
  // State field(s) for Atrrbuite-Search widget.
  FocusNode? atrrbuiteSearchFocusNode;
  TextEditingController? atrrbuiteSearchTextController;
  String? Function(BuildContext, String?)?
      atrrbuiteSearchTextControllerValidator;
  // Algolia Search Results from action on Atrrbuite-Search
  List<BrandsRecord>? algoliaSearchResults2 = [];
  // State field(s) for PriceRangeSlider widget.
  double? priceRangeSliderValue;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  List<ProductsRecord>? allProductsDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  CategoryRecord? filterCategoryResult;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  BrandsRecord? filterBrandResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    categorySearchFocusNode?.dispose();
    categorySearchTextController?.dispose();

    atrrbuiteSearchFocusNode?.dispose();
    atrrbuiteSearchTextController?.dispose();
  }
}
