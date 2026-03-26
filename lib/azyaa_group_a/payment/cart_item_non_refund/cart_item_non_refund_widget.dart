import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_item_non_refund_model.dart';
export 'cart_item_non_refund_model.dart';

class CartItemNonRefundWidget extends StatefulWidget {
  const CartItemNonRefundWidget({
    super.key,
    this.cartItems,
  });

  final List<UserCartItemsStruct>? cartItems;

  @override
  State<CartItemNonRefundWidget> createState() =>
      _CartItemNonRefundWidgetState();
}

class _CartItemNonRefundWidgetState extends State<CartItemNonRefundWidget> {
  late CartItemNonRefundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemNonRefundModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => Builder(
        builder: (context) {
          final nonRefundItems = currentUserDocument?.userCart?.cartItems
                  ?.where(
                      (e) => e.productStockInfo.isProductRefundable == false)
                  .toList()
                  ?.toList() ??
              [];

          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                List.generate(nonRefundItems.length, (nonRefundItemsIndex) {
              final nonRefundItemsItem = nonRefundItems[nonRefundItemsIndex];
              return StreamBuilder<List<ProductsRecord>>(
                stream: queryProductsRecord(
                  queryBuilder: (productsRecord) => productsRecord.where(
                    'product_id',
                    isEqualTo: nonRefundItemsItem.productId,
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
                                  (nonRefundItemsItem.productType ==
                                              'membership') ||
                                          (nonRefundItemsItem.productType ==
                                              'virtualtryon')
                                      ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg'
                                      : nonRefundItemsItem
                                          .productInfo.featureImage,
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                  alignment: Alignment(0.0, 1.0),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 2.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).purple,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 2.0, 6.0, 2.0),
                                      child: Text(
                                        rowProductsRecord
                                                    ?.product?.productType ==
                                                'ready'
                                            ? 'Ready Made'
                                            : 'Custom Made',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Aileron',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  rowProductsRecord!.productInfo.name
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
                                  '${nonRefundItemsItem.price.toString()}${FFLocalizations.of(context).getVariableText(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  () {
                                    if (nonRefundItemsItem.productType ==
                                        'membership') {
                                      return FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Membership plan',
                                        arText: 'خطة العضوية',
                                      );
                                    } else if (nonRefundItemsItem.productType ==
                                        'vto') {
                                      return '${nonRefundItemsItem.vtoPoint.vtoPoint.toString()}${FFLocalizations.of(context).getVariableText(
                                        enText: ' Credits',
                                        arText: 'الاعتمادات',
                                      )}';
                                    } else {
                                      return '${FFLocalizations.of(context).getVariableText(
                                        enText: 'Quantity : ',
                                        arText: 'كمية :',
                                      )}${nonRefundItemsItem.quantity.toString()}${rowProductsRecord?.product?.productType != null && rowProductsRecord?.product?.productType != '' ? FFLocalizations.of(context).getVariableText(
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
                                  '${nonRefundItemsItem.totalPrice.toString()}${FFLocalizations.of(context).getVariableText(
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
                                final attributeList = nonRefundItemsItem
                                    .cartItemAttribute
                                    .toList();

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
                                              child: CircularProgressIndicator(
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
                                                ? rowAttributesRecordList.first
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            StreamBuilder<List<BrandsRecord>>(
                                              stream: queryBrandsRecord(
                                                queryBuilder: (brandsRecord) =>
                                                    brandsRecord
                                                        .where(
                                                          'brand_id',
                                                          isEqualTo:
                                                              attributeListItem
                                                                  .attributesDefaultTermId,
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
                            if (nonRefundItemsItem
                                    .productStockInfo.isProductReturn ==
                                true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '3vgnbv6w' /* * Returns Not Applicable for T... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Aileron',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  );
                },
              );
            }).divide(SizedBox(height: 8.0)),
          );
        },
      ),
    );
  }
}
