import '/backend/links/azy_links.dart';
import '/custom_code/widgets/azy_scroll_refresh.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_b/components/unfollow_confirm_popup/unfollow_confirm_popup_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/catalog/product_frame.dart';
import '/backend/inventory/stock_service.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'designer_model.dart';
export 'designer_model.dart';

class DesignerWidget extends StatefulWidget {
  const DesignerWidget({
    super.key,
    required this.designerUid,
  });

  final String? designerUid;

  static String routeName = 'Designer';
  static String routePath = '/azyaa-designer';

  @override
  State<DesignerWidget> createState() => _DesignerWidgetState();
}

class _DesignerWidgetState extends State<DesignerWidget> {
  late DesignerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesignerModel());

    _model.designerMoreInfoExpandableController =
        ExpandableController(initialExpanded: true)
          ..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  /// Pull to refresh: back to the first page, queries run again, and the stock
  /// numbers are looked up again alongside.
  Future<void> _azyRefresh() async {
    final stock = AzyInventoryStock.instance.refresh();
    safeSetState(() {
      _model.pager.reset();
    });
    await azyRefreshHold(stock);
  }

  /// Shows the next page of products once the scroll nears the end.
  void _azyLoadMore() {
    if (_model.pager.loadMore()) {
      safeSetState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Designer',
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
                                'drxdtdyq' /* Designers Hub  */,
                              ),
                              navigationIconStatus: true,
                              searchIconStatus: false,
                              wishlistIconStatus: true,
                              navigationFrom: 'designer',
                              tryonStatus: false,
                              shareIconStatus: false,
                              designerRef: functions
                                  .getUserReference(widget.designerUid!),
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
                          // A link the app itself opens; see AzyLinks.
                          final link = AzyLinks.designerOrNull(widget.designerUid);
                          if (link != null) {
                            await Share.share(
                              link,
                              sharePositionOrigin: getWidgetBoundingBox(context),
                            );
                          }
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
                        isEqualTo: widget.designerUid,
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
                      List<UsersRecord> columnUsersRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnUsersRecord = columnUsersRecordList.isNotEmpty
                          ? columnUsersRecordList.first
                          : null;

                      return AzyScrollRefresh(
                        onRefresh: _azyRefresh,
                        onNearEnd: _azyLoadMore,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: valueOrDefault<String>(
                                            columnUsersRecord
                                                            ?.designerMainInfo
                                                            .designerInfo
                                                            .brandPhoto !=
                                                        null &&
                                                    columnUsersRecord
                                                            ?.designerMainInfo
                                                            .designerInfo
                                                            .brandPhoto !=
                                                        ''
                                                ? columnUsersRecord
                                                    ?.designerMainInfo
                                                    .designerInfo
                                                    .brandPhoto
                                                : columnUsersRecord?.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/m1a9p5ryq5fw/Azyaa_Designer_Default_Piccture_-_User_App__designerlistpage(1).png',
                                          ),
                                          width: 100.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 4.0),
                                          child: Text(
                                            columnUsersRecord
                                                            ?.designerMainInfo
                                                            .designerInfo
                                                            .name !=
                                                        null &&
                                                    columnUsersRecord
                                                            ?.designerMainInfo
                                                            .designerInfo
                                                            .name !=
                                                        ''
                                                ? columnUsersRecord!
                                                    .designerMainInfo
                                                    .designerInfo
                                                    .name
                                                : columnUsersRecord!
                                                    .displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'almarai',
                                                  fontSize: 14.0,
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
                                            '${FFLocalizations.of(context).getVariableText(
                                              enText: 'Experience:',
                                              arText: 'خبرة:',
                                            )}${columnUsersRecord.designerMainInfo.designerInfo.experienceInYears.toString()}${FFLocalizations.of(context).getVariableText(
                                              enText: 'years',
                                              arText: 'سنين',
                                            )}',
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
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if ((columnUsersRecord.reference !=
                                              currentUserReference) &&
                                          (loggedIn == true))
                                        Stack(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            if ((currentUserDocument
                                                            ?.userDesignerFollowing
                                                            .toList() ??
                                                        [])
                                                    .contains(columnUsersRecord
                                                        .reference) ==
                                                false)
                                              AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed: () async {
                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'user_designer_following':
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
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'byvhcrrq' /* Follow */,
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
                                            if ((currentUserDocument
                                                            ?.userDesignerFollowing
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
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
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
                                                                child:
                                                                    Container(
                                                                  width: 500.0,
                                                                  child:
                                                                      UnfollowConfirmPopupWidget(
                                                                    title: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vl2fumil' /* Are you sure? */,
                                                                    ),
                                                                    description:
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                      'h1hkw04g' /* you want to unfollow this Desi... */,
                                                                    ),
                                                                    userRef:
                                                                        columnUsersRecord
                                                                            .reference,
                                                                    type:
                                                                        'Designer',
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
                                                      'jjj17hgu' /* Unfollow */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 28.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
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
                                                          .primaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                  0.0, 0.0, 0.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                color: const Color(0x00000000),
                                child: ExpandableNotifier(
                                  controller: _model
                                      .designerMoreInfoExpandableController,
                                  child: ExpandablePanel(
                                    header: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 8.0, 20.0, 8.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'gg5n7w4r' /* More Details */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'almarai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    collapsed: Container(),
                                    expanded: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'u219692s' /* Brief Bio : */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Text(
                                                  columnUsersRecord
                                                      .designerMainInfo
                                                      .designerInfo
                                                      .bio,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5kcv2ntv' /* Design Styles / Themes : */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final styleList =
                                                        columnUsersRecord
                                                                .designerMainInfo
                                                                .designerInfo
                                                                .contentCategoryList
                                                                .toList() ??
                                                            [];

                                                    return Wrap(
                                                      spacing: 4.0,
                                                      runSpacing: 0.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          styleList.length,
                                                          (styleListIndex) {
                                                        final styleListItem =
                                                            styleList[
                                                                styleListIndex];
                                                        return Text(
                                                          '${styleListItem}${styleListIndex != (columnUsersRecord.designerMainInfo.designerInfo.contentCategoryList.length - 1) ? ', ' : '. '}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 1.5,
                                                              ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1tcwvfkg' /* Portfolio/Website Link */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(
                                                      columnUsersRecord
                                                          .designerMainInfo
                                                          .designerInfo
                                                          .portfolioLink);
                                                },
                                                child: Text(
                                                  columnUsersRecord
                                                      .designerMainInfo
                                                      .designerInfo
                                                      .portfolioLink,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .velvet,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: true,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                      expandIcon: Icons.add,
                                      collapseIcon: FontAwesomeIcons.minus.data,
                                      iconSize: 18.0,
                                      iconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      iconPadding: const EdgeInsets.fromLTRB(
                                          16.0, 0.0, 16.0, 0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 24.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'wk5wmrhr' /* Exclusive  */,
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
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '0tz8kaef' /* Collections */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.navigate_next_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: StreamBuilder<List<ProductsRecord>>(
                                stream: queryProductsRecord(
                                  queryBuilder: (productsRecord) =>
                                      productsRecord
                                          .where(
                                            'status',
                                            isEqualTo: 'active',
                                          )
                                          .where(
                                            'product_authorizer.product_designer_ref',
                                            isEqualTo:
                                                columnUsersRecord.reference,
                                          )
                                          .orderBy('created_at',
                                              descending: true),
                                ),
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
                                      designerCollectionGridListProductsRecordList =
                                      snapshot.data!;

                                  return ListenableBuilder(
                                    listenable: AzyInventoryStock.instance,
                                    builder: (context, _) {
                                      // Recomputed whenever more stock is
                                      // learned, so a sold-out product drops to
                                      // the end as soon as its inventory is
                                      // known. A Firestore stream will not
                                      // re-emit just because stock arrived, so
                                      // without this the order would stay stale.
                                      final orderedCollection =
                                          _model.pager.window(AzyInventoryStock.instance
                                              .orderInStockFirst(
                                        designerCollectionGridListProductsRecordList,
                                        (p) => p.product.inventoryId,
                                      ));

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
                                      childAspectRatio: AzyProductFrame.cardAspectRatio,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: orderedCollection.length,
                                    itemBuilder: (context,
                                        designerCollectionGridListIndex) {
                                      final designerCollectionGridListProductsRecord =
                                          orderedCollection[
                                              designerCollectionGridListIndex];
                                      return ProductGridWidget(
                                        key: Key(
                                            'Keyb29_${designerCollectionGridListIndex}_of_${designerCollectionGridListProductsRecordList.length}'),
                                        product:
                                            designerCollectionGridListProductsRecord,
                                      );
                                    },
                                  );
                                    },
                                  );
                                },
                              ),
                            ),
                          ]
                              .addToStart(const SizedBox(height: 16.0))
                              .addToEnd(const SizedBox(height: 16.0)),
                        ),
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
