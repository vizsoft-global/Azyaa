import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/virtual_try_on/v_t_o_delete_confirm/v_t_o_delete_confirm_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_listview/product_listview_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'virtual_try_on_copy_model.dart';
export 'virtual_try_on_copy_model.dart';

class VirtualTryOnCopyWidget extends StatefulWidget {
  const VirtualTryOnCopyWidget({super.key});

  static String routeName = 'VirtualTryOnCopy';
  static String routePath = '/azyaa-tryon111';

  @override
  State<VirtualTryOnCopyWidget> createState() => _VirtualTryOnCopyWidgetState();
}

class _VirtualTryOnCopyWidgetState extends State<VirtualTryOnCopyWidget> {
  late VirtualTryOnCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VirtualTryOnCopyModel());

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
        title: 'VirtualTryOnCopy',
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
                        title: 'Virtual-try-on',
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: false,
                        tryonStatus: false,
                        shareIconStatus: false,
                      ),
                    ),
                  ],
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
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                      .orderBy('created_at', descending: true),
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
                              List<TryonRequestsRecord>
                                  staggeredViewTryonRequestsRecordList =
                                  snapshot.data!;

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
                                    staggeredViewTryonRequestsRecordList.length,
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
                                        VirtualTryOnCopyWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
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
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                staggeredViewTryonRequestsRecord
                                                    .result,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                              ),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 250.0,
                                              fit: BoxFit.cover,
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
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .buttonBorder,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
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
                                                            containerProductsRecord
                                                                .productInfo
                                                                .name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Cairo',
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
                                                                      'Cairo',
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (loggedIn) {
                                                          if ((currentUserDocument
                                                                          ?.userRecentViews
                                                                          ?.toList() ??
                                                                      [])
                                                                  .length !=
                                                              0) {
                                                            FFAppState()
                                                                .updateUserDataFlowStruct(
                                                              (e) => e
                                                                ..count = (currentUserDocument
                                                                            ?.userRecentViews
                                                                            ?.toList() ??
                                                                        [])
                                                                    .length
                                                                ..userRecentView =
                                                                    (currentUserDocument?.userRecentViews?.toList() ??
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
                                                                        .elementAtOrNull(
                                                                            FFAppState().UserDataFlow.count -
                                                                                1)
                                                                        ?.productAttribute
                                                                        ?.length !=
                                                                    containerProductsRecord
                                                                        .productAttribute
                                                                        .length) {
                                                                  FFAppState()
                                                                      .updateUserDataFlowStruct(
                                                                    (e) => e
                                                                      ..updateUserRecentView(
                                                                        (e) => e[
                                                                            FFAppState().UserDataFlow.count -
                                                                                1]
                                                                          ..productAttribute = containerProductsRecord
                                                                              .productAttribute
                                                                              .toList(),
                                                                      ),
                                                                  );

                                                                  await currentUserReference!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'user_recent_views':
                                                                            getUserRecentViewedListListFirestoreData(
                                                                          FFAppState()
                                                                              .UserDataFlow
                                                                              .userRecentView,
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
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 32.0),
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
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 150.0,
                                      child: LoadingAnimationWidget(),
                                    ),
                                  );
                                }
                                List<TryonRequestsRecord>
                                    sortListDefaultTryonRequestsRecordList =
                                    snapshot.data!;
                                if (sortListDefaultTryonRequestsRecordList
                                    .isEmpty) {
                                  return Center(
                                    child: EmptyWidget(
                                      messageOne: 'No Try-Ons Available',
                                      image: '',
                                      messageTwo:
                                          'It looks like you haven\'t tried on any products yet.',
                                      buttonText: 'Go to shop',
                                    ),
                                  );
                                }

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.sizeOf(context).width <
                                                kBreakpointMedium
                                            ? 1
                                            : 2,
                                    crossAxisSpacing: 16.0,
                                    mainAxisSpacing: 16.0,
                                    childAspectRatio: 0.75,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount:
                                      sortListDefaultTryonRequestsRecordList
                                          .length,
                                  itemBuilder: (context, sortListDefaultIndex) {
                                    final sortListDefaultTryonRequestsRecord =
                                        sortListDefaultTryonRequestsRecordList[
                                            sortListDefaultIndex];
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 450.0,
                                      child: Stack(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 85.0),
                                                  child: InkWell(
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
                                                              sortListDefaultTryonRequestsRecord
                                                                  .result,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag:
                                                                sortListDefaultTryonRequestsRecord
                                                                    .result,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag:
                                                          sortListDefaultTryonRequestsRecord
                                                              .result,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          sortListDefaultTryonRequestsRecord
                                                              .result,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 400.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Color(0x7FFFFFFF),
                                                borderRadius: 100.0,
                                                buttonSize: 40.0,
                                                fillColor: Color(0xFFAFAEA2),
                                                icon: Icon(
                                                  Icons.more_vert,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.index =
                                                      sortListDefaultIndex;
                                                  if (_model.menuStatus ==
                                                      true) {
                                                    _model.menuStatus = false;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.menuStatus = true;
                                                    safeSetState(() {});
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child:
                                                  StreamBuilder<ProductsRecord>(
                                                stream: ProductsRecord.getDocument(
                                                    sortListDefaultTryonRequestsRecord
                                                        .productRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Container(
                                                      width: 0.0,
                                                      height: 0.0,
                                                      child:
                                                          BlankLoadingWidget(),
                                                    );
                                                  }

                                                  final containerProductsRecord =
                                                      snapshot.data!;

                                                  return Container(
                                                    height: 110.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .border,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child:
                                                          ProductListviewWidget(
                                                        key: Key(
                                                            'Key9x0_${sortListDefaultIndex}_of_${sortListDefaultTryonRequestsRecordList.length}'),
                                                        product:
                                                            containerProductsRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          if ((_model.menuStatus == true) &&
                                              (sortListDefaultIndex ==
                                                  _model.index))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 50.0, 8.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
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
                                                              .getText(
                                                            '95dio177' /* Share */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'mt0jqeoz' /* Download */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Builder(
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
                                                                barrierDismissible:
                                                                    false,
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
                                                                            0.0)
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
                                                                            Container(
                                                                          width:
                                                                              500.0,
                                                                          child:
                                                                              VTODeleteConfirmWidget(
                                                                            vtoRef:
                                                                                sortListDefaultTryonRequestsRecord.reference,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '9fp9sizl' /* Delete */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
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
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .addToStart(SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
