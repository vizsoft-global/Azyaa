import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/product_attribute/product_attribute_widget.dart';
import '/azyaa_group_a/home/components/size_chart_default/size_chart_default_widget.dart';
import '/azyaa_group_a/home/main/product_measurement_popup/product_measurement_popup_widget.dart';
import '/azyaa_group_a/payment/chosseoption_popup/chosseoption_popup_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'product_attribute_cart_level_widget.dart'
    show ProductAttributeCartLevelWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductAttributeCartLevelModel
    extends FlutterFlowModel<ProductAttributeCartLevelWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductsRecord? normalProductResult;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  InventoryRecord? normalInventoryResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  IdMapRecord? idMapResultNew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
