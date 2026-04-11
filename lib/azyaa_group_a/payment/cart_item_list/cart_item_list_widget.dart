import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/payment/cart_item_list_delete_confirm/cart_item_list_delete_confirm_widget.dart';
import '/azyaa_group_a/payment/cart_item_out_of_stock/cart_item_out_of_stock_widget.dart';
import '/azyaa_group_a/payment/product_attribute_cart_level/product_attribute_cart_level_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'cart_item_list_model.dart';
export 'cart_item_list_model.dart';

class CartItemListWidget extends StatefulWidget {
  const CartItemListWidget({
    super.key,
    this.cartItems,
    this.navigationAt,
    this.cartIndex,
    bool? displayFields,
  }) : this.displayFields = displayFields ?? true;

  final UserCartItemsStruct? cartItems;
  final String? navigationAt;
  final int? cartIndex;
  final bool displayFields;

  @override
  State<CartItemListWidget> createState() => _CartItemListWidgetState();
}

class _CartItemListWidgetState extends State<CartItemListWidget> {
  late CartItemListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemListModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<List<ProductsRecord>>(
          stream: queryProductsRecord(
            queryBuilder: (productsRecord) => productsRecord.where(
              'product_id',
              isEqualTo: widget!.cartItems?.productId,
            ),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return BlankLoadingWidget();
            }
            List<ProductsRecord> rowProductsRecordList = snapshot.data!;
            final rowProductsRecord = rowProductsRecordList.isNotEmpty
                ? rowProductsRecordList.first
                : null;

            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            (widget!.cartItems?.productType == 'membership') ||
                                    (widget!.cartItems?.productType ==
                                        'virtualtryon')
                                ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg'
                                : widget!.cartItems!.productInfo.featureImage,
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                            alignment: Alignment(0.0, 1.0),
                          ),
                        ),
                        if (widget!.cartItems?.productType == 'product')
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).purple,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 2.0, 6.0, 2.0),
                                  child: Text(
                                    rowProductsRecord?.product?.productType ==
                                            'ready'
                                        ? FFLocalizations.of(context)
                                            .getVariableText(
                                            enText: 'Ready Made',
                                            arText: 'جاهز',
                                          )
                                        : FFLocalizations.of(context)
                                            .getVariableText(
                                            enText: 'Custom Made',
                                            arText: 'حسب الطلب',
                                          ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: WebViewAware(
                                    child: ProductAttributeCartLevelWidget(
                                      cartIndex: widget!.cartIndex!,
                                      product: rowProductsRecord!,
                                      navigation: 'cart',
                                      popupType: 'default',
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
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
                                            'H:${'${(currentUserDocument?.userBody?.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.bodyInfo?.height?.toString()}'}W:${'${(currentUserDocument?.userBody?.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.bodyInfo?.weight?.toString()}'}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ],
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget!.cartItems!.productInfo.name
                                        .maybeHandleOverflow(
                                      maxChars: 15,
                                      replacement: '…',
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '${widget!.cartItems?.price?.toString()}${FFLocalizations.of(context).getVariableText(
                                      enText: 'KWD',
                                      arText: 'KWD',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    () {
                                      if (widget!.cartItems?.productType ==
                                          'membership') {
                                        return FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Membership plan',
                                          arText: 'خطة العضوية',
                                        );
                                      } else if (widget!
                                              .cartItems?.productType ==
                                          'vto') {
                                        return '${widget!.cartItems?.vtoPoint?.vtoPoint?.toString()}${FFLocalizations.of(context).getVariableText(
                                          enText: ' Credits',
                                          arText: 'الاعتمادات',
                                        )}';
                                      } else {
                                        return '${FFLocalizations.of(context).getVariableText(
                                          enText: 'Quantity : ',
                                          arText: 'كمية :',
                                        )}${widget!.cartItems?.quantity?.toString()}${rowProductsRecord?.product?.productType != null && rowProductsRecord?.product?.productType != '' ? FFLocalizations.of(context).getVariableText(
                                            enText: '(',
                                            arText: '(',
                                          ) : '  '}${rowProductsRecord?.product?.productType != null && rowProductsRecord?.product?.productType != '' ? rowProductsRecord?.product?.productType : ' '}${rowProductsRecord?.product?.productType != null && rowProductsRecord?.product?.productType != '' ? FFLocalizations.of(context).getVariableText(
                                            enText: ')',
                                            arText: ')',
                                          ) : ' '}';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Aileron',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '${widget!.cartItems?.totalPrice?.toString()}${FFLocalizations.of(context).getVariableText(
                                      enText: 'KWD',
                                      arText: 'KWD',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                              Builder(
                                builder: (context) {
                                  final attributeList = widget!
                                          .cartItems?.cartItemAttribute
                                          ?.toList() ??
                                      [];

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: attributeList.length,
                                    itemBuilder: (context, attributeListIndex) {
                                      final attributeListItem =
                                          attributeList[attributeListIndex];
                                      return StreamBuilder<
                                          List<AttributesRecord>>(
                                        stream: queryAttributesRecord(
                                          queryBuilder: (attributesRecord) =>
                                              attributesRecord
                                                  .where(
                                                    'attribute_id',
                                                    isEqualTo: attributeListItem
                                                        .attributesId,
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<AttributesRecord>
                                              rowAttributesRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowAttributesRecord =
                                              rowAttributesRecordList.isNotEmpty
                                                  ? rowAttributesRecordList
                                                      .first
                                                  : null;

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText: () {
                                                    if (rowAttributesRecord
                                                            ?.attributeInfoCustomTranslate
                                                            ?.name
                                                            ?.en !=
                                                        '') {
                                                      return rowAttributesRecord
                                                          ?.attributeInfoCustomTranslate
                                                          ?.name
                                                          ?.en;
                                                    } else if (rowAttributesRecord
                                                            ?.attributeInfoTranslate
                                                            ?.name
                                                            ?.en !=
                                                        '') {
                                                      return rowAttributesRecord
                                                          ?.attributeInfoTranslate
                                                          ?.name
                                                          ?.en;
                                                    } else {
                                                      return rowAttributesRecord
                                                          ?.attributeInfo?.name;
                                                    }
                                                  }(),
                                                  arText: () {
                                                    if (rowAttributesRecord
                                                            ?.attributeInfoCustomTranslate
                                                            ?.name
                                                            ?.ar !=
                                                        '') {
                                                      return rowAttributesRecord
                                                          ?.attributeInfoCustomTranslate
                                                          ?.name
                                                          ?.ar;
                                                    } else if (rowAttributesRecord
                                                            ?.attributeInfoTranslate
                                                            ?.name
                                                            ?.ar !=
                                                        '') {
                                                      return rowAttributesRecord
                                                          ?.attributeInfoTranslate
                                                          ?.name
                                                          ?.ar;
                                                    } else {
                                                      return rowAttributesRecord
                                                          ?.attributeInfo?.name;
                                                    }
                                                  }(),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              StreamBuilder<List<BrandsRecord>>(
                                                stream: queryBrandsRecord(
                                                  queryBuilder:
                                                      (brandsRecord) =>
                                                          brandsRecord
                                                              .where(
                                                                'brand_id',
                                                                isEqualTo:
                                                                    attributeListItem
                                                                        .attributesDefaultTermId,
                                                              )
                                                              .where(
                                                                'status',
                                                                isEqualTo:
                                                                    'active',
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
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            Colors.transparent,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<BrandsRecord>
                                                      attributeDefaultTermBrandsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final attributeDefaultTermBrandsRecord =
                                                      attributeDefaultTermBrandsRecordList
                                                              .isNotEmpty
                                                          ? attributeDefaultTermBrandsRecordList
                                                              .first
                                                          : null;

                                                  return Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: () {
                                                        if (attributeDefaultTermBrandsRecord
                                                                ?.brandInfoCustomTranslate
                                                                ?.name
                                                                ?.en !=
                                                            '') {
                                                          return attributeDefaultTermBrandsRecord
                                                              ?.brandInfoCustomTranslate
                                                              ?.name
                                                              ?.en;
                                                        } else if (attributeDefaultTermBrandsRecord
                                                                ?.brandInfoTranslate
                                                                ?.name
                                                                ?.en !=
                                                            '') {
                                                          return attributeDefaultTermBrandsRecord
                                                              ?.brandInfoTranslate
                                                              ?.name
                                                              ?.en;
                                                        } else {
                                                          return attributeDefaultTermBrandsRecord
                                                              ?.brandInfo?.name;
                                                        }
                                                      }(),
                                                      arText: () {
                                                        if (attributeDefaultTermBrandsRecord
                                                                ?.brandInfoCustomTranslate
                                                                ?.name
                                                                ?.ar !=
                                                            '') {
                                                          return attributeDefaultTermBrandsRecord
                                                              ?.brandInfoCustomTranslate
                                                              ?.name
                                                              ?.ar;
                                                        } else if (attributeDefaultTermBrandsRecord
                                                                ?.brandInfoTranslate
                                                                ?.name
                                                                ?.ar !=
                                                            '') {
                                                          return attributeDefaultTermBrandsRecord
                                                              ?.brandInfoTranslate
                                                              ?.name
                                                              ?.ar;
                                                        } else {
                                                          return attributeDefaultTermBrandsRecord
                                                              ?.brandInfo?.name;
                                                        }
                                                      }(),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((widget!.cartItems?.productType != 'virtualtryon') ||
                          (rowProductsRecord?.product?.productType !=
                              'virtualtryon'))
                        StreamBuilder<List<InventoryRecord>>(
                          stream: queryInventoryRecord(
                            queryBuilder: (inventoryRecord) =>
                                inventoryRecord.where(
                              'inventory_id',
                              isEqualTo:
                                  rowProductsRecord?.product?.inventoryId,
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
                            List<InventoryRecord> stackInventoryRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final stackInventoryRecord =
                                stackInventoryRecordList.isNotEmpty
                                    ? stackInventoryRecordList.first
                                    : null;

                            return Container(
                              height: 35.0,
                              child: Stack(
                                children: [
                                  if (stackInventoryRecord!.stock <= 0)
                                    Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.antiAlias,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          wrapWithModel(
                                            model:
                                                _model.cartItemOutOfStockModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: CartItemOutOfStockWidget(
                                              cartIndex: widget!.cartIndex!,
                                            ),
                                          ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'o00hwsyc' /* Out of stock */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  if ((stackInventoryRecord!.stock > 0) &&
                                      ((rowProductsRecord
                                                  ?.product?.productType ==
                                              'product') ||
                                          (widget!.cartItems?.productType ==
                                              'product')))
                                    Container(
                                      width: 85.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFAFA),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) => Icon(
                                          Icons.remove_rounded,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 18.0,
                                        ),
                                        incrementIconBuilder: (enabled) => Icon(
                                          Icons.add_rounded,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 18.0,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Aileron',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        count: _model.countControllerValue1 ??=
                                            widget!.cartItems!.quantity,
                                        updateCount: (count) async {
                                          safeSetState(() => _model
                                              .countControllerValue1 = count);
                                          if ((stackInventoryRecord!.stock >
                                                  0) &&
                                              ((rowProductsRecord?.product
                                                          ?.productType ==
                                                      'product') ||
                                                  (widget!.cartItems
                                                          ?.productType ==
                                                      'product'))) {
                                            if (_model.countControllerValue1! >
                                                stackInventoryRecord!.stock) {
                                              safeSetState(() {
                                                _model.countControllerValue1 =
                                                    stackInventoryRecord!.stock;
                                              });
                                            }
                                            FFAppState()
                                                .updateUserDataFlowStruct(
                                              (e) => e
                                                ..userCartCount =
                                                    currentUserDocument
                                                        ?.userCart
                                                        ?.cartItems
                                                        ?.length
                                                ..userCartItemList =
                                                    currentUserDocument!
                                                        .userCart.cartItems
                                                        .toList(),
                                            );
                                            FFAppState()
                                                .updateUserDataFlowStruct(
                                              (e) => e
                                                ..updateUserCartItemList(
                                                  (e) => e[widget!.cartIndex!]
                                                    ..productInfo =
                                                        rowProductsRecord
                                                            ?.productInfo
                                                    ..quantity = _model
                                                        .countControllerValue1
                                                    ..price = rowProductsRecord
                                                        ?.product?.productPrice
                                                    ..totalPrice = (_model
                                                            .countControllerValue1!) *
                                                        rowProductsRecord!
                                                            .product
                                                            .productPrice
                                                    ..updateProductInventoryInfo(
                                                      (e) => e
                                                        ..stock =
                                                            stackInventoryRecord
                                                                ?.stock
                                                        ..stockOnHand =
                                                            stackInventoryRecord
                                                                ?.stockOnHand
                                                        ..stockReserved =
                                                            stackInventoryRecord
                                                                ?.stockReserved
                                                        ..stockUnavailable =
                                                            stackInventoryRecord
                                                                ?.stockUnavailable,
                                                    ),
                                                ),
                                            );

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              userCart: createUserCartStruct(
                                                updatedAt: getCurrentTimestamp,
                                                subtotal: functions
                                                    .newCartTotal(FFAppState()
                                                        .UserDataFlow
                                                        .userCartItemList
                                                        .map(
                                                            (e) => e.totalPrice)
                                                        .toList()),
                                                total: functions.newCartTotal(
                                                    FFAppState()
                                                        .UserDataFlow
                                                        .userCartItemList
                                                        .map(
                                                            (e) => e.totalPrice)
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
                                            _model.refresh =
                                                (_model.refresh!) + 1;
                                            _model.updatePage(() {});
                                          }
                                        },
                                        stepSize: 1,
                                        minimum: 1,
                                        maximum: stackInventoryRecord!.stock,
                                        contentPadding: EdgeInsets.all(4.0),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      if ((((widget!.cartItems?.productType != 'membership') &&
                                  (widget!.navigationAt != 'checkout') &&
                                  (widget!.cartItems?.productType != 'vto')) ||
                              (widget!.cartItems?.productType == 'product')) &&
                          responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                        StreamBuilder<List<InventoryRecord>>(
                          stream: queryInventoryRecord(
                            queryBuilder: (inventoryRecord) =>
                                inventoryRecord.where(
                              'inventory_id',
                              isEqualTo:
                                  rowProductsRecord?.product?.inventoryId,
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
                            List<InventoryRecord> stackInventoryRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final stackInventoryRecord =
                                stackInventoryRecordList.isNotEmpty
                                    ? stackInventoryRecordList.first
                                    : null;

                            return Container(
                              height: 35.0,
                              child: Stack(
                                children: [
                                  if (stackInventoryRecord!.stock <= 0)
                                    Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.antiAlias,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          wrapWithModel(
                                            model:
                                                _model.cartItemOutOfStockModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: CartItemOutOfStockWidget(
                                              cartIndex: widget!.cartIndex!,
                                            ),
                                          ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'g7ppysrc' /* Out of stock */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  if ((widget!.cartItems?.productType !=
                                          'virtualtryon') ||
                                      (stackInventoryRecord!.stock > 0) ||
                                      (rowProductsRecord
                                              ?.product?.productType !=
                                          'virtualtryon'))
                                    Container(
                                      width: 85.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFAFA),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: FlutterFlowCountController(
                                        decrementIconBuilder: (enabled) => Icon(
                                          Icons.remove_rounded,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 18.0,
                                        ),
                                        incrementIconBuilder: (enabled) => Icon(
                                          Icons.add_rounded,
                                          color: enabled
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          size: 18.0,
                                        ),
                                        countBuilder: (count) => Text(
                                          count.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Aileron',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        count: _model.countControllerValue2 ??=
                                            widget!.cartItems!.quantity,
                                        updateCount: (count) async {
                                          safeSetState(() => _model
                                              .countControllerValue2 = count);
                                          if (_model.countControllerValue2! >
                                              stackInventoryRecord!.stock) {
                                            safeSetState(() {
                                              _model.countControllerValue2 =
                                                  stackInventoryRecord!.stock;
                                            });
                                          }
                                          FFAppState().updateUserDataFlowStruct(
                                            (e) => e
                                              ..userCartCount =
                                                  currentUserDocument?.userCart
                                                      ?.cartItems?.length
                                              ..userCartItemList =
                                                  currentUserDocument!
                                                      .userCart.cartItems
                                                      .toList(),
                                          );
                                          FFAppState().updateUserDataFlowStruct(
                                            (e) => e
                                              ..updateUserCartItemList(
                                                (e) => e[widget!.cartIndex!]
                                                  ..productInfo =
                                                      rowProductsRecord
                                                          ?.productInfo
                                                  ..quantity = _model
                                                      .countControllerValue2
                                                  ..price = rowProductsRecord
                                                      ?.product?.productPrice
                                                  ..totalPrice = (_model
                                                          .countControllerValue2!) *
                                                      rowProductsRecord!
                                                          .product.productPrice
                                                  ..updateProductInventoryInfo(
                                                    (e) => e
                                                      ..stock =
                                                          stackInventoryRecord
                                                              ?.stock
                                                      ..stockOnHand =
                                                          stackInventoryRecord
                                                              ?.stockOnHand
                                                      ..stockReserved =
                                                          stackInventoryRecord
                                                              ?.stockReserved
                                                      ..stockUnavailable =
                                                          stackInventoryRecord
                                                              ?.stockUnavailable,
                                                  ),
                                              ),
                                          );

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            userCart: createUserCartStruct(
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
                                          _model.refresh =
                                              (_model.refresh!) + 1;
                                          _model.updatePage(() {});
                                        },
                                        stepSize: 1,
                                        minimum: 1,
                                        maximum: stackInventoryRecord!.stock,
                                        contentPadding: EdgeInsets.all(4.0),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
                if (widget!.navigationAt != 'checkout')
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          FFIcons.kdelete,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          await showDialog(
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
                                    child: CartItemListDeleteConfirmWidget(
                                      cartItem: widget!.cartItems!,
                                      index: widget!.cartIndex!,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
              ].divide(SizedBox(width: 8.0)),
            );
          },
        ),
        if (widget!.cartItems?.productStockInfo?.isProductReturn == false)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'dluq1saw' /* * Returns Not Applicable for T... */,
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Aileron',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
      ],
    );
  }
}
