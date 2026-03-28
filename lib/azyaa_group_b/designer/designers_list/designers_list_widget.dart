import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'designers_list_model.dart';
export 'designers_list_model.dart';

class DesignersListWidget extends StatefulWidget {
  const DesignersListWidget({super.key});

  static String routeName = 'Designers-List';
  static String routePath = '/azyaa-designers-list';

  @override
  State<DesignersListWidget> createState() => _DesignersListWidgetState();
}

class _DesignersListWidgetState extends State<DesignersListWidget>
    with TickerProviderStateMixin {
  late DesignersListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesignersListModel());

    _model.designersController = TabController(
      vsync: this,
      length: 5,
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
        title: 'Designers-List',
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
                      updateOnChange: true,
                      child: UniversalAppBarWidget(
                        backButtonStatus: false,
                        title: FFLocalizations.of(context).getText(
                          'knh5m8h4' /* Designers Hub  */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: true,
                        navigationFrom: 'designerList',
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
                  StreamBuilder<List<SettingsRecord>>(
                    stream: querySettingsRecord(
                      queryBuilder: (settingsRecord) => settingsRecord.where(
                        'type',
                        isEqualTo: 'Company',
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
                      List<SettingsRecord> columnSettingsRecordList =
                          snapshot.data!;
                      final columnSettingsRecord =
                          columnSettingsRecordList.isNotEmpty
                              ? columnSettingsRecordList.first
                              : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if ((columnSettingsRecord?.settingsUserappMenu
                                      ?.isDesignerConsultation ==
                                  true) &&
                              responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
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
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 8.0, 16.0, 8.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'j6wlrhrb' /* Confusion while selecting 
dre... */
                                                  ,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () {
                                                print('consult pressed ...');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '9d8euxjc' /* Consult Now */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .velvet,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
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
                                  16.0, 0.0, 16.0, 0.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Stack(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                            'x0m15gce' /* Our  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'ynfyymby' /* Designers */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
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
                                                  Expanded(
                                                    child: Container(
                                                      width: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'cr2b1tlr' /* Discover collections from our ... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.7,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    valueOrDefault<
                                                                        double>(
                                                                      (MediaQuery.sizeOf(context).width < kBreakpointMedium
                                                                              ? 60
                                                                              : 12)
                                                                          .toDouble(),
                                                                      0.0,
                                                                    ),
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '4fly72sy' /* Confusion while 
selecting dre... */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Aileron',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed: () {
                                                                print(
                                                                    'consult pressed ...');
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '8m1y3j9k' /* Consult Now */,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 30.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Aileron',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [],
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 0.0, 12.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/2148875359-Photoroom_1.png',
                                                width: 130.0,
                                                height: 180.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 1.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Expanded(
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) => usersRecord
                                    .where(
                                      'status',
                                      isEqualTo: 'Published',
                                    )
                                    .where(
                                      'user_role',
                                      isEqualTo: 'Designer',
                                    ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 150.0,
                                    child: LoadingAnimationWidget(),
                                  );
                                }
                                List<UsersRecord> designersUsersRecordList =
                                    snapshot.data!
                                        .where((u) => u.uid != currentUserUid)
                                        .toList();

                                return Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
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
                                              fontFamily: 'Aileron',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        tabs: [
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'pj1esee6' /* All Designer  */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'owodwezx' /* Store */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'c1ru0ojg' /* Formal */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'nophft4b' /* Wedding */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'nfm0h86b' /* Party Wear */,
                                            ),
                                          ),
                                        ],
                                        controller: _model.designersController,
                                        onTap: (i) async {
                                          [
                                            () async {},
                                            () async {},
                                            () async {
                                              _model.categoryName = 'Formal';
                                              safeSetState(() {});
                                            },
                                            () async {
                                              _model.categoryName = 'Wedding';
                                              safeSetState(() {});
                                            },
                                            () async {
                                              _model.categoryName =
                                                  'Party Wear';
                                              safeSetState(() {});
                                            }
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.designersController,
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'pwu5bnzr' /* All */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'tucde2pp' /* Discover */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'vvmg98id' /* Following */,
                                                      ))
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .allDesignerChoiceChipsValue =
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
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .allDesignerChoiceChipsValue !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .allDesignerChoiceChipsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'hsj1iqj2' /* All */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Builder(
                                                            builder: (context) {
                                                              final allDesignerList = designersUsersRecordList
                                                                  .where((e) => _model.allDesignerChoiceChipsValue ==
                                                                          FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                'All',
                                                                            arText:
                                                                                'الجميع',
                                                                          )
                                                                      ? true
                                                                      : ((currentUserDocument?.userDesignerFollowing?.toList() ?? []).contains(e.reference) ==
                                                                          (_model.allDesignerChoiceChipsValue ==
                                                                                  FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Discover',
                                                                                    arText: 'يكتشف',
                                                                                  )
                                                                              ? false
                                                                              : true)))
                                                                  .toList()
                                                                  .sortedList(keyOf: (e) => e.createdTime!, desc: false)
                                                                  .toList();

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    allDesignerList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        allDesignerListIndex) {
                                                                  final allDesignerListItem =
                                                                      allDesignerList[
                                                                          allDesignerListIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
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
                                                                          DesignerWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'designer':
                                                                                serializeParam(
                                                                              allDesignerListItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    allDesignerListItem.designerMainInfo.designerInfo.brandPhoto != null && allDesignerListItem.designerMainInfo.designerInfo.brandPhoto != '' ? allDesignerListItem.designerMainInfo.designerInfo.brandPhoto : allDesignerListItem.photoUrl,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/m1a9p5ryq5fw/Azyaa_Designer_Default_Piccture_-_User_App__designerlistpage(1).png',
                                                                                  ),
                                                                                  width: 110.0,
                                                                                  height: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  allDesignerListItem.designerMainInfo.designerInfo.name != null && allDesignerListItem.designerMainInfo.designerInfo.name != '' ? allDesignerListItem.designerMainInfo.designerInfo.name : allDesignerListItem.displayName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                child: Text(
                                                                                                  allDesignerListItem.designerMainInfo.designerInfo.bio.maybeHandleOverflow(
                                                                                                    maxChars: 100,
                                                                                                    replacement: '…',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
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
                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'c1slh3i5' /* Best Rated */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    if (allDesignerListItem.designerMainInfo.designerInfo.brandGallery.length > 0)
                                                                                      Container(
                                                                                        width: 190.0,
                                                                                        height: 45.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final brandGalleryList = allDesignerListItem.designerMainInfo.designerInfo.brandGallery.toList();

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: brandGalleryList.length,
                                                                                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                                                                                              itemBuilder: (context, brandGalleryListIndex) {
                                                                                                final brandGalleryListItem = brandGalleryList[brandGalleryListIndex];
                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      brandGalleryListItem,
                                                                                                      width: 40.0,
                                                                                                      height: 45.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 12.0))
                                                  .addToStart(
                                                      SizedBox(height: 12.0))
                                                  .addToEnd(
                                                      SizedBox(height: 12.0)),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'kbntv617' /* All */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '28n811cb' /* Discover */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'gy6luqfa' /* Following */,
                                                      ))
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .storeDesignerChoiceChipsValue =
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
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .storeDesignerChoiceChipsValue !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .storeDesignerChoiceChipsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rbpyuu4q' /* All */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Builder(
                                                            builder: (context) {
                                                              final storeDesignerList = designersUsersRecordList
                                                                  .where((e) =>
                                                                      (e.designerMainInfo.designerInfo.storeAvailable == true) &&
                                                                      (_model.storeDesignerChoiceChipsValue ==
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'All',
                                                                                arText: 'الجميع',
                                                                              )
                                                                          ? true
                                                                          : ((currentUserDocument?.userDesignerFollowing?.toList() ?? []).contains(e.reference) ==
                                                                              (_model.storeDesignerChoiceChipsValue ==
                                                                                      FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Discover',
                                                                                        arText: 'يكتشف',
                                                                                      )
                                                                                  ? false
                                                                                  : true))))
                                                                  .toList()
                                                                  .sortedList(keyOf: (e) => e.createdTime!, desc: false)
                                                                  .toList();

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    storeDesignerList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        storeDesignerListIndex) {
                                                                  final storeDesignerListItem =
                                                                      storeDesignerList[
                                                                          storeDesignerListIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
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
                                                                          DesignerWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'designer':
                                                                                serializeParam(
                                                                              storeDesignerListItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  storeDesignerListItem.designerMainInfo.designerInfo.brandPhoto != null && storeDesignerListItem.designerMainInfo.designerInfo.brandPhoto != '' ? storeDesignerListItem.designerMainInfo.designerInfo.brandPhoto : storeDesignerListItem.photoUrl,
                                                                                  width: 110.0,
                                                                                  height: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  storeDesignerListItem.designerMainInfo.designerInfo.name != null && storeDesignerListItem.designerMainInfo.designerInfo.name != '' ? storeDesignerListItem.designerMainInfo.designerInfo.name : storeDesignerListItem.displayName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                child: Text(
                                                                                                  storeDesignerListItem.designerMainInfo.designerInfo.bio.maybeHandleOverflow(
                                                                                                    maxChars: 20,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
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
                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'pcgm643a' /* Best Rated */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    if (storeDesignerListItem.designerMainInfo.designerInfo.brandGallery.length > 0)
                                                                                      Container(
                                                                                        width: 190.0,
                                                                                        height: 45.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final brandGalleryList = storeDesignerListItem.designerMainInfo.designerInfo.brandGallery.toList();

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: brandGalleryList.length,
                                                                                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                                                                                              itemBuilder: (context, brandGalleryListIndex) {
                                                                                                final brandGalleryListItem = brandGalleryList[brandGalleryListIndex];
                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      brandGalleryListItem,
                                                                                                      width: 40.0,
                                                                                                      height: 45.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 12.0))
                                                  .addToStart(
                                                      SizedBox(height: 12.0))
                                                  .addToEnd(
                                                      SizedBox(height: 12.0)),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'ps7h58i4' /* All */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'kbahpuim' /* Discover */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'f51lm7sx' /* Following */,
                                                      ))
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .formalDesignerChoiceChipsValue1 =
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
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .formalDesignerChoiceChipsValue1 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .formalDesignerChoiceChipsValueController1 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ez53m93z' /* All */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Builder(
                                                            builder: (context) {
                                                              final partyDesignerList = designersUsersRecordList
                                                                  .where((e) =>
                                                                      (e.designerMainInfo.designerInfo.contentCategoryList.where((e) => e == _model.categoryName).toList().length > 0) &&
                                                                      (_model.formalDesignerChoiceChipsValue1 ==
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'All',
                                                                                arText: 'الجميع',
                                                                              )
                                                                          ? true
                                                                          : ((currentUserDocument?.userDesignerFollowing?.toList() ?? []).contains(e.reference) ==
                                                                              (_model.storeDesignerChoiceChipsValue ==
                                                                                      FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Discover',
                                                                                        arText: 'يكتشف',
                                                                                      )
                                                                                  ? false
                                                                                  : true))))
                                                                  .toList()
                                                                  .sortedList(keyOf: (e) => e.createdTime!, desc: false)
                                                                  .toList();

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    partyDesignerList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        partyDesignerListIndex) {
                                                                  final partyDesignerListItem =
                                                                      partyDesignerList[
                                                                          partyDesignerListIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
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
                                                                          DesignerWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'designer':
                                                                                serializeParam(
                                                                              partyDesignerListItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto != null && partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto != '' ? partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto : partyDesignerListItem.photoUrl,
                                                                                  width: 110.0,
                                                                                  height: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  partyDesignerListItem.designerMainInfo.designerInfo.name != null && partyDesignerListItem.designerMainInfo.designerInfo.name != '' ? partyDesignerListItem.designerMainInfo.designerInfo.name : partyDesignerListItem.displayName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'xi578rmv' /* Casual Designer  */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
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
                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'whg2jdvd' /* Best Rated */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    if (partyDesignerListItem.designerMainInfo.designerInfo.brandGallery.length > 0)
                                                                                      Container(
                                                                                        width: 190.0,
                                                                                        height: 45.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final brandGalleryList = partyDesignerListItem.designerMainInfo.designerInfo.brandGallery.toList();

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: brandGalleryList.length,
                                                                                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                                                                                              itemBuilder: (context, brandGalleryListIndex) {
                                                                                                final brandGalleryListItem = brandGalleryList[brandGalleryListIndex];
                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      brandGalleryListItem,
                                                                                                      width: 40.0,
                                                                                                      height: 45.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 12.0))
                                                  .addToStart(
                                                      SizedBox(height: 12.0))
                                                  .addToEnd(
                                                      SizedBox(height: 12.0)),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'oytsxush' /* All */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'w14903nt' /* Discover */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'hpezoz3d' /* Following */,
                                                      ))
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .formalDesignerChoiceChipsValue2 =
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
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .formalDesignerChoiceChipsValue2 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .formalDesignerChoiceChipsValueController2 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4egs6ue7' /* All */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Builder(
                                                            builder: (context) {
                                                              final partyDesignerList = designersUsersRecordList
                                                                  .where((e) =>
                                                                      (e.designerMainInfo.designerInfo.contentCategoryList.where((e) => e == _model.categoryName).toList().length > 0) &&
                                                                      (_model.formalDesignerChoiceChipsValue2 ==
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'All',
                                                                                arText: 'الجميع',
                                                                              )
                                                                          ? true
                                                                          : ((currentUserDocument?.userDesignerFollowing?.toList() ?? []).contains(e.reference) ==
                                                                              (_model.storeDesignerChoiceChipsValue ==
                                                                                      FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Discover',
                                                                                        arText: 'يكتشف',
                                                                                      )
                                                                                  ? false
                                                                                  : true))))
                                                                  .toList()
                                                                  .sortedList(keyOf: (e) => e.createdTime!, desc: false)
                                                                  .toList();

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    partyDesignerList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        partyDesignerListIndex) {
                                                                  final partyDesignerListItem =
                                                                      partyDesignerList[
                                                                          partyDesignerListIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
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
                                                                          DesignerWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'designer':
                                                                                serializeParam(
                                                                              partyDesignerListItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto != null && partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto != '' ? partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto : partyDesignerListItem.photoUrl,
                                                                                  width: 110.0,
                                                                                  height: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  partyDesignerListItem.designerMainInfo.designerInfo.name != null && partyDesignerListItem.designerMainInfo.designerInfo.name != '' ? partyDesignerListItem.designerMainInfo.designerInfo.name : partyDesignerListItem.displayName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'w3y5k180' /* Casual Designer  */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
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
                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'iq2iob1u' /* Best Rated */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    if (partyDesignerListItem.designerMainInfo.designerInfo.brandGallery.length > 0)
                                                                                      Container(
                                                                                        width: 190.0,
                                                                                        height: 45.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final brandGalleryList = partyDesignerListItem.designerMainInfo.designerInfo.brandGallery.toList();

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: brandGalleryList.length,
                                                                                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                                                                                              itemBuilder: (context, brandGalleryListIndex) {
                                                                                                final brandGalleryListItem = brandGalleryList[brandGalleryListIndex];
                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      brandGalleryListItem,
                                                                                                      width: 40.0,
                                                                                                      height: 45.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 12.0))
                                                  .addToStart(
                                                      SizedBox(height: 12.0))
                                                  .addToEnd(
                                                      SizedBox(height: 12.0)),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'hn7zrls9' /* All */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '86tx2xmf' /* Discover */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'x4gqbhns' /* Following */,
                                                      ))
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .partyDesignerChoiceChipsValue =
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
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Aileron',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                    ),
                                                    chipSpacing: 8.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .partyDesignerChoiceChipsValue !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .partyDesignerChoiceChipsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ovs14rcm' /* All */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        AuthUserStreamWidget(
                                                          builder: (context) =>
                                                              Builder(
                                                            builder: (context) {
                                                              final partyDesignerList = designersUsersRecordList
                                                                  .where((e) =>
                                                                      (e.designerMainInfo.designerInfo.contentCategoryList.where((e) => e == _model.categoryName).toList().length > 0) &&
                                                                      (_model.partyDesignerChoiceChipsValue ==
                                                                              FFLocalizations.of(context).getVariableText(
                                                                                enText: 'All',
                                                                                arText: 'الجميع',
                                                                              )
                                                                          ? true
                                                                          : ((currentUserDocument?.userDesignerFollowing?.toList() ?? []).contains(e.reference) ==
                                                                              (_model.storeDesignerChoiceChipsValue ==
                                                                                      FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Discover',
                                                                                        arText: 'يكتشف',
                                                                                      )
                                                                                  ? false
                                                                                  : true))))
                                                                  .toList()
                                                                  .sortedList(keyOf: (e) => e.createdTime!, desc: false)
                                                                  .toList();

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    partyDesignerList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        partyDesignerListIndex) {
                                                                  final partyDesignerListItem =
                                                                      partyDesignerList[
                                                                          partyDesignerListIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
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
                                                                          DesignerWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'designer':
                                                                                serializeParam(
                                                                              partyDesignerListItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).border,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto != null && partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto != '' ? partyDesignerListItem.designerMainInfo.designerInfo.brandPhoto : partyDesignerListItem.photoUrl,
                                                                                  width: 110.0,
                                                                                  height: 90.0,
                                                                                  fit: BoxFit.cover,
                                                                                  alignment: Alignment(0.0, 0.0),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                child: Text(
                                                                                                  partyDesignerListItem.designerMainInfo.designerInfo.name != null && partyDesignerListItem.designerMainInfo.designerInfo.name != '' ? partyDesignerListItem.designerMainInfo.designerInfo.name : partyDesignerListItem.displayName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '0ilbyaqs' /* Casual Designer  */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
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
                                                                                            alignment: AlignmentDirectional(1.0, -1.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'cykz9jxn' /* Best Rated */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Aileron',
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                    if (partyDesignerListItem.designerMainInfo.designerInfo.brandGallery.length > 0)
                                                                                      Container(
                                                                                        width: 190.0,
                                                                                        height: 45.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Builder(
                                                                                          builder: (context) {
                                                                                            final brandGalleryList = partyDesignerListItem.designerMainInfo.designerInfo.brandGallery.toList();

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              primary: false,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              itemCount: brandGalleryList.length,
                                                                                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                                                                                              itemBuilder: (context, brandGalleryListIndex) {
                                                                                                final brandGalleryListItem = brandGalleryList[brandGalleryListIndex];
                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).border,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    child: Image.network(
                                                                                                      brandGalleryListItem,
                                                                                                      width: 40.0,
                                                                                                      height: 45.0,
                                                                                                      fit: BoxFit.contain,
                                                                                                      alignment: Alignment(0.0, 0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 12.0))
                                                  .addToStart(
                                                      SizedBox(height: 12.0))
                                                  .addToEnd(
                                                      SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.universalNavigationBarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: UniversalNavigationBarWidget(
                                navigation: 'designer',
                              ),
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
