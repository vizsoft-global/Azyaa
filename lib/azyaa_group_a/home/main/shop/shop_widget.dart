import '/auth/base_auth_user_provider.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/category_small_grid/category_small_grid_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/ui/salebanner/salebanner_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'shop_model.dart';
export 'shop_model.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({super.key});

  static String routeName = 'Shop';
  static String routePath = '/azyaa-shop';

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  late ShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().UserFilter = UserFiltersStruct();
    });

    _model.searchFiledsTextController ??= TextEditingController();
    _model.searchFiledsFocusNode ??= FocusNode();

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
        title: 'Shop',
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
                      updateOnChange: true,
                      child: UniversalAppBarWidget(
                        backButtonStatus: false,
                        title: FFLocalizations.of(context).getText(
                          'zukbwsf4' /* Shop */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: false,
                        navigationFrom: 'shop',
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
                alignment: const AlignmentDirectional(0.0, 1.0),
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (loggedIn)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller:
                                            _model.searchFiledsTextController,
                                        focusNode: _model.searchFiledsFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.searchFiledsTextController',
                                          const Duration(milliseconds: 2000),
                                          () async {
                                            if (_model
                                                    .searchFiledsTextController
                                                    .text !=
                                                '') {
                                              safeSetState(() => _model
                                                  .algoliaSearchResults = null);
                                              await ProductsRecord.search(
                                                term: _model
                                                    .searchFiledsTextController
                                                    .text,
                                                maxResults: 10,
                                              )
                                                  .then((r) => _model
                                                      .algoliaSearchResults = r)
                                                  .onError((_, __) => _model
                                                          .algoliaSearchResults =
                                                      [])
                                                  .whenComplete(() =>
                                                      safeSetState(() {}));

                                              _model.searchStatus = true;
                                              safeSetState(() {});
                                            } else {
                                              _model.searchStatus = false;
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'wtd5s078' /* Search Products */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'almarai',
                                                    color: const Color(0xFF575454),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent2,
                                          suffixIcon: Icon(
                                            FFIcons.ksearch,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .searchFiledsTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              if (_model.searchStatus == false)
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.searchStatus == false)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 24.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 150.0,
                                                  child: Stack(
                                                    children: [
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
                                                          context.pushNamed(
                                                            DesignersListWidget
                                                                .routeName,
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
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '76onb21h' /* Shop by */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'almarai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '43apeb42' /* DESIGNERS */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'almarai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .velvet,
                                                                        fontSize:
                                                                            () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return 24.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return 24.0;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return 28.0;
                                                                          } else {
                                                                            return 28.0;
                                                                          }
                                                                        }(),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/2148875359-Photoroom_1.png',
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      alignment:
                                                                          const Alignment(
                                                                              0.0,
                                                                              1.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                                                Expanded(
                                                  child: Container(
                                                    height: 150.0,
                                                    child: Stack(
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              CreatorsWidget
                                                                  .routeName,
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
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ayh7mntr' /* Shop by */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'soc1z6fs' /* CREATORS */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 24.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 24.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 28.0;
                                                                            } else {
                                                                              return 28.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      45.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/creator1_1_(3).png',
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                              alignment:
                                                                  const Alignment(
                                                                      0.0, 1.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              Expanded(
                                                child: Container(
                                                  height: 150.0,
                                                  child: Stack(
                                                    children: [
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
                                                          context.pushNamed(
                                                            StoresListWidget
                                                                .routeName,
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
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent2,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '447tret0' /* Shop by */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'iwz05azw' /* STORES */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).velvet,
                                                                          fontSize:
                                                                              () {
                                                                            if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointSmall) {
                                                                              return 24.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium) {
                                                                              return 24.0;
                                                                            } else if (MediaQuery.sizeOf(context).width <
                                                                                kBreakpointLarge) {
                                                                              return 28.0;
                                                                            } else {
                                                                              return 28.0;
                                                                            }
                                                                          }(),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Group_2085662550_(1)-min.png',
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      alignment: Alignment(
                                                                          valueOrDefault<double>(
                                                                            MediaQuery.sizeOf(context).width < kBreakpointMedium
                                                                                ? -1.0
                                                                                : 0.0,
                                                                            0.0,
                                                                          ),
                                                                          1.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 16.0)),
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
                                          model: _model.salebannerModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: const SalebannerWidget(),
                                        ),
                                      if (_model.searchStatus == false)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 24.0),
                                          child: FutureBuilder<
                                              List<CategoryRecord>>(
                                            future: (_model
                                                        .firestoreRequestCompleter1 ??=
                                                    Completer<
                                                        List<CategoryRecord>>()
                                                      ..complete(
                                                          queryCategoryRecordOnce(
                                                        queryBuilder: (categoryRecord) =>
                                                            categoryRecord
                                                                .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'active',
                                                                )
                                                                .where(
                                                                  'category_marketing.is_featue_product',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .orderBy(
                                                                    'created_at',
                                                                    descending:
                                                                        true),
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 150.0,
                                                    child:
                                                        const LoadingAnimationWidget(),
                                                  ),
                                                );
                                              }
                                              List<CategoryRecord>
                                                  categoryCategoryRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Visibility(
                                                  visible: (_model
                                                              .searchStatus ==
                                                          false) &&
                                                      (categoryCategoryRecordList
                                                              .length >
                                                          0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'yx0nbfsn' /* Categories  */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
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
                                                                context
                                                                    .pushNamed(
                                                                  ProductListWidget
                                                                      .routeName,
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
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .navigate_next_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final categoryList =
                                                                categoryCategoryRecordList
                                                                    .toList();

                                                            return RefreshIndicator(
                                                              color: const Color(
                                                                  0xFF7F56D9),
                                                              onRefresh:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.firestoreRequestCompleter1 =
                                                                        null);
                                                                await _model
                                                                    .waitForFirestoreRequestCompleted1(
                                                                        minWait:
                                                                            300,
                                                                        maxWait:
                                                                            600);
                                                              },
                                                              child: GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium
                                                                          ? 3
                                                                          : 6,
                                                                  crossAxisSpacing:
                                                                      8.0,
                                                                  mainAxisSpacing:
                                                                      16.0,
                                                                  childAspectRatio:
                                                                      1.0,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    categoryList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        categoryListIndex) {
                                                                  final categoryListItem =
                                                                      categoryList[
                                                                          categoryListIndex];
                                                                  return CategorySmallGridWidget(
                                                                    key: Key(
                                                                        'Keydzw_${categoryListIndex}_of_${categoryList.length}'),
                                                                    category:
                                                                        categoryListItem,
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(const SizedBox(
                                                            height: 12.0))
                                                        .addToStart(const SizedBox(
                                                            height: 8.0))
                                                        .addToEnd(const SizedBox(
                                                            height: 8.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (_model.searchStatus == false)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 24.0),
                                          child: FutureBuilder<
                                              List<ProductsRecord>>(
                                            future: (_model
                                                        .firestoreRequestCompleter2 ??=
                                                    Completer<
                                                        List<ProductsRecord>>()
                                                      ..complete(
                                                          queryProductsRecordOnce(
                                                        queryBuilder: (productsRecord) =>
                                                            productsRecord
                                                                .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'active',
                                                                )
                                                                .where(
                                                                  'product_marketing.is_popular_product',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .orderBy(
                                                                    'created_at',
                                                                    descending:
                                                                        true),
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Container(
                                                  width: 0.0,
                                                  height: 0.0,
                                                  child: const BlankLoadingWidget(),
                                                );
                                              }
                                              List<ProductsRecord>
                                                  popularProductListProductsRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      popularProductListProductsRecordList
                                                              .length >
                                                          0,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'vmlldeif' /* Popular  */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'almarai',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'udcpl7k5' /* Picks */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'almarai',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
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
                                                                      context
                                                                          .pushNamed(
                                                                        ProductListWidget
                                                                            .routeName,
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
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(4.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .navigate_next_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
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
                                                                context
                                                                    .pushNamed(
                                                                  ProductListWidget
                                                                      .routeName,
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
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'bo9w3xj8' /* View All */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final popularPicks =
                                                                  popularProductListProductsRecordList
                                                                      .toList();

                                                              return RefreshIndicator(
                                                                color: const Color(
                                                                    0xFF7F56D9),
                                                                onRefresh:
                                                                    () async {
                                                                  safeSetState(() =>
                                                                      _model.firestoreRequestCompleter2 =
                                                                          null);
                                                                  await _model.waitForFirestoreRequestCompleted2(
                                                                      minWait:
                                                                          300,
                                                                      maxWait:
                                                                          600);
                                                                },
                                                                child: GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        MediaQuery.sizeOf(context).width <
                                                                                kBreakpointMedium
                                                                            ? 2
                                                                            : 4,
                                                                    crossAxisSpacing:
                                                                        8.0,
                                                                    mainAxisSpacing:
                                                                        24.0,
                                                                    childAspectRatio:
                                                                        0.58,
                                                                  ),
                                                                  primary:
                                                                      false,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      popularPicks
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          popularPicksIndex) {
                                                                    final popularPicksItem =
                                                                        popularPicks[
                                                                            popularPicksIndex];
                                                                    return ProductGridWidget(
                                                                      key: Key(
                                                                          'Keymfx_${popularPicksIndex}_of_${popularPicks.length}'),
                                                                      product:
                                                                          popularPicksItem,
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(const SizedBox(
                                                            height: 12.0))
                                                        .addToStart(const SizedBox(
                                                            height: 8.0))
                                                        .addToEnd(const SizedBox(
                                                            height: 8.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              if (_model.searchStatus == true)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
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
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model
                                                                  .algoliaSearchResults
                                                                  ?.where((e) =>
                                                                      e.status ==
                                                                      'active')
                                                                  .toList()
                                                                  .length
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
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
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'mnxm3yx9' /*  results */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
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
                                                                      'almarai',
                                                                  letterSpacing:
                                                                      0.0,
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
                                                          context.pushNamed(
                                                            ProductListWidget
                                                                .routeName,
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
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    4.0),
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
                                                      ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
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
                                                      context.pushNamed(
                                                        ProductListWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              const TransitionInfo(
                                                            hasTransition: true,
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
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7jplrpub' /* View All */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                if (_model.algoliaSearchResults
                                                        ?.where((e) =>
                                                            e.status ==
                                                            'active')
                                                        .toList() ==
                                                    null) {
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
                                                final searchPicks = _model
                                                        .algoliaSearchResults
                                                        ?.where((e) =>
                                                            e.status ==
                                                            'active')
                                                        .toList()
                                                        .toList() ??
                                                    [];

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
                                                    childAspectRatio: 0.58,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: searchPicks.length,
                                                  itemBuilder: (context,
                                                      searchPicksIndex) {
                                                    final searchPicksItem =
                                                        searchPicks[
                                                            searchPicksIndex];
                                                    return ProductGridWidget(
                                                      key: Key(
                                                          'Key0qi_${searchPicksIndex}_of_${searchPicks.length}'),
                                                      product: searchPicksItem,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ]
                                            .divide(const SizedBox(height: 12.0))
                                            .addToStart(const SizedBox(height: 8.0))
                                            .addToEnd(const SizedBox(height: 8.0)),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ].addToStart(const SizedBox(height: 16.0)),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.universalNavigationBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const UniversalNavigationBarWidget(
                      navigation: 'shop',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
