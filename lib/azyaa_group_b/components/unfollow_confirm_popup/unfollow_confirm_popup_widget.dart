import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'unfollow_confirm_popup_model.dart';
export 'unfollow_confirm_popup_model.dart';

class UnfollowConfirmPopupWidget extends StatefulWidget {
  const UnfollowConfirmPopupWidget({
    super.key,
    required this.userRef,
    required this.title,
    required this.description,
    required this.type,
  });

  final DocumentReference? userRef;
  final String? title;
  final String? description;
  final String? type;

  @override
  State<UnfollowConfirmPopupWidget> createState() =>
      _UnfollowConfirmPopupWidgetState();
}

class _UnfollowConfirmPopupWidgetState
    extends State<UnfollowConfirmPopupWidget> {
  late UnfollowConfirmPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnfollowConfirmPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(
                0.0,
                -3.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 100.0,
                          buttonSize: 40.0,
                          fillColor: const Color(0xFFE9E9E9),
                          icon: Icon(
                            FFIcons.kdelete2,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).border,
                    borderRadius: 100.0,
                    buttonSize: 36.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      unawaited(
                        () async {
                          Navigator.pop(context);
                        }(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  widget.title!,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'almarai',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
              child: Text(
                widget.description!,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'almarai',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      lineHeight: 1.5,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  unawaited(
                    () async {
                      Navigator.pop(context);
                    }(),
                  );
                },
                text: FFLocalizations.of(context).getText(
                  '1hynjjqr' /* Close */,
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (widget.type == 'Designer') {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'user_designer_following':
                              FieldValue.arrayRemove([widget.userRef]),
                        },
                      ),
                    });
                    Navigator.pop(context);

                    context.pushNamed(
                      DesignerWidget.routeName,
                      queryParameters: {
                        'designerUid': serializeParam(
                          widget.userRef?.id,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  } else {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'user_creator_following':
                              FieldValue.arrayRemove([widget.userRef]),
                        },
                      ),
                    });
                    Navigator.pop(context);

                    context.pushNamed(
                      CreatorsIndividualWidget.routeName,
                      queryParameters: {
                        'creatorUid': serializeParam(
                          widget.userRef?.id,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  }

                  FFAppState().updateUserDataFlowStruct(
                    (e) => e..incrementRefresh(1),
                  );
                  _model.updatePage(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'sl87x5a9' /* Unfollow */,
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).border,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Checkbox(
                        value: _model.checkboxValue ??= false,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.checkboxValue = newValue!);
                        },
                        side: (FlutterFlowTheme.of(context).alternate != null)
                            ? BorderSide(
                                width: 2,
                                color: FlutterFlowTheme.of(context).alternate,
                              )
                            : null,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '1tru23t4' /* Don't show again */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'almarai',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
          ].addToStart(const SizedBox(height: 16.0)).addToEnd(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
