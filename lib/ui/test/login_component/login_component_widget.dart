import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'login_component_model.dart';
export 'login_component_model.dart';

class LoginComponentWidget extends StatefulWidget {
  const LoginComponentWidget({super.key});

  @override
  State<LoginComponentWidget> createState() => _LoginComponentWidgetState();
}

class _LoginComponentWidgetState extends State<LoginComponentWidget> {
  late LoginComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginComponentModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
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
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Container(
                    width: 35.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCCBBCC),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'kvv17ohc' /* Login */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'almarai',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    final user = await authManager
                                        .signInWithGoogle(context);
                                    if (user == null) {
                                      return;
                                    }
                                    if (valueOrDefault(
                                            currentUserDocument?.status, '') ==
                                        '') {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) =>
                                            e..userRef = currentUserReference,
                                      );

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        userInfo: createUserRelatedInfoStruct(
                                          userId: currentUserUid,
                                          firstName: currentUserDisplayName,
                                          email: currentUserEmail,
                                          isEmailVerificationStatus: true,
                                          isPhoneVerificationStatus: false,
                                          isPofileCompleteStatus: false,
                                          isStep1Status: false,
                                          isStep2Status: false,
                                          isStep3Status: false,
                                          clearUnsetFields: false,
                                        ),
                                        status: 'Published',
                                        userRole: 'Customer',
                                        userName: currentUserDisplayName,
                                        referralCode: random_data.randomString(
                                          8,
                                          8,
                                          false,
                                          true,
                                          true,
                                        ),
                                      ));

                                      context.goNamedAuth(PhoneWidget.routeName,
                                          context.mounted);
                                    } else {
                                      if (valueOrDefault(
                                              currentUserDocument?.status,
                                              '') ==
                                          'Published') {
                                        FFAppState().updateUserDataFlowStruct(
                                          (e) => e
                                            ..userEmail = currentUserDocument
                                                ?.userInfo.email
                                            ..phoneNumberCountry =
                                                currentUserDocument?.userInfo
                                                    .phoneNumberCountry
                                            ..userPhoneNumber =
                                                currentUserDocument
                                                    ?.userInfo.phoneNumber
                                            ..phoneNumberDailcode =
                                                currentUserDocument?.userInfo
                                                    .phoneNumberDailCode
                                            ..userRef = currentUserReference,
                                        );
                                        if (currentUserDocument?.userInfo
                                                .isPofileCompleteStatus ==
                                            true) {
                                          context.goNamedAuth(
                                              HomeWidget.routeName,
                                              context.mounted);
                                        } else {
                                          if (currentUserDocument?.userInfo
                                                  .isEmailVerificationStatus ==
                                              false) {
                                            FFAppState()
                                                .updateUserDataFlowStruct(
                                              (e) => e
                                                ..userEmailOtp = random_data
                                                    .randomInteger(6, 6)
                                                ..userEmail = currentUserEmail
                                                ..userEmailOtpAttempt = 1,
                                            );

                                            await MailRecord.collection
                                                .doc()
                                                .set(createMailRecordData(
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  to: currentUserEmail,
                                                  message: createMailBodyStruct(
                                                    subject: 'OTP from Azyaa',
                                                    html:
                                                        'This is an ${FFAppState().UserDataFlow.userEmailOtp.toString()} email CODE.',
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                ));

                                            context.goNamedAuth(
                                                RegisterVerificationWidget
                                                    .routeName,
                                                context.mounted);
                                          } else {
                                            if (currentUserDocument?.userInfo
                                                    .isPhoneVerificationStatus ==
                                                false) {
                                              context.goNamedAuth(
                                                  PhoneWidget.routeName,
                                                  context.mounted);
                                            } else {
                                              if (currentUserDocument?.userInfo
                                                      .isStep1Status ==
                                                  false) {
                                                context.goNamedAuth(
                                                    Step1PersonalWidget
                                                        .routeName,
                                                    context.mounted);
                                              } else {
                                                if (currentUserDocument
                                                        ?.userInfo
                                                        .isStep2Status ==
                                                    false) {
                                                  context.goNamedAuth(
                                                      Step2MeasurementsWidget
                                                          .routeName,
                                                      context.mounted);
                                                } else {
                                                  if (currentUserDocument
                                                          ?.userInfo
                                                          .isStep3Status ==
                                                      false) {
                                                    context.goNamedAuth(
                                                        Step3PreferredStyleWidget
                                                            .routeName,
                                                        context.mounted);
                                                  } else {
                                                    context.goNamedAuth(
                                                        Step4ReferralCodeWidget
                                                            .routeName,
                                                        context.mounted);
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: const Text(
                                                    'Please contact us as your account has been blocked.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            LoginWidget.routeName,
                                            context.mounted);
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .buttonBorder,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/google-logo.png',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5vw54zpj' /* Google */,
                                                ),
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
                                            ].divide(const SizedBox(width: 12.0)),
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
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Lottie.asset(
                                              'assets/jsons/google-login.json',
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    final user = await authManager
                                        .signInWithApple(context);
                                    if (user == null) {
                                      return;
                                    }
                                    if (valueOrDefault(
                                            currentUserDocument?.status, '') ==
                                        '') {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) =>
                                            e..userRef = currentUserReference,
                                      );

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        userInfo: createUserRelatedInfoStruct(
                                          userId: currentUserUid,
                                          firstName: currentUserDisplayName,
                                          email: currentUserEmail,
                                          isEmailVerificationStatus: true,
                                          isPhoneVerificationStatus: false,
                                          isPofileCompleteStatus: false,
                                          isStep1Status: false,
                                          isStep2Status: false,
                                          isStep3Status: false,
                                          clearUnsetFields: false,
                                        ),
                                        status: 'Published',
                                        userRole: 'Customer',
                                        userName: currentUserDisplayName,
                                        referralCode: random_data.randomString(
                                          8,
                                          8,
                                          false,
                                          true,
                                          true,
                                        ),
                                      ));

                                      context.goNamedAuth(PhoneWidget.routeName,
                                          context.mounted);
                                    } else {
                                      if (valueOrDefault(
                                              currentUserDocument?.status,
                                              '') ==
                                          'Published') {
                                        FFAppState().updateUserDataFlowStruct(
                                          (e) => e
                                            ..userEmail = currentUserDocument
                                                ?.userInfo.email
                                            ..phoneNumberCountry =
                                                currentUserDocument?.userInfo
                                                    .phoneNumberCountry
                                            ..userPhoneNumber =
                                                currentUserDocument
                                                    ?.userInfo.phoneNumber
                                            ..phoneNumberDailcode =
                                                currentUserDocument?.userInfo
                                                    .phoneNumberDailCode
                                            ..userRef = currentUserReference,
                                        );
                                        if (currentUserDocument?.userInfo
                                                .isPofileCompleteStatus ==
                                            true) {
                                          context.goNamedAuth(
                                              HomeWidget.routeName,
                                              context.mounted);
                                        } else {
                                          if (currentUserDocument?.userInfo
                                                  .isEmailVerificationStatus ==
                                              false) {
                                            FFAppState()
                                                .updateUserDataFlowStruct(
                                              (e) => e
                                                ..userEmailOtp = random_data
                                                    .randomInteger(6, 6)
                                                ..userEmail = currentUserEmail
                                                ..userEmailOtpAttempt = 1,
                                            );

                                            await MailRecord.collection
                                                .doc()
                                                .set(createMailRecordData(
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  to: currentUserEmail,
                                                  message: createMailBodyStruct(
                                                    subject: 'OTP from Azyaa',
                                                    html:
                                                        'This is an ${FFAppState().UserDataFlow.userEmailOtp.toString()} email CODE.',
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                ));

                                            context.goNamedAuth(
                                                RegisterVerificationWidget
                                                    .routeName,
                                                context.mounted);
                                          } else {
                                            if (currentUserDocument?.userInfo
                                                    .isPhoneVerificationStatus ==
                                                false) {
                                              context.goNamedAuth(
                                                  PhoneWidget.routeName,
                                                  context.mounted);
                                            } else {
                                              if (currentUserDocument?.userInfo
                                                      .isStep1Status ==
                                                  false) {
                                                context.goNamedAuth(
                                                    Step1PersonalWidget
                                                        .routeName,
                                                    context.mounted);
                                              } else {
                                                if (currentUserDocument
                                                        ?.userInfo
                                                        .isStep2Status ==
                                                    false) {
                                                  context.goNamedAuth(
                                                      Step2MeasurementsWidget
                                                          .routeName,
                                                      context.mounted);
                                                } else {
                                                  if (currentUserDocument
                                                          ?.userInfo
                                                          .isStep3Status ==
                                                      false) {
                                                    context.goNamedAuth(
                                                        Step3PreferredStyleWidget
                                                            .routeName,
                                                        context.mounted);
                                                  } else {
                                                    context.goNamedAuth(
                                                        Step4ReferralCodeWidget
                                                            .routeName,
                                                        context.mounted);
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: const Text(
                                                    'Please contact us as your account has been blocked.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            LoginWidget.routeName,
                                            context.mounted);
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .buttonBorder,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/apple-logo_(1).png',
                                                  width: 24.0,
                                                  height: 24.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'mn316pv0' /* Apple */,
                                                ),
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
                                            ].divide(const SizedBox(width: 12.0)),
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
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Lottie.asset(
                                              'assets/jsons/apple_login.json',
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 16.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '7x90iye7' /* or sign in with */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'vs6l9e80' /* Email  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'qnvcuxqk' /* * */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
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
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _model.emailTextController,
                              focusNode: _model.emailFocusNode,
                              autofocus: true,
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
                                hintText: FFLocalizations.of(context).getText(
                                  'oeot317w' /* Enter your email */,
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
                                    color: FlutterFlowTheme.of(context).border,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).border,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
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
                              keyboardType: TextInputType.emailAddress,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.emailTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'bv6k9wh3' /* Password  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'almarai',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    's4ro5lcw' /* * */,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).error,
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
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _model.passwordTextController,
                              focusNode: _model.passwordFocusNode,
                              autofocus: false,
                              obscureText: !_model.passwordVisibility,
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
                                hintText: FFLocalizations.of(context).getText(
                                  'eq2s4ibg' /* Enter your password */,
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
                                    color: FlutterFlowTheme.of(context).border,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).border,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    safeSetState(() =>
                                        _model.passwordVisibility =
                                            !_model.passwordVisibility);
                                  },
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                              maxLength: 25,
                              buildCounter: (context,
                                      {required currentLength,
                                      required isFocused,
                                      maxLength}) =>
                                  null,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.passwordTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(ForgotPasswordWidget.routeName);
                              },
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'zg8hoo1h' /* Forgot your password? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            ForgotPasswordWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              GoRouter.of(context).prepareAuthEvent();

                              final user = await authManager.signInWithEmail(
                                context,
                                _model.emailTextController.text,
                                _model.passwordTextController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              if (valueOrDefault(
                                      currentUserDocument?.status, '') ==
                                  'Published') {
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..userEmail =
                                        currentUserDocument?.userInfo.email
                                    ..phoneNumberCountry = currentUserDocument
                                        ?.userInfo.phoneNumberCountry
                                    ..userPhoneNumber = currentUserDocument
                                        ?.userInfo.phoneNumber
                                    ..phoneNumberDailcode = currentUserDocument
                                        ?.userInfo.phoneNumberDailCode
                                    ..userRef = currentUserReference,
                                );
                                if (currentUserDocument
                                        ?.userInfo.isPofileCompleteStatus ==
                                    true) {
                                  context.goNamedAuth(
                                      HomeWidget.routeName, context.mounted);
                                } else {
                                  if (currentUserDocument?.userInfo
                                          .isEmailVerificationStatus ==
                                      false) {
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..userEmailOtp = random_data
                                            .randomInteger(100000, 999999)
                                        ..userEmail = currentUserEmail
                                        ..userEmailOtpAttempt = 1,
                                    );

                                    await MailRecord.collection
                                        .doc()
                                        .set(createMailRecordData(
                                          createdAt: getCurrentTimestamp,
                                          to: currentUserEmail,
                                          message: createMailBodyStruct(
                                            subject: 'OTP from Azyaa',
                                            html:
                                                'Welcome to Azyaa<br/><br/><br/>This is an <b>${FFAppState().UserDataFlow.userEmailOtp.toString()} <b/>email CODE.',
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                        ));

                                    context.goNamedAuth(
                                        RegisterVerificationWidget.routeName,
                                        context.mounted);
                                  } else {
                                    if (currentUserDocument?.userInfo
                                            .isPhoneVerificationStatus ==
                                        false) {
                                      context.goNamedAuth(PhoneWidget.routeName,
                                          context.mounted);
                                    } else {
                                      if (currentUserDocument
                                              ?.userInfo.isStep1Status ==
                                          false) {
                                        context.goNamedAuth(
                                            Step1PersonalWidget.routeName,
                                            context.mounted);
                                      } else {
                                        if (currentUserDocument
                                                ?.userInfo.isStep2Status ==
                                            false) {
                                          context.goNamedAuth(
                                              Step2MeasurementsWidget.routeName,
                                              context.mounted);
                                        } else {
                                          if (currentUserDocument
                                                  ?.userInfo.isStep3Status ==
                                              false) {
                                            context.goNamedAuth(
                                                Step3PreferredStyleWidget
                                                    .routeName,
                                                context.mounted);
                                          } else {
                                            context.goNamedAuth(
                                                Step4ReferralCodeWidget
                                                    .routeName,
                                                context.mounted);
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: const Text(
                                            'Please contact us as your account has been blocked.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    LoginWidget.routeName, context.mounted);
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'gsx9xqu6' /* Sign in */,
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
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 24.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '7eznhnt9' /* By continuing you agree  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'zwsgxgao' /* Terms of Services  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'flsbkg0f' /* &  */,
                                      ),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'v713ww30' /* Privacy Policy  */,
                                      ),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'almarai',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(RegisterWidget.routeName);
                            },
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'n084xvym' /* Don’t have an account ?  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'g2cfh96m' /* Sign Up */,
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
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
                .addToStart(const SizedBox(height: 16.0))
                .addToEnd(const SizedBox(height: 16.0)),
          ),
        ],
      ),
    );
  }
}
