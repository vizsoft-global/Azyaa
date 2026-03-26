import '/azyaa_group_a/customer/order/track_order/track_order_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'orders_single_comp_model.dart';
export 'orders_single_comp_model.dart';

class OrdersSingleCompWidget extends StatefulWidget {
  const OrdersSingleCompWidget({
    super.key,
    required this.orderCart,
    required this.order,
  });

  final UserCartStruct? orderCart;
  final OrdersRecord? order;

  @override
  State<OrdersSingleCompWidget> createState() => _OrdersSingleCompWidgetState();
}

class _OrdersSingleCompWidgetState extends State<OrdersSingleCompWidget> {
  late OrdersSingleCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersSingleCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) {
                final activeOrderItems =
                    widget!.orderCart?.cartItems?.toList() ?? [];

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    8.0,
                    0,
                    8.0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: activeOrderItems.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.0),
                  itemBuilder: (context, activeOrderItemsIndex) {
                    final activeOrderItemsItem =
                        activeOrderItems[activeOrderItemsIndex];
                    return Stack(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    activeOrderItemsItem.productType ==
                                            'membership'
                                        ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/kwcb1kmteqoh/Frame_2087324774.png'
                                        : activeOrderItemsItem
                                            .productInfo.featureImage,
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    fit: BoxFit.cover,
                                    alignment: Alignment(0.0, -1.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      StreamBuilder<List<ProductsRecord>>(
                                        stream: queryProductsRecord(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord.where(
                                            'product_id',
                                            isEqualTo:
                                                activeOrderItemsItem.productId,
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
                                          List<ProductsRecord>
                                              containerProductsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final containerProductsRecord =
                                              containerProductsRecordList
                                                      .isNotEmpty
                                                  ? containerProductsRecordList
                                                      .first
                                                  : null;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText: () {
                                                  if (containerProductsRecord
                                                          ?.productInfoCustomTranslate
                                                          ?.name
                                                          ?.en !=
                                                      '') {
                                                    return containerProductsRecord
                                                        ?.productInfoCustomTranslate
                                                        ?.name
                                                        ?.en;
                                                  } else if (containerProductsRecord
                                                          ?.productInfoTranslate
                                                          ?.name
                                                          ?.en !=
                                                      '') {
                                                    return containerProductsRecord
                                                        ?.productInfoTranslate
                                                        ?.name
                                                        ?.en;
                                                  } else {
                                                    return containerProductsRecord
                                                        ?.productInfo?.name;
                                                  }
                                                }(),
                                                arText: () {
                                                  if (containerProductsRecord
                                                          ?.productInfoCustomTranslate
                                                          ?.name
                                                          ?.ar !=
                                                      '') {
                                                    return containerProductsRecord
                                                        ?.productInfoCustomTranslate
                                                        ?.name
                                                        ?.ar;
                                                  } else if (containerProductsRecord
                                                          ?.productInfoTranslate
                                                          ?.name
                                                          ?.ar !=
                                                      '') {
                                                    return containerProductsRecord
                                                        ?.productInfoTranslate
                                                        ?.name
                                                        ?.ar;
                                                  } else {
                                                    return containerProductsRecord
                                                        ?.productInfo?.name;
                                                  }
                                                }(),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          );
                                        },
                                      ),
                                    Text(
                                      activeOrderItemsItem.productInfo.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          activeOrderItemsItem.productType ==
                                                  'membership'
                                              ? FFLocalizations.of(context)
                                                  .getVariableText(
                                                  enText: 'Membership plan',
                                                  arText: 'خطة العضوية',
                                                )
                                              : '${FFLocalizations.of(context).getVariableText(
                                                  enText: 'Quantity : ',
                                                  arText: 'كمية :',
                                                )}${activeOrderItemsItem.quantity.toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 0.0, 0.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: activeOrderItemsItem
                                                          .price
                                                          .toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'v46mmwl4' /*  KD */,
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'j8bzkzfo' /*  x */,
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: activeOrderItemsItem
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                      ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Builder(
                                      builder: (context) {
                                        final attributeList =
                                            activeOrderItemsItem
                                                .cartItemAttribute
                                                .toList();

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: attributeList.length,
                                          itemBuilder:
                                              (context, attributeListIndex) {
                                            final attributeListItem =
                                                attributeList[
                                                    attributeListIndex];
                                            return StreamBuilder<
                                                List<AttributesRecord>>(
                                              stream: queryAttributesRecord(
                                                queryBuilder:
                                                    (attributesRecord) =>
                                                        attributesRecord
                                                            .where(
                                                              'attribute_id',
                                                              isEqualTo:
                                                                  attributeListItem
                                                                      .attributesId,
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
                                                List<AttributesRecord>
                                                    rowAttributesRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final rowAttributesRecord =
                                                    rowAttributesRecordList
                                                            .isNotEmpty
                                                        ? rowAttributesRecordList
                                                            .first
                                                        : null;

                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${rowAttributesRecord?.attributeInfo?.name}${FFLocalizations.of(context).getVariableText(
                                                        enText: ':',
                                                        arText: ':',
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    StreamBuilder<
                                                        List<BrandsRecord>>(
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
                                                            attributeDefaultTermBrandsRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final attributeDefaultTermBrandsRecord =
                                                            attributeDefaultTermBrandsRecordList
                                                                    .isNotEmpty
                                                                ? attributeDefaultTermBrandsRecordList
                                                                    .first
                                                                : null;

                                                        return Text(
                                                          attributeDefaultTermBrandsRecord!
                                                              .brandInfo.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                    if (activeOrderItemsItem.productMainType ==
                                        'custom')
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'Height: ${activeOrderItemsItem.productUserBodyInfo.bodyInfo.height.toString()}${activeOrderItemsItem.productUserBodyInfo.bodyInfo.heightUnit}, Chest: ${activeOrderItemsItem.productUserBodyInfo.bodyInfo.chest.toString()}${activeOrderItemsItem.productUserBodyInfo.bodyInfo.chestUnit}, Waist: ${activeOrderItemsItem.productUserBodyInfo.bodyInfo.waist.toString()}${activeOrderItemsItem.productUserBodyInfo.bodyInfo.waistUnit}, Hips: ${activeOrderItemsItem.productUserBodyInfo.bodyInfo.hips.toString()}${activeOrderItemsItem.productUserBodyInfo.bodyInfo.hipsUnit}, Inseam: ${activeOrderItemsItem.productUserBodyInfo.bodyInfo.inseam.toString()}${activeOrderItemsItem.productUserBodyInfo.bodyInfo.inseamUnit}, Shoulder width: ${activeOrderItemsItem.productUserBodyInfo.bodyInfo.shoulderWidth.toString()}${activeOrderItemsItem.productUserBodyInfo.bodyInfo.shoulderWidthUnit}, Arm length: ${activeOrderItemsItem.productUserBodyInfo.bodyInfo.armLength.toString()}${activeOrderItemsItem.productUserBodyInfo.bodyInfo.armLengthUnit}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    Expanded(
                                      child:
                                          StreamBuilder<List<ProductsRecord>>(
                                        stream: queryProductsRecord(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord
                                                  .where(
                                                    'status',
                                                    isEqualTo: 'active',
                                                  )
                                                  .where(
                                                    'product_id',
                                                    isEqualTo:
                                                        activeOrderItemsItem
                                                            .productId,
                                                  )
                                                  .where(
                                                    'product.is_product_return',
                                                    isEqualTo: true,
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
                                          List<ProductsRecord>
                                              rowProductsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final rowProductsRecord =
                                              rowProductsRecordList.isNotEmpty
                                                  ? rowProductsRecordList.first
                                                  : null;

                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if ((rowProductsRecord?.product
                                                          ?.isProductReturn ==
                                                      true) &&
                                                  (widget!.order?.orderStatus ==
                                                      'CAPTURED') &&
                                                  (functions.getDateForSubscription(
                                                          widget!.order!
                                                              .deliveredAt!,
                                                          rowProductsRecord!
                                                              .product
                                                              .returnProductNumberDay) >=
                                                      getCurrentTimestamp))
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '8jn0nddu' /* Available return till :  */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Aileron',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text: dateTimeFormat(
                                                          "yMMMd",
                                                          functions.getDateForSubscription(
                                                              widget!.order!
                                                                  .deliveredAt!,
                                                              rowProductsRecord!
                                                                  .product
                                                                  .returnProductNumberDay),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Aileron',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ),
                              Text(
                                activeOrderItemsItem.totalPrice.toString(),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Aileron',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        if ((widget!.order?.paymentStatus == 'CAPTURED') &&
                            (widget!.order?.deliveryInfoList
                                        ?.where((e) =>
                                            e.productIds.contains(
                                                activeOrderItemsItem
                                                    .productId) ==
                                            true)
                                        .toList()
                                        ?.firstOrNull
                                        ?.deliveryTrackingId !=
                                    null &&
                                widget!.order?.deliveryInfoList
                                        ?.where((e) =>
                                            e.productIds.contains(
                                                activeOrderItemsItem
                                                    .productId) ==
                                            true)
                                        .toList()
                                        ?.firstOrNull
                                        ?.deliveryTrackingId !=
                                    '') &&
                            (widget!.order?.orderStatus != 'completed'))
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 12.0, 0.0),
                              child:
                                  StreamBuilder<List<LogisticsResponseRecord>>(
                                stream: queryLogisticsResponseRecord(
                                  queryBuilder: (logisticsResponseRecord) =>
                                      logisticsResponseRecord.where(
                                    'id',
                                    isEqualTo: widget!.order?.deliveryInfoList
                                        ?.where((e) =>
                                            e.productIds.contains(
                                                activeOrderItemsItem
                                                    .productId) ==
                                            true)
                                        .toList()
                                        ?.firstOrNull
                                        ?.deliveryId,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 10.0,
                                        height: 10.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<LogisticsResponseRecord>
                                      textLogisticsResponseRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textLogisticsResponseRecord =
                                      textLogisticsResponseRecordList.isNotEmpty
                                          ? textLogisticsResponseRecordList
                                              .first
                                          : null;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        barrierColor: Color(0x7B000000),
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
                                                width: 400.0,
                                                child: TrackOrderWidget(
                                                  logisticsDoc:
                                                      textLogisticsResponseRecord!,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'oe5iamra' /* Track Order */,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            fontSize: 11.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
