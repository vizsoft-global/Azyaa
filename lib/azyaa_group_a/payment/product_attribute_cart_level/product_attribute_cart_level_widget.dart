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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_attribute_cart_level_model.dart';
export 'product_attribute_cart_level_model.dart';

class ProductAttributeCartLevelWidget extends StatefulWidget {
  const ProductAttributeCartLevelWidget({
    super.key,
    required this.cartIndex,
    required this.product,
    String? navigation,
    required this.popupType,
  }) : this.navigation = navigation ?? 'default';

  final int? cartIndex;
  final ProductsRecord? product;
  final String navigation;
  final String? popupType;

  @override
  State<ProductAttributeCartLevelWidget> createState() =>
      _ProductAttributeCartLevelWidgetState();
}

class _ProductAttributeCartLevelWidgetState
    extends State<ProductAttributeCartLevelWidget> {
  late ProductAttributeCartLevelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductAttributeCartLevelModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Container(
                width: 35.0,
                height: 3.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).navbaricon,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'chk8ds63' /* Choose */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Aileron',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  if (widget!.popupType == 'icon')
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          if (loggedIn) {
                            _model.normalProductResult =
                                await ProductsRecord.getDocumentOnce(
                                    widget!.product!.reference);
                            _shouldSetState = true;
                            _model.normalInventoryResult =
                                await InventoryRecord.getDocumentOnce(_model
                                    .normalProductResult!
                                    .product
                                    .inventoryRef!);
                            _shouldSetState = true;
                            if (_model.normalInventoryResult!.stock > 0) {
                              if (FFAppState()
                                      .UserDataFlow
                                      .userProductSwatchesList
                                      .where((e) =>
                                          e.viewedItemId ==
                                          widget!.product?.productId)
                                      .toList()
                                      .length >
                                  0) {
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..count = FFAppState()
                                        .UserDataFlow
                                        .userProductSwatchesList
                                        .where((e) =>
                                            e.viewedItemId ==
                                            widget!.product?.productId)
                                        .toList()
                                        .firstOrNull
                                        ?.productAttribute
                                        ?.length
                                    ..userSwatchesProductAttribute =
                                        FFAppState()
                                            .UserDataFlow
                                            .userProductSwatchesList
                                            .where((e) =>
                                                e.viewedItemId ==
                                                widget!.product?.productId)
                                            .toList()
                                            .firstOrNull!
                                            .productAttribute
                                            .toList(),
                                );
                                while (FFAppState().UserDataFlow.count > 0) {
                                  if (FFAppState()
                                          .UserDataFlow
                                          .userSwatchesProductAttribute
                                          .elementAtOrNull(
                                              FFAppState().UserDataFlow.count -
                                                  1)
                                          ?.attributesDefaultTermId ==
                                      '') {
                                    await showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: Container(
                                              width: 500.0,
                                              child: ChosseoptionPopupWidget(
                                                title:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'y12no71w' /* Select */,
                                                ),
                                                description:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'mae5c7ae' /* Please choose product options ... */,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e
                                      ..count =
                                          FFAppState().UserDataFlow.count - 1,
                                  );
                                }
                              } else {
                                await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: Container(
                                          width: 500.0,
                                          child: ChosseoptionPopupWidget(
                                            title: FFLocalizations.of(context)
                                                .getVariableText(
                                              enText: 'Select',
                                              arText: 'يختار',
                                            ),
                                            description:
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText:
                                                  'Please choose product options !',
                                              arText:
                                                  'الرجاء اختيار خيارات المنتج!',
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );

                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              _model.idMapResultNew =
                                  await queryIdMapRecordOnce(
                                queryBuilder: (idMapRecord) =>
                                    idMapRecord.where(
                                  'type',
                                  isEqualTo: 'Main',
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              if (FFAppState()
                                      .UserDataFlow
                                      .userProductSwatchesList
                                      .where((e) =>
                                          e.viewedItemId ==
                                          widget!.product?.productId)
                                      .toList()
                                      .length <=
                                  0) {
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..userCartItemList = currentUserDocument!
                                        .userCart.cartItems
                                        .toList(),
                                );
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..updateUserCartItemList(
                                      (e) => e.add(UserCartItemsStruct(
                                        cartItemId:
                                            _model.idMapResultNew?.cartItemId,
                                        productType: 'product',
                                        cartItemAttribute:
                                            widget!.product?.productAttribute,
                                        productId: widget!.product?.productId,
                                        productInfo:
                                            widget!.product?.productInfo,
                                        quantity: 1,
                                        price: widget!
                                                .product!.product.productPrice *
                                            1,
                                        totalPrice: widget!
                                                .product!.product.productPrice *
                                            1,
                                        productDesignerRef: widget!
                                            .product
                                            ?.productAuthorizer
                                            ?.productDesignerRef,
                                        productDesignerId: widget!
                                            .product
                                            ?.productAuthorizer
                                            ?.productDesignerId,
                                        productRef: widget!.product?.reference,
                                        productStockInfo:
                                            _model.normalProductResult?.product,
                                        productInventoryInfo:
                                            InventoryInfoStruct(
                                          stock: _model
                                              .normalInventoryResult?.stock,
                                          stockOnHand: _model
                                              .normalInventoryResult
                                              ?.stockOnHand,
                                          stockReserved: _model
                                              .normalInventoryResult
                                              ?.stockReserved,
                                          stockUnavailable: _model
                                              .normalInventoryResult
                                              ?.stockUnavailable,
                                        ),
                                      )),
                                    ),
                                );

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  userCart: createUserCartStruct(
                                    cartId: _model.idMapResultNew?.cartId,
                                    createdAt: getCurrentTimestamp,
                                    updatedAt: getCurrentTimestamp,
                                    subtotal: functions.newCartTotal(
                                        currentUserDocument!.userCart.cartItems
                                            .map((e) => e.totalPrice)
                                            .toList()),
                                    total: functions.newCartTotal(
                                        currentUserDocument!.userCart.cartItems
                                            .map((e) => e.totalPrice)
                                            .toList()),
                                    fieldValues: {
                                      'cart_items':
                                          getUserCartItemsListFirestoreData(
                                        FFAppState()
                                            .UserDataFlow
                                            .userCartItemList,
                                      ),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));
                                unawaited(
                                  () async {
                                    await _model.idMapResultNew!.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'cart_id': FieldValue.increment(1),
                                          'cart_item_id':
                                              FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                  }(),
                                );
                              }
                              FFAppState().updateUserDataFlowStruct(
                                (e) => e
                                  ..userCartItemList = currentUserDocument!
                                      .userCart.cartItems
                                      .toList()
                                  ..count = currentUserDocument
                                      ?.userCart?.cartItems?.length
                                  ..userCartItemPAFound = 'notfound',
                              );
                              while (FFAppState().UserDataFlow.count > 0) {
                                if (FFAppState()
                                        .UserDataFlow
                                        .userCartItemList
                                        .elementAtOrNull(
                                            FFAppState().UserDataFlow.count - 1)
                                        ?.productId ==
                                    widget!.product?.productId) {
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e
                                      ..userCartItemProductAttribute =
                                          FFAppState()
                                              .UserDataFlow
                                              .userCartItemList
                                              .elementAtOrNull(FFAppState()
                                                      .UserDataFlow
                                                      .count -
                                                  1)!
                                              .cartItemAttribute
                                              .toList()
                                      ..userCartItemPAFound = 'notfound'
                                      ..userCartItemPAIndex =
                                          FFAppState().UserDataFlow.count - 1,
                                  );
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e
                                      ..count = FFAppState()
                                          .UserDataFlow
                                          .userCartItemList
                                          .elementAtOrNull(
                                              FFAppState().UserDataFlow.count -
                                                  1)
                                          ?.cartItemAttribute
                                          ?.length,
                                  );
                                  while (FFAppState().UserDataFlow.count > 0) {
                                    if ((FFAppState()
                                                .UserDataFlow
                                                .userCartItemProductAttribute
                                                .elementAtOrNull(FFAppState()
                                                        .UserDataFlow
                                                        .count -
                                                    1)
                                                ?.attributesDefaultTermId ==
                                            FFAppState()
                                                .UserDataFlow
                                                .userProductSwatchesList
                                                .where((e) =>
                                                    e.viewedItemId ==
                                                    widget!.product?.productId)
                                                .toList()
                                                .elementAtOrNull(FFAppState()
                                                        .UserDataFlow
                                                        .count -
                                                    1)
                                                ?.productAttribute
                                                ?.firstOrNull
                                                ?.attributesDefaultTermId) ||
                                        (FFAppState()
                                                .UserDataFlow
                                                .userCartItemProductAttribute
                                                .elementAtOrNull(FFAppState()
                                                        .UserDataFlow
                                                        .count -
                                                    1)
                                                ?.attributesDefaultTermId ==
                                            (FFAppState()
                                                    .UserDataFlow
                                                    .userProductSwatchesList
                                                    .where((e) =>
                                                        e.viewedItemId ==
                                                        widget!
                                                            .product?.productId)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.productAttribute
                                                    ?.elementAtOrNull(
                                                        FFAppState()
                                                                .UserDataFlow
                                                                .count -
                                                            1))
                                                ?.attributesDefaultTermId)) {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) => e..userCartItemPAFound = 'found',
                                      );
                                    } else {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) =>
                                            e..userCartItemPAFound = 'notfound',
                                      );
                                    }

                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..count =
                                            FFAppState().UserDataFlow.count - 1,
                                    );
                                  }
                                }
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..count =
                                        FFAppState().UserDataFlow.count - 1,
                                );
                              }
                              if (FFAppState()
                                      .UserDataFlow
                                      .userCartItemPAFound ==
                                  'found') {
                                if (_model.normalInventoryResult!.stock >=
                                    (FFAppState()
                                            .UserDataFlow
                                            .userCartItemList
                                            .elementAtOrNull(FFAppState()
                                                .UserDataFlow
                                                .userCartItemPAIndex)!
                                            .quantity +
                                        1)) {
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e
                                      ..updateUserCartItemList(
                                        (e) => e[FFAppState()
                                            .UserDataFlow
                                            .userCartItemPAIndex]
                                          ..quantity = FFAppState()
                                                  .UserDataFlow
                                                  .userCartItemList
                                                  .elementAtOrNull(FFAppState()
                                                      .UserDataFlow
                                                      .userCartItemPAIndex)!
                                                  .quantity +
                                              1,
                                      ),
                                  );
                                  if ((currentUserDocument?.userBody
                                                  ?.toList() ??
                                              [])
                                          .where((e) => e.isDefault == true)
                                          .toList()
                                          .length >
                                      0) {
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..updateUserCartItemList(
                                          (e) => e[FFAppState()
                                              .UserDataFlow
                                              .userCartItemPAIndex]
                                            ..price = widget!.product!.product
                                                    .productPrice *
                                                FFAppState()
                                                    .UserDataFlow
                                                    .userCartItemList
                                                    .elementAtOrNull(FFAppState()
                                                        .UserDataFlow
                                                        .userCartItemPAIndex)!
                                                    .quantity
                                            ..totalPrice = widget!.product!
                                                    .product.productPrice *
                                                FFAppState()
                                                    .UserDataFlow
                                                    .userCartItemList
                                                    .elementAtOrNull(FFAppState()
                                                        .UserDataFlow
                                                        .userCartItemPAIndex)!
                                                    .quantity
                                            ..productMainType = _model
                                                .normalProductResult
                                                ?.product
                                                ?.productType
                                            ..productUserBodyInfo =
                                                (currentUserDocument?.userBody
                                                            ?.toList() ??
                                                        [])
                                                    .where((e) =>
                                                        e.isDefault == true)
                                                    .toList()
                                                    .firstOrNull,
                                        ),
                                    );
                                  } else {
                                    if (_model.normalProductResult?.product
                                            ?.productType ==
                                        'custom') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText:
                                                    'Kindly choose your measurement.',
                                                arText:
                                                    'يرجى اختيار القياس الخاص بك.',
                                              )),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    enText: 'Ok',
                                                    arText: 'نعم',
                                                  )),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) => e
                                          ..updateUserCartItemList(
                                            (e) => e[FFAppState()
                                                .UserDataFlow
                                                .userCartItemPAIndex]
                                              ..price = widget!.product!.product
                                                      .productPrice *
                                                  FFAppState()
                                                      .UserDataFlow
                                                      .userCartItemList
                                                      .elementAtOrNull(FFAppState()
                                                          .UserDataFlow
                                                          .userCartItemPAIndex)!
                                                      .quantity
                                              ..totalPrice = widget!.product!
                                                      .product.productPrice *
                                                  FFAppState()
                                                      .UserDataFlow
                                                      .userCartItemList
                                                      .elementAtOrNull(FFAppState()
                                                          .UserDataFlow
                                                          .userCartItemPAIndex)!
                                                      .quantity
                                              ..productMainType = _model
                                                  .normalProductResult
                                                  ?.product
                                                  ?.productType,
                                          ),
                                      );
                                    }
                                  }
                                }
                              } else {
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..count = FFAppState()
                                        .UserDataFlow
                                        .userProductSwatchesList
                                        .where((e) =>
                                            e.viewedItemId ==
                                            widget!.product?.productId)
                                        .toList()
                                        .firstOrNull
                                        ?.productAttribute
                                        ?.length
                                    ..userSwatchesProductAttribute =
                                        FFAppState()
                                            .UserDataFlow
                                            .userProductSwatchesList
                                            .where((e) =>
                                                e.viewedItemId ==
                                                widget!.product?.productId)
                                            .toList()
                                            .firstOrNull!
                                            .productAttribute
                                            .toList(),
                                );
                                while (FFAppState().UserDataFlow.count > 0) {
                                  if (FFAppState()
                                              .UserDataFlow
                                              .userSwatchesProductAttribute
                                              .elementAtOrNull(FFAppState()
                                                      .UserDataFlow
                                                      .count -
                                                  1)
                                              ?.attributesDefaultTermId ==
                                          null ||
                                      FFAppState()
                                              .UserDataFlow
                                              .userSwatchesProductAttribute
                                              .elementAtOrNull(FFAppState()
                                                      .UserDataFlow
                                                      .count -
                                                  1)
                                              ?.attributesDefaultTermId ==
                                          '') {
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..updateUserSwatchesProductAttribute(
                                          (e) => e[
                                              FFAppState().UserDataFlow.count -
                                                  1]
                                            ..attributesDefaultTermId = (widget!
                                                    .product?.productAttribute
                                                    ?.elementAtOrNull(
                                                        FFAppState()
                                                                .UserDataFlow
                                                                .count -
                                                            1))
                                                ?.attributesBrandTermIds
                                                ?.firstOrNull,
                                        ),
                                    );
                                  }
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e
                                      ..count =
                                          FFAppState().UserDataFlow.count - 1,
                                  );
                                }
                                if ((currentUserDocument?.userBody?.toList() ??
                                            [])
                                        .where((e) => e.isDefault == true)
                                        .toList()
                                        .length >
                                    0) {
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e
                                      ..updateUserCartItemList(
                                        (e) => e.add(UserCartItemsStruct(
                                          cartItemId:
                                              _model.idMapResultNew?.cartItemId,
                                          productType: 'product',
                                          cartItemAttribute: FFAppState()
                                              .UserDataFlow
                                              .userSwatchesProductAttribute,
                                          productId: widget!.product?.productId,
                                          productInfo:
                                              widget!.product?.productInfo,
                                          quantity: 1,
                                          price: widget!.product!.product
                                                  .productPrice *
                                              1,
                                          totalPrice: widget!.product!.product
                                                  .productPrice *
                                              1,
                                          productDesignerRef: widget!
                                              .product
                                              ?.productAuthorizer
                                              ?.productDesignerRef,
                                          productDesignerId: widget!
                                              .product
                                              ?.productAuthorizer
                                              ?.productDesignerId,
                                          productRef:
                                              widget!.product?.reference,
                                          productStockInfo: _model
                                              .normalProductResult?.product,
                                          productInventoryInfo:
                                              InventoryInfoStruct(
                                            stock: _model
                                                .normalInventoryResult?.stock,
                                            stockOnHand: _model
                                                .normalInventoryResult
                                                ?.stockOnHand,
                                            stockReserved: _model
                                                .normalInventoryResult
                                                ?.stockReserved,
                                            stockUnavailable: _model
                                                .normalInventoryResult
                                                ?.stockUnavailable,
                                          ),
                                          productMainType: _model
                                              .normalProductResult
                                              ?.product
                                              ?.productType,
                                          productUserBodyInfo:
                                              (currentUserDocument?.userBody
                                                          ?.toList() ??
                                                      [])
                                                  .where((e) =>
                                                      e.isDefault == true)
                                                  .toList()
                                                  .firstOrNull,
                                        )),
                                      ),
                                  );
                                } else {
                                  if (_model.normalProductResult?.product
                                          ?.productType ==
                                      'custom') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText:
                                                  'Kindly choose your measurement.',
                                              arText:
                                                  'يرجى اختيار القياس الخاص بك.',
                                            )),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  enText: 'Ok',
                                                  arText: 'نعم',
                                                )),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..updateUserCartItemList(
                                          (e) => e.add(UserCartItemsStruct(
                                            cartItemId: _model
                                                .idMapResultNew?.cartItemId,
                                            productType: 'product',
                                            cartItemAttribute: FFAppState()
                                                .UserDataFlow
                                                .userSwatchesProductAttribute,
                                            productId:
                                                widget!.product?.productId,
                                            productInfo:
                                                widget!.product?.productInfo,
                                            quantity: 1,
                                            price: widget!.product!.product
                                                    .productPrice *
                                                1,
                                            totalPrice: widget!.product!.product
                                                    .productPrice *
                                                1,
                                            productDesignerRef: widget!
                                                .product
                                                ?.productAuthorizer
                                                ?.productDesignerRef,
                                            productDesignerId: widget!
                                                .product
                                                ?.productAuthorizer
                                                ?.productDesignerId,
                                            productRef:
                                                widget!.product?.reference,
                                            productStockInfo: _model
                                                .normalProductResult?.product,
                                            productInventoryInfo:
                                                InventoryInfoStruct(
                                              stock: _model
                                                  .normalInventoryResult?.stock,
                                              stockOnHand: _model
                                                  .normalInventoryResult
                                                  ?.stockOnHand,
                                              stockReserved: _model
                                                  .normalInventoryResult
                                                  ?.stockReserved,
                                              stockUnavailable: _model
                                                  .normalInventoryResult
                                                  ?.stockUnavailable,
                                            ),
                                            productMainType: _model
                                                .normalProductResult
                                                ?.product
                                                ?.productType,
                                          )),
                                        ),
                                    );
                                  }
                                }
                              }

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                userCart: createUserCartStruct(
                                  cartId: _model.idMapResultNew?.cartId,
                                  createdAt: getCurrentTimestamp,
                                  updatedAt: getCurrentTimestamp,
                                  subtotal: functions.newCartTotal(
                                      currentUserDocument!.userCart.cartItems
                                          .map((e) => e.totalPrice)
                                          .toList()),
                                  total: functions.newCartTotal(
                                      currentUserDocument!.userCart.cartItems
                                          .map((e) => e.totalPrice)
                                          .toList()),
                                  fieldValues: {
                                    'cart_items':
                                        getUserCartItemsListFirestoreData(
                                      FFAppState()
                                          .UserDataFlow
                                          .userCartItemList,
                                    ),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ));
                              unawaited(
                                () async {
                                  await _model.idMapResultNew!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'cart_id': FieldValue.increment(1),
                                        'cart_item_id': FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                }(),
                              );
                              unawaited(
                                () async {
                                  Navigator.pop(context);
                                }(),
                              );

                              context.pushNamed(CartWidget.routeName);
                            }
                          } else {
                            context.goNamed(LoginWidget.routeName);
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'gcn1cgz9' /* Add to bag */,
                        ),
                        options: FFButtonOptions(
                          height: 32.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Aileron',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Wrap(
              spacing: 0.0,
              runSpacing: 0.0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                Builder(
                  builder: (context) {
                    final attributeList = widget!.product?.productAttribute
                            ?.sortedList(
                                keyOf: (e) => e.attributesId, desc: false)
                            ?.toList() ??
                        [];

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: attributeList.length,
                      itemBuilder: (context, attributeListIndex) {
                        final attributeListItem =
                            attributeList[attributeListIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: StreamBuilder<List<AttributesRecord>>(
                            stream: queryAttributesRecord(
                              queryBuilder: (attributesRecord) =>
                                  attributesRecord
                                      .where(
                                        'attribute_id',
                                        isEqualTo:
                                            attributeListItem.attributesId,
                                      )
                                      .where(
                                        'status',
                                        isEqualTo: 'active',
                                      ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 2.0,
                                    height: 2.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<AttributesRecord>
                                  variationAttributesRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final variationAttributesRecord =
                                  variationAttributesRecordList.isNotEmpty
                                      ? variationAttributesRecordList.first
                                      : null;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Divider(
                                    height: 4.0,
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: () {
                                              if (variationAttributesRecord
                                                      ?.attributeInfoCustomTranslate
                                                      ?.name
                                                      ?.en !=
                                                  '') {
                                                return variationAttributesRecord
                                                    ?.attributeInfoCustomTranslate
                                                    ?.name
                                                    ?.en;
                                              } else if (variationAttributesRecord
                                                      ?.attributeInfoTranslate
                                                      ?.name
                                                      ?.en !=
                                                  '') {
                                                return variationAttributesRecord
                                                    ?.attributeInfoTranslate
                                                    ?.name
                                                    ?.en;
                                              } else {
                                                return variationAttributesRecord
                                                    ?.attributeInfo?.name;
                                              }
                                            }(),
                                            arText: () {
                                              if (variationAttributesRecord
                                                      ?.attributeInfoCustomTranslate
                                                      ?.name
                                                      ?.ar !=
                                                  '') {
                                                return variationAttributesRecord
                                                    ?.attributeInfoCustomTranslate
                                                    ?.name
                                                    ?.ar;
                                              } else if (variationAttributesRecord
                                                      ?.attributeInfoTranslate
                                                      ?.name
                                                      ?.ar !=
                                                  '') {
                                                return variationAttributesRecord
                                                    ?.attributeInfoTranslate
                                                    ?.name
                                                    ?.ar;
                                              } else {
                                                return variationAttributesRecord
                                                    ?.attributeInfo?.name;
                                              }
                                            }(),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Aileron',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        if (variationAttributesRecord
                                                ?.attributeId ==
                                            '1000')
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: Container(
                                                          width: 600.0,
                                                          child:
                                                              SizeChartDefaultWidget(
                                                            product: widget!
                                                                .product!,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2ouksv87' /* Size Chart */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .velvet,
                                                          letterSpacing: 0.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final termList = attributeListItem
                                                  .attributesBrandTermIds
                                                  .toList();

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: List.generate(
                                                          termList.length,
                                                          (termListIndex) {
                                                    final termListItem =
                                                        termList[termListIndex];
                                                    return StreamBuilder<
                                                        List<BrandsRecord>>(
                                                      stream: queryBrandsRecord(
                                                        queryBuilder:
                                                            (brandsRecord) =>
                                                                brandsRecord
                                                                    .where(
                                                                      'brand_id',
                                                                      isEqualTo:
                                                                          termListItem,
                                                                    )
                                                                    .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'active',
                                                                    ),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 2.0,
                                                              height: 2.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Colors
                                                                      .transparent,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BrandsRecord>
                                                            stackBrandsRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final stackBrandsRecord =
                                                            stackBrandsRecordList
                                                                    .isNotEmpty
                                                                ? stackBrandsRecordList
                                                                    .first
                                                                : null;

                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (FFAppState()
                                                                    .UserDataFlow
                                                                    .userProductSwatchesList
                                                                    .where((e) =>
                                                                        e.viewedItemId ==
                                                                        widget!
                                                                            .product
                                                                            ?.productId)
                                                                    .toList()
                                                                    .length ==
                                                                0) {
                                                              FFAppState()
                                                                  .updateUserDataFlowStruct(
                                                                (e) => e
                                                                  ..count = widget!
                                                                      .product
                                                                      ?.productAttribute
                                                                      ?.length
                                                                  ..userSwatchesProductAttribute = widget!
                                                                      .product!
                                                                      .productAttribute
                                                                      .toList(),
                                                              );
                                                              while (FFAppState()
                                                                      .UserDataFlow
                                                                      .count >
                                                                  0) {
                                                                FFAppState()
                                                                    .updateUserDataFlowStruct(
                                                                  (e) => e
                                                                    ..updateUserSwatchesProductAttribute(
                                                                      (e) => e[
                                                                          FFAppState().UserDataFlow.count -
                                                                              1]
                                                                        ..attributesDefaultTermId =
                                                                            null,
                                                                    ),
                                                                );
                                                                FFAppState()
                                                                    .updateUserDataFlowStruct(
                                                                  (e) => e
                                                                    ..count = FFAppState()
                                                                            .UserDataFlow
                                                                            .count -
                                                                        1,
                                                                );
                                                              }
                                                              FFAppState()
                                                                  .updateUserDataFlowStruct(
                                                                (e) => e
                                                                  ..updateUserProductSwatchesList(
                                                                    (e) => e.add(
                                                                        UserRecentViewedListStruct(
                                                                      createdAt:
                                                                          getCurrentTimestamp,
                                                                      viewedItemId: widget!
                                                                          .product
                                                                          ?.productId,
                                                                      productAttribute: FFAppState()
                                                                          .UserDataFlow
                                                                          .userSwatchesProductAttribute,
                                                                      viewedEntityType:
                                                                          'product',
                                                                    )),
                                                                  ),
                                                              );
                                                            }
                                                            FFAppState()
                                                                .updateUserDataFlowStruct(
                                                              (e) => e
                                                                ..count = FFAppState()
                                                                    .UserDataFlow
                                                                    .userProductSwatchesList
                                                                    .length,
                                                            );
                                                            while (FFAppState()
                                                                    .UserDataFlow
                                                                    .count >
                                                                0) {
                                                              if (FFAppState()
                                                                      .UserDataFlow
                                                                      .userProductSwatchesList
                                                                      .elementAtOrNull(
                                                                          FFAppState().UserDataFlow.count -
                                                                              1)
                                                                      ?.viewedItemId ==
                                                                  widget!
                                                                      .product
                                                                      ?.productId) {
                                                                FFAppState()
                                                                    .updateUserDataFlowStruct(
                                                                  (e) => e
                                                                    ..updateUserProductSwatchesList(
                                                                      (e) => e[
                                                                          FFAppState().UserDataFlow.count -
                                                                              1]
                                                                        ..updateProductAttribute(
                                                                          (e) => e[
                                                                              attributeListIndex]
                                                                            ..attributesDefaultTermId =
                                                                                termListItem,
                                                                        ),
                                                                    ),
                                                                );
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                break;
                                                              }
                                                              FFAppState()
                                                                  .updateUserDataFlowStruct(
                                                                (e) => e
                                                                  ..count = FFAppState()
                                                                          .UserDataFlow
                                                                          .count -
                                                                      1,
                                                              );
                                                            }
                                                            if (widget!
                                                                    .popupType ==
                                                                'icon') {
                                                              return;
                                                            }
                                                            FFAppState()
                                                                .updateUserDataFlowStruct(
                                                              (e) => e
                                                                ..count =
                                                                    currentUserDocument
                                                                        ?.userCart
                                                                        ?.cartItems
                                                                        ?.length
                                                                ..userCartItemList =
                                                                    currentUserDocument!
                                                                        .userCart
                                                                        .cartItems
                                                                        .toList(),
                                                            );
                                                            while (FFAppState()
                                                                    .UserDataFlow
                                                                    .count >
                                                                0) {
                                                              if (FFAppState()
                                                                      .UserDataFlow
                                                                      .userCartItemList
                                                                      .elementAtOrNull(
                                                                          FFAppState().UserDataFlow.count -
                                                                              1)
                                                                      ?.productId ==
                                                                  widget!
                                                                      .product
                                                                      ?.productId) {
                                                                FFAppState()
                                                                    .updateUserDataFlowStruct(
                                                                  (e) => e
                                                                    ..updateUserCartItemList(
                                                                      (e) => e[
                                                                          FFAppState().UserDataFlow.count -
                                                                              1]
                                                                        ..updateCartItemAttribute(
                                                                          (e) => e[
                                                                              attributeListIndex]
                                                                            ..attributesDefaultTermId =
                                                                                termListItem,
                                                                        ),
                                                                    ),
                                                                );
                                                                FFAppState()
                                                                    .update(
                                                                        () {});

                                                                await currentUserReference!
                                                                    .update(
                                                                        createUsersRecordData(
                                                                  userCart:
                                                                      createUserCartStruct(
                                                                    updatedAt:
                                                                        getCurrentTimestamp,
                                                                    subtotal: functions.newCartTotal(FFAppState()
                                                                        .UserDataFlow
                                                                        .userCartItemList
                                                                        .map((e) =>
                                                                            e.totalPrice)
                                                                        .toList()),
                                                                    total: functions.newCartTotal(FFAppState()
                                                                        .UserDataFlow
                                                                        .userCartItemList
                                                                        .map((e) =>
                                                                            e.totalPrice)
                                                                        .toList()),
                                                                    fieldValues: {
                                                                      'cart_items':
                                                                          getUserCartItemsListFirestoreData(
                                                                        FFAppState()
                                                                            .UserDataFlow
                                                                            .userCartItemList,
                                                                      ),
                                                                    },
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                ));
                                                                return;
                                                              }
                                                              FFAppState()
                                                                  .updateUserDataFlowStruct(
                                                                (e) => e
                                                                  ..count = FFAppState()
                                                                          .UserDataFlow
                                                                          .count -
                                                                      1,
                                                              );
                                                            }
                                                          },
                                                          child: Stack(
                                                            children: [
                                                              if ((variationAttributesRecord
                                                                          ?.attributeId ==
                                                                      '1001') &&
                                                                  (stackBrandsRecord
                                                                          ?.brandInfo
                                                                          ?.color !=
                                                                      null))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == widget!.product?.productId).toList().firstOrNull?.productAttribute?.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId ==
                                                                                stackBrandsRecord?.brandId
                                                                            ? FlutterFlowTheme.of(context).primaryText
                                                                            : FlutterFlowTheme.of(context).primaryBackground,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: stackBrandsRecord
                                                                              ?.brandInfo
                                                                              ?.color,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0x27000000),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (!((variationAttributesRecord
                                                                          ?.attributeId ==
                                                                      '1001') &&
                                                                  (stackBrandsRecord
                                                                          ?.brandInfo
                                                                          ?.color !=
                                                                      null)))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == widget!.product?.productId).toList().firstOrNull?.productAttribute?.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId ==
                                                                                stackBrandsRecord?.brandId
                                                                            ? FlutterFlowTheme.of(context).primaryText
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              () {
                                                                            if (stackBrandsRecord?.brandInfoCustomTranslate?.name?.en !=
                                                                                '') {
                                                                              return stackBrandsRecord?.brandInfoCustomTranslate?.name?.en;
                                                                            } else if (stackBrandsRecord?.brandInfoTranslate?.name?.en !=
                                                                                '') {
                                                                              return stackBrandsRecord?.brandInfoTranslate?.name?.en;
                                                                            } else {
                                                                              return stackBrandsRecord?.brandInfo?.name;
                                                                            }
                                                                          }(),
                                                                          arText:
                                                                              () {
                                                                            if (stackBrandsRecord?.brandInfoCustomTranslate?.name?.ar !=
                                                                                '') {
                                                                              return stackBrandsRecord?.brandInfoCustomTranslate?.name?.ar;
                                                                            } else if (stackBrandsRecord?.brandInfoTranslate?.name?.ar !=
                                                                                '') {
                                                                              return stackBrandsRecord?.brandInfoTranslate?.name?.ar;
                                                                            } else {
                                                                              return stackBrandsRecord?.brandInfo?.name;
                                                                            }
                                                                          }(),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'Aileron',
                                                                              color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == widget!.product?.productId).toList().firstOrNull?.productAttribute?.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId == stackBrandsRecord?.brandId ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  })
                                                      .divide(
                                                          SizedBox(width: 4.0))
                                                      .addToStart(
                                                          SizedBox(width: 8.0))
                                                      .addToEnd(
                                                          SizedBox(width: 8.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 1.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child:
                                                          ProductAttributeWidget(
                                                        index:
                                                            attributeListIndex,
                                                        attribute:
                                                            attributeListItem,
                                                        productID: widget!
                                                            .product!.productId,
                                                        navigation: 'cart',
                                                        cartItemIndex:
                                                            widget!.cartIndex,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(
                                              FFIcons.klayer1,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 14.0,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget!.product?.product?.productType != 'ready')
                      Divider(
                        height: 4.0,
                        thickness: 1.0,
                        indent: 16.0,
                        endIndent: 16.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    if (widget!.product?.product?.productType != 'ready')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm7f6lydu' /* Measurement */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Aileron',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.6,
                                            child:
                                                ProductMeasurementPopupWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                ((currentUserDocument?.userBody
                                                                        ?.toList() ??
                                                                    [])
                                                                .length ==
                                                            0) ||
                                                        ((currentUserDocument
                                                                        ?.userBody
                                                                        ?.toList() ??
                                                                    [])
                                                                .where((e) =>
                                                                    e.isDefault ==
                                                                    true)
                                                                .toList()
                                                                .length ==
                                                            0)
                                                    ? FFLocalizations.of(
                                                            context)
                                                        .getVariableText(
                                                        enText: 'Choose here..',
                                                        arText: 'اختر هنا ..',
                                                      )
                                                    : (currentUserDocument
                                                                ?.userBody
                                                                ?.toList() ??
                                                            [])
                                                        .where((e) =>
                                                            e.isDefault == true)
                                                        .toList()
                                                        .firstOrNull!
                                                        .userName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            if ((currentUserDocument?.userBody
                                                            ?.toList() ??
                                                        [])
                                                    .where((e) =>
                                                        e.isDefault == true)
                                                    .toList()
                                                    .length >
                                                0)
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  'H: ${'${(currentUserDocument?.userBody?.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.bodyInfo?.height?.toString()} ${(currentUserDocument?.userBody?.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.bodyInfo?.heightUnit}'} W: ${'${(currentUserDocument?.userBody?.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.bodyInfo?.weight?.toString()} ${(currentUserDocument?.userBody?.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.bodyInfo?.weightUnit}'}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                        Icon(
                                          FFIcons.klayer1,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 14.0,
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    Divider(
                      height: 4.0,
                      thickness: 1.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ],
                ),
              ],
            ),
          ]
              .divide(SizedBox(height: 16.0))
              .addToStart(SizedBox(height: 24.0))
              .addToEnd(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
