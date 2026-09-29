import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/empty_v_t_o/empty_v_t_o_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'virtual_try_on_model.dart';
export 'virtual_try_on_model.dart';

class VirtualTryOnWidget extends StatefulWidget {
  const VirtualTryOnWidget({super.key});

  static String routeName = 'VirtualTryOn';
  static String routePath = '/azyaa-tryon';

  @override
  State<VirtualTryOnWidget> createState() => _VirtualTryOnWidgetState();
}

class _VirtualTryOnWidgetState extends State<VirtualTryOnWidget> {
  late VirtualTryOnModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VirtualTryOnModel());

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
        title: 'VirtualTryOn',
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
              preferredSize: const Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.universalAppBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: UniversalAppBarWidget(
                        backButtonStatus: true,
                        title: FFLocalizations.of(context).getVariableText(
                          enText: 'Virtual-try-on',
                          arText: 'تجربة افتراضية',
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: false,
                        tryonStatus: false,
                        shareIconStatus: false,
                      ),
                    ),
                  ],
                ),
                actions: const [],
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
                    child: const UserInitialWidget(),
                  ),
                  wrapWithModel(
                    model: _model.appUpdateCheckerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const AppUpdateCheckerWidget(),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: StreamBuilder<List<TryonRequestsRecord>>(
                              stream: queryTryonRequestsRecord(
                                queryBuilder: (tryonRequestsRecord) =>
                                    tryonRequestsRecord
                                        .where(
                                          'user_id',
                                          isEqualTo: currentUserUid,
                                        )
                                        .where(
                                          'status',
                                          isEqualTo: 'completed',
                                        )
                                        .orderBy('created_at',
                                            descending: true),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TryonRequestsRecord>
                                    staggeredViewTryonRequestsRecordList =
                                    snapshot.data!;
                                if (staggeredViewTryonRequestsRecordList
                                    .isEmpty) {
                                  return Center(
                                    child: EmptyVTOWidget(
                                      messageOne:
                                          FFLocalizations.of(context).getText(
                                        'qwrm4duf' /* You have not yet tried Virtual... */,
                                      ),
                                      image: '',
                                      buttonText: FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Try Now!!',
                                        arText: 'جرب الآن!!',
                                      ),
                                    ),
                                  );
                                }

                                return MasonryGridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.sizeOf(context).width <
                                                kBreakpointMedium
                                            ? 2
                                            : 3,
                                  ),
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  itemCount:
                                      staggeredViewTryonRequestsRecordList
                                          .length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, staggeredViewIndex) {
                                    final staggeredViewTryonRequestsRecord =
                                        staggeredViewTryonRequestsRecordList[
                                            staggeredViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          VirtualTryOnSlidesWidget.routeName,
                                          queryParameters: {
                                            'product': serializeParam(
                                              staggeredViewTryonRequestsRecord
                                                  .productRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
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
                                                      image: CachedNetworkImage(
                                                        imageUrl: valueOrDefault<String>(
                                                          staggeredViewTryonRequestsRecord
                                                              .result,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: valueOrDefault<
                                                          String>(
                                                        staggeredViewTryonRequestsRecord
                                                            .result,
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg' +
                                                            '$staggeredViewIndex',
                                                      ),
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: valueOrDefault<String>(
                                                  staggeredViewTryonRequestsRecord
                                                      .result,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg' +
                                                      '$staggeredViewIndex',
                                                ),
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: valueOrDefault<String>(
                                                      staggeredViewTryonRequestsRecord
                                                          .result,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                                    ),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 250.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          StreamBuilder<ProductsRecord>(
                                            stream: ProductsRecord.getDocument(
                                                staggeredViewTryonRequestsRecord
                                                    .productRef!),
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

                                              final containerProductsRecord =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .buttonBorder,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText: () {
                                                                  if (containerProductsRecord
                                                                          .productInfoTranslate
                                                                          .name
                                                                          .en !=
                                                                      '') {
                                                                    return containerProductsRecord
                                                                        .productInfoTranslate
                                                                        .name
                                                                        .en;
                                                                  } else if (containerProductsRecord
                                                                          .productInfoCustomTranslate
                                                                          .name
                                                                          .en !=
                                                                      '') {
                                                                    return containerProductsRecord
                                                                        .productInfoCustomTranslate
                                                                        .name
                                                                        .en;
                                                                  } else {
                                                                    return containerProductsRecord
                                                                        .productInfo
                                                                        .name;
                                                                  }
                                                                }(),
                                                                arText: () {
                                                                  if (containerProductsRecord
                                                                          .productInfoTranslate
                                                                          .name
                                                                          .ar !=
                                                                      '') {
                                                                    return containerProductsRecord
                                                                        .productInfoTranslate
                                                                        .name
                                                                        .ar;
                                                                  } else if (containerProductsRecord
                                                                          .productInfoCustomTranslate
                                                                          .name
                                                                          .ar !=
                                                                      '') {
                                                                    return containerProductsRecord
                                                                        .productInfoCustomTranslate
                                                                        .name
                                                                        .ar;
                                                                  } else {
                                                                    return containerProductsRecord
                                                                        .productInfo
                                                                        .name;
                                                                  }
                                                                }(),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              '${containerProductsRecord.product.productPrice.toString()} KD',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        borderRadius: 100.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 16.0,
                                                        ),
                                                        onPressed: () async {
                                                          if (loggedIn) {
                                                            if ((currentUserDocument
                                                                            ?.userRecentViews
                                                                            .toList() ??
                                                                        [])
                                                                    .length !=
                                                                0) {
                                                              FFAppState()
                                                                  .updateUserDataFlowStruct(
                                                                (e) => e
                                                                  ..count =
                                                                      (currentUserDocument?.userRecentViews.toList() ??
                                                                              [])
                                                                          .length
                                                                  ..userRecentView =
                                                                      (currentUserDocument?.userRecentViews.toList() ??
                                                                              [])
                                                                          .toList(),
                                                              );
                                                              while (FFAppState()
                                                                      .UserDataFlow
                                                                      .count >
                                                                  0) {
                                                                if ((FFAppState()
                                                                            .UserDataFlow
                                                                            .userRecentView
                                                                            .elementAtOrNull(FFAppState().UserDataFlow.count -
                                                                                1)
                                                                            ?.viewedItemId ==
                                                                        containerProductsRecord
                                                                            .productId) &&
                                                                    (FFAppState()
                                                                            .UserDataFlow
                                                                            .userRecentView
                                                                            .elementAtOrNull(FFAppState().UserDataFlow.count -
                                                                                1)
                                                                            ?.viewedEntityType ==
                                                                        'product')) {
                                                                  if (FFAppState()
                                                                          .UserDataFlow
                                                                          .userRecentView
                                                                          .elementAtOrNull(FFAppState().UserDataFlow.count -
                                                                              1)
                                                                          ?.productAttribute
                                                                          .length !=
                                                                      containerProductsRecord
                                                                          .productAttribute
                                                                          .length) {
                                                                    FFAppState()
                                                                        .updateUserDataFlowStruct(
                                                                      (e) => e
                                                                        ..updateUserRecentView(
                                                                          (e) => e[FFAppState().UserDataFlow.count -
                                                                              1]
                                                                            ..productAttribute =
                                                                                containerProductsRecord.productAttribute.toList(),
                                                                        ),
                                                                    );

                                                                    await currentUserReference!
                                                                        .update({
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

                                                                  context
                                                                      .pushNamed(
                                                                    ProductWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'product':
                                                                          serializeParam(
                                                                        containerProductsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      '__transition_info__':
                                                                          const TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );

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

                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'user_recent_views':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getUserRecentViewedListFirestoreData(
                                                                      updateUserRecentViewedListStruct(
                                                                        UserRecentViewedListStruct(
                                                                          createdAt:
                                                                              getCurrentTimestamp,
                                                                          viewedItemId:
                                                                              containerProductsRecord.productId,
                                                                          productAttribute:
                                                                              containerProductsRecord.productAttribute,
                                                                          viewedEntityType:
                                                                              'product',
                                                                        ),
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                          }

                                                          context.pushNamed(
                                                            ProductWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'product':
                                                                  serializeParam(
                                                                containerProductsRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  const TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 8.0))
                          .addToStart(const SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
