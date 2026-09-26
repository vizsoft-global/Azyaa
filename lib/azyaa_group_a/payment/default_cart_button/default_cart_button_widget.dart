import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/payment/product_attribute_cart_level/product_attribute_cart_level_widget.dart';
import '/backend/backend.dart';
import '/backend/catalog/product_options.dart';
import '/backend/catalog/cart_variants.dart';
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
    this.options,
    this.quantity,
    this.onAdded,
  }) : type = type ?? 'button';

  final String type;
  final DocumentReference? product;
  final String? navigation;
  final List<ProductAttributesNewStruct>? defaultTerms;

  /// The product's own attribute list, when the caller has the record to hand.
  ///
  /// The product page does; listing cards do not, and they do not gate this
  /// way -- their tap opens the product page instead.
  final List<ProductAttributesNewStruct>? options;
  final int? quantity;

  /// Called after a line is added, so the page can reset its quantity.
  final VoidCallback? onAdded;

  @override
  State<DefaultCartButtonWidget> createState() =>
      _DefaultCartButtonWidgetState();
}

class _DefaultCartButtonWidgetState extends State<DefaultCartButtonWidget> {
  late DefaultCartButtonModel _model;

  /// True when every option this product offers has a chosen term.
  ///
  /// `options` is the product's own attribute list and `defaultTerms` is the
  /// shopper's selection for it, so the decision needs no network call and no
  /// knowledge of which page is rendering the button.
  ///
  /// A caller that passes no `options` gets the permissive answer: listing
  /// cards hand the tap to the product page rather than disabling a button the
  /// shopper can do nothing about.
  bool get _optionsReady {
    final options = widget.options;
    if (options == null) {
      return true;
    }
    return AzyProductOptions.isCompleteForSelection(
      options: options,
      selection: widget.defaultTerms,
    );
  }

  /// "Add to Bag", noting how many of this exact variant are already in it.
  ///
  /// Only the chosen variant counts: another colour of the same product being
  /// in the bag must not make the shopper think this one cannot be added.
  String _addLabel(BuildContext context) {
    final lines = currentUserDocument!.userCart.cartItems
        .where((e) => e.productRef == widget.product)
        .toList();
    final inBag = lines.isEmpty
        ? 0
        : AzyCartVariants.quantityInBag(
            lines: lines,
            productId: lines.first.productId,
            selection: AzyCartVariants.copyForLine(
              widget.defaultTerms,
              options: widget.options,
            ),
          );
    return inBag > 0
        ? FFLocalizations.of(context).getVariableText(
            enText: 'Add to Bag · $inBag in bag',
            arText: 'أضف إلى الحقيبة · $inBag في الحقيبة',
          )
        : FFLocalizations.of(context).getVariableText(
            enText: 'Add to Bag',
            arText: 'أضف إلى الحقيبة',
          );
  }

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
                        // Disabled until every option has a chosen term.
                        //
                        // This is the shared cart button -- the product page, the
                        // shop cards and every listing all render it -- so the
                        // check lives here rather than at six call sites.
                        onPressed: !_optionsReady
                            ? null
                            : () async {
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
                              FFAppState().updateUserDataFlowStruct(
                                (e) => e
                                  ..userCartItemList = currentUserDocument!
                                      .userCart.cartItems
                                      .toList()
                                  ..count = currentUserDocument
                                      ?.userCart.cartItems.length
                                  ..userCartItemPAFound = 'notfound',
                              );
                                final selectedTerms = AzyCartVariants.copyForLine(
                                  widget.defaultTerms,
                                  options: _model
                                      .normalProductResult?.productAttribute,
                                );
                                var matchedCartItemIndex = -1;
                                for (var i = FFAppState()
                                        .UserDataFlow
                                        .userCartItemList
                                        .length -
                                    1; i >= 0; i--) {
                                  final cartLine = FFAppState()
                                      .UserDataFlow
                                      .userCartItemList
                                      .elementAtOrNull(i);
                                  if (cartLine?.productId !=
                                      _model.normalProductResult?.productId) {
                                    continue;
                                  }
                                  if (!AzyCartVariants.isSameVariant(
                                    line: cartLine!.cartItemAttribute.toList(),
                                    selection: selectedTerms,
                                  )) {
                                    continue;
                                  }
                                  matchedCartItemIndex = i;
                                  break;
                                }
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..userCartItemProductAttribute =
                                        matchedCartItemIndex >= 0
                                            ? FFAppState()
                                                .UserDataFlow
                                                .userCartItemList
                                                .elementAtOrNull(
                                                    matchedCartItemIndex)!
                                                .cartItemAttribute
                                                .toList()
                                            : <ProductAttributesNewStruct>[]
                                    ..userCartItemPAIndex = matchedCartItemIndex
                                    ..userCartItemPAFound =
                                        matchedCartItemIndex >= 0
                                            ? 'found'
                                            : 'notfound',
                                );
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
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'Only ${_model.normalInventoryResult!.stock} in stock',
                                            arText:
                                                'المتوفر ${_model.normalInventoryResult!.stock} فقط',
                                          ),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        duration:
                                            const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                    return;
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
                                                selectedTerms,
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
                                                  selectedTerms,
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
                                        FFAppState()
                                            .UserDataFlow
                                            .userCartItemList
                                            .map((e) => e.totalPrice)
                                            .toList()),
                                    total: functions.newCartTotal(
                                        FFAppState()
                                            .UserDataFlow
                                            .userCartItemList
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

                                if (!context.mounted) {
                                  return;
                                }
                                widget.onAdded?.call();
                                final router = GoRouter.of(context);
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Added to bag',
                                          arText: 'تمت الإضافة إلى الحقيبة',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration:
                                          const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      action: SnackBarAction(
                                        label: FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'View Bag',
                                          arText: 'عرض الحقيبة',
                                        ),
                                        textColor:
                                            FlutterFlowTheme.of(context).info,
                                        onPressed: () => router
                                            .pushNamed(CartWidget.routeName),
                                      ),
                                    ),
                                  );
                            }
                          } else {
                            context.goNamed(LoginWidget.routeName);
                          }

                        },
                        text: !_optionsReady
                            ? FFLocalizations.of(context).getVariableText(
                                enText: 'Select options',
                                arText: 'اختر الخيارات',
                              )
                            : loggedIn
                                ? _addLabel(context)
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
                          // The locked state has to look locked: a disabled
                          // FlutterFlow button keeps its fill colour otherwise.
                          disabledColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          color: FlutterFlowTheme.of(context).primary,
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
                              // A listing card has no room for a chooser, so
                              // while options are unanswered the tap opens the
                              // product page: the shopper picks there and the
                              // bag button unlocks itself.
                              if (!AzyProductOptions.isCompleteFor(
                                  _model.iconProductResult!, FFAppState())) {
                                if (!context.mounted) {
                                  return;
                                }
                                safeSetState(() {});
                                context.pushNamed(
                                  ProductWidget.routeName,
                                  queryParameters: {
                                    'product': serializeParam(
                                      widget.product,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    '__transition_info__':
                                        const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                                return;
                              }
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
