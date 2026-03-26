import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'creators_model.dart';
export 'creators_model.dart';

class CreatorsWidget extends StatefulWidget {
  const CreatorsWidget({super.key});

  static String routeName = 'Creators';
  static String routePath = '/azyaa-creators';

  @override
  State<CreatorsWidget> createState() => _CreatorsWidgetState();
}

class _CreatorsWidgetState extends State<CreatorsWidget>
    with TickerProviderStateMixin {
  late CreatorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorsModel());

    _model.searchFiledsTextController ??= TextEditingController();
    _model.searchFiledsFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController!.indexIsChanging) {
          return;
        }

        if (!loggedIn) {
          context.pushNamed(LoginWidget.routeName);

          return;
        }
      });

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
        title: 'Creators',
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
                          '445mldjb' /* Creators Hub  */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: true,
                        navigationFrom: '',
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: Stack(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '3nwbgzd9' /* Our  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'rdnyp0u0' /* Creators  */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Aileron',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 180.0,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ifa42y0z' /* Browse through our featured Cr... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/creator1_1_(3).png',
                                  width: 150.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                  alignment: Alignment(1.0, -1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (loggedIn)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (loggedIn)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                          Duration(milliseconds: 2000),
                                          () async {
                                            if (_model.searchFiledsTextController
                                                        .text !=
                                                    null &&
                                                _model.searchFiledsTextController
                                                        .text !=
                                                    '') {
                                              safeSetState(() => _model
                                                  .algoliaSearchResults = null);
                                              await UsersRecord.search(
                                                term: _model
                                                    .searchFiledsTextController
                                                    .text,
                                              )
                                                  .then((r) => _model
                                                      .algoliaSearchResults = r)
                                                  .onError((_, __) => _model
                                                          .algoliaSearchResults =
                                                      [])
                                                  .whenComplete(() =>
                                                      safeSetState(() {}));

                                              safeSetState(() {});
                                            } else {
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'bzkrlgow' /* Search */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Aileron',
                                                    color: Color(0xFF575454),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
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
                                                BorderRadius.circular(16.0),
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
                                              fontFamily: 'Aileron',
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
                                if ((_model.searchFiledsTextController.text !=
                                            null &&
                                        _model.searchFiledsTextController
                                                .text !=
                                            '') &&
                                    responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                  Container(
                                    height: 200.0,
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        if (_model.algoliaSearchResults ==
                                            null) {
                                          return Center(
                                            child: SizedBox(
                                              width: 10.0,
                                              height: 10.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final searchList = _model
                                                .algoliaSearchResults
                                                ?.toList() ??
                                            [];

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: searchList.length,
                                          itemBuilder:
                                              (context, searchListIndex) {
                                            final searchListItem =
                                                searchList[searchListIndex];
                                            return Container(
                                                width: 100,
                                                height: 100,
                                                color: Colors.green);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
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
                                  isEqualTo: 'Creator',
                                )
                                .where(
                                  'creator_main_info.creator_status',
                                  isEqualTo: 'active',
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
                            List<UsersRecord> creatorUsersRecordList = snapshot
                                .data!
                                .where((u) => u.uid != currentUserUid)
                                .toList();

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 300.0,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        if (loggedIn)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7kut8vgw' /* All */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nst7p0t9' /* Discover */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'uxdp9stf' /* Following */,
                                                ))
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .choiceChipsloginValue1 =
                                                      val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              chipSpacing: 8.0,
                                              rowSpacing: 8.0,
                                              multiselect: false,
                                              initialized: _model
                                                      .choiceChipsloginValue1 !=
                                                  null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsloginValueController1 ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'sf23yl78' /* All */,
                                                  )
                                                ],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                        if (!loggedIn)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'fnkxbtam' /* All */,
                                                ))
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .choiceChipslogoutValue1 =
                                                      val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              chipSpacing: 8.0,
                                              rowSpacing: 8.0,
                                              multiselect: false,
                                              initialized: _model
                                                      .choiceChipslogoutValue1 !=
                                                  null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipslogoutValueController1 ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'fi7ekjly' /* All */,
                                                  )
                                                ],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => Builder(
                                            builder: (context) {
                                              final allCreatorList = (_model
                                                                      .searchFiledsTextController
                                                                      .text !=
                                                                  null &&
                                                              _model.searchFiledsTextController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .algoliaSearchResults
                                                              ?.where((e) => (_model
                                                                              .choiceChipsloginValue1 ==
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                            enText:
                                                                                'All',
                                                                            arText:
                                                                                'الجميع',
                                                                          )) &&
                                                                      (e.status ==
                                                                          'Published') &&
                                                                      (e.userRole ==
                                                                          'Creator')
                                                                  ? true
                                                                  : (((currentUserDocument?.userCreatorFollowing?.toList() ?? [])
                                                                              .contains(e.reference) ==
                                                                          (_model.choiceChipsloginValue1 ==
                                                                                  FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Discover',
                                                                                    arText: 'يكتشف',
                                                                                  )
                                                                              ? false
                                                                              : true)) &&
                                                                      (e.status == 'Published') &&
                                                                      (e.userRole == 'Creator')))
                                                              .toList()
                                                              ?.sortedList(keyOf: (e) => e.createdTime!, desc: false)
                                                          : creatorUsersRecordList
                                                              .where((e) => () {
                                                                    if (!loggedIn &&
                                                                        (_model.choiceChipslogoutValue1 ==
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'All',
                                                                              arText: 'الجميع',
                                                                            ))) {
                                                                      return true;
                                                                    } else if (loggedIn &&
                                                                        (_model.choiceChipsloginValue1 ==
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'All',
                                                                              arText: 'الجميع',
                                                                            ))) {
                                                                      return true;
                                                                    } else {
                                                                      return ((currentUserDocument?.userCreatorFollowing?.toList() ?? [])
                                                                              .contains(e.reference) ==
                                                                          ((_model.choiceChipsloginValue1 ==
                                                                                      FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Discover',
                                                                                        arText: 'يكتشف',
                                                                                      )) &&
                                                                                  loggedIn
                                                                              ? false
                                                                              : true));
                                                                    }
                                                                  }())
                                                              .toList()
                                                              .sortedList(keyOf: (e) => e.createdTime!, desc: false))
                                                      ?.toList() ??
                                                  [];
                                              if (allCreatorList.isEmpty) {
                                                return Center(
                                                  child: EmptyWidget(
                                                    messageOne:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'styqnzvy' /* No creator found! */,
                                                    ),
                                                    image: '',
                                                    messageTwo:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'xuy0818g' /* Looks like there’s no data to ... */,
                                                    ),
                                                    buttonText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'usfnod9k' /* Explore Creators */,
                                                    ),
                                                  ),
                                                );
                                              }

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    allCreatorList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 12.0),
                                                itemBuilder: (context,
                                                    allCreatorListIndex) {
                                                  final allCreatorListItem =
                                                      allCreatorList[
                                                          allCreatorListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
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
                                                        context.pushNamed(
                                                          CreatorsIndividualWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'creator':
                                                                serializeParam(
                                                              allCreatorListItem
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
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
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
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
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    allCreatorListItem
                                                                        .creatorMainInfo
                                                                        .creatorInfo
                                                                        .brandPhoto,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                                                  ),
                                                                  width: 110.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          0.0),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                allCreatorListItem.displayName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Aileron',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                child: Text(
                                                                                  allCreatorListItem.creatorMainInfo.creatorInfo.bio.maybeHandleOverflow(
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
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                          tabletLandscape:
                                                                              false,
                                                                        ))
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF6729DA),
                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'wts05ndc' /* Best Rated */,
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
                                                                    if (allCreatorListItem
                                                                            .creatorMainInfo
                                                                            .creatorPromotions
                                                                            .where((e) =>
                                                                                e.promotionStatus ==
                                                                                'active')
                                                                            .toList()
                                                                            .length >
                                                                        0)
                                                                      Container(
                                                                        width:
                                                                            190.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final portfolioImageList =
                                                                                allCreatorListItem.creatorMainInfo.creatorPromotions.where((e) => e.promotionStatus == 'active').toList().sortedList(keyOf: (e) => e.promotionCreatedAt!, desc: true).map((e) => e.promotionInfo.galleryImage.firstOrNull).withoutNulls.toList().take(4).toList();

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                8.0,
                                                                                0,
                                                                              ),
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: portfolioImageList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(width: 8.0),
                                                                              itemBuilder: (context, portfolioImageListIndex) {
                                                                                final portfolioImageListItem = portfolioImageList[portfolioImageListIndex];
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
                                                                                      portfolioImageListItem,
                                                                                      width: 40.0,
                                                                                      height: 45.0,
                                                                                      fit: BoxFit.cover,
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
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
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
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 12.0))
                                      .addToStart(SizedBox(height: 12.0))
                                      .addToEnd(SizedBox(height: 12.0)),
                                ),
                              ),
                            );
                          },
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
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where(
                                    'status',
                                    isEqualTo: 'Published',
                                  )
                                  .where(
                                    'user_role',
                                    isEqualTo: 'Creator',
                                  )
                                  .where(
                                    'creator_main_info.creator_status',
                                    isEqualTo: 'active',
                                  ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 150.0,
                                  child: LoadingAnimationWidget(),
                                );
                              }
                              List<UsersRecord> tabBarUsersRecordList = snapshot
                                  .data!
                                  .where((u) => u.uid != currentUserUid)
                                  .toList();

                              return Column(
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
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'm43elsih' /* Creators */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'pllmesie' /* Posts */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
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
                                              Stack(
                                                children: [
                                                  if (loggedIn)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: [
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '75z6xv4q' /* All */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'x5vul0f5' /* Discover */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'pbpj0bvc' /* Following */,
                                                          ))
                                                        ],
                                                        onChanged: (val) =>
                                                            safeSetState(() => _model
                                                                    .choiceChipsloginValue2 =
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
                                                                    fontSize:
                                                                        12.0,
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
                                                              BorderRadius
                                                                  .circular(
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
                                                                    fontSize:
                                                                        12.0,
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
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: false,
                                                        initialized: _model
                                                                .choiceChipsloginValue2 !=
                                                            null,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .choiceChipsloginValueController2 ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'nhlfa8f2' /* All */,
                                                            )
                                                          ],
                                                        ),
                                                        wrapped: true,
                                                      ),
                                                    ),
                                                  if (!loggedIn)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: [
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            's6jdef0m' /* All */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'nm949foq' /* Discover */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '32fvo7ax' /* Following */,
                                                          ))
                                                        ],
                                                        onChanged: (val) async {
                                                          safeSetState(() => _model
                                                                  .choiceChipslogoutValue2 =
                                                              val?.firstOrNull);
                                                          if (!loggedIn) {
                                                            context.pushNamed(
                                                                LoginWidget
                                                                    .routeName);

                                                            return;
                                                          }
                                                        },
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
                                                                    fontSize:
                                                                        12.0,
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
                                                              BorderRadius
                                                                  .circular(
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
                                                                    fontSize:
                                                                        12.0,
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
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: false,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .choiceChipslogoutValueController2 ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [],
                                                        ),
                                                        wrapped: true,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (context) {
                                                        final allCreatorList =
                                                            tabBarUsersRecordList
                                                                .where((e) => _model
                                                                            .choiceChipsloginValue2 ==
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'All',
                                                                          arText:
                                                                              'الجميع',
                                                                        )
                                                                    ? true
                                                                    : ((currentUserDocument?.userCreatorFollowing?.toList() ??
                                                                                [])
                                                                            .contains(e
                                                                                .reference) ==
                                                                        (_model
                                                                                    .choiceChipsloginValue2 ==
                                                                                FFLocalizations.of(context)
                                                                                    .getVariableText(
                                                                                  enText: 'Discover',
                                                                                  arText: 'يكتشف',
                                                                                )
                                                                            ? false
                                                                            : true)))
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.createdTime!,
                                                                    desc: false)
                                                                .toList();

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              allCreatorList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 12.0),
                                                          itemBuilder: (context,
                                                              allCreatorListIndex) {
                                                            final allCreatorListItem =
                                                                allCreatorList[
                                                                    allCreatorListIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
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
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    CreatorsIndividualWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'creator':
                                                                          serializeParam(
                                                                        allCreatorListItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              allCreatorListItem.creatorMainInfo.creatorInfo.brandPhoto,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                                                            ),
                                                                            width:
                                                                                110.0,
                                                                            height:
                                                                                90.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                Alignment(0.0, 0.0),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                                        Text(
                                                                                          allCreatorListItem.displayName,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Aileron',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                          child: Text(
                                                                                            allCreatorListItem.creatorMainInfo.creatorInfo.bio.maybeHandleOverflow(
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
                                                                                  ))
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, -1.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFF6729DA),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'sjbxzl97' /* Best Rated */,
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
                                                                              if (currentUserDocument!.creatorMainInfo.creatorInfo.brandGallery.length > 0)
                                                                                Container(
                                                                                  width: 190.0,
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final portfolioImageList = (currentUserDocument?.creatorMainInfo?.creatorInfo?.brandGallery?.toList() ?? []).take(5).toList();

                                                                                      return ListView.separated(
                                                                                        padding: EdgeInsets.fromLTRB(
                                                                                          0,
                                                                                          0,
                                                                                          8.0,
                                                                                          0,
                                                                                        ),
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        itemCount: portfolioImageList.length,
                                                                                        separatorBuilder: (_, __) => SizedBox(width: 8.0),
                                                                                        itemBuilder: (context, portfolioImageListIndex) {
                                                                                          final portfolioImageListItem = portfolioImageList[portfolioImageListIndex];
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
                                                                                                portfolioImageListItem,
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
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
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
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 12.0))
                                                .addToStart(
                                                    SizedBox(height: 12.0))
                                                .addToEnd(
                                                    SizedBox(height: 12.0)),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final imageList =
                                                        tabBarUsersRecordList
                                                            .map((e) => e
                                                                .creatorMainInfo
                                                                .creatorPromotions
                                                                .where((e) =>
                                                                    e.promotionStatus ==
                                                                    'active')
                                                                .toList()
                                                                .firstOrNull
                                                                ?.promotionInfo
                                                                ?.featureImage)
                                                            .withoutNulls
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
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 1.0,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          imageList.length,
                                                      itemBuilder: (context,
                                                          imageListIndex) {
                                                        final imageListItem =
                                                            imageList[
                                                                imageListIndex];
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .border,
                                                            ),
                                                          ),
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
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      imageListItem,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      alignment:
                                                                          Alignment(
                                                                              0.0,
                                                                              -1.0),
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        imageListItem,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  imageListItem,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  imageListItem,
                                                                  width: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          -1.0),
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
                                            ),
                                          ]
                                              .addToStart(
                                                  SizedBox(height: 12.0))
                                              .addToEnd(SizedBox(height: 12.0)),
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
                            navigation: 'creator',
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
