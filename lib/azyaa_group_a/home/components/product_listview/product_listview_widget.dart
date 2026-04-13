import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/azyaa_group_a/payment/product_attribute_cart_level/product_attribute_cart_level_widget.dart';
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
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_listview_model.dart';
export 'product_listview_model.dart';

class ProductListviewWidget extends StatefulWidget {
  const ProductListviewWidget({
    super.key,
    this.product,
  });

  final ProductsRecord? product;

  @override
  State<ProductListviewWidget> createState() => _ProductListviewWidgetState();
}

class _ProductListviewWidgetState extends State<ProductListviewWidget> {
  late ProductListviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListviewModel());

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

    return StreamBuilder<List<InventoryRecord>>(
      stream: queryInventoryRecord(
        queryBuilder: (inventoryRecord) => inventoryRecord.where(
          'inventory_id',
          isEqualTo: widget!.product?.product?.inventoryId,
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
        List<InventoryRecord> rowInventoryRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final rowInventoryRecord = rowInventoryRecordList.isNotEmpty
            ? rowInventoryRecordList.first
            : null;

        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (loggedIn) {
              if ((currentUserDocument?.userRecentViews?.toList() ?? [])
                      .length !=
                  0) {
                FFAppState().updateUserDataFlowStruct(
                  (e) => e
                    ..count =
                        (currentUserDocument?.userRecentViews?.toList() ?? [])
                            .length
                    ..userRecentView =
                        (currentUserDocument?.userRecentViews?.toList() ?? [])
                            .toList(),
                );
                while (FFAppState().UserDataFlow.count > 0) {
                  if ((FFAppState()
                              .UserDataFlow
                              .userRecentView
                              .elementAtOrNull(
                                  FFAppState().UserDataFlow.count - 1)
                              ?.viewedItemId ==
                          widget!.product?.productId) &&
                      (FFAppState()
                              .UserDataFlow
                              .userRecentView
                              .elementAtOrNull(
                                  FFAppState().UserDataFlow.count - 1)
                              ?.viewedEntityType ==
                          'product')) {
                    if (FFAppState()
                            .UserDataFlow
                            .userRecentView
                            .elementAtOrNull(
                                FFAppState().UserDataFlow.count - 1)
                            ?.productAttribute
                            ?.length !=
                        widget!.product?.productAttribute?.length) {
                      FFAppState().updateUserDataFlowStruct(
                        (e) => e
                          ..updateUserRecentView(
                            (e) => e[FFAppState().UserDataFlow.count - 1]
                              ..productAttribute =
                                  widget!.product!.productAttribute.toList(),
                          ),
                      );

                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'user_recent_views':
                                getUserRecentViewedListListFirestoreData(
                              FFAppState().UserDataFlow.userRecentView,
                            ),
                          },
                        ),
                      });
                    }

                    context.pushNamed(
                      ProductWidget.routeName,
                      queryParameters: {
                        'product': serializeParam(
                          widget!.product?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );

                    return;
                  }
                  FFAppState().updateUserDataFlowStruct(
                    (e) => e..count = FFAppState().UserDataFlow.count - 1,
                  );
                }
              }

              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'user_recent_views': FieldValue.arrayUnion([
                      getUserRecentViewedListFirestoreData(
                        updateUserRecentViewedListStruct(
                          UserRecentViewedListStruct(
                            createdAt: getCurrentTimestamp,
                            viewedItemId: widget!.product?.productId,
                            productAttribute: widget!.product?.productAttribute,
                            viewedEntityType: 'product',
                          ),
                          clearUnsetFields: false,
                        ),
                        true,
                      )
                    ]),
                  },
                ),
              });
            }

            context.pushNamed(
              ProductWidget.routeName,
              queryParameters: {
                'product': serializeParam(
                  widget!.product?.reference,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 75.0,
                child: Stack(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  children: [
                    Container(
                      width: 100.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).border,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          () {
                            if (widget!.product?.productInfo?.featureImage !=
                                    null &&
                                widget!.product?.productInfo?.featureImage !=
                                    '') {
                              return widget!.product!.productInfo.featureImage;
                            } else if (widget!
                                        .product?.productInfo?.iconImage !=
                                    null &&
                                widget!.product?.productInfo?.iconImage != '') {
                              return widget!.product!.productInfo.iconImage;
                            } else if (widget!
                                    .product!.productInfo.galleryImage.length >
                                0) {
                              return widget!.product!.productInfo.galleryImage
                                  .firstOrNull!;
                            } else {
                              return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                            }
                          }(),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -1.0),
                        ),
                      ),
                    ),
                    if (widget!.product!.productReview.length > 0)
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).border,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 2.0, 4.0, 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 2.0, 0.0),
                                    child: Text(
                                      (functions.newCartTotal(widget!
                                                  .product!.productReview
                                                  .map((e) => e.reviewRate)
                                                  .toList()) /
                                              widget!.product!.productReview
                                                  .length)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Cairo',
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.star_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).purple,
                                      size: 12.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                    child: VerticalDivider(
                                      width: 1.0,
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      widget!.product!.productReview.length
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Cairo',
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getVariableText(
                          enText: () {
                            if (widget!
                                    .product?.productInfoTranslate?.name?.en !=
                                '') {
                              return widget!
                                  .product?.productInfoTranslate?.name?.en;
                            } else if (widget!.product
                                    ?.productInfoCustomTranslate?.name?.en !=
                                '') {
                              return widget!.product?.productInfoCustomTranslate
                                  ?.name?.en;
                            } else {
                              return widget!.product?.productInfo?.name;
                            }
                          }(),
                          arText: () {
                            if (widget!
                                    .product?.productInfoTranslate?.name?.ar !=
                                '') {
                              return widget!
                                  .product?.productInfoTranslate?.name?.ar;
                            } else if (widget!.product
                                    ?.productInfoCustomTranslate?.name?.ar !=
                                '') {
                              return widget!.product?.productInfoCustomTranslate
                                  ?.name?.ar;
                            } else {
                              return widget!.product?.productInfo?.name;
                            }
                          }(),
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Cairo',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'mvsgg1z4' /* Ready made  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ppcfshmr' /* |  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            TextSpan(
                              text: rowInventoryRecord!.stock <= 0
                                  ? FFLocalizations.of(context).getVariableText(
                                      enText: 'Out of stocks',
                                      arText: 'نفاد المخزون',
                                    )
                                  : '${FFLocalizations.of(context).getVariableText(
                                      enText: 'Last ',
                                      arText: 'آخر',
                                    )}${rowInventoryRecord?.stock?.toString()}${FFLocalizations.of(context).getVariableText(
                                      enText: ' stocks',
                                      arText: 'الأسهم',
                                    )}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Cairo',
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${widget!.product?.product?.productPrice?.toString()} KD',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Cairo',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          if (widget!.product?.product?.productRegularPrice !=
                              widget!.product?.product?.productPrice)
                            Text(
                              '${widget!.product?.product?.productRegularPrice?.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Cairo',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: wrapWithModel(
                  model: _model.userWishlistModel,
                  updateCallback: () => safeSetState(() {}),
                  child: UserWishlistWidget(
                    type: 'product',
                    itemID: widget!.product!.productId,
                    iconSize: 16.0,
                    containersize: 40,
                    iconsize: 16,
                  ),
                ),
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (loggedIn) {
                      if (rowInventoryRecord!.stock > 0) {
                        _model.idMapResultNew = await queryIdMapRecordOnce(
                          queryBuilder: (idMapRecord) => idMapRecord.where(
                            'type',
                            isEqualTo: 'Main',
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        _model.iconProductResult =
                            await ProductsRecord.getDocumentOnce(
                                widget!.product!.reference);
                        unawaited(
                          () async {}(),
                        );
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
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }

                    safeSetState(() {});
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(100.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).buttonBorder,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.add_rounded,
                        color: FlutterFlowTheme.of(context).velvet,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                wrapWithModel(
                  model: _model.defaultCartButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: DefaultCartButtonWidget(
                    type: 'icon',
                    product: widget!.product!.reference,
                    navigation: 'cart',
                    quantity: 1,
                    defaultTerms: FFAppState()
                        .UserDataFlow
                        .userProductSwatchesList
                        .where(
                            (e) => e.viewedItemId == widget!.product?.productId)
                        .toList()
                        .firstOrNull
                        ?.productAttribute,
                  ),
                ),
            ].divide(SizedBox(width: 8.0)),
          ),
        );
      },
    );
  }
}
