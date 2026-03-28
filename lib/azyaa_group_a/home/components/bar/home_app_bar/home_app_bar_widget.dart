import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loglist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_app_bar_model.dart';
export 'home_app_bar_model.dart';

class HomeAppBarWidget extends StatefulWidget {
  const HomeAppBarWidget({super.key});

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  late HomeAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeAppBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SettingsRecord>>(
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
              width: 2.0,
              height: 2.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.transparent,
                ),
              ),
            ),
          );
        }
        List<SettingsRecord> columnSettingsRecordList = snapshot.data!;
        final columnSettingsRecord = columnSettingsRecordList.isNotEmpty
            ? columnSettingsRecordList.first
            : null;

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: 50.0,
                    height: 50.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      () {
                        if ((loggedIn == true) &&
                            (currentUserPhoto != null &&
                                currentUserPhoto != '')) {
                          return currentUserPhoto;
                        } else if ((loggedIn == true) &&
                            (currentUserPhoto == null ||
                                currentUserPhoto == '')) {
                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                        } else {
                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                        }
                      }(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          '${FFLocalizations.of(context).getVariableText(
                            enText: 'Hello, ',
                            arText: 'مرحبًا،',
                          )}${loggedIn ? currentUserDisplayName : ' '}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Aileron',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      if (functions.getTimeOfDay() != 'hide')
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.85,
                                      child: LoglistWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Text(
                            () {
                              if (functions.getTimeOfDay() == 'Morning') {
                                return FFLocalizations.of(context)
                                    .getVariableText(
                                  enText: 'Good Morning',
                                  arText: 'صباح الخير',
                                );
                              } else if (functions.getTimeOfDay() ==
                                  'Afternoon') {
                                return FFLocalizations.of(context)
                                    .getVariableText(
                                  enText: 'Good Afternoon',
                                  arText: 'مساء الخير',
                                );
                              } else if (functions.getTimeOfDay() ==
                                  'Evening') {
                                return FFLocalizations.of(context)
                                    .getVariableText(
                                  enText: 'Good Evening',
                                  arText: 'مساء الخير',
                                );
                              } else {
                                return FFLocalizations.of(context)
                                    .getVariableText(
                                  enText: 'Good Evening',
                                  arText: 'مساء الخير',
                                );
                              }
                            }(),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Aileron',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (loggedIn
                    ? ((valueOrDefault(currentUserDocument?.status, '') ==
                            'Published') &&
                        (valueOrDefault(currentUserDocument?.userRole, '') ==
                            'Creator'))
                    : false)
                  AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(CreatorSpaceWidget.routeName);
                      },
                      child: Container(
                        width: 80.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).purple,
                              Color(0xFFC78CC7)
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 6.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'yip4u30a' /* Creator */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'wg9zzf01' /* Space */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ].divide(SizedBox(
                                    height: FFLocalizations.of(context)
                                                .languageCode ==
                                            'ar'
                                        ? 0.0
                                        : 2.0)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFAC7BAC),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.navigate_next_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 14.0,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                  height: 42.0,
                  child: Stack(
                    children: [
                      if (!loggedIn)
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).border,
                            borderRadius: 100.0,
                            buttonSize: 42.0,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            icon: Icon(
                              FFIcons.kuser,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 18.0,
                            ),
                            onPressed: () async {
                              context.goNamed(LoginWidget.routeName);
                            },
                          ),
                        ),
                      if (loggedIn == true)
                        Stack(
                          children: [
                            if (loggedIn == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        CartWidget.routeName,
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
                                    child: badges.Badge(
                                      badgeContent: Text(
                                        currentUserDocument!
                                            .userCart.cartItems.length
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Aileron',
                                              color: currentUserDocument
                                                          ?.userCart
                                                          ?.cartItems
                                                          ?.length ==
                                                      0
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .velvet,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      showBadge: currentUserDocument!
                                              .userCart.cartItems.length >
                                          0,
                                      shape: badges.BadgeShape.circle,
                                      badgeColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 4.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      position: badges.BadgePosition.topEnd(),
                                      animationType:
                                          badges.BadgeAnimationType.scale,
                                      toAnimate: true,
                                      child: Visibility(
                                        visible: (loggedIn == true) &&
                                            (columnSettingsRecord?.settingsHome
                                                    ?.settingsIsBagStatus ==
                                                true),
                                        child: FlutterFlowIconButton(
                                          borderColor: currentUserDocument
                                                      ?.userCart
                                                      ?.cartItems
                                                      ?.length ==
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .velvet,
                                          borderRadius: 100.0,
                                          buttonSize: 42.0,
                                          fillColor: currentUserDocument
                                                      ?.userCart
                                                      ?.cartItems
                                                      ?.length ==
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .velvet,
                                          icon: Icon(
                                            FFIcons.kvector1,
                                            color: currentUserDocument?.userCart
                                                        ?.cartItems?.length ==
                                                    0
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              CartWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ],
        );
      },
    );
  }
}
