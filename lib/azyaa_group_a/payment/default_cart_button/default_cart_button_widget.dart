import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/payment/chosseoption_popup/chosseoption_popup_widget.dart';
import '/azyaa_group_a/payment/product_attribute_cart_level/product_attribute_cart_level_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'default_cart_button_model.dart';
export 'default_cart_button_model.dart';

class DefaultCartButtonWidget extends StatefulWidget {
  const DefaultCartButtonWidget({
    super.key,
    String? type,
    required this.product,
    required this.navigation,
    this.defaultTerms,
    this.quantity,
  }) : type = type ?? 'button';

  final String type;
  final DocumentReference? product;
  final String? navigation;
  final List<ProductAttributesNewStruct>? defaultTerms;
  final int? quantity;

  @override
  State<DefaultCartButtonWidget> createState() =>
      _DefaultCartButtonWidgetState();
}

class _DefaultCartButtonWidgetState extends State<DefaultCartButtonWidget> {
  late DefaultCartButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefaultCartButtonModel());

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

    return StreamBuilder<List<SettingsRecord>>(
      stream: querySettingsRecord(
        queryBuilder: (settingsRecord) => settingsRecord
            .where(
              'type',
              isEqualTo: 'Company',
            )
            .where(
              'settings_secret_feature.settings_catllog_feature',
              isEqualTo: false,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
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
        List<SettingsRecord> stackSettingsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final stackSettingsRecord = stackSettingsRecordList.isNotEmpty
            ? stackSettingsRecordList.first
            : null;

        return Stack(
          children: [
            Stack(
              children: [
                if (widget.type == 'button')
                  Builder(
                    builder: (context) => AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          if (loggedIn) {
                            _model.normalProductResult =
                                await ProductsRecord.getDocumentOnce(
                                    widget.product!);
                            _shouldSetState = true;
                            _model.normalInventoryResult =
                                await InventoryRecord.getDocumentOnce(_model
                                    .normalProductResult!
                                    .product
                                    .inventoryRef!);
                            _shouldSetState = true;
                            if (_model.normalInventoryResult!.stock > 0) {
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
                                          _model.normalProductResult?.productId)
                                      .toList()
                                      .length >
                                  0) {
                                if (FFAppState()
                                        .UserDataFlow
                                        .userProductSwatchesList
                                        .where((e) =>
                                            e.viewedItemId ==
                                            _model
                                                .normalProductResult?.productId)
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
                                              _model.normalProductResult
                                                  ?.productId)
                                          .toList()
                                          .firstOrNull
                                          ?.productAttribute
                                          .length
                                      ..userSwatchesProductAttribute =
                                          FFAppState()
                                              .UserDataFlow
                                              .userProductSwatchesList
                                              .where((e) =>
                                                  e.viewedItemId ==
                                                  _model.normalProductResult
                                                      ?.productId)
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
                                        '') {
                                      await showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: Container(
                                                width: 500.0,
                                                child: ChosseoptionPopupWidget(
                                                  title: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'eaw4t280' /* Select */,
                                                  ),
                                                  description:
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                    '9654rw8w' /* Please choose product options ... */,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

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
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: Container(
                                            width: 500.0,
                                            child: ChosseoptionPopupWidget(
                                              title: FFLocalizations.of(context)
                                                  .getText(
                                                'wn642lb5' /* Select */,
                                              ),
                                              description:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'wib82ouz' /* Please choose product options ... */,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  return;
                                }

                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..userCartItemList = currentUserDocument!
                                        .userCart.cartItems
                                        .toList()
                                    ..userSwatchesProductAttribute =
                                        widget.defaultTerms!.toList()
                                    ..count = currentUserDocument
                                        ?.userCart.cartItems.length
                                    ..userCartItemPAFound = 'notfound',
                                );
                                while (FFAppState().UserDataFlow.count > 0) {
                                  if (FFAppState()
                                          .UserDataFlow
                                          .userCartItemList
                                          .elementAtOrNull(
                                              FFAppState().UserDataFlow.count -
                                                  1)
                                          ?.productId ==
                                      _model.normalProductResult?.productId) {
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
                                            .elementAtOrNull(FFAppState()
                                                    .UserDataFlow
                                                    .count -
                                                1)
                                            ?.cartItemAttribute
                                            .length,
                                    );
                                    while (
                                        FFAppState().UserDataFlow.count > 0) {
                                      if ((FFAppState()
                                                  .UserDataFlow
                                                  .userCartItemProductAttribute
                                                  .elementAtOrNull(FFAppState()
                                                          .UserDataFlow
                                                          .count -
                                                      1)
                                                  ?.attributesDefaultTermId ==
                                              (widget.defaultTerms
                                                      ?.elementAtOrNull(
                                                          FFAppState()
                                                                  .UserDataFlow
                                                                  .count -
                                                              1))
                                                  ?.attributesDefaultTermId) ||
                                          (FFAppState()
                                                  .UserDataFlow
                                                  .userCartItemProductAttribute
                                                  .elementAtOrNull(FFAppState()
                                                          .UserDataFlow
                                                          .count -
                                                      1)
                                                  ?.attributesDefaultTermId ==
                                              (widget.defaultTerms
                                                      ?.elementAtOrNull(
                                                          FFAppState()
                                                                  .UserDataFlow
                                                                  .count -
                                                              1))
                                                  ?.attributesBrandTermIds
                                                  .firstOrNull)) {
                                        FFAppState().updateUserDataFlowStruct(
                                          (e) =>
                                              e..userCartItemPAFound = 'found',
                                        );
                                      } else {
                                        FFAppState().updateUserDataFlowStruct(
                                          (e) => e
                                            ..userCartItemPAFound = 'notfound',
                                        );
                                      }

                                      FFAppState().updateUserDataFlowStruct(
                                        (e) => e
                                          ..count =
                                              FFAppState().UserDataFlow.count -
                                                  1,
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
                                          (widget.quantity!))) {
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
                                                (widget.quantity!),
                                        ),
                                    );
                                    if ((currentUserDocument?.userBody
                                                    .toList() ??
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
                                              ..price = _model
                                                      .normalProductResult!
                                                      .product
                                                      .productPrice *
                                                  FFAppState()
                                                      .UserDataFlow
                                                      .userCartItemList
                                                      .elementAtOrNull(FFAppState()
                                                          .UserDataFlow
                                                          .userCartItemPAIndex)!
                                                      .quantity
                                              ..totalPrice = _model
                                                      .normalProductResult!
                                                      .product
                                                      .productPrice *
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
                                                  .productType
                                              ..productUserBodyInfo =
                                                  (currentUserDocument?.userBody
                                                              .toList() ??
                                                          [])
                                                      .where((e) =>
                                                          e.isDefault == true)
                                                      .toList()
                                                      .firstOrNull,
                                          ),
                                      );
                                    } else {
                                      if (_model.normalProductResult?.product
                                              .productType ==
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
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        FFAppState().updateUserDataFlowStruct(
                                          (e) => e
                                            ..updateUserCartItemList(
                                              (e) => e[FFAppState()
                                                  .UserDataFlow
                                                  .userCartItemPAIndex]
                                                ..price = _model
                                                        .normalProductResult!
                                                        .product
                                                        .productPrice *
                                                    FFAppState()
                                                        .UserDataFlow
                                                        .userCartItemList
                                                        .elementAtOrNull(
                                                            FFAppState()
                                                                .UserDataFlow
                                                                .userCartItemPAIndex)!
                                                        .quantity
                                                ..totalPrice = _model
                                                        .normalProductResult!
                                                        .product
                                                        .productPrice *
                                                    FFAppState()
                                                        .UserDataFlow
                                                        .userCartItemList
                                                        .elementAtOrNull(
                                                            FFAppState()
                                                                .UserDataFlow
                                                                .userCartItemPAIndex)!
                                                        .quantity
                                                ..productMainType = _model
                                                    .normalProductResult
                                                    ?.product
                                                    .productType,
                                            ),
                                        );
                                      }
                                    }
                                  }
                                } else {
                                  if ((currentUserDocument?.userBody
                                                  .toList() ??
                                              [])
                                          .where((e) => e.isDefault == true)
                                          .toList()
                                          .length >
                                      0) {
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..updateUserCartItemList(
                                          (e) => e.add(UserCartItemsStruct(
                                            cartItemId: _model
                                                .idMapResultNew?.cartItemId,
                                            productType: 'product',
                                            cartItemAttribute:
                                                widget.defaultTerms,
                                            productId: _model
                                                .normalProductResult?.productId,
                                            productInfo: _model
                                                .normalProductResult
                                                ?.productInfo,
                                            quantity: widget.quantity,
                                            price: _model.normalProductResult!
                                                    .product.productPrice *
                                                (widget.quantity!),
                                            totalPrice: _model
                                                    .normalProductResult!
                                                    .product
                                                    .productPrice *
                                                (widget.quantity!),
                                            productDesignerRef: _model
                                                .normalProductResult
                                                ?.productAuthorizer
                                                .productDesignerRef,
                                            productDesignerId: _model
                                                .normalProductResult
                                                ?.productAuthorizer
                                                .productDesignerId,
                                            productRef: _model
                                                .normalProductResult?.reference,
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
                                                .productType,
                                            productUserBodyInfo:
                                                (currentUserDocument?.userBody
                                                            .toList() ??
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
                                            .productType ==
                                        'custom') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: const Text(
                                                  'Kindly choose your measurement.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      return;
                                    } else {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) => e
                                          ..updateUserCartItemList(
                                            (e) => e.add(UserCartItemsStruct(
                                              cartItemId: _model
                                                  .idMapResultNew?.cartItemId,
                                              productType: 'product',
                                              cartItemAttribute:
                                                  widget.defaultTerms,
                                              productId: _model
                                                  .normalProductResult
                                                  ?.productId,
                                              productInfo: _model
                                                  .normalProductResult
                                                  ?.productInfo,
                                              quantity: widget.quantity,
                                              price: _model.normalProductResult!
                                                      .product.productPrice *
                                                  (widget.quantity!),
                                              totalPrice: _model
                                                      .normalProductResult!
                                                      .product
                                                      .productPrice *
                                                  (widget.quantity!),
                                              productDesignerRef: _model
                                                  .normalProductResult
                                                  ?.productAuthorizer
                                                  .productDesignerRef,
                                              productDesignerId: _model
                                                  .normalProductResult
                                                  ?.productAuthorizer
                                                  .productDesignerId,
                                              productRef: _model
                                                  .normalProductResult
                                                  ?.reference,
                                              productStockInfo: _model
                                                  .normalProductResult?.product,
                                              productMainType: _model
                                                  .normalProductResult
                                                  ?.product
                                                  .productType,
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
                                          'cart_item_id':
                                              FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                  }(),
                                );

                                context.pushNamed(CartWidget.routeName);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: const AlignmentDirectional(0.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: ProductAttributeCartLevelWidget(
                                          cartIndex: currentUserDocument!
                                                  .userCart.cartItems.length -
                                              1,
                                          product: _model.normalProductResult!,
                                          navigation: 'cart',
                                          popupType: 'icon',
                                        ),
                                      ),
                                    );
                                  },
                                );

                                unawaited(
                                  () async {}(),
                                );
                              }
                            }
                          } else {
                            context.goNamed(LoginWidget.routeName);
                          }

                        },
                        text: loggedIn
                            ? (currentUserDocument!.userCart.cartItems
                                        .where((e) =>
                                            (e.productRef == widget.product) &&
                                            (e.productType == 'product'))
                                        .toList()
                                        .length >
                                    0
                                ? FFLocalizations.of(context).getVariableText(
                                    enText: 'Go to Bag',
                                    arText: 'اذهب إلى الحقيبة',
                                  )
                                : FFLocalizations.of(context).getVariableText(
                                    enText: 'Add to Bag',
                                    arText: 'أضف إلى الحقيبة',
                                  ))
                            : FFLocalizations.of(context).getVariableText(
                                enText: 'Login',
                                arText: 'تسجيل الدخول',
                              ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconAlignment: IconAlignment.end,
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: loggedIn
                              ? (currentUserDocument!.userCart.cartItems
                                          .where((e) =>
                                              (e.productRef ==
                                                  widget.product) &&
                                              (e.productType == 'product'))
                                          .toList()
                                          .length >
                                      0
                                  ? FlutterFlowTheme.of(context).velvet
                                  : FlutterFlowTheme.of(context).primary)
                              : FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                if (widget.type == 'icon')
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderRadius: 100.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.add_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          if (loggedIn) {
                            _model.iconProductResult =
                                await ProductsRecord.getDocumentOnce(
                                    widget.product!);
                            _model.iconInventoryResult =
                                await InventoryRecord.getDocumentOnce(_model
                                    .iconProductResult!.product.inventoryRef!);
                            if (_model.iconInventoryResult!.stock > 0) {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(0.0, 1.0)
                                        .resolve(Directionality.of(context)),
                                    child: WebViewAware(
                                      child: ProductAttributeCartLevelWidget(
                                        cartIndex: currentUserDocument!
                                                .userCart.cartItems.length -
                                            1,
                                        product: _model.iconProductResult!,
                                        navigation: 'cart',
                                        popupType: 'icon',
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          } else {
                            context.goNamed(
                              LoginWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
              ],
            ),
            if ((stackSettingsRecord?.settingsInappPurchaseStatus == true) &&
                (isiOS == true))
              FFButtonWidget(
                onPressed: () async {
                  var _shouldSetState = false;
                  final isEntitled =
                      await revenue_cat.isEntitled('Mini package') ?? false;
                  if (!isEntitled) {
                    await revenue_cat.loadOfferings();
                  }

                  if (isEntitled) {
                    context.pushNamed(
                      ProductWidget.routeName,
                      queryParameters: {
                        'product': serializeParam(
                          widget.product,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  } else {
                    _model.didPurchasedTab1 = await revenue_cat.purchasePackage(
                        revenue_cat.offerings!.current!.weekly!.identifier);
                    _shouldSetState = true;
                    if (_model.didPurchasedTab1!) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            FFLocalizations.of(context).getVariableText(
                              enText: 'Please wait while we process..',
                              arText: 'يرجى الانتظار بينما نقوم بالمعالجة..',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            FFLocalizations.of(context).getVariableText(
                              enText: 'Just a moment...',
                              arText: 'لحظة واحدة...',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                      _model.idMapResultInapp = await queryIdMapRecordOnce(
                        queryBuilder: (idMapRecord) => idMapRecord.where(
                          'type',
                          isEqualTo: 'Main',
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _shouldSetState = true;
                      _model.normalProductInappResult =
                          await ProductsRecord.getDocumentOnce(
                              widget.product!);
                      _shouldSetState = true;
                      _model.addToInappCartItems(UserCartItemsStruct(
                        cartItemId: _model.idMapResultInapp?.cartItemId,
                        cartItemAttribute:
                            _model.normalProductInappResult?.productAttribute,
                        productId: _model.normalProductInappResult?.productId,
                        productType: 'product',
                        productInfo:
                            _model.normalProductInappResult?.productInfo,
                        quantity: 1,
                        price: _model
                            .normalProductInappResult?.product.productPrice,
                        totalPrice: _model
                            .normalProductInappResult?.product.productPrice,
                        productDesignerRef: _model.normalProductInappResult
                            ?.productAuthorizer.productDesignerRef,
                        productRef: widget.product,
                        productDesignerId: _model.normalProductInappResult
                            ?.productAuthorizer.productDesignerId,
                      ));
                      safeSetState(() {});

                      var ordersRecordReference = OrdersRecord.collection.doc();
                      await ordersRecordReference.set(createOrdersRecordData(
                        orderStatus: 'CAPTURED',
                        createdAt: getCurrentTimestamp,
                        orderId:
                            'ORDAZYA_INAPP${random_data.randomInteger(1000, 9999).toString()}',
                        customerRef: currentUserReference,
                        totalPrice: _model
                            .normalProductInappResult?.product.productPrice,
                        orderItems: updateUserCartStruct(
                          UserCartStruct(
                            cartId: _model.idMapResultInapp?.cartId,
                            createdAt: getCurrentTimestamp,
                            updatedAt: getCurrentTimestamp,
                            subtotal: _model.normalProductInappResult?.product
                                .productPrice,
                            total: _model.normalProductInappResult?.product
                                .productPrice,
                            cartItems: _model.inappCartItems,
                          ),
                          clearUnsetFields: false,
                          create: true,
                        ),
                        customerId: currentUserUid,
                      ));
                      _model.orderUpaymentInapp =
                          OrdersRecord.getDocumentFromData(
                              createOrdersRecordData(
                                orderStatus: 'CAPTURED',
                                createdAt: getCurrentTimestamp,
                                orderId:
                                    'ORDAZYA_INAPP${random_data.randomInteger(1000, 9999).toString()}',
                                customerRef: currentUserReference,
                                totalPrice: _model.normalProductInappResult
                                    ?.product.productPrice,
                                orderItems: updateUserCartStruct(
                                  UserCartStruct(
                                    cartId: _model.idMapResultInapp?.cartId,
                                    createdAt: getCurrentTimestamp,
                                    updatedAt: getCurrentTimestamp,
                                    subtotal: _model.normalProductInappResult
                                        ?.product.productPrice,
                                    total: _model.normalProductInappResult
                                        ?.product.productPrice,
                                    cartItems: _model.inappCartItems,
                                  ),
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                                customerId: currentUserUid,
                              ),
                              ordersRecordReference);
                      _shouldSetState = true;
                      if (currentUserDocument!.userCart.cartItems
                              .where((e) => e.productType == 'product')
                              .toList()
                              .length >
                          0) {
                        await _model.orderUpaymentInapp!.reference
                            .update(createOrdersRecordData(
                          shippingAddress: updateUserShippingaddressInfoStruct(
                            (currentUserDocument?.userShippingaddress
                                        .toList() ??
                                    [])
                                .where((e) => e.isDefault == true)
                                .toList()
                                .firstOrNull
                                ?.shippingAddressInfo,
                            clearUnsetFields: false,
                          ),
                          shippingInfo: updateUserShippingaddressStruct(
                            (currentUserDocument?.userShippingaddress
                                        .toList() ??
                                    [])
                                .where((e) => e.isDefault == true)
                                .toList()
                                .firstOrNull,
                            clearUnsetFields: false,
                          ),
                        ));
                      }

                      await _model.idMapResultInapp!.reference.update({
                        ...mapToFirestore(
                          {
                            'order_id': FieldValue.increment(1),
                            'cart_item_id': FieldValue.increment(1),
                            'cart_id': FieldValue.increment(1),
                          },
                        ),
                      });

                      await _model.orderUpaymentInapp!.reference
                          .update(createOrdersRecordData(
                        paymentStatus: 'CAPTURED',
                        paymentId: _model.orderUpaymentInapp?.orderId,
                        paymentMethod: 'InApp',
                        paymentType: 'InApp',
                        updatedAt: getCurrentTimestamp,
                      ));
                      if (_model.inappCartItems.firstOrNull?.productType !=
                          'membership') {
                        if (_model.inappCartItems.firstOrNull?.productType ==
                            'product') {
                          _model.myfatoorahCartProductResult =
                              await queryProductsRecordOnce(
                            queryBuilder: (productsRecord) =>
                                productsRecord.where(
                              'product_id',
                              isEqualTo:
                                  _model.normalProductInappResult?.productId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _shouldSetState = true;

                          await _model.normalProductInappResult!.reference
                              .update(createProductsRecordData(
                            updatedAt: getCurrentTimestamp,
                            productMarketing: createMarketingStruct(
                              fieldValues: {
                                'product_sales_history': FieldValue.arrayUnion([
                                  getProductSalesHistoryFirestoreData(
                                    createProductSalesHistoryStruct(
                                      createdAt: getCurrentTimestamp,
                                      orderId:
                                          _model.orderUpaymentInapp?.orderId,
                                      quantity: 1,
                                      salesUserInfo: createSalesUserInfoStruct(
                                        customerId: currentUserDocument
                                            ?.userInfo.userId,
                                        customerRef: currentUserReference,
                                        customerName: currentUserDisplayName,
                                        email: currentUserEmail,
                                        phoneNumber: currentUserDocument
                                            ?.userInfo.phoneNumber,
                                        clearUnsetFields: false,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                              clearUnsetFields: false,
                            ),
                          ));
                        }
                      }

                      context.goNamed(
                        SuccessWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );

                      return;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            FFLocalizations.of(context).getVariableText(
                              enText: 'Purchase Failed',
                              arText: 'فشل الشراء',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }
                  }

                },
                text: FFLocalizations.of(context).getText(
                  'wj0v0g4o' /* Purchase  */,
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'almarai',
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
          ],
        );
      },
    );
  }
}
