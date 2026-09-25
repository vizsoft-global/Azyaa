import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_small_grid_model.dart';
export 'product_small_grid_model.dart';

class ProductSmallGridWidget extends StatefulWidget {
  const ProductSmallGridWidget({
    super.key,
    this.product,
  });

  final ProductsRecord? product;

  @override
  State<ProductSmallGridWidget> createState() => _ProductSmallGridWidgetState();
}

class _ProductSmallGridWidgetState extends State<ProductSmallGridWidget> {
  late ProductSmallGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductSmallGridModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (loggedIn) {
          if ((currentUserDocument?.userRecentViews.toList() ?? []).length !=
              0) {
            FFAppState().updateUserDataFlowStruct(
              (e) => e
                ..count = (currentUserDocument?.userRecentViews.toList() ?? [])
                    .length
                ..userRecentView =
                    (currentUserDocument?.userRecentViews.toList() ?? [])
                        .toList(),
            );
            while (FFAppState().UserDataFlow.count > 0) {
              if ((FFAppState()
                          .UserDataFlow
                          .userRecentView
                          .elementAtOrNull(FFAppState().UserDataFlow.count - 1)
                          ?.viewedItemId ==
                      widget.product?.productId) &&
                  (FFAppState()
                          .UserDataFlow
                          .userRecentView
                          .elementAtOrNull(FFAppState().UserDataFlow.count - 1)
                          ?.viewedEntityType ==
                      'product')) {
                if (FFAppState()
                        .UserDataFlow
                        .userRecentView
                        .elementAtOrNull(FFAppState().UserDataFlow.count - 1)
                        ?.productAttribute
                        .length !=
                    widget.product?.productAttribute.length) {
                  FFAppState().updateUserDataFlowStruct(
                    (e) => e
                      ..updateUserRecentView(
                        (e) => e[FFAppState().UserDataFlow.count - 1]
                          ..productAttribute =
                              widget.product!.productAttribute.toList(),
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
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(
                  ProductWidget.routeName,
                  queryParameters: {
                    'product': serializeParam(
                      widget.product?.reference,
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
                        viewedItemId: widget.product?.productId,
                        productAttribute: widget.product?.productAttribute,
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
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(
          ProductWidget.routeName,
          queryParameters: {
            'product': serializeParam(
              widget.product?.reference,
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
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 100.0,
              child: Stack(
                children: [
                  Container(
                    width: 100.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).border,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: () {
                          if (widget.product?.productInfo.featureImage !=
                                  null &&
                              widget.product?.productInfo.featureImage !=
                                  '') {
                            return (((isiOS == true) || (isAndroid == true)) &&
                                    (widget.product?.productInfo
                                                .featureImageId !=
                                            null &&
                                        widget.product?.productInfo
                                                .featureImageId !=
                                            '')
                                ? widget.product!.productInfo.featureImage
                                : widget.product!.productInfo.featureImage);
                          } else if (widget.product?.productInfo.iconImage !=
                                  null &&
                              widget.product?.productInfo.iconImage != '') {
                            return widget.product!.productInfo.iconImage;
                          } else if (widget
                                  .product!.productInfo.galleryImage.length >
                              0) {
                            return widget
                                .product!.productInfo.galleryImage.firstOrNull!;
                          } else {
                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                          }
                        }(),
                        fit: BoxFit.cover,
                        alignment: const Alignment(0.0, -1.0),
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
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: wrapWithModel(
                        model: _model.userWishlistModel,
                        updateCallback: () => safeSetState(() {}),
                        child: UserWishlistWidget(
                          type: 'product',
                          itemID: widget.product!.productId,
                          iconSize: 14.0,
                          containersize: 25,
                          iconsize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getVariableText(
                enText: () {
                  if (widget.product?.productInfoTranslate.name.en != '') {
                    return widget.product?.productInfoTranslate.name.en;
                  } else if (widget
                          .product?.productInfoCustomTranslate.name.en !=
                      '') {
                    return widget
                        .product?.productInfoCustomTranslate.name.en;
                  } else {
                    return widget.product?.productInfo.name;
                  }
                }(),
                arText: () {
                  if (widget.product?.productInfoTranslate.name.ar != '') {
                    return widget.product?.productInfoTranslate.name.ar;
                  } else if (widget
                          .product?.productInfoCustomTranslate.name.ar !=
                      '') {
                    return widget
                        .product?.productInfoCustomTranslate.name.ar;
                  } else {
                    return widget.product?.productInfo.name;
                  }
                }(),
              ).maybeHandleOverflow(
                maxChars: 12,
              ),
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'almarai',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.product?.product.productPrice.toString()} KD',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'almarai',
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (widget.product?.product.productRegularPrice !=
                    widget.product?.product.productPrice)
                  Text(
                    '${widget.product?.product.productRegularPrice.toString()}',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'almarai',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 11.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
              ].divide(const SizedBox(width: 2.0)),
            ),
          ),
        ].divide(const SizedBox(height: 4.0)),
      ),
    );
  }
}
