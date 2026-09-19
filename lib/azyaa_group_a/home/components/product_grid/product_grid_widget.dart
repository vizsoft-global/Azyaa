import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/azyaa_group_b/creator/product_attribute_promo_level/product_attribute_promo_level_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_grid_model.dart';
export 'product_grid_model.dart';

class ProductGridWidget extends StatefulWidget {
  const ProductGridWidget({
    super.key,
    this.product,
    String? checkboxStatus,
    this.checkboxComponentType,
    this.wishlistDatatype,
    this.recentDatatype,
    String? cartCheckboxStatus,
    String? cartButtonStatus,
    this.creatorDoc,
    this.promoID,
  })  : this.checkboxStatus = checkboxStatus ?? 'hide',
        this.cartCheckboxStatus = cartCheckboxStatus ?? 'hide',
        this.cartButtonStatus = cartButtonStatus ?? 'show';

  final ProductsRecord? product;
  final String checkboxStatus;
  final String? checkboxComponentType;
  final UserWishlistItemStruct? wishlistDatatype;
  final UserRecentViewedListStruct? recentDatatype;
  final String cartCheckboxStatus;
  final String cartButtonStatus;
  final UsersRecord? creatorDoc;
  final String? promoID;

  @override
  State<ProductGridWidget> createState() => _ProductGridWidgetState();
}

class _ProductGridWidgetState extends State<ProductGridWidget> {
  late ProductGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductGridModel());

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
              width: 10.0,
              height: 10.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<InventoryRecord> columnInventoryRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnInventoryRecord = columnInventoryRecordList.isNotEmpty
            ? columnInventoryRecordList.first
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).border,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  () {
                                    if (widget!.product?.productInfo
                                                ?.featureImage !=
                                            null &&
                                        widget!.product?.productInfo
                                                ?.featureImage !=
                                            '') {
                                      return (((isiOS == true) ||
                                                  (isAndroid == true)) &&
                                              (widget!.product?.productInfo
                                                          ?.featureImageId !=
                                                      null &&
                                                  widget!.product?.productInfo
                                                          ?.featureImageId !=
                                                      '')
                                          ? widget!
                                              .product!.productInfo.featureImage
                                          : widget!.product!.productInfo
                                              .featureImage);
                                    } else if (widget!.product?.productInfo
                                                ?.iconImage !=
                                            null &&
                                        widget!.product?.productInfo
                                                ?.iconImage !=
                                            '') {
                                      return widget!
                                          .product!.productInfo.iconImage;
                                    } else if (widget!.product!.productInfo
                                            .galleryImage.length >
                                        0) {
                                      return widget!.product!.productInfo
                                          .galleryImage.firstOrNull!;
                                    } else {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                                    }
                                  }(),
                                  fit: BoxFit.cover,
                                  alignment: Alignment(0.0, -1.0),
                                ),
                              ),
                            ),
                            if (((columnInventoryRecord!.stock > 0) &&
                                    (widget!.checkboxStatus == 'show')) &&
                                responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 7.0, 0.0, 0.0),
                                child: Container(
                                  width: 18.0,
                                  height: 18.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget!.checkboxComponentType ==
                                            'wishlist') {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'user_wishlist_item':
                                                    FieldValue.arrayRemove([
                                                  getUserWishlistItemFirestoreData(
                                                    updateUserWishlistItemStruct(
                                                      widget!.wishlistDatatype,
                                                      clearUnsetFields: false,
                                                    ),
                                                    true,
                                                  )
                                                ]),
                                              },
                                            ),
                                          });
                                        } else {
                                          if (widget!.checkboxComponentType ==
                                              'recent') {
                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'user_recent_views':
                                                      FieldValue.arrayRemove([
                                                    getUserRecentViewedListFirestoreData(
                                                      updateUserRecentViewedListStruct(
                                                        widget!.recentDatatype,
                                                        clearUnsetFields: false,
                                                      ),
                                                      true,
                                                    )
                                                  ]),
                                                },
                                              ),
                                            });
                                          }
                                        }
                                      },
                                      child: FaIcon(
                                        FontAwesomeIcons.minus,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 16.0,
                                      ),
                                    ),
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
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 2.0, 4.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 2.0, 0.0),
                                            child: Text(
                                              (functions.newCartTotal(widget!
                                                          .product!
                                                          .productReview
                                                          .map((e) =>
                                                              e.reviewRate)
                                                          .toList()) /
                                                      widget!.product!
                                                          .productReview.length)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Icon(
                                              Icons.star_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .purple,
                                              size: 12.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                            child: VerticalDivider(
                                              width: 1.0,
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              widget!
                                                  .product!.productReview.length
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
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
                            if ((columnInventoryRecord!.stock > 0) &&
                                (widget!.cartCheckboxStatus == 'show'))
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 2.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<SettingsRecord>>(
                                        stream: querySettingsRecord(
                                          queryBuilder: (settingsRecord) =>
                                              settingsRecord
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
                                            return Container(
                                              width: 0.0,
                                              height: 0.0,
                                              child: BlankLoadingWidget(),
                                            );
                                          }
                                          List<SettingsRecord>
                                              checkboxSettingsRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final checkboxSettingsRecord =
                                              checkboxSettingsRecordList
                                                      .isNotEmpty
                                                  ? checkboxSettingsRecordList
                                                      .first
                                                  : null;

                                          return Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValue ??= currentUserDocument!
                                                          .userCart.cartItems
                                                          .where((e) =>
                                                              (e.productRef ==
                                                                  widget!
                                                                      .product
                                                                      ?.reference) &&
                                                              (e.creatorRef ==
                                                                  widget!
                                                                      .creatorDoc
                                                                      ?.reference))
                                                          .toList()
                                                          .length >
                                                      0
                                                  ? true
                                                  : false,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .checkboxValue = newValue!);
                                                if (newValue!) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              ProductAttributePromoLevelWidget(
                                                            cartIndex:
                                                                currentUserDocument!
                                                                    .userCart
                                                                    .cartItems
                                                                    .length,
                                                            product: widget!
                                                                .product!,
                                                            navigation: 'cart',
                                                            popupType: 'icon',
                                                            creatorDoc: widget!
                                                                .creatorDoc!,
                                                            promoID: widget!
                                                                .promoID!,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  _model.updatePage(() {});
                                                } else {
                                                  FFAppState()
                                                      .updateUserDataFlowStruct(
                                                    (e) => e
                                                      ..count =
                                                          currentUserDocument
                                                              ?.userCart
                                                              ?.cartItems
                                                              ?.length
                                                      ..userCartItemList =
                                                          currentUserDocument!
                                                              .userCart
                                                              .cartItems
                                                              .toList(),
                                                  );
                                                  while (FFAppState()
                                                          .UserDataFlow
                                                          .count >
                                                      0) {
                                                    if ((widget!.product
                                                                ?.reference ==
                                                            FFAppState()
                                                                .UserDataFlow
                                                                .userCartItemList
                                                                .elementAtOrNull(
                                                                    FFAppState()
                                                                            .UserDataFlow
                                                                            .count -
                                                                        1)
                                                                ?.productRef) &&
                                                        (widget!.creatorDoc
                                                                ?.reference ==
                                                            FFAppState()
                                                                .UserDataFlow
                                                                .userCartItemList
                                                                .elementAtOrNull(
                                                                    FFAppState()
                                                                            .UserDataFlow
                                                                            .count -
                                                                        1)
                                                                ?.creatorRef)) {
                                                      FFAppState()
                                                          .updateUserDataFlowStruct(
                                                        (e) => e
                                                          ..updateUserCartItemList(
                                                            (e) => e.removeAt(
                                                                FFAppState()
                                                                        .UserDataFlow
                                                                        .count -
                                                                    1),
                                                          ),
                                                      );
                                                      _model.updatePage(() {});

                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        userCart:
                                                            createUserCartStruct(
                                                          updatedAt:
                                                              getCurrentTimestamp,
                                                          fieldValues: {
                                                            'cart_items':
                                                                getUserCartItemsListFirestoreData(
                                                              FFAppState()
                                                                  .UserDataFlow
                                                                  .userCartItemList,
                                                            ),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                      return;
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
                                                }
                                              },
                                              side:
                                                  (FlutterFlowTheme.of(context)
                                                              .tertiary !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary!,
                                                        )
                                                      : null,
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: wrapWithModel(
                                  model: _model.userWishlistModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: UserWishlistWidget(
                                    type: 'product',
                                    itemID: widget!.product!.productId,
                                    iconSize: 14.0,
                                    containersize: 30,
                                    iconsize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if ((((columnInventoryRecord!.stock <= 0) &&
                                  (getCurrentRouteStack(context).lastOrNull !=
                                      '/home')) ||
                              ((columnInventoryRecord!.stock <= 0) &&
                                  (getCurrentRouteStack(context).lastOrNull !=
                                      '/')) ||
                              ((columnInventoryRecord!.stock <= 0) &&
                                  (getCurrentRouteStack(context).lastOrNull !=
                                      '/azyaa-product-list'))) &&
                          responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0xD3B9B4B4),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 90.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: () {
                                      if (widget!.product?.productInfoTranslate
                                              ?.name?.en !=
                                          '') {
                                        return widget!.product
                                            ?.productInfoTranslate?.name?.en;
                                      } else if (widget!
                                              .product
                                              ?.productInfoCustomTranslate
                                              ?.name
                                              ?.en !=
                                          '') {
                                        return widget!
                                            .product
                                            ?.productInfoCustomTranslate
                                            ?.name
                                            ?.en;
                                      } else {
                                        return widget!
                                            .product?.productInfo?.name;
                                      }
                                    }(),
                                    arText: () {
                                      if (widget!.product?.productInfoTranslate
                                              ?.name?.ar !=
                                          '') {
                                        return widget!.product
                                            ?.productInfoTranslate?.name?.ar;
                                      } else if (widget!
                                              .product
                                              ?.productInfoCustomTranslate
                                              ?.name
                                              ?.ar !=
                                          '') {
                                        return widget!
                                            .product
                                            ?.productInfoCustomTranslate
                                            ?.name
                                            ?.ar;
                                      } else {
                                        return widget!
                                            .product?.productInfo?.name;
                                      }
                                    }(),
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'almarai',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 4.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: widget!.product?.product
                                                      ?.productType ==
                                                  'ready'
                                              ? 'Ready made'
                                              : 'Custom made',
                                          arText: widget!.product?.product
                                                      ?.productType ==
                                                  'ready'
                                              ? 'جاهز'
                                              : 'مصنوع بطريقة مخصصة',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 4.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'kiugng58' /* Ready made  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'mxwbgakx' /* |  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        TextSpan(
                                          text: columnInventoryRecord!.stock > 0
                                              ? '${FFLocalizations.of(context).getVariableText(
                                                  enText: 'Last ',
                                                  arText: 'آخر',
                                                )}${columnInventoryRecord?.stock?.toString()}${FFLocalizations.of(context).getVariableText(
                                                  enText: ' stocks',
                                                  arText: 'الأسهم',
                                                )}'
                                              : FFLocalizations.of(context)
                                                  .getVariableText(
                                                  enText: 'Out of stock',
                                                  arText: 'إنتهى من المخزن',
                                                ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color: columnInventoryRecord!
                                                            .stock >
                                                        0
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if ((columnInventoryRecord!.stock > 0) &&
                            (widget!.cartButtonStatus == 'show'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.defaultCartButtonModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: DefaultCartButtonWidget(
                                type: 'icon',
                                product: widget!.product!.reference,
                                navigation: 'cart',
                                defaultTerms: FFAppState()
                                    .UserDataFlow
                                    .userProductSwatchesList
                                    .where((e) =>
                                        e.viewedItemId ==
                                        widget!.product?.productId)
                                    .toList()
                                    .firstOrNull
                                    ?.productAttribute,
                                quantity: 1,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '${widget!.product?.product?.productPrice?.toString()} KD',
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'almarai',
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
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
                    Stack(
                      children: [
                        if (loggedIn && (columnInventoryRecord!.stock <= 0))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                't0ffzigk' /* Out of stock */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        if ((columnInventoryRecord!.stock > 0) &&
                            (widget!.product?.product?.productType == 'ready'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              columnInventoryRecord!.stock > 0
                                  ? '${FFLocalizations.of(context).getVariableText(
                                      enText: 'Last ',
                                      arText: 'آخر',
                                    )}${columnInventoryRecord?.stock?.toString()}${FFLocalizations.of(context).getVariableText(
                                      enText: ' stocks',
                                      arText: 'الأسهم',
                                    )}'
                                  : '',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
