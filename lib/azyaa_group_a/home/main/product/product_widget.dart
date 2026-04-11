import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/virtual_try_on/v_t_o_begin/v_t_o_begin_widget.dart';
import '/azyaa_group_a/customer/virtual_try_on/v_t_o_final/v_t_o_final_widget.dart';
import '/azyaa_group_a/customer/virtual_try_on/virtual_try_on_points/virtual_try_on_points_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/customer/zone/user_wishlist/user_wishlist_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_attribute/product_attribute_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_a/home/components/product_small_grid/product_small_grid_widget.dart';
import '/azyaa_group_a/home/components/size_chart_default/size_chart_default_widget.dart';
import '/azyaa_group_a/home/main/product_measurement_popup/product_measurement_popup_widget.dart';
import '/azyaa_group_a/payment/default_cart_button/default_cart_button_widget.dart';
import '/azyaa_group_b/components/unfollow_confirm_popup/unfollow_confirm_popup_widget.dart';
import '/azyaa_group_b/creator_space/creator_space/c1_share_promotion/c1_share_promotion_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui/reviewgrid/reviewgrid_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_model.dart';
export 'product_model.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final DocumentReference? product;

  static String routeName = 'Product';
  static String routePath = '/azyaa-product';

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late ProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Product',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: wrapWithModel(
                  model: _model.universalAppBarModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: UniversalAppBarWidget(
                    backButtonStatus: true,
                    title: FFLocalizations.of(context).getText(
                      '54vo9rtg' /* Product */,
                    ),
                    navigationIconStatus: true,
                    searchIconStatus: false,
                    wishlistIconStatus: false,
                    navigationFrom: 'productDetails',
                    tryonStatus: false,
                    shareIconStatus: false,
                    productRef: widget!.product,
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.userInitialModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: UserInitialWidget(),
                  ),
                  wrapWithModel(
                    model: _model.appUpdateCheckerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppUpdateCheckerWidget(),
                  ),
                  StreamBuilder<ProductsRecord>(
                    stream: ProductsRecord.getDocument(widget!.product!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 150.0,
                            child: LoadingAnimationWidget(),
                          ),
                        );
                      }

                      final stackProductsRecord = snapshot.data!;

                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: (MediaQuery.sizeOf(context).width <
                                              kBreakpointMedium
                                          ? 450
                                          : 650)
                                      .toDouble(),
                                  child: Stack(
                                    children: [
                                      if (stackProductsRecord
                                              .productInfo.galleryImage.length >
                                          0)
                                        Builder(
                                          builder: (context) {
                                            final imageList =
                                                stackProductsRecord
                                                    .productInfo.galleryImage
                                                    .toList();

                                            return Container(
                                              width: double.infinity,
                                              height:
                                                  (MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointMedium
                                                          ? 450
                                                          : 650)
                                                      .toDouble(),
                                              child: CarouselSlider.builder(
                                                itemCount: imageList.length,
                                                itemBuilder: (context,
                                                    imageListIndex, _) {
                                                  final imageListItem =
                                                      imageList[imageListIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              imageListItem,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: imageListItem,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: imageListItem,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          imageListItem,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                carouselController: _model
                                                        .galleryController ??=
                                                    CarouselSliderController(),
                                                options: CarouselOptions(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          0,
                                                          imageList.length -
                                                              1)),
                                                  viewportFraction: 0.8,
                                                  disableCenter: true,
                                                  enlargeCenterPage: true,
                                                  enlargeFactor: 0.2,
                                                  enableInfiniteScroll: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  autoPlay: false,
                                                  onPageChanged: (index, _) =>
                                                      _model.galleryCurrentIndex =
                                                          index,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      if (stackProductsRecord.productInfo
                                              .galleryImage.length ==
                                          0)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: Image.network(
                                                        () {
                                                          if (stackProductsRecord
                                                                      .productInfo
                                                                      .featureImage !=
                                                                  null &&
                                                              stackProductsRecord
                                                                      .productInfo
                                                                      .featureImage !=
                                                                  '') {
                                                            return stackProductsRecord
                                                                .productInfo
                                                                .featureImage;
                                                          } else if (stackProductsRecord
                                                                      .productInfo
                                                                      .iconImage !=
                                                                  null &&
                                                              stackProductsRecord
                                                                      .productInfo
                                                                      .iconImage !=
                                                                  '') {
                                                            return stackProductsRecord
                                                                .productInfo
                                                                .iconImage;
                                                          } else if (stackProductsRecord
                                                                  .productInfo
                                                                  .galleryImage
                                                                  .length >
                                                              0) {
                                                            return stackProductsRecord
                                                                .productInfo
                                                                .galleryImage
                                                                .firstOrNull!;
                                                          } else {
                                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/1khy5glmoom8/h1.jpg';
                                                          }
                                                        }(),
                                                        fit: BoxFit.contain,
                                                        alignment: Alignment(
                                                            0.0, -1.0),
                                                      ),
                                                      allowRotation: false,
                                                      tag: () {
                                                        if (stackProductsRecord
                                                                    .productInfo
                                                                    .featureImage !=
                                                                null &&
                                                            stackProductsRecord
                                                                    .productInfo
                                                                    .featureImage !=
                                                                '') {
                                                          return stackProductsRecord
                                                              .productInfo
                                                              .featureImage;
                                                        } else if (stackProductsRecord
                                                                    .productInfo
                                                                    .iconImage !=
                                                                null &&
                                                            stackProductsRecord
                                                                    .productInfo
                                                                    .iconImage !=
                                                                '') {
                                                          return stackProductsRecord
                                                              .productInfo
                                                              .iconImage;
                                                        } else if (stackProductsRecord
                                                                .productInfo
                                                                .galleryImage
                                                                .length >
                                                            0) {
                                                          return stackProductsRecord
                                                              .productInfo
                                                              .galleryImage
                                                              .firstOrNull!;
                                                        } else {
                                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/1khy5glmoom8/h1.jpg';
                                                        }
                                                      }(),
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: () {
                                                  if (stackProductsRecord
                                                              .productInfo
                                                              .featureImage !=
                                                          null &&
                                                      stackProductsRecord
                                                              .productInfo
                                                              .featureImage !=
                                                          '') {
                                                    return stackProductsRecord
                                                        .productInfo
                                                        .featureImage;
                                                  } else if (stackProductsRecord
                                                              .productInfo
                                                              .iconImage !=
                                                          null &&
                                                      stackProductsRecord
                                                              .productInfo
                                                              .iconImage !=
                                                          '') {
                                                    return stackProductsRecord
                                                        .productInfo.iconImage;
                                                  } else if (stackProductsRecord
                                                          .productInfo
                                                          .galleryImage
                                                          .length >
                                                      0) {
                                                    return stackProductsRecord
                                                        .productInfo
                                                        .galleryImage
                                                        .firstOrNull!;
                                                  } else {
                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/1khy5glmoom8/h1.jpg';
                                                  }
                                                }(),
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    () {
                                                      if (stackProductsRecord
                                                                  .productInfo
                                                                  .featureImage !=
                                                              null &&
                                                          stackProductsRecord
                                                                  .productInfo
                                                                  .featureImage !=
                                                              '') {
                                                        return stackProductsRecord
                                                            .productInfo
                                                            .featureImage;
                                                      } else if (stackProductsRecord
                                                                  .productInfo
                                                                  .iconImage !=
                                                              null &&
                                                          stackProductsRecord
                                                                  .productInfo
                                                                  .iconImage !=
                                                              '') {
                                                        return stackProductsRecord
                                                            .productInfo
                                                            .iconImage;
                                                      } else if (stackProductsRecord
                                                              .productInfo
                                                              .galleryImage
                                                              .length >
                                                          0) {
                                                        return stackProductsRecord
                                                            .productInfo
                                                            .galleryImage
                                                            .firstOrNull!;
                                                      } else {
                                                        return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/1khy5glmoom8/h1.jpg';
                                                      }
                                                    }(),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointMedium
                                                            ? 450
                                                            : 650)
                                                        .toDouble(),
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        Alignment(0.0, -1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (stackProductsRecord.productAuthorizer
                                              .isVirtualtryonStatus ==
                                          true)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(24.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (loggedIn) {
                                                  if (currentUserDocument!
                                                          .userVto
                                                          .userVtoHistory
                                                          .length >
                                                      0) {
                                                    if (currentUserDocument!
                                                            .userVto
                                                            .userVtoCreditPoints >
                                                        0) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.9,
                                                                  child:
                                                                      VTOFinalWidget(
                                                                    product:
                                                                        stackProductsRecord,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    } else {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.76,
                                                                  child:
                                                                      VirtualTryOnPointsWidget(),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }
                                                  } else {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  VTOBeginWidget(
                                                                product:
                                                                    stackProductsRecord,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                } else {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                VTOBeginWidget(
                                                              product:
                                                                  stackProductsRecord,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                }
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '86m6pgqo' /* Virtual Try on */,
                                              ),
                                              icon: Icon(
                                                FFIcons.kvector29,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 8.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .border,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getVariableText(
                                                            enText: () {
                                                              if (stackProductsRecord
                                                                      .productInfoCustomTranslate
                                                                      .name
                                                                      .en !=
                                                                  '') {
                                                                return stackProductsRecord
                                                                    .productInfoCustomTranslate
                                                                    .name
                                                                    .en;
                                                              } else if (stackProductsRecord
                                                                      .productInfoTranslate
                                                                      .name
                                                                      .en !=
                                                                  '') {
                                                                return stackProductsRecord
                                                                    .productInfoTranslate
                                                                    .name
                                                                    .en;
                                                              } else {
                                                                return stackProductsRecord
                                                                    .productInfo
                                                                    .name;
                                                              }
                                                            }(),
                                                            arText: () {
                                                              if (stackProductsRecord
                                                                      .productInfoCustomTranslate
                                                                      .name
                                                                      .ar !=
                                                                  '') {
                                                                return stackProductsRecord
                                                                    .productInfoCustomTranslate
                                                                    .name
                                                                    .ar;
                                                              } else if (stackProductsRecord
                                                                      .productInfoTranslate
                                                                      .name
                                                                      .ar !=
                                                                  '') {
                                                                return stackProductsRecord
                                                                    .productInfoTranslate
                                                                    .name
                                                                    .ar;
                                                              } else {
                                                                return stackProductsRecord
                                                                    .productInfo
                                                                    .name;
                                                              }
                                                            }(),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .purple,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      2.0,
                                                                      6.0,
                                                                      4.0),
                                                          child: Text(
                                                            stackProductsRecord
                                                                        .product
                                                                        .productType ==
                                                                    'ready'
                                                                ? FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                    enText:
                                                                        'Ready Made',
                                                                    arText:
                                                                        'جاهز',
                                                                  )
                                                                : FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                    enText:
                                                                        'Custom Made',
                                                                    arText:
                                                                        'مصنوع بطريقة مخصصة',
                                                                  ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: () {
                                                        if (stackProductsRecord
                                                                .productInfoCustomTranslate
                                                                .shortDescription
                                                                .en !=
                                                            '') {
                                                          return stackProductsRecord
                                                              .productInfoCustomTranslate
                                                              .shortDescription
                                                              .en;
                                                        } else if (stackProductsRecord
                                                                .productInfoTranslate
                                                                .shortDescription
                                                                .en !=
                                                            '') {
                                                          return stackProductsRecord
                                                              .productInfoTranslate
                                                              .shortDescription
                                                              .en;
                                                        } else {
                                                          return stackProductsRecord
                                                              .productInfo
                                                              .shortDescription;
                                                        }
                                                      }(),
                                                      arText: () {
                                                        if (stackProductsRecord
                                                                .productInfoCustomTranslate
                                                                .shortDescription
                                                                .ar !=
                                                            '') {
                                                          return stackProductsRecord
                                                              .productInfoCustomTranslate
                                                              .shortDescription
                                                              .ar;
                                                        } else if (stackProductsRecord
                                                                .productInfoTranslate
                                                                .shortDescription
                                                                .ar !=
                                                            '') {
                                                          return stackProductsRecord
                                                              .productInfoTranslate
                                                              .shortDescription
                                                              .ar;
                                                        } else {
                                                          return stackProductsRecord
                                                              .productInfo
                                                              .shortDescription;
                                                        }
                                                      }(),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  if (stackProductsRecord
                                                          .productReview
                                                          .length >
                                                      0)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        RatingBarIndicator(
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(
                                                            Icons.star_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                          direction:
                                                              Axis.horizontal,
                                                          rating:
                                                              valueOrDefault<
                                                                  double>(
                                                            (functions.newCartTotal(stackProductsRecord
                                                                    .productReview
                                                                    .map((e) => e
                                                                        .reviewRate)
                                                                    .toList()) /
                                                                stackProductsRecord
                                                                    .productReview
                                                                    .length),
                                                            0.0,
                                                          ),
                                                          unratedColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          itemCount: 5,
                                                          itemSize: 18.0,
                                                        ),
                                                        Text(
                                                          '${stackProductsRecord.productReview.length.toString()}${FFLocalizations.of(context).getVariableText(
                                                            enText: ' ratings',
                                                            arText: 'التقييمات',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.userWishlistModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: UserWishlistWidget(
                                                type: 'product',
                                                itemID: stackProductsRecord
                                                    .productId,
                                                iconSize: 16.0,
                                                containersize: 38,
                                                iconsize: 16,
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                icon: Icon(
                                                  FFIcons.kshare,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {
                                                  _model.newlink = await actions
                                                      .generateLinkNew(
                                                    context,
                                                    '/azyaa-product',
                                                    stackProductsRecord
                                                        .productInfo.name,
                                                    'Azyaa Product',
                                                    <String, String>{
                                                      'page_name': 'Product',
                                                      'page_parameter':
                                                          stackProductsRecord
                                                              .reference.id,
                                                    },
                                                    <String, String>{
                                                      'channel': 'Share',
                                                      'feature': 'feature',
                                                      'campaign': 'campaign',
                                                      'stage': 'stage',
                                                    },
                                                  );
                                                  await Share.share(
                                                    _model.newlink!,
                                                    sharePositionOrigin:
                                                        getWidgetBoundingBox(
                                                            context),
                                                  );

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${stackProductsRecord.product.productPrice.toString()} KD',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            if (stackProductsRecord.product
                                                    .productRegularPrice !=
                                                stackProductsRecord
                                                    .product.productPrice)
                                              Text(
                                                '${stackProductsRecord.product.productRegularPrice.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                              ),
                                          ].divide(SizedBox(width: 2.0)),
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '2qf7mxmd' /* Delivery charges excluded */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Aileron',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final attributeList =
                                            stackProductsRecord
                                                .productAttribute
                                                .sortedList(
                                                    keyOf: (e) =>
                                                        e.attributesId,
                                                    desc: false)
                                                .toList();

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
                                              padding: EdgeInsetsDirectional
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
                                                            BoxDecoration(),
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
                                                                    alignment: AlignmentDirectional(
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
                                                                              stackProductsRecord.productId,
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
                                                                              ?.name
                                                                              ?.en !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoCustomTranslate
                                                                            ?.name
                                                                            ?.en;
                                                                      } else if (variationAttributesRecord
                                                                              ?.attributeInfoTranslate
                                                                              ?.name
                                                                              ?.en !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoTranslate
                                                                            ?.name
                                                                            ?.en;
                                                                      } else {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfo
                                                                            ?.name;
                                                                      }
                                                                    }(),
                                                                    arText: () {
                                                                      if (variationAttributesRecord
                                                                              ?.attributeInfoCustomTranslate
                                                                              ?.name
                                                                              ?.ar !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoCustomTranslate
                                                                            ?.name
                                                                            ?.ar;
                                                                      } else if (variationAttributesRecord
                                                                              ?.attributeInfoTranslate
                                                                              ?.name
                                                                              ?.ar !=
                                                                          '') {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfoTranslate
                                                                            ?.name
                                                                            ?.ar;
                                                                      } else {
                                                                        return variationAttributesRecord
                                                                            ?.attributeInfo
                                                                            ?.name;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Aileron',
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
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    width: 600.0,
                                                                                    child: SizeChartDefaultWidget(
                                                                                      product: stackProductsRecord,
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
                                                                              fontFamily: 'Aileron',
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
                                                                        BoxDecoration(),
                                                                    alignment:
                                                                        AlignmentDirectional(
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
                                                                                    if (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == stackProductsRecord.productId).toList().length == 0) {
                                                                                      FFAppState().updateUserDataFlowStruct(
                                                                                        (e) => e
                                                                                          ..count = stackProductsRecord.productAttribute.length
                                                                                          ..userSwatchesProductAttribute = stackProductsRecord.productAttribute.toList(),
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
                                                                                              viewedItemId: stackProductsRecord.productId,
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
                                                                                      if (FFAppState().UserDataFlow.userProductSwatchesList.elementAtOrNull(FFAppState().UserDataFlow.count - 1)?.viewedItemId == stackProductsRecord.productId) {
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
                                                                                      if ((variationAttributesRecord?.attributeId == '1001') && (stackBrandsRecord?.brandInfo?.color != null))
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              shape: BoxShape.circle,
                                                                                              border: Border.all(
                                                                                                color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == stackProductsRecord.productId).toList().firstOrNull?.productAttribute?.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId == stackBrandsRecord?.brandId ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(2.0),
                                                                                              child: Container(
                                                                                                width: 40.0,
                                                                                                height: 40.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: stackBrandsRecord?.brandInfo?.color,
                                                                                                  borderRadius: BorderRadius.circular(100.0),
                                                                                                  border: Border.all(
                                                                                                    color: Color(0x27000000),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (!((variationAttributesRecord?.attributeId == '1001') && (stackBrandsRecord?.brandInfo?.color != null)))
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                border: Border.all(
                                                                                                  color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == stackProductsRecord.productId).toList().firstOrNull?.productAttribute?.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId == stackBrandsRecord?.brandId ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getVariableText(
                                                                                                    enText: () {
                                                                                                      if (stackBrandsRecord?.brandInfoCustomTranslate?.name?.en != '') {
                                                                                                        return stackBrandsRecord?.brandInfoCustomTranslate?.name?.en;
                                                                                                      } else if (stackBrandsRecord?.brandInfoTranslate?.name?.en != '') {
                                                                                                        return stackBrandsRecord?.brandInfoTranslate?.name?.en;
                                                                                                      } else {
                                                                                                        return stackBrandsRecord?.brandInfo?.name;
                                                                                                      }
                                                                                                    }(),
                                                                                                    arText: () {
                                                                                                      if (stackBrandsRecord?.brandInfoCustomTranslate?.name?.ar != '') {
                                                                                                        return stackBrandsRecord?.brandInfoCustomTranslate?.name?.ar;
                                                                                                      } else if (stackBrandsRecord?.brandInfoTranslate?.name?.ar != '') {
                                                                                                        return stackBrandsRecord?.brandInfoTranslate?.name?.ar;
                                                                                                      } else {
                                                                                                        return stackBrandsRecord?.brandInfo?.name;
                                                                                                      }
                                                                                                    }(),
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: (FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == stackProductsRecord.productId).toList().firstOrNull?.productAttribute?.elementAtOrNull(attributeListIndex))?.attributesDefaultTermId == stackBrandsRecord?.brandId ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
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
                                                                                AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
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
                                                                                  productID: stackProductsRecord.productId,
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
                                                              ].divide(SizedBox(
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
                                      },
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Divider(
                                          height: 4.0,
                                          thickness: 1.0,
                                          indent: 16.0,
                                          endIndent: 16.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        if (stackProductsRecord
                                                .product.productType !=
                                            'ready')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8bv30j7e' /* Measurement */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.6,
                                                                  child:
                                                                      ProductMeasurementPopupWidget(),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                AuthUserStreamWidget(
                                                                  builder:
                                                                      (context) =>
                                                                          Text(
                                                                    ((currentUserDocument?.userBody?.toList() ?? []).length ==
                                                                                0) ||
                                                                            ((currentUserDocument?.userBody?.toList() ?? []).where((e) => e.isDefault == true).toList().length ==
                                                                                0)
                                                                        ? FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                            enText:
                                                                                'Choose here..',
                                                                            arText:
                                                                                'اختر هنا ..',
                                                                          )
                                                                        : (currentUserDocument?.userBody?.toList() ??
                                                                                [])
                                                                            .where((e) =>
                                                                                e.isDefault ==
                                                                                true)
                                                                            .toList()
                                                                            .firstOrNull!
                                                                            .userName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Aileron',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                            .UserDataFlow
                                                                            .userSelectedBody
                                                                            .userName !=
                                                                        null &&
                                                                    FFAppState()
                                                                            .UserDataFlow
                                                                            .userSelectedBody
                                                                            .userName !=
                                                                        '')
                                                                  Text(
                                                                    'H: ${'${FFAppState().UserDataFlow.userSelectedBody.bodyInfo.height.toString()} ${FFAppState().UserDataFlow.userSelectedBody.bodyInfo.heightUnit}'} W: ${'${FFAppState().UserDataFlow.userSelectedBody.bodyInfo.weight.toString()} ${FFAppState().UserDataFlow.userSelectedBody.bodyInfo.weightUnit}'}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Aileron',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                            Icon(
                                                              FFIcons.klayer1,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 14.0,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        if (stackProductsRecord
                                                .product.productType !=
                                            'ready')
                                          Divider(
                                            height: 4.0,
                                            thickness: 1.0,
                                            indent: 16.0,
                                            endIndent: 16.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'k38a6iee' /* Description */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Aileron',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: () {
                                            if (stackProductsRecord
                                                    .productInfoCustomTranslate
                                                    .description
                                                    .en !=
                                                '') {
                                              return stackProductsRecord
                                                  .productInfoCustomTranslate
                                                  .description
                                                  .en;
                                            } else if (stackProductsRecord
                                                    .productInfoTranslate
                                                    .description
                                                    .en !=
                                                '') {
                                              return stackProductsRecord
                                                  .productInfoTranslate
                                                  .description
                                                  .en;
                                            } else {
                                              return stackProductsRecord
                                                  .productInfo.description;
                                            }
                                          }(),
                                          arText: () {
                                            if (stackProductsRecord
                                                    .productInfoCustomTranslate
                                                    .description
                                                    .ar !=
                                                '') {
                                              return stackProductsRecord
                                                  .productInfoCustomTranslate
                                                  .description
                                                  .ar;
                                            } else if (stackProductsRecord
                                                    .productInfoTranslate
                                                    .description
                                                    .ar !=
                                                '') {
                                              return stackProductsRecord
                                                  .productInfoTranslate
                                                  .description
                                                  .ar;
                                            } else {
                                              return stackProductsRecord
                                                  .productInfo.description;
                                            }
                                          }(),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Aileron',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                                if (stackProductsRecord
                                        .product.isProductReturn ==
                                    false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'o016908b' /* * Returns Not Applicable for T... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Aileron',
                                            color: FlutterFlowTheme.of(context)
                                                .velvet,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                StreamBuilder<List<TagsRecord>>(
                                  stream: queryTagsRecord(
                                    queryBuilder: (tagsRecord) => tagsRecord
                                        .where(
                                          'status',
                                          isEqualTo: 'active',
                                        )
                                        .where(
                                          'tag_product_id',
                                          arrayContains:
                                              stackProductsRecord.productId,
                                        ),
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
                                    List<TagsRecord> tagsTagsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: tagsTagsRecordList.length > 0,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1c45r1ma' /* Tags */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final tagList =
                                                      tagsTagsRecordList
                                                          .toList();

                                                  return Wrap(
                                                    spacing: 0.0,
                                                    runSpacing: 0.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        tagList.length,
                                                        (tagListIndex) {
                                                      final tagListItem =
                                                          tagList[tagListIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                              .updateUserFilterStruct(
                                                            (e) => e
                                                              ..filterStatus =
                                                                  'set'
                                                              ..productCount =
                                                                  tagListItem
                                                                      .tagProductId
                                                                      .length,
                                                          );
                                                          while (FFAppState()
                                                                  .UserFilter
                                                                  .productCount >
                                                              0) {
                                                            if (FFAppState()
                                                                    .UserFilter
                                                                    .productId
                                                                    .contains(tagListItem
                                                                        .tagProductId
                                                                        .elementAtOrNull(FFAppState().UserFilter.productCount -
                                                                            1)) !=
                                                                true) {
                                                              FFAppState()
                                                                  .updateUserFilterStruct(
                                                                (e) => e
                                                                  ..updateProductId(
                                                                    (e) => e.add(tagListItem
                                                                        .tagProductId
                                                                        .elementAtOrNull(FFAppState().UserFilter.productCount -
                                                                            1)!),
                                                                  ),
                                                              );
                                                            }
                                                            FFAppState()
                                                                .updateUserFilterStruct(
                                                              (e) => e
                                                                ..productCount =
                                                                    FFAppState()
                                                                            .UserFilter
                                                                            .productCount -
                                                                        1,
                                                            );
                                                          }

                                                          context.goNamed(
                                                              ProductListWidget
                                                                  .routeName);
                                                        },
                                                        child: Text(
                                                          '${FFLocalizations.of(context).getVariableText(
                                                            enText: () {
                                                              if (tagListItem
                                                                      .tagInfoTranslate
                                                                      .name
                                                                      .en ==
                                                                  '') {
                                                                return tagListItem
                                                                    .tagInfoTranslate
                                                                    .name
                                                                    .en;
                                                              } else if (tagListItem
                                                                      .tagInfoCustomTranslate
                                                                      .name
                                                                      .en ==
                                                                  '') {
                                                                return tagListItem
                                                                    .tagInfoCustomTranslate
                                                                    .name
                                                                    .en;
                                                              } else {
                                                                return tagListItem
                                                                    .tagInfo
                                                                    .name;
                                                              }
                                                            }(),
                                                            arText: () {
                                                              if (tagListItem
                                                                      .tagInfoTranslate
                                                                      .name
                                                                      .ar ==
                                                                  '') {
                                                                return tagListItem
                                                                    .tagInfoTranslate
                                                                    .name
                                                                    .ar;
                                                              } else if (tagListItem
                                                                      .tagInfoCustomTranslate
                                                                      .name
                                                                      .ar ==
                                                                  '') {
                                                                return tagListItem
                                                                    .tagInfoCustomTranslate
                                                                    .name
                                                                    .ar;
                                                              } else {
                                                                return tagListItem
                                                                    .tagInfo
                                                                    .name;
                                                              }
                                                            }(),
                                                          )}${tagListIndex != (tagsTagsRecordList.length - 1) ? ', ' : ' '}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                if (stackProductsRecord.productAuthorizer
                                        .creatorIdList.length >
                                    0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '${FFLocalizations.of(context).getVariableText(
                                                            enText:
                                                                'More than ',
                                                            arText: 'أكثر من',
                                                          )}${stackProductsRecord.productAuthorizer.creatorIdList.length.toString()}${FFLocalizations.of(context).getVariableText(
                                                            enText:
                                                                ' creators are using this product, why not you?',
                                                            arText:
                                                                'يستخدم المبدعون هذا المنتج، فلماذا لا تستخدمه أنت أيضًا؟',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Aileron',
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
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'viewall pressed ...');
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'j2k1n981' /* View All */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 28.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .buttonBorder,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      hoverTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 180.0,
                                              decoration: BoxDecoration(),
                                              child: Builder(
                                                builder: (context) {
                                                  final creatorList =
                                                      stackProductsRecord
                                                          .productAuthorizer
                                                          .creatorIdList
                                                          .toList();

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        creatorList.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(width: 8.0),
                                                    itemBuilder: (context,
                                                        creatorListIndex) {
                                                      final creatorListItem =
                                                          creatorList[
                                                              creatorListIndex];
                                                      return StreamBuilder<
                                                          List<UsersRecord>>(
                                                        stream:
                                                            queryUsersRecord(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'uid',
                                                            isEqualTo:
                                                                creatorListItem,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Container(
                                                              width: 0.0,
                                                              height: 0.0,
                                                              child:
                                                                  BlankLoadingWidget(),
                                                            );
                                                          }
                                                          List<UsersRecord>
                                                              containerUsersRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final containerUsersRecord =
                                                              containerUsersRecordList
                                                                      .isNotEmpty
                                                                  ? containerUsersRecordList
                                                                      .first
                                                                  : null;

                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .border,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: 140.0,
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        containerUsersRecord?.creatorMainInfo?.creatorInfo?.brandPhoto != null &&
                                                                                containerUsersRecord?.creatorMainInfo?.creatorInfo?.brandPhoto != ''
                                                                            ? containerUsersRecord!.creatorMainInfo.creatorInfo.brandPhoto
                                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            500.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        alignment: Alignment(
                                                                            0.0,
                                                                            -1.0),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Colors.transparent,
                                                                              Color(0xB2000000)
                                                                            ],
                                                                            stops: [
                                                                              0.0,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            end:
                                                                                AlignmentDirectional(0, 1.0),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(8.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      containerUsersRecord!.creatorMainInfo.creatorInfo.name,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Aileron',
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 4.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                if (stackProductsRecord.productAuthorizer
                                            .productDesignerId !=
                                        null &&
                                    stackProductsRecord.productAuthorizer
                                            .productDesignerId !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                stackProductsRecord
                                                    .productAuthorizer
                                                    .productDesignerRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Container(
                                                  width: 0.0,
                                                  height: 0.0,
                                                  child: BlankLoadingWidget(),
                                                );
                                              }

                                              final designerUsersRecord =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    DesignerWidget.routeName,
                                                    queryParameters: {
                                                      'designer':
                                                          serializeParam(
                                                        designerUsersRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 180.0,
                                                  child: Stack(
                                                    children: [
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 180.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              image:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  designerUsersRecord.designerMainInfo.designerInfo.brandPhoto !=
                                                                              null &&
                                                                          designerUsersRecord.designerMainInfo.designerInfo.brandPhoto !=
                                                                              ''
                                                                      ? designerUsersRecord
                                                                          .designerMainInfo
                                                                          .designerInfo
                                                                          .brandPhoto
                                                                      : designerUsersRecord
                                                                          .photoUrl,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/kwcb1kmteqoh/Frame_2087324774.png',
                                                                ),
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            designerUsersRecord
                                                                            .designerMainInfo
                                                                            .designerInfo
                                                                            .brandPhoto !=
                                                                        null &&
                                                                    designerUsersRecord
                                                                            .designerMainInfo
                                                                            .designerInfo
                                                                            .brandPhoto !=
                                                                        ''
                                                                ? designerUsersRecord
                                                                    .designerMainInfo
                                                                    .designerInfo
                                                                    .brandPhoto
                                                                : designerUsersRecord
                                                                    .photoUrl,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/n26jfqywpvdh/Azyaa_Designer_Default_Piccture_-_User_App.png',
                                                          ),
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 500.0,
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment(
                                                              0.0, 0.0),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Colors
                                                                    .transparent,
                                                                Color(
                                                                    0xB2000000)
                                                              ],
                                                              stops: [0.0, 1.0],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1.0),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      16.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        designerUsersRecord.designerMainInfo.designerInfo.name != null &&
                                                                                designerUsersRecord.designerMainInfo.designerInfo.name != ''
                                                                            ? designerUsersRecord.designerMainInfo.designerInfo.name
                                                                            : designerUsersRecord.displayName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Aileron',
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cviiz2g7' /* Follow */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          28.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Aileron',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      hoverColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      hoverTextColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                    ),
                                                                  ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    if ((designerUsersRecord.reference !=
                                                                            currentUserReference) &&
                                                                        (loggedIn ==
                                                                            true))
                                                                      Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        children: [
                                                                          if ((currentUserDocument?.userDesignerFollowing?.toList() ?? []).contains(designerUsersRecord.reference) ==
                                                                              false)
                                                                            AuthUserStreamWidget(
                                                                              builder: (context) => FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  await currentUserReference!.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'user_designer_following': FieldValue.arrayUnion([
                                                                                          designerUsersRecord.reference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  FFAppState().updateUserDataFlowStruct(
                                                                                    (e) => e..incrementRefresh(1),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'ceibnxuw' /* Follow */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  height: 28.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0x34000000),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Aileron',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 0.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  hoverColor: FlutterFlowTheme.of(context).primary,
                                                                                  hoverTextColor: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ((currentUserDocument?.userDesignerFollowing?.toList() ?? []).contains(designerUsersRecord.reference) ==
                                                                              true)
                                                                            Builder(
                                                                              builder: (context) => AuthUserStreamWidget(
                                                                                builder: (context) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await showDialog(
                                                                                      barrierDismissible: false,
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 500.0,
                                                                                                child: UnfollowConfirmPopupWidget(
                                                                                                  title: FFLocalizations.of(context).getText(
                                                                                                    '0czkwi6a' /* Are you sure? */,
                                                                                                  ),
                                                                                                  description: FFLocalizations.of(context).getText(
                                                                                                    '0kacteio' /* you want to unfollow this Desi... */,
                                                                                                  ),
                                                                                                  userRef: designerUsersRecord.reference,
                                                                                                  type: 'Designer',
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'wliy4nun' /* Unfollow */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 28.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: Color(0x34000000),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Aileron',
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 0.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    hoverColor: FlutterFlowTheme.of(context).primary,
                                                                                    hoverTextColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                  ],
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (stackProductsRecord.productReview.length >
                                    0)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'cx6klrgv' /* Ratings and reviews */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${valueOrDefault<String>(
                                                    ((functions.newCartTotal(
                                                                stackProductsRecord
                                                                    .productReview
                                                                    .map((e) => e
                                                                        .reviewRate)
                                                                    .toList()) /
                                                            stackProductsRecord
                                                                .productReview
                                                                .length))
                                                        .toString(),
                                                    '0',
                                                  )} ★',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  '${stackProductsRecord.productReview.length.toString()}${FFLocalizations.of(context).getVariableText(
                                                    enText: ' ratings',
                                                    arText: 'التقييمات',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4ac9zw03' /* 5 */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (stackProductsRecord
                                                                          .productReview
                                                                          .where((e) =>
                                                                              e.reviewRate >=
                                                                              5.0)
                                                                          .toList()
                                                                          .length
                                                                          .toDouble() /
                                                                      stackProductsRecord
                                                                          .productReview
                                                                          .length) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 3.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            center: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'r4v5h7q2' /* 50% */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Aileron',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            barRadius:
                                                                Radius.circular(
                                                                    8.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'pr363qtm' /* 4 */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (stackProductsRecord
                                                                          .productReview
                                                                          .where((e) =>
                                                                              (e.reviewRate < 5.0) &&
                                                                              (e.reviewRate >=
                                                                                  4.0))
                                                                          .toList()
                                                                          .length
                                                                          .toDouble() /
                                                                      stackProductsRecord
                                                                          .productReview
                                                                          .length) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 3.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            center: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'qtzmypb0' /* 50% */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Aileron',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            barRadius:
                                                                Radius.circular(
                                                                    8.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'bzrylz3v' /* 3 */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (stackProductsRecord
                                                                          .productReview
                                                                          .where((e) =>
                                                                              (e.reviewRate < 4.0) &&
                                                                              (e.reviewRate >=
                                                                                  3.0))
                                                                          .toList()
                                                                          .length
                                                                          .toDouble() /
                                                                      stackProductsRecord
                                                                          .productReview
                                                                          .length) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 3.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            center: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'b9j2bnt4' /* 50% */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Aileron',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            barRadius:
                                                                Radius.circular(
                                                                    8.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'j9q10jum' /* 2 */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (stackProductsRecord
                                                                          .productReview
                                                                          .where((e) =>
                                                                              (e.reviewRate < 3.0) &&
                                                                              (e.reviewRate >=
                                                                                  2.0))
                                                                          .toList()
                                                                          .length
                                                                          .toDouble() /
                                                                      stackProductsRecord
                                                                          .productReview
                                                                          .length) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 3.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            center: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'duu27h8j' /* 50% */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Aileron',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            barRadius:
                                                                Radius.circular(
                                                                    8.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'fy1f1t7o' /* 1 */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  fontSize: 8.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child:
                                                              LinearPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              (stackProductsRecord
                                                                          .productReview
                                                                          .where((e) =>
                                                                              e.reviewRate <=
                                                                              1.0)
                                                                          .toList()
                                                                          .length
                                                                          .toDouble() /
                                                                      stackProductsRecord
                                                                          .productReview
                                                                          .length) /
                                                                  100,
                                                              0.0,
                                                            ),
                                                            lineHeight: 3.0,
                                                            animation: true,
                                                            animateFromLastPercent:
                                                                true,
                                                            progressColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            center: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'csozl64b' /* 50% */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Aileron',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            barRadius:
                                                                Radius.circular(
                                                                    8.0),
                                                            padding:
                                                                EdgeInsets.zero,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                ].divide(SizedBox(height: 1.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 24.0)),
                                        ),
                                      ),
                                      if (stackProductsRecord.productReview
                                              .where(
                                                  (e) => e.reviewComments != '')
                                              .toList()
                                              .length >
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 120.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final reviewList =
                                                      stackProductsRecord
                                                          .productReview
                                                          .where((e) =>
                                                              e.reviewComments !=
                                                              '')
                                                          .toList();

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      16.0,
                                                      0,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        reviewList.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(width: 8.0),
                                                    itemBuilder: (context,
                                                        reviewListIndex) {
                                                      final reviewListItem =
                                                          reviewList[
                                                              reviewListIndex];
                                                      return ReviewgridWidget(
                                                        key: Key(
                                                            'Keykpm_${reviewListIndex}_of_${reviewList.length}'),
                                                        review: reviewListItem,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '35s0i4pq' /* View More */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Aileron',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                if (true /* Warning: Trying to access variable not yet defined. */)
                                  FutureBuilder<List<ProductsRecord>>(
                                    future: queryProductsRecordOnce(
                                      queryBuilder: (productsRecord) =>
                                          productsRecord
                                              .where(
                                                'status',
                                                isEqualTo: 'active',
                                              )
                                              .where(
                                                'product_marketing.is_popular_product',
                                                isEqualTo: true,
                                              )
                                              .orderBy('created_at',
                                                  descending: true),
                                      limit: 20,
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
                                      List<ProductsRecord>
                                          popularProductsRecordList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible:
                                              popularProductsRecordList.length >
                                                  0,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'o2g1qvgb' /* Bought  */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'e4fbjx4h' /* With */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child: Icon(
                                                          Icons
                                                              .navigate_next_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final popularList =
                                                        popularProductsRecordList
                                                            .where((e) =>
                                                                e.productId !=
                                                                stackProductsRecord
                                                                    .productId)
                                                            .toList();

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium
                                                            ? 2
                                                            : 4,
                                                        crossAxisSpacing: 8.0,
                                                        mainAxisSpacing: 24.0,
                                                        childAspectRatio: 0.6,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          popularList.length,
                                                      itemBuilder: (context,
                                                          popularListIndex) {
                                                        final popularListItem =
                                                            popularList[
                                                                popularListIndex];
                                                        return ProductGridWidget(
                                                          key: Key(
                                                              'Keyk4x_${popularListIndex}_of_${popularList.length}'),
                                                          product:
                                                              popularListItem,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                if (((currentUserDocument?.userRecentViews
                                                    ?.toList() ??
                                                [])
                                            .length >
                                        0) &&
                                    loggedIn)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
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
                                                          '91z1janp' /* Recommended for  */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'n9u3bocu' /* You */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Icon(
                                                        Icons
                                                            .navigate_next_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 8.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 165.0,
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<ProductsRecord>>(
                                                stream: queryProductsRecord(
                                                  queryBuilder:
                                                      (productsRecord) =>
                                                          productsRecord
                                                              .where(
                                                                'product_marketing.is_recommended_product',
                                                                isEqualTo: true,
                                                              )
                                                              .where(
                                                                'status',
                                                                isEqualTo:
                                                                    'active',
                                                              ),
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
                                                      listViewProductsRecordList =
                                                      snapshot.data!;

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      0,
                                                      16.0,
                                                      0,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewProductsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(width: 8.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewProductsRecord =
                                                          listViewProductsRecordList[
                                                              listViewIndex];
                                                      return ProductSmallGridWidget(
                                                        key: Key(
                                                            'Keyzto_${listViewIndex}_of_${listViewProductsRecordList.length}'),
                                                        product:
                                                            listViewProductsRecord,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .addToStart(SizedBox(height: 16.0))
                                  .addToEnd(SizedBox(height: 100.0)),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: StreamBuilder<List<SettingsRecord>>(
                              stream: querySettingsRecord(
                                queryBuilder: (settingsRecord) => settingsRecord
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
                                  return Center(
                                    child: Container(
                                      width: 0.0,
                                      height: 0.0,
                                      child: BlankLoadingWidget(),
                                    ),
                                  );
                                }
                                List<SettingsRecord>
                                    containerSettingsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerSettingsRecord =
                                    containerSettingsRecordList.isNotEmpty
                                        ? containerSettingsRecordList.first
                                        : null;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      if (stackProductsRecord
                                              .product.productType ==
                                          'ready')
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              StreamBuilder<InventoryRecord>(
                                            stream: InventoryRecord.getDocument(
                                                stackProductsRecord
                                                    .product.inventoryRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: 0.0,
                                                    height: 0.0,
                                                    child: BlankLoadingWidget(),
                                                  ),
                                                );
                                              }

                                              final readymadeInventoryRecord =
                                                  snapshot.data!;

                                              return Container(
                                                height: valueOrDefault<double>(
                                                  (loggedIn == true) &&
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'Creator') &&
                                                          (stackProductsRecord
                                                                  .productAuthorizer
                                                                  .isAffiliateProduct ==
                                                              true)
                                                      ? 135.0
                                                      : 75.0,
                                                  75.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Stack(
                                                    children: [
                                                      if (() {
                                                        if (!loggedIn) {
                                                          return true;
                                                        } else if ((stackProductsRecord
                                                                    .product
                                                                    .productType ==
                                                                'ready') &&
                                                            (readymadeInventoryRecord
                                                                    .stock >
                                                                0)) {
                                                          return true;
                                                        } else if (stackProductsRecord
                                                                .product
                                                                .productType ==
                                                            'custom') {
                                                          return true;
                                                        } else {
                                                          return false;
                                                        }
                                                      }())
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      8.0,
                                                                      8.0,
                                                                      8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (loggedIn &&
                                                                        (stackProductsRecord.product.productType ==
                                                                            'ready') &&
                                                                        (readymadeInventoryRecord.stock >
                                                                            0))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              120.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).buttonBorder,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              FlutterFlowCountController(
                                                                            decrementIconBuilder: (enabled) =>
                                                                                Icon(
                                                                              Icons.remove_rounded,
                                                                              color: enabled ? FlutterFlowTheme.of(context).secondaryText : FlutterFlowTheme.of(context).alternate,
                                                                              size: 24.0,
                                                                            ),
                                                                            incrementIconBuilder: (enabled) =>
                                                                                Icon(
                                                                              Icons.add_rounded,
                                                                              color: enabled ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).alternate,
                                                                              size: 24.0,
                                                                            ),
                                                                            countBuilder: (count) =>
                                                                                Text(
                                                                              count.toString(),
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    fontFamily: 'Aileron',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            count: _model.countControllerValue ??=
                                                                                1,
                                                                            updateCount:
                                                                                (count) async {
                                                                              safeSetState(() => _model.countControllerValue = count);
                                                                              if (_model.countControllerValue! > readymadeInventoryRecord.stock) {
                                                                                _model.countControllerValue = readymadeInventoryRecord.stock;
                                                                              }
                                                                            },
                                                                            stepSize:
                                                                                1,
                                                                            minimum:
                                                                                1,
                                                                            maximum:
                                                                                readymadeInventoryRecord.stock,
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (() {
                                                                      if (!loggedIn) {
                                                                        return true;
                                                                      } else if ((stackProductsRecord.product.productType ==
                                                                              'ready') &&
                                                                          (readymadeInventoryRecord.stock >
                                                                              0)) {
                                                                        return true;
                                                                      } else if (stackProductsRecord
                                                                              .product
                                                                              .productType ==
                                                                          'custom') {
                                                                        return true;
                                                                      } else {
                                                                        return false;
                                                                      }
                                                                    }())
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              wrapWithModel(
                                                                            model:
                                                                                _model.defaultCartButtonModel1,
                                                                            updateCallback: () =>
                                                                                safeSetState(() {}),
                                                                            updateOnChange:
                                                                                true,
                                                                            child:
                                                                                DefaultCartButtonWidget(
                                                                              type: 'button',
                                                                              product: widget!.product!,
                                                                              navigation: 'cart',
                                                                              defaultTerms: FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == stackProductsRecord.productId).toList().firstOrNull?.productAttribute,
                                                                              quantity: stackProductsRecord.product.productType == 'ready' ? _model.countControllerValue : 1,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if ((loggedIn ==
                                                                      true) &&
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.userRole,
                                                                          '') ==
                                                                      'Creator') &&
                                                                  (stackProductsRecord
                                                                          .productAuthorizer
                                                                          .isAffiliateProduct ==
                                                                      true))
                                                                Stack(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  children: [
                                                                    if (loggedIn &&
                                                                        (valueOrDefault(currentUserDocument?.userRole, '') ==
                                                                            'Creator') &&
                                                                        (stackProductsRecord.productAuthorizer.isAffiliateProduct ==
                                                                            true) &&
                                                                        (stackProductsRecord.productAuthorizer.creatorIdList.where((e) => e == currentUserUid).toList().length ==
                                                                            0))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if ((valueOrDefault(currentUserDocument?.userRole, '') == 'Creator') &&
                                                                                (stackProductsRecord.productAuthorizer.creatorIdList.contains(currentUserDocument?.creatorMainInfo?.creatorMainId) == false)) {
                                                                              _model.iDMapResultOne = await queryIdMapRecordOnce(
                                                                                queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                  'type',
                                                                                  isEqualTo: FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Main',
                                                                                    arText: 'رئيسي',
                                                                                  ),
                                                                                ),
                                                                                singleRecord: true,
                                                                              ).then((s) => s.firstOrNull);
                                                                              _shouldSetState = true;
                                                                              _model.updatePromotionStruct(
                                                                                (e) => e
                                                                                  ..promotionType = 'preapproved'
                                                                                  ..updateProductDocReference(
                                                                                    (e) => e.add(stackProductsRecord.reference),
                                                                                  )
                                                                                  ..promotionInfo = InfoStruct(
                                                                                    name: stackProductsRecord.productInfo.name,
                                                                                    featureImage: stackProductsRecord.productInfo.featureImage,
                                                                                    galleryImage: stackProductsRecord.productInfo.galleryImage,
                                                                                    shortDescription: stackProductsRecord.productInfo.shortDescription,
                                                                                  )
                                                                                  ..promotionCreatedAt = getCurrentTimestamp
                                                                                  ..promotionStatus = 'active'
                                                                                  ..promotionId = 'PROMP${_model.iDMapResultOne?.promotionId?.toString()}'
                                                                                  ..promotionCaption = stackProductsRecord.productInfo.name
                                                                                  ..promotionDescription = stackProductsRecord.productInfo.description
                                                                                  ..promotionCode = 'PROMP${random_data.randomString(
                                                                                    4,
                                                                                    5,
                                                                                    false,
                                                                                    true,
                                                                                    true,
                                                                                  )}'
                                                                                  ..updateProductDetails(
                                                                                    (e) => e.add(stackProductsRecord.productInfo),
                                                                                  )
                                                                                  ..promotionUserRef = currentUserReference
                                                                                  ..promotionStartDate = functions.presentDateFromZerotime()
                                                                                  ..promotionEndDate = stackProductsRecord.productAuthorizer.affiliateEndDate,
                                                                              );
                                                                              _model.productUrl = 'https://azyaa.kw${_model.promotion?.promotionCode}';
                                                                              _model.updatePromotionStruct(
                                                                                (e) => e..promotionUrl = _model.productUrl,
                                                                              );

                                                                              await currentUserReference!.update(createUsersRecordData(
                                                                                creatorMainInfo: createCreatorMainInfoStruct(
                                                                                  fieldValues: {
                                                                                    'creator_promotions': FieldValue.arrayUnion([
                                                                                      getCreatorPromotionsFirestoreData(
                                                                                        updateCreatorPromotionsStruct(
                                                                                          _model.promotion,
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        true,
                                                                                      )
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));

                                                                              await _model.iDMapResultOne!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'promotion_id': FieldValue.increment(1),
                                                                                  },
                                                                                ),
                                                                              });

                                                                              await widget!.product!.update(createProductsRecordData(
                                                                                productAuthorizer: createProductAuthorizeInfoStruct(
                                                                                  fieldValues: {
                                                                                    'creator_id_list': FieldValue.arrayUnion([
                                                                                      currentUserUid
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                productMarketing: createMarketingStruct(
                                                                                  fieldValues: {
                                                                                    'promotion': FieldValue.arrayUnion([
                                                                                      getPromotionMarketingFirestoreData(
                                                                                        createPromotionMarketingStruct(
                                                                                          createdAt: getCurrentTimestamp,
                                                                                          updatedAt: getCurrentTimestamp,
                                                                                          promotionId: _model.promotion?.promotionId,
                                                                                          creatorRef: currentUserReference,
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        true,
                                                                                      )
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                      onTap: () {
                                                                                        FocusScope.of(context).unfocus();
                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                      },
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: Container(
                                                                                          height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                          child: C1SharePromotionWidget(
                                                                                            promotionURL: _model.productUrl,
                                                                                            productDetails: stackProductsRecord.reference,
                                                                                            promotionImages: _model.promotion?.promotionImages,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            } else {
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'vz37nhn5' /* Promote */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kstar,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                48.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).velvet,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Aileron',
                                                                                  color: Color(0xFF344054),
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).buttonBorder,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (loggedIn &&
                                                                        (valueOrDefault(currentUserDocument?.userRole, '') ==
                                                                            'Creator') &&
                                                                        (stackProductsRecord.productAuthorizer.isAffiliateProduct ==
                                                                            true) &&
                                                                        (stackProductsRecord.productAuthorizer.creatorIdList.where((e) => e == currentUserUid).toList().length >
                                                                            0))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(CreatorSpaceWidget.routeName);
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'h05ej0tu' /* See Insights */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kicon10,
                                                                            size:
                                                                                21.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                48.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).velvet,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Aileron',
                                                                                  color: Color(0xFF344054),
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).buttonBorder,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              if ((readymadeInventoryRecord
                                                                          .stock >
                                                                      0) &&
                                                                  responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if (loggedIn) {
                                                                          if (readymadeInventoryRecord.stock >
                                                                              0) {
                                                                            FFAppState().updateUserDataFlowStruct(
                                                                              (e) => e..userCartCount = currentUserDocument?.userCart?.cartItems?.where((e) => e.productType != 'membership').toList()?.length,
                                                                            );
                                                                            _model.idMapResult =
                                                                                await queryIdMapRecordOnce(
                                                                              queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                'type',
                                                                                isEqualTo: 'Main',
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (FFAppState().UserDataFlow.userCartCount ==
                                                                                0) {
                                                                              await currentUserReference!.update(createUsersRecordData(
                                                                                userCart: createUserCartStruct(
                                                                                  cartId: _model.idMapResult?.cartId,
                                                                                  createdAt: getCurrentTimestamp,
                                                                                  updatedAt: getCurrentTimestamp,
                                                                                  subtotal: functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()),
                                                                                  total: functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()),
                                                                                  fieldValues: {
                                                                                    'cart_items': FieldValue.arrayUnion([
                                                                                      getUserCartItemsFirestoreData(
                                                                                        createUserCartItemsStruct(
                                                                                          cartItemId: _model.idMapResult?.cartItemId,
                                                                                          productId: stackProductsRecord.productId,
                                                                                          productInfo: updateInfoStruct(
                                                                                            stackProductsRecord.productInfo,
                                                                                            clearUnsetFields: false,
                                                                                          ),
                                                                                          quantity: 1,
                                                                                          price: stackProductsRecord.product.productPrice,
                                                                                          totalPrice: stackProductsRecord.product.productPrice,
                                                                                          productType: 'product',
                                                                                          productDesignerRef: stackProductsRecord.productAuthorizer.productDesignerRef,
                                                                                          productDesignerId: stackProductsRecord.productAuthorizer.productDesignerId,
                                                                                          productRef: stackProductsRecord.reference,
                                                                                          fieldValues: {
                                                                                            'cart_item_attribute': getProductAttributesNewListFirestoreData(
                                                                                              (currentUserDocument?.userRecentViews?.toList() ?? []).where((e) => stackProductsRecord.productId == e.viewedItemId).toList().firstOrNull?.productAttribute,
                                                                                            ),
                                                                                          },
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        true,
                                                                                      )
                                                                                    ]),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));

                                                                              await _model.idMapResult!.reference.update({
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'cart_id': FieldValue.increment(1),
                                                                                    'cart_item_id': FieldValue.increment(1),
                                                                                  },
                                                                                ),
                                                                              });
                                                                            } else {
                                                                              FFAppState().updateUserDataFlowStruct(
                                                                                (e) => e
                                                                                  ..userCartCount = currentUserDocument?.userCart?.cartItems?.length
                                                                                  ..userCartItemList = currentUserDocument!.userCart.cartItems.toList(),
                                                                              );
                                                                              while (FFAppState().UserDataFlow.userCartCount > 0) {
                                                                                if (FFAppState().UserDataFlow.userCartItemList.elementAtOrNull(FFAppState().UserDataFlow.userCartCount - 1)?.productId == stackProductsRecord.productId) {
                                                                                  FFAppState().updateUserDataFlowStruct(
                                                                                    (e) => e
                                                                                      ..updateUserCartItemList(
                                                                                        (e) => e[FFAppState().UserDataFlow.userCartCount - 1]
                                                                                          ..productId = stackProductsRecord.productId
                                                                                          ..productType = 'product'
                                                                                          ..productInfo = stackProductsRecord.productInfo
                                                                                          ..quantity = 1
                                                                                          ..price = stackProductsRecord.product.productPrice
                                                                                          ..totalPrice = stackProductsRecord.product.productPrice
                                                                                          ..cartItemAttribute = (currentUserDocument?.userRecentViews?.toList() ?? []).where((e) => stackProductsRecord.productId == e.viewedItemId).toList().firstOrNull!.productAttribute.toList()
                                                                                          ..productDesignerRef = stackProductsRecord.productAuthorizer.productDesignerRef
                                                                                          ..productDesignerId = stackProductsRecord.productAuthorizer.productDesignerId
                                                                                          ..productRef = stackProductsRecord.reference,
                                                                                      ),
                                                                                  );

                                                                                  await currentUserReference!.update(createUsersRecordData(
                                                                                    userCart: createUserCartStruct(
                                                                                      updatedAt: getCurrentTimestamp,
                                                                                      subtotal: functions.newCartTotal(FFAppState().UserDataFlow.userCartItemList.map((e) => e.totalPrice).toList()),
                                                                                      total: functions.newCartTotal(FFAppState().UserDataFlow.userCartItemList.map((e) => e.totalPrice).toList()),
                                                                                      fieldValues: {
                                                                                        'cart_items': getUserCartItemsListFirestoreData(
                                                                                          FFAppState().UserDataFlow.userCartItemList,
                                                                                        ),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                  if (Navigator.of(context).canPop()) {
                                                                                    context.pop();
                                                                                  }
                                                                                  context.pushNamed(CartWidget.routeName);

                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                                FFAppState().updateUserDataFlowStruct(
                                                                                  (e) => e..userCartCount = FFAppState().UserDataFlow.userCartCount - 1,
                                                                                );
                                                                              }
                                                                              FFAppState().updateUserDataFlowStruct(
                                                                                (e) => e
                                                                                  ..updateUserCartItemList(
                                                                                    (e) => e.add(UserCartItemsStruct(
                                                                                      cartItemId: _model.idMapResult?.cartItemId,
                                                                                      productType: 'product',
                                                                                      productId: stackProductsRecord.productId,
                                                                                      productInfo: stackProductsRecord.productInfo,
                                                                                      quantity: 1,
                                                                                      price: stackProductsRecord.product.productPrice,
                                                                                      totalPrice: stackProductsRecord.product.productPrice,
                                                                                      cartItemAttribute: (currentUserDocument?.userRecentViews?.toList() ?? []).where((e) => stackProductsRecord.productId == e.viewedItemId).toList().firstOrNull?.productAttribute,
                                                                                      productDesignerRef: stackProductsRecord.productAuthorizer.productDesignerRef,
                                                                                      productDesignerId: stackProductsRecord.productAuthorizer.productDesignerId,
                                                                                      productRef: stackProductsRecord.reference,
                                                                                    )),
                                                                                  ),
                                                                              );

                                                                              await currentUserReference!.update(createUsersRecordData(
                                                                                userCart: createUserCartStruct(
                                                                                  updatedAt: getCurrentTimestamp,
                                                                                  subtotal: functions.newCartTotal(FFAppState().UserDataFlow.userCartItemList.map((e) => e.totalPrice).toList()),
                                                                                  total: functions.newCartTotal(FFAppState().UserDataFlow.userCartItemList.map((e) => e.totalPrice).toList()),
                                                                                  fieldValues: {
                                                                                    'cart_items': getUserCartItemsListFirestoreData(
                                                                                      FFAppState().UserDataFlow.userCartItemList,
                                                                                    ),
                                                                                  },
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            }

                                                                            context.pushNamed(CartWidget.routeName);
                                                                          }
                                                                        } else {
                                                                          context
                                                                              .goNamed(LoginWidget.routeName);
                                                                        }

                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      text: loggedIn
                                                                          ? (currentUserDocument!.userCart.cartItems.where((e) => (e.productId == stackProductsRecord.productId) && (e.productType == 'product')).toList().length > 0
                                                                              ? 'Update Bag'
                                                                              : 'Add to Bag')
                                                                          : 'Login',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            48.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconAlignment:
                                                                            IconAlignment.end,
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: loggedIn
                                                                            ? (currentUserDocument!.userCart.cartItems.where((e) => (e.productId == stackProductsRecord.productId) && (e.productType == 'product')).toList().length > 0
                                                                                ? FlutterFlowTheme.of(context).success
                                                                                : FlutterFlowTheme.of(context).primary)
                                                                            : FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Aileron',
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((readymadeInventoryRecord
                                                                          .stock >
                                                                      0) &&
                                                                  responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        if (loggedIn) {
                                                                          if (readymadeInventoryRecord.stock >
                                                                              0) {
                                                                            _model.idMapResultNew =
                                                                                await queryIdMapRecordOnce(
                                                                              queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                'type',
                                                                                isEqualTo: 'Main',
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            FFAppState().updateUserDataFlowStruct(
                                                                              (e) => e..userCartItemList = currentUserDocument!.userCart.cartItems.toList(),
                                                                            );
                                                                            FFAppState().updateUserDataFlowStruct(
                                                                              (e) => e
                                                                                ..updateUserCartItemList(
                                                                                  (e) => e.add(UserCartItemsStruct(
                                                                                    cartItemId: _model.idMapResult?.cartItemId,
                                                                                    productType: 'product',
                                                                                    cartItemAttribute: stackProductsRecord.productAttribute,
                                                                                    productId: stackProductsRecord.productId,
                                                                                    productInfo: stackProductsRecord.productInfo,
                                                                                    quantity: 1,
                                                                                    price: stackProductsRecord.product.productPrice,
                                                                                    totalPrice: stackProductsRecord.product.productPrice,
                                                                                    productDesignerRef: stackProductsRecord.productAuthorizer.productDesignerRef,
                                                                                    productDesignerId: stackProductsRecord.productAuthorizer.productDesignerId,
                                                                                    productRef: stackProductsRecord.reference,
                                                                                  )),
                                                                                ),
                                                                            );

                                                                            await currentUserReference!.update(createUsersRecordData(
                                                                              userCart: createUserCartStruct(
                                                                                cartId: _model.idMapResult?.cartId,
                                                                                createdAt: getCurrentTimestamp,
                                                                                updatedAt: getCurrentTimestamp,
                                                                                subtotal: functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()),
                                                                                total: functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()),
                                                                                fieldValues: {
                                                                                  'cart_items': getUserCartItemsListFirestoreData(
                                                                                    FFAppState().UserDataFlow.userCartItemList,
                                                                                  ),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                            unawaited(
                                                                              () async {
                                                                                await _model.idMapResult!.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'cart_id': FieldValue.increment(1),
                                                                                      'cart_item_id': FieldValue.increment(1),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              }(),
                                                                            );

                                                                            context.pushNamed(CartWidget.routeName);
                                                                          }
                                                                        } else {
                                                                          context
                                                                              .goNamed(LoginWidget.routeName);
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text: loggedIn
                                                                          ? (currentUserDocument!.userCart.cartItems.where((e) => (e.productId == stackProductsRecord.productId) && (e.productType == 'product')).toList().length > 0
                                                                              ? FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'Add to Bag',
                                                                                  arText: 'أضف إلى الحقيبة',
                                                                                )
                                                                              : FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'Add to Bag',
                                                                                  arText: 'أضف إلى الحقيبة',
                                                                                ))
                                                                          : FFLocalizations.of(context).getVariableText(
                                                                              enText: 'Login',
                                                                              arText: 'تسجيل الدخول',
                                                                            ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            48.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconAlignment:
                                                                            IconAlignment.end,
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: loggedIn
                                                                            ? (currentUserDocument!.userCart.cartItems.where((e) => (e.productId == stackProductsRecord.productId) && (e.productType == 'product')).toList().length > 0
                                                                                ? FlutterFlowTheme.of(context).success
                                                                                : FlutterFlowTheme.of(context).primary)
                                                                            : FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Aileron',
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (loggedIn &&
                                                          (readymadeInventoryRecord
                                                                  .stock <=
                                                              0))
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: InkWell(
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
                                                              if (loggedIn) {
                                                                await stackProductsRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'product_notify_list':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        currentUserEmail
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'Added! you will receive email once product is back in stock',
                                                                        arText:
                                                                            'تمت الإضافة! ستتلقى رسالة بريد إلكتروني بمجرد توفر المنتج مرة أخرى.',
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Aileron',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            3000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.92,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Visibility(
                                                                visible:
                                                                    readymadeInventoryRecord
                                                                            .stock <=
                                                                        0,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          16.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'dggmi9tv' /* Notify me! */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Aileron',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (stackProductsRecord
                                              .product.productType ==
                                          'custom')
                                        AuthUserStreamWidget(
                                          builder: (context) =>
                                              StreamBuilder<InventoryRecord>(
                                            stream: InventoryRecord.getDocument(
                                                stackProductsRecord
                                                    .product.inventoryRef!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: 0.0,
                                                    height: 0.0,
                                                    child: BlankLoadingWidget(),
                                                  ),
                                                );
                                              }

                                              final custommadeInventoryRecord =
                                                  snapshot.data!;

                                              return Container(
                                                height: valueOrDefault<double>(
                                                  (loggedIn == true) &&
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'Creator') &&
                                                          (stackProductsRecord
                                                                  .productAuthorizer
                                                                  .isAffiliateProduct ==
                                                              true)
                                                      ? 135.0
                                                      : 75.0,
                                                  75.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 4.0),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        if (custommadeInventoryRecord.stock >
                                                                            0)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                wrapWithModel(
                                                                              model: _model.defaultCartButtonModel2,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              updateOnChange: true,
                                                                              child: DefaultCartButtonWidget(
                                                                                type: 'button',
                                                                                product: widget!.product!,
                                                                                navigation: 'cart',
                                                                                defaultTerms: FFAppState().UserDataFlow.userProductSwatchesList.where((e) => e.viewedItemId == stackProductsRecord.productId).toList().firstOrNull?.productAttribute,
                                                                                quantity: 1,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (((custommadeInventoryRecord.stock == 0) &&
                                                                                loggedIn) ||
                                                                            ((custommadeInventoryRecord.stock < 0) &&
                                                                                loggedIn))
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (loggedIn) {
                                                                                await stackProductsRecord.reference.update({
                                                                                  ...mapToFirestore(
                                                                                    {
                                                                                      'product_notify_list': FieldValue.arrayUnion([
                                                                                        currentUserEmail
                                                                                      ]),
                                                                                    },
                                                                                  ),
                                                                                });
                                                                              }
                                                                            },
                                                                            text: loggedIn
                                                                                ? FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Notify me!',
                                                                                    arText: 'أعلمني!',
                                                                                  )
                                                                                : FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Login',
                                                                                    arText: 'تسجيل الدخول',
                                                                                  ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 48.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconAlignment: IconAlignment.end,
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: 'Aileron',
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if ((loggedIn ==
                                                                    true) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.userRole,
                                                                        '') ==
                                                                    'Creator') &&
                                                                (stackProductsRecord
                                                                        .productAuthorizer
                                                                        .isAffiliateProduct ==
                                                                    true))
                                                              Stack(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                children: [
                                                                  if (loggedIn &&
                                                                      (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.userRole,
                                                                              '') ==
                                                                          'Creator') &&
                                                                      (stackProductsRecord
                                                                              .productAuthorizer
                                                                              .isAffiliateProduct ==
                                                                          true) &&
                                                                      (stackProductsRecord
                                                                              .productAuthorizer
                                                                              .creatorIdList
                                                                              .where((e) => e == currentUserUid)
                                                                              .toList()
                                                                              .length ==
                                                                          0))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          var _shouldSetState =
                                                                              false;
                                                                          if ((valueOrDefault(currentUserDocument?.userRole, '') == 'Creator') &&
                                                                              (stackProductsRecord.productAuthorizer.creatorIdList.contains(currentUserDocument?.creatorMainInfo?.creatorMainId) == false)) {
                                                                            _model.iDMapResultCustomOne =
                                                                                await queryIdMapRecordOnce(
                                                                              queryBuilder: (idMapRecord) => idMapRecord.where(
                                                                                'type',
                                                                                isEqualTo: FFLocalizations.of(context).getVariableText(
                                                                                  enText: 'Main',
                                                                                  arText: 'رئيسي',
                                                                                ),
                                                                              ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.updatePromotionStruct(
                                                                              (e) => e
                                                                                ..promotionType = 'preapproved'
                                                                                ..updateProductDocReference(
                                                                                  (e) => e.add(stackProductsRecord.reference),
                                                                                )
                                                                                ..promotionInfo = InfoStruct(
                                                                                  name: stackProductsRecord.productInfo.name,
                                                                                  featureImage: stackProductsRecord.productInfo.featureImage,
                                                                                  galleryImage: stackProductsRecord.productInfo.galleryImage,
                                                                                  shortDescription: stackProductsRecord.productInfo.shortDescription,
                                                                                )
                                                                                ..promotionCreatedAt = getCurrentTimestamp
                                                                                ..promotionStatus = 'active'
                                                                                ..promotionId = 'PROMP${_model.iDMapResultCustomOne?.promotionId?.toString()}'
                                                                                ..promotionCaption = stackProductsRecord.productInfo.name
                                                                                ..promotionDescription = stackProductsRecord.productInfo.description
                                                                                ..promotionCode = 'PROMP${random_data.randomString(
                                                                                  4,
                                                                                  5,
                                                                                  false,
                                                                                  true,
                                                                                  true,
                                                                                )}'
                                                                                ..updateProductDetails(
                                                                                  (e) => e.add(stackProductsRecord.productInfo),
                                                                                )
                                                                                ..promotionUserRef = currentUserReference
                                                                                ..promotionStartDate = functions.presentDateFromZerotime()
                                                                                ..promotionEndDate = stackProductsRecord.productAuthorizer.affiliateEndDate,
                                                                            );
                                                                            _model.productUrl =
                                                                                'https://azyaa.kw${_model.promotion?.promotionCode}';
                                                                            _model.updatePromotionStruct(
                                                                              (e) => e..promotionUrl = _model.productUrl,
                                                                            );

                                                                            await currentUserReference!.update(createUsersRecordData(
                                                                              creatorMainInfo: createCreatorMainInfoStruct(
                                                                                fieldValues: {
                                                                                  'creator_promotions': FieldValue.arrayUnion([
                                                                                    getCreatorPromotionsFirestoreData(
                                                                                      updateCreatorPromotionsStruct(
                                                                                        _model.promotion,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      true,
                                                                                    )
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));

                                                                            await _model.iDMapResultCustomOne!.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'promotion_id': FieldValue.increment(1),
                                                                                },
                                                                              ),
                                                                            });

                                                                            await widget!.product!.update(createProductsRecordData(
                                                                              productAuthorizer: createProductAuthorizeInfoStruct(
                                                                                fieldValues: {
                                                                                  'creator_id_list': FieldValue.arrayUnion([
                                                                                    currentUserUid
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                              productMarketing: createMarketingStruct(
                                                                                fieldValues: {
                                                                                  'promotion': FieldValue.arrayUnion([
                                                                                    getPromotionMarketingFirestoreData(
                                                                                      createPromotionMarketingStruct(
                                                                                        createdAt: getCurrentTimestamp,
                                                                                        updatedAt: getCurrentTimestamp,
                                                                                        promotionId: _model.promotion?.promotionId,
                                                                                        creatorRef: currentUserReference,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      true,
                                                                                    )
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(context).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                        child: C1SharePromotionWidget(
                                                                                          promotionURL: _model.productUrl,
                                                                                          productDetails: stackProductsRecord.reference,
                                                                                          promotionImages: _model.promotion?.promotionImages,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          } else {
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'sm50rzpt' /* Promote */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kstar,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              48.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).velvet,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Aileron',
                                                                                color: Color(0xFF344054),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).buttonBorder,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (loggedIn &&
                                                                      (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.userRole,
                                                                              '') ==
                                                                          'Creator') &&
                                                                      (stackProductsRecord
                                                                              .productAuthorizer
                                                                              .isAffiliateProduct ==
                                                                          true) &&
                                                                      (stackProductsRecord
                                                                              .productAuthorizer
                                                                              .creatorIdList
                                                                              .where((e) => e == currentUserUid)
                                                                              .toList()
                                                                              .length >
                                                                          0))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(CreatorSpaceWidget.routeName);
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'a56vsja7' /* See Insights */,
                                                                        ),
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kicon10,
                                                                          size:
                                                                              21.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              48.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).velvet,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Aileron',
                                                                                color: Color(0xFF344054),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              0.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).buttonBorder,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
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
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
