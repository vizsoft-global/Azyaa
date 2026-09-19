import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'universal_navigation_bar_model.dart';
export 'universal_navigation_bar_model.dart';

class UniversalNavigationBarWidget extends StatefulWidget {
  const UniversalNavigationBarWidget({
    super.key,
    required this.navigation,
  });

  final String? navigation;

  @override
  State<UniversalNavigationBarWidget> createState() =>
      _UniversalNavigationBarWidgetState();
}

class _UniversalNavigationBarWidgetState
    extends State<UniversalNavigationBarWidget> {
  late UniversalNavigationBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UniversalNavigationBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: Color(0xFFECECEC),
        borderRadius: BorderRadius.only(),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      HomeWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FFIcons.kazyaaactive,
                        color: widget!.navigation == 'home'
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).navbaricon,
                        size: 24.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'qym5k4mn' /* Home */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'almarai',
                              color: widget!.navigation == 'home'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).navbaricon,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
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
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        DesignersListWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FFIcons.kdesigner,
                          color: widget!.navigation == 'designer'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).navbaricon,
                          size: 24.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'z30s5x9j' /* Designer */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'almarai',
                                color: widget!.navigation == 'designer'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).navbaricon,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      ShopWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FFIcons.kshopactive,
                        color: widget!.navigation == 'shop'
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).navbaricon,
                        size: 24.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'h8ksppd5' /* Shop */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'almarai',
                              color: widget!.navigation == 'shop'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).navbaricon,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      CreatorsWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FFIcons.knowcreator,
                        color: widget!.navigation == 'creator'
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).navbaricon,
                        size: 24.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '4tvho7in' /* Creator */,
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'almarai',
                              color: widget!.navigation == 'creator'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).navbaricon,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
            ),
            if (loggedIn)
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ProfileWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FFIcons.kuseractive,
                          color: widget!.navigation == 'profile'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).navbaricon,
                          size: 24.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'uvhd8kwt' /* Account */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'almarai',
                                color: widget!.navigation == 'profile'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).navbaricon,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
          ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
