import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'creators_individual_promo_model.dart';
export 'creators_individual_promo_model.dart';

class CreatorsIndividualPromoWidget extends StatefulWidget {
  const CreatorsIndividualPromoWidget({
    super.key,
    required this.promo,
    required this.creatorUid,
  });

  final String? promo;
  final String? creatorUid;

  static String routeName = 'Creators-IndividualPromo';
  static String routePath = '/azyaa-creator-promo';

  @override
  State<CreatorsIndividualPromoWidget> createState() =>
      _CreatorsIndividualPromoWidgetState();
}

class _CreatorsIndividualPromoWidgetState
    extends State<CreatorsIndividualPromoWidget> {
  late CreatorsIndividualPromoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorsIndividualPromoModel());

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
        title: 'Creators-IndividualPromo',
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
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.universalAppBarModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: UniversalAppBarWidget(
                              backButtonStatus: true,
                              title: FFLocalizations.of(context).getText(
                                '7l8juwqq' /* Creators Hub  */,
                              ),
                              navigationIconStatus: true,
                              searchIconStatus: false,
                              wishlistIconStatus: true,
                              navigationFrom: 'default',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).border,
                        borderRadius: 100.0,
                        buttonSize: 42.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          FFIcons.kshare,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 18.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          _model.idmapDoc = await queryIdMapRecordOnce(
                            queryBuilder: (idMapRecord) => idMapRecord.where(
                              'type',
                              isEqualTo: 'Main',
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.creatorDoc = await queryUsersRecordOnce(
                            queryBuilder: (usersRecord) => usersRecord.where(
                              'uid',
                              isEqualTo: widget.creatorUid,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.dubshortlink =
                              await DuoDeeplinkGroup.createLinkCall.call(
                            url: 'https://azyaa.ai',
                            title: valueOrDefault<String>(
                              _model.creatorDoc?.creatorMainInfo
                                  .creatorPromotions
                                  .where((e) => e.promotionId == widget.promo)
                                  .toList()
                                  .firstOrNull
                                  ?.promotionCaption,
                              '-',
                            ),
                            description: valueOrDefault<String>(
                              _model.creatorDoc?.creatorMainInfo
                                  .creatorPromotions
                                  .where((e) => e.promotionId == widget.promo)
                                  .toList()
                                  .firstOrNull
                                  ?.promotionDescription,
                              '-',
                            ),
                            image: _model
                                .creatorDoc?.creatorMainInfo.creatorPromotions
                                .where((e) => e.promotionId == widget.promo)
                                .toList()
                                .firstOrNull
                                ?.promotionImages
                                .firstOrNull,
                            ios:
                                'https://azyaa.ai/azyaa-creator-promo?promo=${widget.promo}&creatorUid=${widget.creatorUid}',
                            domain: 'azyaa.link',
                            externalID:
                                '${currentUserUid}-PR${_model.idmapDoc?.shareLinkId.toString()}',
                            android:
                                'https://azyaa.ai/azyaa-creator-promo?promo=${widget.promo}&creatorUid=${widget.creatorUid}',
                          );

                          if ((_model.dubshortlink?.succeeded ?? true)) {
                            await Share.share(
                              DuoDeeplinkGroup.createLinkCall.shortLink(
                                (_model.dubshortlink?.jsonBody ?? ''),
                              )!,
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );

                            await _model.idmapDoc!.reference.update({
                              ...mapToFirestore(
                                {
                                  'share_link_id': FieldValue.increment(1),
                                },
                              ),
                            });
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content:
                                        const Text('Server busy try after sometime.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }

                          safeSetState(() {});
                        },
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
                  StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where(
                        'uid',
                        isEqualTo: widget.creatorUid,
                      ),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 150.0,
                          child: const LoadingAnimationWidget(),
                        );
                      }
                      List<UsersRecord> creatorDocumentUsersRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final creatorDocumentUsersRecord =
                          creatorDocumentUsersRecordList.isNotEmpty
                              ? creatorDocumentUsersRecordList.first
                              : null;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        imageUrl: () {
                                          if (creatorDocumentUsersRecord
                                                      ?.creatorMainInfo
                                                      .creatorPromotions
                                                      .where((e) =>
                                                          e.promotionId ==
                                                          widget.promo)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.promotionInfo
                                                      .featureImage !=
                                                  null &&
                                              creatorDocumentUsersRecord
                                                      ?.creatorMainInfo
                                                      .creatorPromotions
                                                      .where((e) =>
                                                          e.promotionId ==
                                                          widget.promo)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.promotionInfo
                                                      .featureImage !=
                                                  '') {
                                            return creatorDocumentUsersRecord!
                                                .creatorMainInfo
                                                .creatorPromotions
                                                .where((e) =>
                                                    e.promotionId ==
                                                    widget.promo)
                                                .toList()
                                                .firstOrNull!
                                                .promotionInfo
                                                .featureImage;
                                          } else if (creatorDocumentUsersRecord
                                                      ?.creatorMainInfo
                                                      .creatorInfo
                                                      .brandPhoto !=
                                                  null &&
                                              creatorDocumentUsersRecord
                                                      ?.creatorMainInfo
                                                      .creatorInfo
                                                      .brandPhoto !=
                                                  '') {
                                            return creatorDocumentUsersRecord!
                                                .creatorMainInfo
                                                .creatorInfo
                                                .brandPhoto;
                                          } else {
                                            return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                                          }
                                        }(),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, -1.0),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                creatorDocumentUsersRecord!
                                                    .creatorMainInfo
                                                    .creatorInfo
                                                    .name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Flexible(
                                                  child: Container(
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
                                                          const EdgeInsets.all(4.0),
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
                                                ),
                                            ].divide(const SizedBox(width: 4.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '94vg1rgm' /* Promo code :  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      creatorDocumentUsersRecord
                                                          .creatorMainInfo
                                                          .creatorPromotions
                                                          .where((e) =>
                                                              e.promotionId ==
                                                              widget.promo)
                                                          .toList()
                                                          .firstOrNull!
                                                          .promotionCode,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'qmeqb9zk' /* Caption */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'almarai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            creatorDocumentUsersRecord
                                                .creatorMainInfo
                                                .creatorPromotions
                                                .where((e) =>
                                                    e.promotionId ==
                                                    widget.promo)
                                                .toList()
                                                .firstOrNull!
                                                .promotionCaption,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'almarai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'jwr42f9w' /* Description */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'almarai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            creatorDocumentUsersRecord
                                                .creatorMainInfo
                                                .creatorPromotions
                                                .where((e) =>
                                                    e.promotionId ==
                                                    widget.promo)
                                                .toList()
                                                .firstOrNull!
                                                .promotionDescription,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'almarai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 2.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ohezrg6m' /* Curated in this post */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final productLists =
                                      creatorDocumentUsersRecord
                                              .creatorMainInfo
                                              .creatorPromotions
                                              .where((e) =>
                                                  widget.promo ==
                                                  e.promotionId)
                                              .toList()
                                              .firstOrNull
                                              ?.productDocReference
                                              .toList() ??
                                          [];

                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          MediaQuery.sizeOf(context).width <
                                                  kBreakpointMedium
                                              ? 2
                                              : 4,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 24.0,
                                      childAspectRatio: 0.6,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: productLists.length,
                                    itemBuilder: (context, productListsIndex) {
                                      final productListsItem =
                                          productLists[productListsIndex];
                                      return StreamBuilder<ProductsRecord>(
                                        stream: ProductsRecord.getDocument(
                                            productListsItem),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Container(
                                              width: 0.0,
                                              height: 0.0,
                                              child: const BlankLoadingWidget(),
                                            );
                                          }

                                          final productGridProductsRecord =
                                              snapshot.data!;

                                          return ProductGridWidget(
                                            key: Key(
                                                'Keytnc_${productListsIndex}_of_${productLists.length}'),
                                            product: productGridProductsRecord,
                                            checkboxStatus: 'show',
                                            cartCheckboxStatus: 'show',
                                            cartButtonStatus: 'hide',
                                            creatorDoc:
                                                creatorDocumentUsersRecord,
                                            promoID: widget.promo,
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            if ((FFAppState()
                                        .UserDataFlow
                                        .userSelectedProductList
                                        .length >
                                    0) &&
                                responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (loggedIn != true) {
                                      context.goNamed(LoginWidget.routeName);

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..userCartCount = currentUserDocument
                                            ?.userCart.cartItems
                                            .where((e) =>
                                                e.productType != 'membership')
                                            .toList()
                                            .length
                                        ..userSelectedProductCount =
                                            FFAppState()
                                                .UserDataFlow
                                                .userSelectedProductList
                                                .length,
                                    );
                                    _model.idMapResult1 =
                                        await queryIdMapRecordOnce(
                                      queryBuilder: (idMapRecord) =>
                                          idMapRecord.where(
                                        'type',
                                        isEqualTo: 'Main',
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(CartWidget.routeName);

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text:
                                      '${FFAppState().UserDataFlow.userSelectedProductList.length.toString()} Items selected, Add to Bag',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 48.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'almarai',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          ]
                              .divide(const SizedBox(height: 16.0))
                              .addToStart(const SizedBox(height: 16.0))
                              .addToEnd(const SizedBox(height: 16.0)),
                        ),
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
