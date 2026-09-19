import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/designer_grid/designer_grid_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wishlist_model.dart';
export 'wishlist_model.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({super.key});

  static String routeName = 'Wishlist';
  static String routePath = '/azyaa-wishlist';

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget>
    with TickerProviderStateMixin {
  late WishlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WishlistModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.screenWidth = await actions.getScreenWidth(
        context,
      );
      _model.screenwidth = _model.screenWidth!;
      _model.gridWidth = functions.getGridWidth(_model.screenwidth);
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Wishlist',
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
                        title: FFLocalizations.of(context).getText(
                          '1b6wj01j' /* Wishlist */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: false,
                        navigationFrom: 'default',
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    labelPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    tabs: [
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'yk2lq0g9' /* Wishlist */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'ioyocihf' /* Shared */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'e3i4msgu' /* Viewed */,
                                        ),
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 12.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'hcvpn5cd' /* All */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'jx9cl3jd' /* Designer */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'qd54v23b' /* Creator */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'k2ml04ao' /* Product */,
                                                      ))
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .choiceChipsValue1 =
                                                            val?.firstOrNull),
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderWidth: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .border,
                                                      borderWidth: 1.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsValue1 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsValueController1 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '6xm2684z' /* Product */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: false,
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (context) {
                                                        final allWishlist1 =
                                                            (currentUserDocument
                                                                        ?.userWishlistItem
                                                                        ?.toList() ??
                                                                    [])
                                                                .where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      () {
                                                                        if (_model.choiceChipsValue1 ==
                                                                            'Product') {
                                                                          return (e.entityType ==
                                                                              'product');
                                                                        } else if (_model.choiceChipsValue1 ==
                                                                            'Designer') {
                                                                          return (e.entityType ==
                                                                              'designer');
                                                                        } else if (_model.choiceChipsValue1 ==
                                                                            'Creator') {
                                                                          return (e.entityType ==
                                                                              'creator');
                                                                        } else {
                                                                          return true;
                                                                        }
                                                                      }(),
                                                                      true,
                                                                    ))
                                                                .toList();
                                                        if (allWishlist1
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Oops! Your wishlist is feeling lonely!',
                                                                arText:
                                                                    'عفواً! قائمة أمنياتك تشعر بالوحدة!',
                                                              ),
                                                              image:
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/salf246xetz8/Frame_2087324937.png',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Start adding your dream picks now!\"',
                                                                arText:
                                                                    'ابدأ بإضافة اختيارات أحلامك الآن!',
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText:
                                                                    'Start adding',
                                                                arText:
                                                                    'ابدأ في الإضافة',
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              allWishlist1
                                                                  .length,
                                                              (allWishlist1Index) {
                                                            final allWishlist1Item =
                                                                allWishlist1[
                                                                    allWishlist1Index];
                                                            return Stack(
                                                              children: [
                                                                if (allWishlist1Item
                                                                        .entityType ==
                                                                    'product')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            24.0),
                                                                    child:
                                                                        Container(
                                                                      width: _model
                                                                          .gridWidth,
                                                                      height:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ProductsRecord>>(
                                                                        stream:
                                                                            queryProductsRecord(
                                                                          queryBuilder: (productsRecord) => productsRecord
                                                                              .where(
                                                                                'status',
                                                                                isEqualTo: 'active',
                                                                              )
                                                                              .where(
                                                                                'product_id',
                                                                                isEqualTo: allWishlist1Item.wishlistItemId,
                                                                              ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 150.0,
                                                                              child: LoadingAnimationWidget(),
                                                                            );
                                                                          }
                                                                          List<ProductsRecord>
                                                                              productGridProductsRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final productGridProductsRecord = productGridProductsRecordList.isNotEmpty
                                                                              ? productGridProductsRecordList.first
                                                                              : null;

                                                                          return ProductGridWidget(
                                                                            key:
                                                                                Key('Keywxx_${allWishlist1Index}_of_${allWishlist1.length}'),
                                                                            product:
                                                                                productGridProductsRecord,
                                                                            checkboxStatus:
                                                                                'show',
                                                                            checkboxComponentType:
                                                                                'wishlist',
                                                                            wishlistDatatype:
                                                                                allWishlist1Item,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (((allWishlist1Item.entityType ==
                                                                            'designer') ||
                                                                        (allWishlist1Item.entityType ==
                                                                            'creator')) &&
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child:
                                                                        Container(
                                                                      width: _model
                                                                          .gridWidth,
                                                                      height:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          DesignerGridWidget(
                                                                        key: Key(
                                                                            'Keyvhs_${allWishlist1Index}_of_${allWishlist1.length}'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 12.0))
                                              .addToStart(
                                                  SizedBox(height: 12.0))
                                              .addToEnd(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (context) {
                                                        final allWishlist1 =
                                                            (currentUserDocument
                                                                        ?.userWishlistItem
                                                                        ?.toList() ??
                                                                    [])
                                                                .where(
                                                                    (e) => () {
                                                                          if (_model.choiceChipsValue1 ==
                                                                              'Product') {
                                                                            return (e.entityType ==
                                                                                'product');
                                                                          } else if (_model.choiceChipsValue1 ==
                                                                              'Designer') {
                                                                            return (e.entityType ==
                                                                                'designer');
                                                                          } else if (_model.choiceChipsValue1 ==
                                                                              'Creator') {
                                                                            return (e.entityType ==
                                                                                'creator');
                                                                          } else {
                                                                            return true;
                                                                          }
                                                                        }())
                                                                .toList();

                                                        return Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              allWishlist1
                                                                  .length,
                                                              (allWishlist1Index) {
                                                            final allWishlist1Item =
                                                                allWishlist1[
                                                                    allWishlist1Index];
                                                            return Stack(
                                                              children: [
                                                                if (allWishlist1Item
                                                                        .entityType ==
                                                                    'product')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            24.0),
                                                                    child:
                                                                        Container(
                                                                      width: _model
                                                                          .gridWidth,
                                                                      height:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ProductsRecord>>(
                                                                        stream:
                                                                            queryProductsRecord(
                                                                          queryBuilder: (productsRecord) => productsRecord
                                                                              .where(
                                                                                'status',
                                                                                isEqualTo: 'active',
                                                                              )
                                                                              .where(
                                                                                'product_id',
                                                                                isEqualTo: allWishlist1Item.wishlistItemId,
                                                                              ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 150.0,
                                                                              child: LoadingAnimationWidget(),
                                                                            );
                                                                          }
                                                                          List<ProductsRecord>
                                                                              productGridProductsRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final productGridProductsRecord = productGridProductsRecordList.isNotEmpty
                                                                              ? productGridProductsRecordList.first
                                                                              : null;

                                                                          return ProductGridWidget(
                                                                            key:
                                                                                Key('Keyj5s_${allWishlist1Index}_of_${allWishlist1.length}'),
                                                                            product:
                                                                                productGridProductsRecord,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((allWishlist1Item
                                                                            .entityType ==
                                                                        'designer') ||
                                                                    (allWishlist1Item
                                                                            .entityType ==
                                                                        'creator'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child:
                                                                        Container(
                                                                      width: _model
                                                                          .gridWidth,
                                                                      height:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          DesignerGridWidget(
                                                                        key: Key(
                                                                            'Keylm8_${allWishlist1Index}_of_${allWishlist1.length}'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 12.0))
                                              .addToStart(
                                                  SizedBox(height: 12.0))
                                              .addToEnd(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 12.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(),
                                                child: FlutterFlowChoiceChips(
                                                  options: [
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '9wt3ilyc' /* All */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '94jmk331' /* Designer */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '3r9xst70' /* Creator */,
                                                    )),
                                                    ChipData(FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '33zgir4b' /* Product */,
                                                    ))
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .choiceChipsValue2 =
                                                          val?.firstOrNull),
                                                  selectedChipStyle: ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    iconSize: 16.0,
                                                    elevation: 0.0,
                                                    borderWidth: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  unselectedChipStyle:
                                                      ChipStyle(
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    iconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    iconSize: 16.0,
                                                    elevation: 0.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .border,
                                                    borderWidth: 1.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  chipSpacing: 8.0,
                                                  rowSpacing: 8.0,
                                                  multiselect: false,
                                                  initialized: _model
                                                          .choiceChipsValue2 !=
                                                      null,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  controller: _model
                                                          .choiceChipsValueController2 ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7q0r80pj' /* All */,
                                                      )
                                                    ],
                                                  ),
                                                  wrapped: false,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (context) {
                                                        final allViewed1 =
                                                            (currentUserDocument
                                                                        ?.userRecentViews
                                                                        ?.toList() ??
                                                                    [])
                                                                .where(
                                                                    (e) => () {
                                                                          if (_model.choiceChipsValue2 ==
                                                                              'Product') {
                                                                            return (e.viewedEntityType ==
                                                                                'product');
                                                                          } else if (_model.choiceChipsValue2 ==
                                                                              'Designer') {
                                                                            return (e.viewedEntityType ==
                                                                                'designer');
                                                                          } else if (_model.choiceChipsValue2 ==
                                                                              'Creator') {
                                                                            return (e.viewedEntityType ==
                                                                                'creator');
                                                                          } else {
                                                                            return true;
                                                                          }
                                                                        }())
                                                                .toList();

                                                        return Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              allViewed1.length,
                                                              (allViewed1Index) {
                                                            final allViewed1Item =
                                                                allViewed1[
                                                                    allViewed1Index];
                                                            return Stack(
                                                              children: [
                                                                if (allViewed1Item
                                                                        .viewedEntityType ==
                                                                    'product')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            24.0),
                                                                    child:
                                                                        Container(
                                                                      width: _model
                                                                          .gridWidth,
                                                                      height:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ProductsRecord>>(
                                                                        stream:
                                                                            queryProductsRecord(
                                                                          queryBuilder: (productsRecord) => productsRecord
                                                                              .where(
                                                                                'status',
                                                                                isEqualTo: 'active',
                                                                              )
                                                                              .where(
                                                                                'product_id',
                                                                                isEqualTo: allViewed1Item.viewedItemId,
                                                                              ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              height: 150.0,
                                                                              child: LoadingAnimationWidget(),
                                                                            );
                                                                          }
                                                                          List<ProductsRecord>
                                                                              productGridProductsRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final productGridProductsRecord = productGridProductsRecordList.isNotEmpty
                                                                              ? productGridProductsRecordList.first
                                                                              : null;

                                                                          return ProductGridWidget(
                                                                            key:
                                                                                Key('Key4ga_${allViewed1Index}_of_${allViewed1.length}'),
                                                                            product:
                                                                                productGridProductsRecord,
                                                                            checkboxStatus:
                                                                                'show',
                                                                            checkboxComponentType:
                                                                                'recent',
                                                                            recentDatatype:
                                                                                allViewed1Item,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((allViewed1Item
                                                                            .viewedEntityType ==
                                                                        'designer') ||
                                                                    (allViewed1Item
                                                                            .viewedEntityType ==
                                                                        'creator'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            16.0),
                                                                    child:
                                                                        Container(
                                                                      width: _model
                                                                          .gridWidth,
                                                                      height:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          DesignerGridWidget(
                                                                        key: Key(
                                                                            'Keyf7d_${allViewed1Index}_of_${allViewed1.length}'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 12.0))
                                              .addToStart(
                                                  SizedBox(height: 12.0))
                                              .addToEnd(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Builder(
                              builder: (context) {
                                final allWishlist1 = (currentUserDocument
                                            ?.userWishlistItem
                                            ?.toList() ??
                                        [])
                                    .where((e) => () {
                                          if (_model.choiceChipsValue1 ==
                                              'Product') {
                                            return (e.entityType == 'product');
                                          } else if (_model.choiceChipsValue1 ==
                                              'Designer') {
                                            return (e.entityType == 'designer');
                                          } else if (_model.choiceChipsValue1 ==
                                              'Creator') {
                                            return (e.entityType == 'creator');
                                          } else {
                                            return true;
                                          }
                                        }())
                                    .toList();
                                if (allWishlist1.isEmpty) {
                                  return Center(
                                    child: EmptyWidget(
                                      messageOne: FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Oops! Your wishlist is feeling lonely!',
                                        arText:
                                            'عفواً! قائمة أمنياتك تشعر بالوحدة!',
                                      ),
                                      image:
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/salf246xetz8/Frame_2087324937.png',
                                      messageTwo: FFLocalizations.of(context)
                                          .getVariableText(
                                        enText:
                                            'Start adding your dream picks now!\"',
                                        arText:
                                            'ابدأ بإضافة اختيارات أحلامك الآن!',
                                      ),
                                      buttonText: FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Start adding',
                                        arText: 'ابدأ في الإضافة',
                                      ),
                                    ),
                                  );
                                }

                                return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 24.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(allWishlist1.length,
                                      (allWishlist1Index) {
                                    final allWishlist1Item =
                                        allWishlist1[allWishlist1Index];
                                    return Stack(
                                      children: [
                                        if (allWishlist1Item.entityType ==
                                            'product')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 24.0),
                                            child: Container(
                                              width: _model.gridWidth,
                                              height: 280.0,
                                              decoration: BoxDecoration(),
                                              child: StreamBuilder<
                                                  List<ProductsRecord>>(
                                                stream: queryProductsRecord(
                                                  queryBuilder:
                                                      (productsRecord) =>
                                                          productsRecord
                                                              .where(
                                                                'status',
                                                                isEqualTo:
                                                                    'active',
                                                              )
                                                              .where(
                                                                'product_id',
                                                                isEqualTo:
                                                                    allWishlist1Item
                                                                        .wishlistItemId,
                                                              ),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 150.0,
                                                      child:
                                                          LoadingAnimationWidget(),
                                                    );
                                                  }
                                                  List<ProductsRecord>
                                                      productGridProductsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final productGridProductsRecord =
                                                      productGridProductsRecordList
                                                              .isNotEmpty
                                                          ? productGridProductsRecordList
                                                              .first
                                                          : null;

                                                  return ProductGridWidget(
                                                    key: Key(
                                                        'Keyo03_${allWishlist1Index}_of_${allWishlist1.length}'),
                                                    product:
                                                        productGridProductsRecord,
                                                    checkboxStatus: 'show',
                                                    checkboxComponentType:
                                                        'wishlist',
                                                    wishlistDatatype:
                                                        allWishlist1Item,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if ((allWishlist1Item.entityType ==
                                                'designer') ||
                                            (allWishlist1Item.entityType ==
                                                'creator'))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: _model.gridWidth,
                                              height: 280.0,
                                              decoration: BoxDecoration(),
                                              child: DesignerGridWidget(
                                                key: Key(
                                                    'Keypit_${allWishlist1Index}_of_${allWishlist1.length}'),
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 16.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
