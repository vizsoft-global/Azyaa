import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'selected_dress_component_model.dart';
export 'selected_dress_component_model.dart';

class SelectedDressComponentWidget extends StatefulWidget {
  const SelectedDressComponentWidget({
    super.key,
    required this.productIds,
  });

  final List<String>? productIds;

  @override
  State<SelectedDressComponentWidget> createState() =>
      _SelectedDressComponentWidgetState();
}

class _SelectedDressComponentWidgetState
    extends State<SelectedDressComponentWidget> {
  late SelectedDressComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedDressComponentModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: 35.0,
                height: 3.0,
                decoration: BoxDecoration(
                  color: Color(0xFFCCBBCC),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '2nw6eap5' /* Select Product */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'almarai',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: Builder(
                          builder: (context) {
                            final productList = widget!.productIds!.toList();
                            if (productList.isEmpty) {
                              return Center(
                                child: EmptyWidget(
                                  messageOne: 'Your orders look lonely!',
                                  image:
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/z8ajswlikpb8/Group_(4).svg',
                                  messageTwo:
                                      'Order products available for promotion to promote them',
                                  buttonText: 'Shop now',
                                ),
                              );
                            }

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.58,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: productList.length,
                              itemBuilder: (context, productListIndex) {
                                final productListItem =
                                    productList[productListIndex];
                                return StreamBuilder<List<ProductsRecord>>(
                                  stream: queryProductsRecord(
                                    queryBuilder: (productsRecord) =>
                                        productsRecord
                                            .where(
                                              'product_id',
                                              isEqualTo: productListItem,
                                            )
                                            .where(
                                              'product_authorizer.is_affiliate_product',
                                              isEqualTo: true,
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
                                    List<ProductsRecord>
                                        columnProductsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final columnProductsRecord =
                                        columnProductsRecordList.isNotEmpty
                                            ? columnProductsRecordList.first
                                            : null;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: StreamBuilder<InventoryRecord>(
                                            stream: InventoryRecord.getDocument(
                                                columnProductsRecord!
                                                    .product.inventoryRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 10.0,
                                                    height: 10.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }

                                              final wrapInventoryRecord =
                                                  snapshot.data!;

                                              return Wrap(
                                                spacing: 0.0,
                                                runSpacing: 0.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 200.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                columnProductsRecord?.productInfo?.featureImage !=
                                                                            null &&
                                                                        columnProductsRecord?.productInfo?.featureImage !=
                                                                            ''
                                                                    ? columnProductsRecord!
                                                                        .productInfo
                                                                        .featureImage
                                                                    : columnProductsRecord!
                                                                        .productInfo
                                                                        .galleryImage
                                                                        .firstOrNull!,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                alignment:
                                                                    Alignment(
                                                                        0.0,
                                                                        -1.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (wrapInventoryRecord
                                                                .stock >
                                                            0)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                        .checkboxValueMap[
                                                                    productListItem] ??= false,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  safeSetState(() =>
                                                                      _model.checkboxValueMap[
                                                                              productListItem] =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    if (columnProductsRecord
                                                                            ?.productAuthorizer
                                                                            ?.creatorIdList
                                                                            ?.contains(currentUserUid) ==
                                                                        false) {
                                                                      FFAppState()
                                                                          .updatePromotionflowStruct(
                                                                        (e) => e
                                                                          ..updateProductDetails(
                                                                            (e) =>
                                                                                e.add(columnProductsRecord!.productInfo),
                                                                          )
                                                                          ..updateProductRef(
                                                                            (e) =>
                                                                                e.add(columnProductsRecord!.reference),
                                                                          )
                                                                          ..updateProductPricesInfo(
                                                                            (e) =>
                                                                                e.add(columnProductsRecord!.product),
                                                                          ),
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text(FFLocalizations.of(context).getVariableText(
                                                                                enText: 'You already have promoted this product',
                                                                                arText: 'لقد قمت بالفعل بالترويج لهذا المنتج',
                                                                              )),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    _model.count = FFAppState()
                                                                        .promotionflow
                                                                        .productRef
                                                                        .length;
                                                                    while (_model
                                                                            .count >
                                                                        0) {
                                                                      if (columnProductsRecord
                                                                              ?.reference ==
                                                                          FFAppState()
                                                                              .promotionflow
                                                                              .productRef
                                                                              .elementAtOrNull(_model.count - 1)) {
                                                                        FFAppState()
                                                                            .updatePromotionflowStruct(
                                                                          (e) => e
                                                                            ..updateProductDetails(
                                                                              (e) => e.removeAt(_model.count - 1),
                                                                            )
                                                                            ..updateProductRef(
                                                                              (e) => e.removeAt(_model.count - 1),
                                                                            )
                                                                            ..updateProductPricesInfo(
                                                                              (e) => e.removeAt(_model.count - 1),
                                                                            ),
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                        return;
                                                                      } else {
                                                                        _model.count =
                                                                            _model.count -
                                                                                1;
                                                                      }
                                                                    }
                                                                  }
                                                                },
                                                                side: (FlutterFlowTheme.of(context)
                                                                            .tertiary !=
                                                                        null)
                                                                    ? BorderSide(
                                                                        width:
                                                                            2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary!,
                                                                      )
                                                                    : null,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText: () {
                                                            if (columnProductsRecord
                                                                    ?.productInfoCustomTranslate
                                                                    ?.name
                                                                    ?.en !=
                                                                '') {
                                                              return columnProductsRecord
                                                                  ?.productInfoCustomTranslate
                                                                  ?.name
                                                                  ?.en;
                                                            } else if (columnProductsRecord
                                                                    ?.productInfoTranslate
                                                                    ?.name
                                                                    ?.en !=
                                                                '') {
                                                              return columnProductsRecord
                                                                  ?.productInfoTranslate
                                                                  ?.name
                                                                  ?.en;
                                                            } else {
                                                              return columnProductsRecord
                                                                  ?.productInfo
                                                                  ?.name;
                                                            }
                                                          }(),
                                                          arText: () {
                                                            if (columnProductsRecord
                                                                    ?.productInfoCustomTranslate
                                                                    ?.name
                                                                    ?.ar !=
                                                                '') {
                                                              return columnProductsRecord
                                                                  ?.productInfoCustomTranslate
                                                                  ?.name
                                                                  ?.ar;
                                                            } else if (columnProductsRecord
                                                                    ?.productInfoTranslate
                                                                    ?.name
                                                                    ?.ar !=
                                                                '') {
                                                              return columnProductsRecord
                                                                  ?.productInfoTranslate
                                                                  ?.name
                                                                  ?.ar;
                                                            } else {
                                                              return columnProductsRecord
                                                                  ?.productInfo
                                                                  ?.name;
                                                            }
                                                          }(),
                                                        ),
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'almarai',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        columnProductsRecord!
                                                            .productId,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'almarai',
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (wrapInventoryRecord
                                                          .stock <=
                                                      0)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9ndh9vj9' /* Out of stock */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFAppState()
                                    .promotionflow
                                    .productRef
                                    .length
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'lg0ruu8a' /*  Item Selected */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'almarai',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'almarai',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '48ie9i8k' /* Add */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
