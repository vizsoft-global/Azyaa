import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'stores_list_model.dart';
export 'stores_list_model.dart';

class StoresListWidget extends StatefulWidget {
  const StoresListWidget({super.key});

  static String routeName = 'Stores-List';
  static String routePath = '/azyaa-stores-list';

  @override
  State<StoresListWidget> createState() => _StoresListWidgetState();
}

class _StoresListWidgetState extends State<StoresListWidget> {
  late StoresListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoresListModel());

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
        title: 'Stores-List',
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
                        backButtonStatus: true,
                        title: FFLocalizations.of(context).getText(
                          'gxpfxdk5' /* Stores Hub  */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: true,
                        navigationFrom: 'productlist',
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
                  Column(
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 8.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'hrbrnf38' /* Confusion while selecting 
dre... */
                                        ,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () {
                                      print('consult pressed ...');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '2vaeir2v' /* Consult Now */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 30.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'almarai',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 180.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Stack(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
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
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6yucnqof' /* Our  */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jf1gysah' /* Designers */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 200.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xkqar160' /* Discover collections from our ... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.7,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium
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
                                                              'izrn4w41' /* Confusion while 
selecting dre... */
                                                              ,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
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
                                                            '631hfqft' /* Consult Now */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
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
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ),
                                        const Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [],
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 0.0, 12.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/2148875359-Photoroom_1.png',
                                            width: 130.0,
                                            height: 180.0,
                                            fit: BoxFit.cover,
                                            alignment: const Alignment(0.0, 1.0),
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
                            List<UsersRecord> containerUsersRecordList =
                                snapshot.data!
                                    .where((u) => u.uid != currentUserUid)
                                    .toList();

                            return Container(
                              decoration: const BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'aibnfycg' /* All */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '5urltqi8' /* Discover */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'otd0s83z' /* Following */,
                                          ))
                                        ],
                                        onChanged: (val) => safeSetState(() =>
                                            _model.storeDesignerChoiceChipsValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context).info,
                                          iconSize: 16.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 16.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        chipSpacing: 8.0,
                                        rowSpacing: 8.0,
                                        multiselect: false,
                                        initialized: _model
                                                .storeDesignerChoiceChipsValue !=
                                            null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .storeDesignerChoiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          [
                                            FFLocalizations.of(context).getText(
                                              'xnk3pfnb' /* All */,
                                            )
                                          ],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (context) {
                                                  final storeDesignerList =
                                                      containerUsersRecordList
                                                          .where((e) =>
                                                              (e
                                                                      .designerMainInfo
                                                                      .designerInfo
                                                                      .storeAvailable ==
                                                                  true) &&
                                                              (_model
                                                                          .storeDesignerChoiceChipsValue ==
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getVariableText(
                                                                        enText:
                                                                            'All',
                                                                        arText:
                                                                            'الكل',
                                                                      )
                                                                  ? true
                                                                  : ((currentUserDocument?.userDesignerFollowing.toList() ??
                                                                              [])
                                                                          .contains(e
                                                                              .reference) ==
                                                                      (_model
                                                                                  .storeDesignerChoiceChipsValue ==
                                                                              FFLocalizations.of(context)
                                                                                  .getVariableText(
                                                                                enText: 'Discover',
                                                                                arText: 'يكتشف',
                                                                              )
                                                                          ? false
                                                                          : true))))
                                                          .toList()
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .createdTime!,
                                                              desc: false)
                                                          .toList();
                                                  if (storeDesignerList
                                                      .isEmpty) {
                                                    return Center(
                                                      child: EmptyWidget(
                                                        messageOne:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              'No data found!',
                                                          arText:
                                                              'لم يتم العثور على بيانات!',
                                                        ),
                                                        image: ' ',
                                                        messageTwo: ' ',
                                                      ),
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: storeDesignerList
                                                        .length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 12.0),
                                                    itemBuilder: (context,
                                                        storeDesignerListIndex) {
                                                      final storeDesignerListItem =
                                                          storeDesignerList[
                                                              storeDesignerListIndex];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
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
                                                              DesignerWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'designerUid':
                                                                    serializeParam(
                                                                  storeDesignerListItem
                                                                      .uid,
                                                                  ParamType
                                                                      .String,
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
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .network(
                                                                      storeDesignerListItem.designerMainInfo.designerInfo.brandPhoto !=
                                                                                  ''
                                                                          ? storeDesignerListItem
                                                                              .designerMainInfo
                                                                              .designerInfo
                                                                              .brandPhoto
                                                                          : storeDesignerListItem
                                                                              .photoUrl,
                                                                      width:
                                                                          110.0,
                                                                      height:
                                                                          90.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      alignment:
                                                                          const Alignment(
                                                                              0.0,
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                    child: Text(
                                                                                      storeDesignerListItem.designerMainInfo.designerInfo.name != '' ? storeDesignerListItem.designerMainInfo.designerInfo.name : storeDesignerListItem.displayName,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'almarai',
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                    child: Text(
                                                                                      storeDesignerListItem.designerMainInfo.designerInfo.bio.maybeHandleOverflow(
                                                                                        maxChars: 20,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'almarai',
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
                                                                                alignment: const AlignmentDirectional(1.0, -1.0),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    borderRadius: BorderRadius.circular(100.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '07yicerj' /* Best Rated */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'almarai',
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
                                                                        if (storeDesignerListItem.designerMainInfo.designerInfo.brandGallery.length >
                                                                            0)
                                                                          Container(
                                                                            width:
                                                                                190.0,
                                                                            height:
                                                                                45.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final brandGalleryList = storeDesignerListItem.designerMainInfo.designerInfo.brandGallery.toList();

                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  itemCount: brandGalleryList.length,
                                                                                  separatorBuilder: (_, __) => const SizedBox(width: 8.0),
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
                                                                                        child: CachedNetworkImage(
                                                                                          imageUrl: brandGalleryListItem,
                                                                                          width: 40.0,
                                                                                          height: 45.0,
                                                                                          fit: BoxFit.contain,
                                                                                          alignment: const Alignment(0.0, 0.0),
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
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
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
                                      .divide(const SizedBox(height: 12.0))
                                      .addToStart(const SizedBox(height: 12.0))
                                      .addToEnd(const SizedBox(height: 12.0)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.universalNavigationBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const UniversalNavigationBarWidget(
                            navigation: 'designer',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
