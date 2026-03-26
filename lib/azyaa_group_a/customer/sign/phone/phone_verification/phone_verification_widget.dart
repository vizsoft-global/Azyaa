import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'phone_verification_model.dart';
export 'phone_verification_model.dart';

class PhoneVerificationWidget extends StatefulWidget {
  const PhoneVerificationWidget({super.key});

  static String routeName = 'Phone_Verification';
  static String routePath = '/azyaa-phone-otp';

  @override
  State<PhoneVerificationWidget> createState() =>
      _PhoneVerificationWidgetState();
}

class _PhoneVerificationWidgetState extends State<PhoneVerificationWidget> {
  late PhoneVerificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneVerificationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
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
        title: 'Phone_Verification',
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: StreamBuilder<List<SettingsRecord>>(
                        stream: querySettingsRecord(
                          queryBuilder: (settingsRecord) =>
                              settingsRecord.where(
                            'type',
                            isEqualTo: 'Main',
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 1.0,
                                height: 1.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<SettingsRecord> containerSettingsRecordList =
                              snapshot.data!;
                          final containerSettingsRecord =
                              containerSettingsRecordList.isNotEmpty
                                  ? containerSettingsRecordList.first
                                  : null;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: SvgPicture.asset(
                                        'assets/images/logo.svg',
                                        width: 80.0,
                                        height: 80.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '8aw7bzfi' /* Verify Your Mobile Number */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Text(
                                      () {
                                        if (containerSettingsRecord
                                                ?.settingsOtpService ==
                                            'firebase') {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'Enter the 6-digit code sent to your Phone number to continue your purchase.',
                                            arText:
                                                'أدخل الرمز المكون من 6 أرقام المرسل إلى رقم هاتفك لمواصلة عملية الشراء.',
                                          );
                                        } else if (containerSettingsRecord
                                                ?.settingsOtpService ==
                                            'otpless') {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'Enter the 6-digit code sent to your \"Whatsapp\" to continue your purchase.',
                                            arText:
                                                'أدخل الرمز المكون من 6 أرقام المرسل إلى \"واتساب\" الخاص بك لمواصلة عملية الشراء.',
                                          );
                                        } else {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'Enter the 6-digit code sent to your Phone number to continue your purchase.',
                                            arText:
                                                'أدخل الرمز المكون من 6 أرقام المرسل إلى رقم هاتفك لمواصلة عملية الشراء.',
                                          );
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.normal,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: Text(
                                        '+${FFAppState().UserDataFlow.userPhoneNumber}',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Aileron',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: PinCodeTextField(
                                      autoDisposeControllers: false,
                                      appContext: context,
                                      length: 6,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Aileron',
                                            letterSpacing: 0.0,
                                          ),
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      enableActiveFill: false,
                                      autoFocus: true,
                                      focusNode: _model.pinCodeFocusNode,
                                      enablePinAutofill: false,
                                      errorTextSpace: 16.0,
                                      showCursor: true,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      obscureText: false,
                                      hintCharacter: '*',
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      pinTheme: PinTheme(
                                        fieldHeight: 50.0,
                                        fieldWidth: 40.0,
                                        borderWidth: 1.0,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                        shape: PinCodeFieldShape.box,
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        inactiveColor:
                                            FlutterFlowTheme.of(context).border,
                                        selectedColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                      controller: _model.pinCodeController,
                                      onChanged: (_) {},
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      validator: _model
                                          .pinCodeControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        _model.settingsResultPhoneOtpType =
                                            await querySettingsRecordOnce(
                                          queryBuilder: (settingsRecord) =>
                                              settingsRecord.where(
                                            'type',
                                            isEqualTo: 'Company',
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        if (_model.settingsResultPhoneOtpType
                                                ?.settingsOtpService ==
                                            'firebase') {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          final smsCodeVal =
                                              _model.pinCodeController!.text;
                                          if (smsCodeVal == null ||
                                              smsCodeVal.isEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'jh17uloi' /* Enter SMS verification code */,
                                                )),
                                              ),
                                            );
                                            return;
                                          }
                                          final phoneVerifiedUser =
                                              await authManager.verifySmsCode(
                                            context: context,
                                            smsCode: smsCodeVal,
                                          );
                                          if (phoneVerifiedUser == null) {
                                            return;
                                          }

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            phoneNumber: FFAppState()
                                                .UserDataFlow
                                                .userPhoneNumber,
                                            userInfo:
                                                createUserRelatedInfoStruct(
                                              phoneNumber: FFAppState()
                                                  .UserDataFlow
                                                  .userPhoneNumber,
                                              isPhoneVerificationStatus: true,
                                              phoneNumberCountry: FFAppState()
                                                  .UserDataFlow
                                                  .phoneNumberCountry,
                                              phoneNumberDailCode: FFAppState()
                                                  .UserDataFlow
                                                  .phoneNumberDailcode,
                                              phoneNumberWithoutDailcode:
                                                  FFAppState()
                                                      .UserDataFlow
                                                      .phoneNumberWithoutDailcode,
                                              clearUnsetFields: false,
                                            ),
                                          ));

                                          context.goNamedAuth(
                                            Step1PersonalWidget.routeName,
                                            context.mounted,
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
                                        } else {
                                          if (_model.settingsResultPhoneOtpType
                                                  ?.settingsOtpService ==
                                              'otpless') {
                                            if (_model
                                                    .settingsResultPhoneOtpType
                                                    ?.settingsCompanyInfo
                                                    ?.phoneOtpType ==
                                                'SMS') {
                                              _model.otpSmsVerificationApiStatus =
                                                  await OTPlessGroup
                                                      .verifySMSCall
                                                      .call(
                                                requestId: FFAppState()
                                                    .UserDataFlow
                                                    .userPhoneOtpOrderId,
                                                otp: _model
                                                    .pinCodeController!.text,
                                                url: isWeb
                                                    ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                                                    : 'https://nocodeplayground.onrender.com/',
                                              );

                                              _shouldSetState = true;
                                              if ((_model
                                                      .otpSmsVerificationApiStatus
                                                      ?.succeeded ??
                                                  true)) {
                                                if (OTPlessGroup.verifySMSCall
                                                        .status(
                                                      (_model.otpSmsVerificationApiStatus
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    true) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Incorrect Verification CODE.',
                                                            arText:
                                                                'رمز التحقق غير صحيح.',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText: 'Ok',
                                                                arText: 'نعم',
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              'Incorrect Verification CODE.',
                                                          arText:
                                                              'رمز التحقق غير صحيح.',
                                                        )),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                              enText: 'Ok',
                                                              arText: 'نعم',
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            } else {
                                              _model.otpVerificationApiStatus =
                                                  await OTPlessGroup.verifyCall
                                                      .call(
                                                orderId: FFAppState()
                                                    .UserDataFlow
                                                    .userPhoneOtpOrderId,
                                                otp: int.tryParse(_model
                                                    .pinCodeController!.text),
                                                phoneno: FFAppState()
                                                    .UserDataFlow
                                                    .userPhoneNumber,
                                                url: isWeb
                                                    ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                                                    : 'https://nocodeplayground.onrender.com/',
                                              );

                                              _shouldSetState = true;
                                              if ((_model
                                                      .otpVerificationApiStatus
                                                      ?.succeeded ??
                                                  true)) {
                                                if (OTPlessGroup.verifyCall
                                                        .result(
                                                      (_model.otpVerificationApiStatus
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    true) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                            enText:
                                                                'Incorrect Verification CODE.',
                                                            arText:
                                                                'رمز التحقق غير صحيح.',
                                                          )),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                enText: 'Ok',
                                                                arText: 'نعم',
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getVariableText(
                                                          enText:
                                                              'Incorrect Verification CODE.',
                                                          arText:
                                                              'رمز التحقق غير صحيح.',
                                                        )),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                              enText: 'Ok',
                                                              arText: 'نعم',
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                            }

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              phoneNumber: FFAppState()
                                                  .UserDataFlow
                                                  .userPhoneNumber,
                                              userInfo:
                                                  createUserRelatedInfoStruct(
                                                phoneNumber: FFAppState()
                                                    .UserDataFlow
                                                    .userPhoneNumber,
                                                isPhoneVerificationStatus: true,
                                                phoneNumberCountry: FFAppState()
                                                    .UserDataFlow
                                                    .phoneNumberCountry,
                                                phoneNumberDailCode:
                                                    FFAppState()
                                                        .UserDataFlow
                                                        .phoneNumberDailcode,
                                                phoneNumberWithoutDailcode:
                                                    FFAppState()
                                                        .UserDataFlow
                                                        .phoneNumberWithoutDailcode,
                                                clearUnsetFields: false,
                                              ),
                                            ));

                                            context.goNamedAuth(
                                              Step1PersonalWidget.routeName,
                                              context.mounted,
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
                                          }
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '4yn9k72d' /* Verify and Continue */,
                                      ),
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Aileron',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 24.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if ((_model.timerMilliseconds != 0) &&
                                            (FFAppState()
                                                    .UserDataFlow
                                                    .userPhoneOtpAttempt <=
                                                2))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'z514bll0' /* Resend code in  */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.5,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                FlutterFlowTimer(
                                                  initialTime:
                                                      _model.timerInitialTimeMs,
                                                  getDisplayTime: (value) =>
                                                      StopWatchTimer
                                                          .getDisplayTime(
                                                    value,
                                                    hours: false,
                                                    minute: false,
                                                    milliSecond: false,
                                                  ),
                                                  controller:
                                                      _model.timerController,
                                                  updateStateInterval: Duration(
                                                      milliseconds: 1000),
                                                  onChanged: (value,
                                                      displayTime,
                                                      shouldUpdate) {
                                                    _model.timerMilliseconds =
                                                        value;
                                                    _model.timerValue =
                                                        displayTime;
                                                    if (shouldUpdate)
                                                      safeSetState(() {});
                                                  },
                                                  onEnded: () async {
                                                    _model.refresh =
                                                        (_model.refresh!) + 1;
                                                    safeSetState(() {});
                                                  },
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wesm9xkz' /*  sec */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .UserDataFlow
                                                    .userPhoneOtpAttempt <
                                                2) &&
                                            (_model.timerMilliseconds == 0))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (containerSettingsRecord
                                                        ?.settingsOtpService ==
                                                    'firebase') {
                                                  FFAppState()
                                                      .updateUserDataFlowStruct(
                                                    (e) => e
                                                      ..userPhoneOtpAttempt =
                                                          FFAppState()
                                                                  .UserDataFlow
                                                                  .userPhoneOtpAttempt +
                                                              1,
                                                  );
                                                  final phoneNumberVal =
                                                      '+${FFAppState().UserDataFlow.userPhoneNumber}';
                                                  if (phoneNumberVal == null ||
                                                      phoneNumberVal.isEmpty ||
                                                      !phoneNumberVal
                                                          .startsWith('+')) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'gen42piv' /* Phone number required and has ... */,
                                                        )),
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                  await authManager
                                                      .beginPhoneAuth(
                                                    context: context,
                                                    phoneNumber: phoneNumberVal,
                                                    onCodeSent:
                                                        (context) async {
                                                      context.goNamedAuth(
                                                        PhoneVerificationWidget
                                                            .routeName,
                                                        context.mounted,
                                                        ignoreRedirect: true,
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  if (containerSettingsRecord
                                                          ?.settingsOtpService ==
                                                      'otpless') {
                                                    _model.otpResendApiStatus =
                                                        await OTPlessGroup
                                                            .resendCall
                                                            .call(
                                                      orderId: FFAppState()
                                                          .UserDataFlow
                                                          .userPhoneOtpOrderId,
                                                      url: isWeb
                                                          ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                                                          : 'https://nocodeplayground.onrender.com/',
                                                    );

                                                    if (_model
                                                            .settingsSMSResultPhoneOtpType
                                                            ?.settingsCompanyInfo
                                                            ?.phoneOtpType ==
                                                        'SMS') {
                                                      _model.otpSmsSendApiStatus =
                                                          await OTPlessGroup
                                                              .sendSMSCall
                                                              .call(
                                                        phoneno:
                                                            '${FFAppState().UserDataFlow.phoneNumberDailcodeWithPlus}${FFAppState().UserDataFlow.phoneNumberWithoutDailcode}',
                                                        url: isWeb
                                                            ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                                                            : 'https://nocodeplayground.onrender.com/',
                                                      );

                                                      if ((_model
                                                              .otpSmsSendApiStatus
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .updateUserDataFlowStruct(
                                                          (e) => e
                                                            ..userPhoneOtpAttempt =
                                                                FFAppState()
                                                                        .UserDataFlow
                                                                        .userPhoneOtpAttempt +
                                                                    1
                                                            ..userPhoneOtpOrderId =
                                                                OTPlessGroup
                                                                    .sendSMSCall
                                                                    .requestId(
                                                              (_model.otpSmsSendApiStatus
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText:
                                                                    'Resent otp kindly check.',
                                                                arText:
                                                                    'تم إرسال OTP، يرجى التحقق.',
                                                              ),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getVariableText(
                                                                enText:
                                                                    'There was a technical problem sending the OTP; please try again later.',
                                                                arText:
                                                                    'حدثت مشكلة فنية أثناء إرسال OTP؛ يرجى المحاولة مرة أخرى لاحقًا.',
                                                              ),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      _model.settingsSMSResultPhoneOtpType =
                                                          await querySettingsRecordOnce(
                                                        queryBuilder:
                                                            (settingsRecord) =>
                                                                settingsRecord
                                                                    .where(
                                                          'type',
                                                          isEqualTo: 'Company',
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      if ((_model
                                                              .otpResendApiStatus
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState()
                                                            .updateUserDataFlowStruct(
                                                          (e) => e
                                                            ..userPhoneOtpAttempt =
                                                                FFAppState()
                                                                        .UserDataFlow
                                                                        .userPhoneOtpAttempt +
                                                                    1
                                                            ..userPhoneOtpOrderId =
                                                                OTPlessGroup
                                                                    .resendCall
                                                                    .orderid(
                                                                      (_model.otpResendApiStatus
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                    .toString(),
                                                        );
                                                        safeSetState(() {});
                                                      }
                                                    }
                                                  }
                                                }

                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'cbrvwkwf' /* Resend OTP */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.5,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await authManager.signOut();
                                          GoRouter.of(context)
                                              .clearRedirectLocation();

                                          context.goNamedAuth(
                                              LoginWidget.routeName,
                                              context.mounted);
                                        },
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'orxznqxy' /* Already have an account ?  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.5,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'td9o0y0i' /* Login */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.5,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
