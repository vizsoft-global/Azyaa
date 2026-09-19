import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
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
import 'product_attribute_model.dart';
export 'product_attribute_model.dart';

class ProductAttributeWidget extends StatefulWidget {
  const ProductAttributeWidget({
    super.key,
    required this.index,
    required this.attribute,
    required this.productID,
    required this.navigation,
    this.cartItemIndex,
  });

  final int? index;
  final ProductAttributesNewStruct? attribute;
  final String? productID;
  final String? navigation;
  final int? cartItemIndex;

  @override
  State<ProductAttributeWidget> createState() => _ProductAttributeWidgetState();
}

class _ProductAttributeWidgetState extends State<ProductAttributeWidget> {
  late ProductAttributeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductAttributeModel());

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

    return StreamBuilder<List<AttributesRecord>>(
      stream: queryAttributesRecord(
        queryBuilder: (attributesRecord) => attributesRecord
            .where(
              'attribute_id',
              isEqualTo: widget!.attribute?.attributesId,
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
        List<AttributesRecord> contarinerAttributesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final contarinerAttributesRecord =
            contarinerAttributesRecordList.isNotEmpty
                ? contarinerAttributesRecordList.first
                : null;

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
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
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
                    Expanded(
                      child: Text(
                        '${FFLocalizations.of(context).getVariableText(
                          enText: 'Choose ',
                          arText: 'يختار',
                        )}${FFLocalizations.of(context).getVariableText(
                          enText: () {
                            if (contarinerAttributesRecord
                                    ?.attributeInfoCustomTranslate?.name?.en !=
                                '') {
                              return contarinerAttributesRecord
                                  ?.attributeInfoCustomTranslate?.name?.en;
                            } else if (contarinerAttributesRecord
                                    ?.attributeInfoTranslate?.name?.en !=
                                '') {
                              return contarinerAttributesRecord
                                  ?.attributeInfoTranslate?.name?.en;
                            } else {
                              return contarinerAttributesRecord
                                  ?.attributeInfo?.name;
                            }
                          }(),
                          arText: () {
                            if (contarinerAttributesRecord
                                    ?.attributeInfoCustomTranslate?.name?.ar !=
                                '') {
                              return contarinerAttributesRecord
                                  ?.attributeInfoCustomTranslate?.name?.ar;
                            } else if (contarinerAttributesRecord
                                    ?.attributeInfoTranslate?.name?.ar !=
                                '') {
                              return contarinerAttributesRecord
                                  ?.attributeInfoTranslate?.name?.ar;
                            } else {
                              return contarinerAttributesRecord
                                  ?.attributeInfo?.name;
                            }
                          }(),
                        )}',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'almarai',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              Builder(
                builder: (context) {
                  final attributeNewList =
                      widget!.attribute?.attributesBrandTermIds?.toList() ?? [];

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: attributeNewList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.0),
                    itemBuilder: (context, attributeNewListIndex) {
                      final attributeNewListItem =
                          attributeNewList[attributeNewListIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: StreamBuilder<List<BrandsRecord>>(
                          stream: queryBrandsRecord(
                            queryBuilder: (brandsRecord) => brandsRecord
                                .where(
                                  'brand_id',
                                  isEqualTo: attributeNewListItem,
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
                            List<BrandsRecord> rowBrandsRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final rowBrandsRecord =
                                rowBrandsRecordList.isNotEmpty
                                    ? rowBrandsRecordList.first
                                    : null;

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((contarinerAttributesRecord?.attributeId ==
                                        '1001') ||
                                    (rowBrandsRecord?.brandInfo?.color != null))
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: rowBrandsRecord?.brandInfo?.color,
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      border: Border.all(
                                        color: Color(0x27000000),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getVariableText(
                                      enText: () {
                                        if (rowBrandsRecord
                                                ?.brandInfoCustomTranslate
                                                ?.name
                                                ?.en !=
                                            '') {
                                          return rowBrandsRecord
                                              ?.brandInfoCustomTranslate
                                              ?.name
                                              ?.en;
                                        } else if (rowBrandsRecord
                                                ?.brandInfoTranslate
                                                ?.name
                                                ?.en !=
                                            '') {
                                          return rowBrandsRecord
                                              ?.brandInfoTranslate?.name?.en;
                                        } else {
                                          return rowBrandsRecord
                                              ?.brandInfo?.name;
                                        }
                                      }(),
                                      arText: () {
                                        if (rowBrandsRecord
                                                ?.brandInfoCustomTranslate
                                                ?.name
                                                ?.ar !=
                                            '') {
                                          return rowBrandsRecord
                                              ?.brandInfoCustomTranslate
                                              ?.name
                                              ?.ar;
                                        } else if (rowBrandsRecord
                                                ?.brandInfoTranslate
                                                ?.name
                                                ?.ar !=
                                            '') {
                                          return rowBrandsRecord
                                              ?.brandInfoTranslate?.name?.ar;
                                        } else {
                                          return rowBrandsRecord
                                              ?.brandInfo?.name;
                                        }
                                      }(),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    if ((FFAppState()
                                                .UserDataFlow
                                                .userProductSwatchesList
                                                .where((e) =>
                                                    e.viewedItemId ==
                                                    widget!.productID)
                                                .toList()
                                                .firstOrNull
                                                ?.productAttribute
                                                ?.elementAtOrNull(
                                                    widget!.index!))
                                            ?.attributesDefaultTermId !=
                                        rowBrandsRecord?.brandId)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (loggedIn) {
                                            if (FFAppState()
                                                    .UserDataFlow
                                                    .userProductSwatchesList
                                                    .where((e) =>
                                                        e.viewedItemId ==
                                                        widget!.productID)
                                                    .toList()
                                                    .length ==
                                                0) {
                                              _model.presentproductResult =
                                                  await queryProductsRecordOnce(
                                                queryBuilder:
                                                    (productsRecord) =>
                                                        productsRecord.where(
                                                  'product_id',
                                                  isEqualTo: widget!.productID,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              FFAppState()
                                                  .updateUserDataFlowStruct(
                                                (e) => e
                                                  ..count = _model
                                                      .presentproductResult
                                                      ?.productAttribute
                                                      ?.length
                                                  ..userSwatchesProductAttribute =
                                                      _model
                                                          .presentproductResult!
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
                                                      (e) => e[FFAppState()
                                                              .UserDataFlow
                                                              .count -
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
                                                      viewedItemId:
                                                          widget!.productID,
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
                                                          FFAppState()
                                                                  .UserDataFlow
                                                                  .count -
                                                              1)
                                                      ?.viewedItemId ==
                                                  widget!.productID) {
                                                FFAppState()
                                                    .updateUserDataFlowStruct(
                                                  (e) => e
                                                    ..updateUserProductSwatchesList(
                                                      (e) => e[FFAppState()
                                                              .UserDataFlow
                                                              .count -
                                                          1]
                                                        ..updateProductAttribute(
                                                          (e) => e[
                                                              widget!.index!]
                                                            ..attributesDefaultTermId =
                                                                rowBrandsRecord
                                                                    ?.brandId,
                                                        ),
                                                    ),
                                                );
                                                FFAppState().update(() {});
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
                                            if (widget!.navigation == 'cart') {
                                              FFAppState()
                                                  .updateUserDataFlowStruct(
                                                (e) => e
                                                  ..count = currentUserDocument
                                                      ?.userCart
                                                      ?.cartItems
                                                      ?.length
                                                  ..userCartItemList =
                                                      currentUserDocument!
                                                          .userCart.cartItems
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
                                                            FFAppState()
                                                                    .UserDataFlow
                                                                    .count -
                                                                1)
                                                        ?.productId ==
                                                    widget!.productID) {
                                                  FFAppState()
                                                      .updateUserDataFlowStruct(
                                                    (e) => e
                                                      ..updateUserCartItemList(
                                                        (e) => e[FFAppState()
                                                                .UserDataFlow
                                                                .count -
                                                            1]
                                                          ..updateCartItemAttribute(
                                                            (e) => e[
                                                                widget!.index!]
                                                              ..attributesDefaultTermId =
                                                                  rowBrandsRecord
                                                                      ?.brandId,
                                                          ),
                                                      ),
                                                  );
                                                  FFAppState().update(() {});

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    userCart:
                                                        createUserCartStruct(
                                                      updatedAt:
                                                          getCurrentTimestamp,
                                                      subtotal: functions
                                                          .newCartTotal(FFAppState()
                                                              .UserDataFlow
                                                              .userCartItemList
                                                              .map((e) =>
                                                                  e.totalPrice)
                                                              .toList()),
                                                      total: functions.newCartTotal(
                                                          FFAppState()
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
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
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
                                              unawaited(
                                                () async {
                                                  Navigator.pop(context);
                                                }(),
                                              );
                                              unawaited(
                                                () async {
                                                  Navigator.pop(context);
                                                }(),
                                              );
                                            } else {
                                              unawaited(
                                                () async {
                                                  Navigator.pop(context);
                                                }(),
                                              );
                                            }
                                          } else {
                                            context.goNamed(
                                              LoginWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if ((FFAppState()
                                                .UserDataFlow
                                                .userProductSwatchesList
                                                .where((e) =>
                                                    e.viewedItemId ==
                                                    widget!.productID)
                                                .toList()
                                                .firstOrNull
                                                ?.productAttribute
                                                ?.elementAtOrNull(
                                                    widget!.index!))
                                            ?.attributesDefaultTermId ==
                                        rowBrandsRecord?.brandId)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (widget!.navigation == 'cart') {
                                            unawaited(
                                              () async {
                                                Navigator.pop(context);
                                              }(),
                                            );
                                            unawaited(
                                              () async {
                                                Navigator.pop(context);
                                              }(),
                                            );
                                          } else {
                                            unawaited(
                                              () async {
                                                Navigator.pop(context);
                                              }(),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 24.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color: Color(0xFF7F56D9),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 12.0,
                                                height: 12.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF7F56D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ]
                .divide(SizedBox(height: 16.0))
                .addToStart(SizedBox(height: 24.0))
                .addToEnd(SizedBox(height: 24.0)),
          ),
        );
      },
    );
  }
}
