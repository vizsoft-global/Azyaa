import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_b/components/unfollow_confirm_popup/unfollow_confirm_popup_widget.dart';
import '/azyaa_group_b/creator/creator_promotion/creator_promotion_widget.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'creators_individual_model.dart';
export 'creators_individual_model.dart';

class CreatorsIndividualWidget extends StatefulWidget {
  const CreatorsIndividualWidget({
    super.key,
    required this.creatorUid,
  });

  final String? creatorUid;

  static String routeName = 'Creators-Individual';
  static String routePath = '/azyaa-creator';

  @override
  State<CreatorsIndividualWidget> createState() =>
      _CreatorsIndividualWidgetState();
}

class _CreatorsIndividualWidgetState extends State<CreatorsIndividualWidget>
    with TickerProviderStateMixin {
  late CreatorsIndividualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorsIndividualModel());

    _model.promotionController = TabController(
      vsync: this,
      length: 2,
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
        title: 'Creators-Individual',
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
                                '0wohg4qc' /* Creators Hub  */,
                              ),
                              navigationIconStatus: true,
                              searchIconStatus: false,
                              wishlistIconStatus: true,
                              navigationFrom: 'creator',
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
                            title: _model
                                .creatorDoc?.creatorMainInfo.creatorInfo.name,
                            image: _model.creatorDoc?.creatorMainInfo
                                .creatorInfo.brandPhoto,
                            ios:
                                'https://azyaa.ai/azyaa-creator?creatorUid=${widget.creatorUid}',
                            domain: 'azyaa.link',
                            externalID:
                                '${currentUserUid}-CR${_model.idmapDoc?.shareLinkId.toString()}',
                            android:
                                'https://azyaa.ai/azyaa-creator?creatorUid=${widget.creatorUid}',
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
                          width: MediaQuery.sizeOf(context).width * 10.0,
                          height: 150.0,
                          child: const LoadingAnimationWidget(),
                        );
                      }
                      List<UsersRecord> columnUsersRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnUsersRecord = columnUsersRecordList.isNotEmpty
                          ? columnUsersRecordList.first
                          : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: columnUsersRecord
                                                          ?.creatorMainInfo
                                                          .creatorInfo
                                                          .brandPhoto !=
                                                      null &&
                                                  columnUsersRecord
                                                          ?.creatorMainInfo
                                                          .creatorInfo
                                                          .brandPhoto !=
                                                      ''
                                              ? columnUsersRecord!
                                                  .creatorMainInfo
                                                  .creatorInfo
                                                  .brandPhoto
                                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                          width: 100.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                columnUsersRecord
                                                                ?.creatorMainInfo
                                                                .creatorInfo
                                                                .name !=
                                                            null &&
                                                        columnUsersRecord
                                                                ?.creatorMainInfo
                                                                .creatorInfo
                                                                .name !=
                                                            ''
                                                    ? columnUsersRecord!
                                                        .creatorMainInfo
                                                        .creatorInfo
                                                        .name
                                                    : columnUsersRecord!
                                                        .displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Text(
                                                columnUsersRecord
                                                    .creatorMainInfo
                                                    .creatorInfo
                                                    .bio,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                          ],
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 12.0)),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (columnUsersRecord.reference !=
                                        currentUserReference)
                                      Stack(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          if ((currentUserDocument
                                                          ?.userCreatorFollowing
                                                          .toList() ??
                                                      [])
                                                  .contains(columnUsersRecord
                                                      .reference) ==
                                              false)
                                            AuthUserStreamWidget(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  if (loggedIn) {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'user_creator_following':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            columnUsersRecord
                                                                .reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    FFAppState()
                                                        .updateUserDataFlowStruct(
                                                      (e) => e
                                                        ..incrementRefresh(1),
                                                    );
                                                    safeSetState(() {});
                                                  } else {
                                                    context.pushNamed(
                                                      LoginWidget.routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            const TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'y87vjodx' /* Follow */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 28.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
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
                                            ),
                                          if ((currentUserDocument
                                                          ?.userCreatorFollowing
                                                          .toList() ??
                                                      [])
                                                  .contains(columnUsersRecord
                                                      .reference) ==
                                              true)
                                            Builder(
                                              builder: (context) =>
                                                  AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    await showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Container(
                                                                width: 500.0,
                                                                child:
                                                                    UnfollowConfirmPopupWidget(
                                                                  title: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'sosxaqkw' /* Are you sure? */,
                                                                  ),
                                                                  description:
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                    '1qdwfjk6' /* you want to unfollow this Crea... */,
                                                                  ),
                                                                  userRef:
                                                                      columnUsersRecord
                                                                          .reference,
                                                                  type:
                                                                      'Creator',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'jeynp5el' /* Unfollow */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 28.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
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
                                              ),
                                            ),
                                        ],
                                      ),
                                  ],
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 8.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 48.0,
                              decoration: const BoxDecoration(),
                              child: ListView(
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  16.0,
                                  0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  if (columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .instagramProfileFollowers !=
                                          '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (columnUsersRecord
                                                    .creatorMainInfo
                                                    .creatorInfo
                                                    .instagramProfile !=
                                                '') {
                                          await launchURL(columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .instagramProfile);
                                        } else {
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: 90.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                            width: 1.0,
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kinsta,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    columnUsersRecord
                                                        .creatorMainInfo
                                                        .creatorInfo
                                                        .instagramProfileFollowers,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'gyl6vmyq' /* Followers */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .facebookProfileFollowers !=
                                          '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (columnUsersRecord
                                                    .creatorMainInfo
                                                    .creatorInfo
                                                    .facebookProfile !=
                                                '') {
                                          await launchURL(columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .facebookProfile);
                                        } else {
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: 90.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                            width: 1.0,
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kfb,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      columnUsersRecord
                                                          .creatorMainInfo
                                                          .creatorInfo
                                                          .facebookProfileFollowers,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'a1sk801n' /* Followers */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .tiktokProfileFollowers !=
                                          '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (columnUsersRecord
                                                    .creatorMainInfo
                                                    .creatorInfo
                                                    .tiktokHandle !=
                                                '') {
                                          await launchURL(columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .tiktokHandle);
                                        } else {
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: 90.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                            width: 1.0,
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.tiktok,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      columnUsersRecord
                                                          .creatorMainInfo
                                                          .creatorInfo
                                                          .tiktokProfileFollowers,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nazgvax1' /* Followers */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .youtubeProfileFollowers !=
                                          '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (columnUsersRecord
                                                    .creatorMainInfo
                                                    .creatorInfo
                                                    .youtubeChannel !=
                                                '') {
                                          await launchURL(columnUsersRecord
                                              .creatorMainInfo
                                              .creatorInfo
                                              .youtubeChannel);
                                        } else {
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: 90.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                            width: 1.0,
                                          ),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.youtube,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      columnUsersRecord
                                                          .creatorMainInfo
                                                          .creatorInfo
                                                          .youtubeProfileFollowers,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'obr2wm4b' /* Followers */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Align(
                                  alignment: const Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
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
                                          '40s2v8o9' /* Promotions */,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '8s50b6dh' /* Posts */,
                                        ),
                                      ),
                                    ],
                                    controller: _model.promotionController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.promotionController,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final promotionsList =
                                                      columnUsersRecord
                                                              .creatorMainInfo
                                                              .creatorPromotions
                                                              .where((e) =>
                                                                  e.promotionStatus ==
                                                                  'active')
                                                              .toList()
                                                              .sortedList(
                                                                  keyOf: (e) =>
                                                                      e.promotionCreatedAt!,
                                                                  desc: true)
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
                                                      childAspectRatio: 0.6,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        promotionsList.length,
                                                    itemBuilder: (context,
                                                        promotionsListIndex) {
                                                      final promotionsListItem =
                                                          promotionsList[
                                                              promotionsListIndex];
                                                      return CreatorPromotionWidget(
                                                        key: Key(
                                                            'Keyk8c_${promotionsListIndex}_of_${promotionsList.length}'),
                                                        promotionInfo:
                                                            promotionsListItem,
                                                        creator:
                                                            columnUsersRecord,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ]
                                              .divide(const SizedBox(height: 12.0))
                                              .addToStart(
                                                  const SizedBox(height: 12.0))
                                              .addToEnd(const SizedBox(height: 12.0)),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final imageList = columnUsersRecord
                                                          .creatorMainInfo
                                                          .creatorPromotions
                                                          .where((e) =>
                                                              e.promotionStatus ==
                                                              'active')
                                                          .toList()
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .promotionCreatedAt!,
                                                              desc: true)
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
                                                      childAspectRatio: 0.7,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: imageList.length,
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
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: CachedNetworkImage(
                                                            imageUrl: imageListItem
                                                                .promotionInfo
                                                                .featureImage,
                                                            width: 200.0,
                                                            fit: BoxFit.cover,
                                                            alignment:
                                                                const Alignment(
                                                                    0.0, -1.0),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ]
                                              .addToStart(
                                                  const SizedBox(height: 12.0))
                                              .addToEnd(const SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                            .addToStart(const SizedBox(height: 16.0))
                            .addToEnd(const SizedBox(height: 16.0)),
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
