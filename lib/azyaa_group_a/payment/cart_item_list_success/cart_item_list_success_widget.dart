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
import 'cart_item_list_success_model.dart';
export 'cart_item_list_success_model.dart';

class CartItemListSuccessWidget extends StatefulWidget {
  const CartItemListSuccessWidget({
    super.key,
    this.cartItems,
  });

  final UserCartItemsStruct? cartItems;

  @override
  State<CartItemListSuccessWidget> createState() =>
      _CartItemListSuccessWidgetState();
}

class _CartItemListSuccessWidgetState extends State<CartItemListSuccessWidget> {
  late CartItemListSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemListSuccessModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductsRecord>>(
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget!.cartItems?.productType == 'membership'
                    ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg'
                    : valueOrDefault<String>(
                        widget!.cartItems?.productInfo?.featureImage,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/dj2fqe7bf1be/Frame_1609.png',
                      ),
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, -1.0),
              ),
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
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getVariableText(
                            enText: () {
                              if (widget!.cartItems?.productInfo
                                      ?.infoCustomTranslate?.name?.en !=
                                  '') {
                                return widget!.cartItems?.productInfo
                                    ?.infoCustomTranslate?.name?.en;
                              } else if (widget!.cartItems?.productInfo
                                      ?.infoTranslate?.name?.en !=
                                  '') {
                                return widget!.cartItems?.productInfo
                                    ?.infoTranslate?.name?.en;
                              } else {
                                return widget!.cartItems?.productInfo?.name;
                              }
                            }(),
                            arText: () {
                              if (widget!.cartItems?.productInfo
                                      ?.infoCustomTranslate?.name?.ar !=
                                  '') {
                                return widget!.cartItems?.productInfo
                                    ?.infoCustomTranslate?.name?.ar;
                              } else if (widget!.cartItems?.productInfo
                                      ?.infoTranslate?.name?.ar !=
                                  '') {
                                return widget!.cartItems?.productInfo
                                    ?.infoTranslate?.name?.ar;
                              } else {
                                return widget!.cartItems?.productInfo?.name;
                              }
                            }(),
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Cairo',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Text(
                        '${widget!.cartItems?.price?.toString()}${FFLocalizations.of(context).getVariableText(
                          enText: ' KWD',
                          arText: ' KWD',
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
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
                        widget!.cartItems?.productType == 'membership'
                            ? FFLocalizations.of(context).getVariableText(
                                enText: 'Membership plan',
                                arText: 'خطة العضوية',
                              )
                            : '${FFLocalizations.of(context).getVariableText(
                                enText: 'Quantity:',
                                arText: 'كمية:',
                              )}${widget!.cartItems?.quantity?.toString()}',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Cairo',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        '${widget!.cartItems?.totalPrice?.toString()}${FFLocalizations.of(context).getVariableText(
                          enText: ' KWD',
                          arText: ' KWD',
                        )}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Cairo',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) {
                      final attributeList =
                          widget!.cartItems?.cartItemAttribute?.toList() ?? [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: attributeList.length,
                        itemBuilder: (context, attributeListIndex) {
                          final attributeListItem =
                              attributeList[attributeListIndex];
                          return StreamBuilder<List<AttributesRecord>>(
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
                              List<AttributesRecord> rowAttributesRecordList =
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
                                    FFLocalizations.of(context).getVariableText(
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
                                              ?.en;
                                        } else if (rowAttributesRecord
                                                ?.attributeInfoTranslate
                                                ?.name
                                                ?.ar !=
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
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
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
                                                isEqualTo: attributeListItem
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
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
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
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
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
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        );
      },
    );
  }
}
