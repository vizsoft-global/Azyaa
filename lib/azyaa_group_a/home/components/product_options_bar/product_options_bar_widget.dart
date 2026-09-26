// The option pickers that sit under the product page, above Add to Bag.
//
// WHY THIS EXISTS
// ---------------
// These rows used to live in the page body, between the price and the
// description, and the bottom bar sat there dead ("Select options") until the
// shopper scrolled back up and answered them. They now live in the bottom bar
// itself, so the choice is always one tap away and Add to Bag appears next to
// them the moment the last option is answered.
//
// The rows are rendered in the product's own stored order, deliberately not
// sorted by option id: ProductAttributeWidget writes the chosen term by position
// and seeds the shopper's selection from that same stored order, so sorting here
// put the index and the seeded list out of step -- the term saved for one option
// could land on another (the "Green Gown" ticket).

import '/azyaa_group_a/home/components/product_attribute/product_attribute_widget.dart';
import '/azyaa_group_a/home/components/size_chart_default/size_chart_default_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductOptionsBarWidget extends StatelessWidget {
  const ProductOptionsBarWidget({
    super.key,
    required this.product,
  });

  final ProductsRecord product;

  @override
  Widget build(BuildContext context) {
    final attributeList = product.productAttribute.toList();

    if (attributeList.isEmpty) {
      return const SizedBox.shrink();
    }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: attributeList.length,
                                          itemBuilder:
                                              (context, attributeListIndex) {
                                            final attributeListItem =
                                                attributeList[
                                                    attributeListIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: StreamBuilder<
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
                                                    return const Center(
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
                                                      variationAttributesRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final variationAttributesRecord =
                                                      variationAttributesRecordList
                                                              .isNotEmpty
                                                          ? variationAttributesRecordList
                                                              .first
                                                          : null;

                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Divider(
                                                        height: 4.0,
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                      Container(
                                                        height: 50.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) =>
                                                              InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            1.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            ProductAttributeWidget(
                                                                          index:
                                                                              attributeListIndex,
                                                                          attribute:
                                                                              attributeListItem,
                                                                          productID:
                                                                              product.productId,
                                                                          navigation:
                                                                              FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                'default',
                                                                            arText:
                                                                                'تقصير',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText: () {
                                                                      if (variationAttributesRecord
                                                                              ?.attributeInfoCustomTranslate
                                                                              .name
                                                                              .en !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoCustomTranslate
                                                                            .name
                                                                            .en;
                                                                      } else if (variationAttributesRecord
                                                                              ?.attributeInfoTranslate
                                                                              .name
                                                                              .en !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoTranslate
                                                                            .name
                                                                            .en;
                                                                      } else {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfo
                                                                            .name;
                                                                      }
                                                                    }(),
                                                                    arText: () {
                                                                      if (variationAttributesRecord
                                                                              ?.attributeInfoCustomTranslate
                                                                              .name
                                                                              .ar !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoCustomTranslate
                                                                            .name
                                                                            .ar;
                                                                      } else if (variationAttributesRecord
                                                                              ?.attributeInfoTranslate
                                                                              .name
                                                                              .ar !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoTranslate
                                                                            .name
                                                                            .ar;
                                                                      } else {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfo
                                                                            .name;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                if (variationAttributesRecord
                                                                        ?.attributeId ==
                                                                    '1000')
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 600.0,
                                                                                    child: SizeChartDefaultWidget(
                                                                                      product: product,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'vhv11107' /* Size Chart */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              color: FlutterFlowTheme.of(context).velvet,
                                                                              letterSpacing: 0.0,
                                                                              decoration: TextDecoration.underline,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final termList = attributeListItem
                                                                            .attributesBrandTermIds
                                                                            .toList();

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          primary:
                                                                              false,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          itemCount:
                                                                              termList.length,
                                                                          itemBuilder:
                                                                              (context, termListIndex) {
                                                                            final termListItem =
                                                                                termList[termListIndex];
                                                                            return StreamBuilder<List<BrandsRecord>>(
                                                                              stream: queryBrandsRecord(
                                                                                queryBuilder: (brandsRecord) => brandsRecord
                                                                                    .where(
                                                                                      'brand_id',
                                                                                      isEqualTo: termListItem,
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
                                                                                List<BrandsRecord> stackBrandsRecordList = snapshot.data!;
                                                                                // Return an empty Container when the item does not exist.
                                                                                if (snapshot.data!.isEmpty) {
                                                                                  return Container();
                                                                                }
                                                                                final stackBrandsRecord = stackBrandsRecordList.isNotEmpty ? stackBrandsRecordList.first : null;

                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == product.productId).toList().length == 0) {
                                                                                      FFAppState().updateUserDataFlowStruct(
                                                                                        (e) => e
                                                                                          ..count = product.productAttribute.length
                                                                                          ..userSwatchesProductAttribute = product.productAttribute.toList(),
                                                                                      );
                                                                                      while (FFAppState().UserDataFlow.count > 0) {
                                                                                        FFAppState().updateUserDataFlowStruct(
                                                                                          (e) => e
                                                                                            ..updateUserSwatchesProductAttribute(
                                                                                              (e) => e[FFAppState().UserDataFlow.count - 1]..attributesDefaultTermId = null,
                                                                                            ),
                                                                                        );
                                                                                        FFAppState().updateUserDataFlowStruct(
                                                                                          (e) => e..count = FFAppState().UserDataFlow.count - 1,
                                                                                        );
                                                                                      }
                                                                                      FFAppState().updateUserDataFlowStruct(
                                                                                        (e) => e
                                                                                          ..updateUserProductSwatchesList(
                                                                                            (e) => e.add(UserRecentViewedListStruct(
                                                                                              createdAt: getCurrentTimestamp,
                                                                                              viewedItemId: product.productId,
                                                                                              productAttribute: FFAppState().UserDataFlow.userSwatchesProductAttribute,
                                                                                              viewedEntityType: 'product',
                                                                                            )),
                                                                                          ),
                                                                                      );
                                                                                    }
                                                                                    FFAppState().updateUserDataFlowStruct(
                                                                                      (e) => e..count = FFAppState().UserDataFlow.userProductSwatchesList.length,
                                                                                    );
                                                                                    while (FFAppState().UserDataFlow.count > 0) {
                                                                                      if (FFAppState().UserDataFlow.userProductSwatchesList.elementAtOrNull(FFAppState().UserDataFlow.count - 1)?.viewedItemId == product.productId) {
                                                                                        FFAppState().updateUserDataFlowStruct(
                                                                                          (e) => e
                                                                                            ..updateUserProductSwatchesList(
                                                                                              (e) => e[FFAppState().UserDataFlow.count - 1]
                                                                                                ..updateProductAttribute(
                                                                                                  (e) => e[attributeListIndex]..attributesDefaultTermId = termListItem,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        FFAppState().update(() {});
                                                                                        return;
                                                                                      }
                                                                                      FFAppState().updateUserDataFlowStruct(
                                                                                        (e) => e..count = FFAppState().UserDataFlow.count - 1,
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if ((variationAttributesRecord?.attributeId == '1001') && (stackBrandsRecord?.brandInfo.color != null))
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                              border: Border.all(
                                                                                                color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == product.productId).toList().firstOrNull?.productAttribute.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId == stackBrandsRecord?.brandId ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsets.all(2.0),
                                                                                              child: Container(
                                                                                                width: 40.0,
                                                                                                height: 40.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: stackBrandsRecord?.brandInfo.color,
                                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                                  border: Border.all(
                                                                                                    color: const Color(0x27000000),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (!((variationAttributesRecord?.attributeId == '1001') && (stackBrandsRecord?.brandInfo.color != null)))
                                                                                        Align(
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                border: Border.all(
                                                                                                  color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == product.productId).toList().firstOrNull?.productAttribute.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId == stackBrandsRecord?.brandId ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getVariableText(
                                                                                                    enText: () {
                                                                                                      if (stackBrandsRecord?.brandInfoCustomTranslate.name.en != '') {
                                                                                                        return stackBrandsRecord?.brandInfoCustomTranslate.name.en;
                                                                                                      } else if (stackBrandsRecord?.brandInfoTranslate.name.en != '') {
                                                                                                        return stackBrandsRecord?.brandInfoTranslate.name.en;
                                                                                                      } else {
                                                                                                        return stackBrandsRecord?.brandInfo.name;
                                                                                                      }
                                                                                                    }(),
                                                                                                    arText: () {
                                                                                                      if (stackBrandsRecord?.brandInfoCustomTranslate.name.ar != '') {
                                                                                                        return stackBrandsRecord?.brandInfoCustomTranslate.name.ar;
                                                                                                      } else if (stackBrandsRecord?.brandInfoTranslate.name.ar != '') {
                                                                                                        return stackBrandsRecord?.brandInfoTranslate.name.ar;
                                                                                                      } else {
                                                                                                        return stackBrandsRecord?.brandInfo.name;
                                                                                                      }
                                                                                                    }(),
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: 'almarai',
                                                                                                        color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == product.productId).toList().firstOrNull?.productAttribute.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId == stackBrandsRecord?.brandId ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
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
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: ProductAttributeWidget(
                                                                                  index: attributeListIndex,
                                                                                  attribute: attributeListItem,
                                                                                  productID: product.productId,
                                                                                  navigation: 'default',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .klayer1,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
  }
}
