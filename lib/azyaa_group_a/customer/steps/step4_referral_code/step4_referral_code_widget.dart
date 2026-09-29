import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'step4_referral_code_model.dart';
export 'step4_referral_code_model.dart';

class Step4ReferralCodeWidget extends StatefulWidget {
  const Step4ReferralCodeWidget({super.key});

  static String routeName = 'Step4-ReferralCode';
  static String routePath = '/azyaa-step-four';

  @override
  State<Step4ReferralCodeWidget> createState() =>
      _Step4ReferralCodeWidgetState();
}

class _Step4ReferralCodeWidgetState extends State<Step4ReferralCodeWidget> {
  late Step4ReferralCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Step4ReferralCodeModel());

    _model.referralcodeFieldTextController ??= TextEditingController();
    _model.referralcodeFieldFocusNode ??= FocusNode();

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
        title: 'Step4-ReferralCode',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '3kvazbtc' /* 1 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '846sf665' /* 2 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'reh323ar' /* 3 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'fxnddfmx' /* Do you have a referral code? */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'almarai',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'iti7nczb' /* Enter your referral code below... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'almarai',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.normal,
                                lineHeight: 1.5,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          's7xp42zh' /* Enter referral code here  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  child: TextFormField(
                                    controller:
                                        _model.referralcodeFieldTextController,
                                    focusNode:
                                        _model.referralcodeFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.referralcodeFieldTextController',
                                      const Duration(milliseconds: 2000),
                                      () async {
                                        if (_model
                                                .referralcodeFieldTextController
                                                .text ==
                                            '') {
                                          _model.referralStatys =
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                            enText: 'notYet',
                                            arText: 'ليس بعد',
                                          );
                                          _model.referredUserRef = null;
                                          safeSetState(() {});
                                        } else {
                                          _model.userReferralResult1 =
                                              await queryUsersRecordOnce(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord
                                                    .where(
                                                      'referral_code',
                                                      isEqualTo: _model
                                                          .referralcodeFieldTextController
                                                          .text,
                                                    )
                                                    .where(
                                                      'uid',
                                                      isNotEqualTo:
                                                          currentUserUid,
                                                    ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if ((_model.userReferralResult1 !=
                                                  null) ==
                                              true) {
                                            _model.referralStatys =
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Referred',
                                              arText: 'مشار إليه',
                                            );
                                            _model.referredUserRef =
                                                _model.referredUserRef;
                                            safeSetState(() {});
                                          } else {
                                            _model.referralStatys =
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'notYet',
                                              arText: 'ليس بعد',
                                            );
                                            _model.referredUserRef = null;
                                            safeSetState(() {});
                                          }
                                        }

                                        FFAppState().updateUserDataFlowStruct(
                                          (e) => e..incrementRefresh(1),
                                        );
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'vyo5uncc' /* XXXXXXXX */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .referralcodeFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              if (_model.referralStatys !=
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'notYet',
                                    arText: 'ليس بعد',
                                  ))
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vzik9jtp' /* Referral code applied successf... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            color: const Color(0xFF2A7803),
                                            fontSize: 12.0,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_model.referralcodeFieldTextController.text != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.referralStatys == 'Referred') {
                              _model.idMapResult = await queryIdMapRecordOnce(
                                queryBuilder: (idMapRecord) =>
                                    idMapRecord.where(
                                  'type',
                                  isEqualTo: 'Main',
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              var userReferralActivitiesRecordReference =
                                  UserReferralActivitiesRecord.collection.doc();
                              await userReferralActivitiesRecordReference
                                  .set(createUserReferralActivitiesRecordData(
                                userReferralId:
                                    _model.idMapResult?.userReferralId,
                                refereeNewUserId: currentUserReference,
                                referrerExistingUserId:
                                    _model.userReferralResult1?.reference,
                                rewardPoints: _model.referralPoints,
                                status: 'Pending',
                                createdAt: getCurrentTimestamp,
                              ));
                              _model.rewardResult = UserReferralActivitiesRecord
                                  .getDocumentFromData(
                                      createUserReferralActivitiesRecordData(
                                        userReferralId:
                                            _model.idMapResult?.userReferralId,
                                        refereeNewUserId: currentUserReference,
                                        referrerExistingUserId: _model
                                            .userReferralResult1?.reference,
                                        rewardPoints: _model.referralPoints,
                                        status: 'Pending',
                                        createdAt: getCurrentTimestamp,
                                      ),
                                      userReferralActivitiesRecordReference);

                              await _model.userReferralResult1!.reference
                                  .update(createUsersRecordData(
                                pointsBalance:
                                    _model.userReferralResult1!.pointsBalance +
                                        (_model.referralPoints!),
                                userVto: createUserVirtualtryonStruct(
                                  updatedAt: getCurrentTimestamp,
                                  userVtoCreditPoints: _model
                                          .userReferralResult1!
                                          .userVto
                                          .userVtoCreditPoints +
                                      3,
                                  clearUnsetFields: false,
                                ),
                              ));

                              await _model.rewardResult!.reference.update(
                                  createUserReferralActivitiesRecordData(
                                status: 'Completed',
                              ));

                              await _model.idMapResult!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'user_referral_id': FieldValue.increment(1),
                                  },
                                ),
                              });

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                userInfo: createUserRelatedInfoStruct(
                                  isPofileCompleteStatus: true,
                                  clearUnsetFields: false,
                                ),
                                userVto: createUserVirtualtryonStruct(
                                  createdAt: getCurrentTimestamp,
                                  updatedAt: getCurrentTimestamp,
                                  userVtoCreditPoints: 3,
                                  clearUnsetFields: false,
                                ),
                              ));

                              context.goNamed(
                                HomeWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '2753gd5y' /* Complete */,
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'almarai',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await currentUserReference!
                            .update(createUsersRecordData(
                          userInfo: createUserRelatedInfoStruct(
                            isPofileCompleteStatus: true,
                            clearUnsetFields: false,
                          ),
                          userVto: createUserVirtualtryonStruct(
                            createdAt: getCurrentTimestamp,
                            userVtoCreditPoints: 3,
                            updatedAt: getCurrentTimestamp,
                            clearUnsetFields: false,
                          ),
                        ));

                        context.goNamed(
                          HomeWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '8v1686y8' /* Skip */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'almarai',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(height: 16.0))
                      .addToEnd(const SizedBox(height: 32.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
