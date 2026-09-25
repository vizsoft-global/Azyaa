import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'social_model.dart';
export 'social_model.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({super.key});

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  late SocialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: StreamBuilder<List<SettingsRecord>>(
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
            return Container(
              width: 0.0,
              height: 0.0,
              child: const BlankLoadingWidget(),
            );
          }
          List<SettingsRecord> socialSettingsRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final socialSettingsRecord = socialSettingsRecordList.isNotEmpty
              ? socialSettingsRecordList.first
              : null;

          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (socialSettingsRecord?.settingsSocialLogin.googleLogin ==
                  true)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.googlestatus = 'show';
                        GoRouter.of(context).prepareAuthEvent();
                        final user =
                            await authManager.signInWithGoogle(context);
                        if (user == null) {
                          return;
                        }
                        if (FFAppState().UserDataFlow.userWaiterStatus ==
                            true) {
                          if (FFAppState().UserDataFlow.userEmail !=
                              currentUserEmail) {
                            if (valueOrDefault(
                                    currentUserDocument?.status, '') ==
                                '') {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                status: 'Secret',
                              ));
                            }
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText:
                                          'Please contact us as your account has been blocked.',
                                      arText:
                                          'يرجى الاتصال بنا حيث تم حظر حسابك.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                              LoginWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            return;
                          }
                        }
                        if (valueOrDefault(currentUserDocument?.status, '') ==
                            '') {
                          FFAppState().updateUserDataFlowStruct(
                            (e) => e..userRef = currentUserReference,
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
                          if (socialSettingsRecord?.settingsPhoneOtpStatus ==
                              false) {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              userInfo: createUserRelatedInfoStruct(
                                isPhoneVerificationStatus: true,
                                clearUnsetFields: false,
                              ),
                            ));

                            context.goNamedAuth(
                              Step1PersonalWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else {
                            context.goNamedAuth(
                              PhoneWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        } else {
                          if (valueOrDefault(currentUserDocument?.status, '') ==
                              'Published') {
                            FFAppState().updateUserDataFlowStruct(
                              (e) => e
                                ..userEmail =
                                    currentUserDocument?.userInfo.email
                                ..phoneNumberCountry = currentUserDocument
                                    ?.userInfo.phoneNumberCountry
                                ..userPhoneNumber =
                                    currentUserDocument?.userInfo.phoneNumber
                                ..phoneNumberDailcode = currentUserDocument
                                    ?.userInfo.phoneNumberDailCode
                                ..userRef = currentUserReference,
                            );
                            FFAppState().updateUserDataFlowStruct(
                              (e) => e..userProductSwatchesList = [],
                            );
                            await actions.registerFcmTokenIfMissing();
                            if (currentUserDocument
                                    ?.userInfo.isPofileCompleteStatus ==
                                true) {
                              context.goNamedAuth(
                                HomeWidget.routeName,
                                context.mounted,
                                extra: <String, dynamic>{
                                  '__transition_info__': const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              if (currentUserDocument
                                      ?.userInfo.isEmailVerificationStatus ==
                                  false) {
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..userEmailOtp =
                                        random_data.randomInteger(6, 6)
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
                                            'This is an ${FFAppState().UserDataFlow.userEmailOtp.toString()} email CODE.',
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ));

                                context.goNamedAuth(
                                  RegisterVerificationWidget.routeName,
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    '__transition_info__': const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                if (socialSettingsRecord!
                                        .settingsPhoneOtpStatus &&
                                    (currentUserDocument?.userInfo
                                            .isPhoneVerificationStatus ==
                                        false)) {
                                  context.goNamedAuth(
                                    PhoneWidget.routeName,
                                    context.mounted,
                                    extra: <String, dynamic>{
                                      '__transition_info__': const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  if (currentUserDocument
                                          ?.userInfo.isStep1Status ==
                                      false) {
                                    context.goNamedAuth(
                                      Step1PersonalWidget.routeName,
                                      context.mounted,
                                      extra: <String, dynamic>{
                                        '__transition_info__': const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    if (currentUserDocument
                                            ?.userInfo.isStep2Status ==
                                        false) {
                                      context.goNamedAuth(
                                        Step2MeasurementsWidget.routeName,
                                        context.mounted,
                                        extra: <String, dynamic>{
                                          '__transition_info__': const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    } else {
                                      if (currentUserDocument
                                              ?.userInfo.isStep3Status ==
                                          false) {
                                        context.goNamedAuth(
                                          Step3PreferredStyleWidget.routeName,
                                          context.mounted,
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
                                      } else {
                                        context.goNamedAuth(
                                          Step4ReferralCodeWidget.routeName,
                                          context.mounted,
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
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText:
                                          'Please contact us as your account has been blocked.',
                                      arText:
                                          'يرجى الاتصال بنا حيث تم حظر حسابك.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                              LoginWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).buttonBorder,
                            width: 1.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            if (_model.googlestatus == 'hide')
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/google-logo.png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'gatq8815' /* Google */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 12.0)),
                                ),
                              ),
                            if (_model.googlestatus == 'show')
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                ),
              if ((isiOS == true) &&
                  (socialSettingsRecord?.settingsSocialLogin.appleLogin ==
                      true))
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.applestatus = 'show';
                        GoRouter.of(context).prepareAuthEvent();
                        final user = await authManager.signInWithApple(context);
                        if (user == null) {
                          return;
                        }
                        if (FFAppState().UserDataFlow.userWaiterStatus ==
                            true) {
                          if (FFAppState().UserDataFlow.userEmail !=
                              currentUserEmail) {
                            if (valueOrDefault(
                                    currentUserDocument?.status, '') ==
                                '') {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                status: 'Secret',
                              ));
                            }
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText:
                                          'Please contact us as your account has been blocked.',
                                      arText:
                                          'يرجى الاتصال بنا حيث تم حظر حسابك.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                              LoginWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            return;
                          }
                        }
                        if (valueOrDefault(currentUserDocument?.status, '') ==
                            '') {
                          FFAppState().updateUserDataFlowStruct(
                            (e) => e..userRef = currentUserReference,
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
                          if (socialSettingsRecord?.settingsPhoneOtpStatus ==
                              false) {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              userInfo: createUserRelatedInfoStruct(
                                isPhoneVerificationStatus: true,
                                clearUnsetFields: false,
                              ),
                            ));

                            context.goNamedAuth(
                                Step1PersonalWidget.routeName, context.mounted);
                          } else {
                            context.goNamedAuth(
                                PhoneWidget.routeName, context.mounted);
                          }
                        } else {
                          if (valueOrDefault(currentUserDocument?.status, '') ==
                              'Published') {
                            FFAppState().updateUserDataFlowStruct(
                              (e) => e
                                ..userEmail =
                                    currentUserDocument?.userInfo.email
                                ..phoneNumberCountry = currentUserDocument
                                    ?.userInfo.phoneNumberCountry
                                ..userPhoneNumber =
                                    currentUserDocument?.userInfo.phoneNumber
                                ..phoneNumberDailcode = currentUserDocument
                                    ?.userInfo.phoneNumberDailCode
                                ..userRef = currentUserReference,
                            );
                            FFAppState().updateUserDataFlowStruct(
                              (e) => e..userProductSwatchesList = [],
                            );
                            await actions.registerFcmTokenIfMissing();
                            if (currentUserDocument
                                    ?.userInfo.isPofileCompleteStatus ==
                                true) {
                              context.goNamedAuth(
                                HomeWidget.routeName,
                                context.mounted,
                                extra: <String, dynamic>{
                                  '__transition_info__': const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              if (currentUserDocument
                                      ?.userInfo.isEmailVerificationStatus ==
                                  false) {
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..userEmailOtp =
                                        random_data.randomInteger(6, 6)
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
                                            'This is an ${FFAppState().UserDataFlow.userEmailOtp.toString()} email CODE.',
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ));

                                context.goNamedAuth(
                                  RegisterVerificationWidget.routeName,
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    '__transition_info__': const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                if ((currentUserDocument?.userInfo
                                            .isPhoneVerificationStatus ==
                                        false) &&
                                    (socialSettingsRecord
                                            ?.settingsPhoneOtpStatus ==
                                        true)) {
                                  context.goNamedAuth(
                                    PhoneWidget.routeName,
                                    context.mounted,
                                    extra: <String, dynamic>{
                                      '__transition_info__': const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  if (currentUserDocument
                                          ?.userInfo.isStep1Status ==
                                      false) {
                                    context.goNamedAuth(
                                      Step1PersonalWidget.routeName,
                                      context.mounted,
                                      extra: <String, dynamic>{
                                        '__transition_info__': const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    if (currentUserDocument
                                            ?.userInfo.isStep2Status ==
                                        false) {
                                      context.goNamedAuth(
                                        Step2MeasurementsWidget.routeName,
                                        context.mounted,
                                        extra: <String, dynamic>{
                                          '__transition_info__': const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    } else {
                                      if (currentUserDocument
                                              ?.userInfo.isStep3Status ==
                                          false) {
                                        context.goNamedAuth(
                                          Step3PreferredStyleWidget.routeName,
                                          context.mounted,
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
                                      } else {
                                        context.goNamedAuth(
                                          Step4ReferralCodeWidget.routeName,
                                          context.mounted,
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
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText:
                                          'Please contact us as your account has been blocked.',
                                      arText:
                                          'يرجى الاتصال بنا حيث تم حظر حسابك.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                              LoginWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).buttonBorder,
                            width: 1.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            if (_model.applestatus == 'hide')
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/apple-logo_(1).png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '6n0eqkfo' /* Apple */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 12.0)),
                                ),
                              ),
                            if (_model.applestatus == 'show')
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                ),
              if (socialSettingsRecord?.settingsSocialLogin.facebookLogin ==
                  true)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.applestatus = 'show';
                        GoRouter.of(context).prepareAuthEvent();
                        final user = await authManager.signInWithApple(context);
                        if (user == null) {
                          return;
                        }
                        if (FFAppState().UserDataFlow.userWaiterStatus ==
                            true) {
                          if (FFAppState().UserDataFlow.userEmail !=
                              currentUserEmail) {
                            if (valueOrDefault(
                                    currentUserDocument?.status, '') ==
                                '') {
                              await currentUserReference!
                                  .update(createUsersRecordData(
                                status: 'Secret',
                              ));
                            }
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText:
                                          'Please contact us as your account has been blocked.',
                                      arText:
                                          'يرجى الاتصال بنا حيث تم حظر حسابك.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                              LoginWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            return;
                          }
                        }
                        if (valueOrDefault(currentUserDocument?.status, '') ==
                            '') {
                          FFAppState().updateUserDataFlowStruct(
                            (e) => e..userRef = currentUserReference,
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

                          context.goNamedAuth(
                            PhoneWidget.routeName,
                            context.mounted,
                            extra: <String, dynamic>{
                              '__transition_info__': const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          if (valueOrDefault(currentUserDocument?.status, '') ==
                              'Published') {
                            FFAppState().updateUserDataFlowStruct(
                              (e) => e
                                ..userEmail =
                                    currentUserDocument?.userInfo.email
                                ..phoneNumberCountry = currentUserDocument
                                    ?.userInfo.phoneNumberCountry
                                ..userPhoneNumber =
                                    currentUserDocument?.userInfo.phoneNumber
                                ..phoneNumberDailcode = currentUserDocument
                                    ?.userInfo.phoneNumberDailCode
                                ..userRef = currentUserReference,
                            );
                            FFAppState().updateUserDataFlowStruct(
                              (e) => e..userProductSwatchesList = [],
                            );
                            await actions.registerFcmTokenIfMissing();
                            if (currentUserDocument
                                    ?.userInfo.isPofileCompleteStatus ==
                                true) {
                              context.goNamedAuth(
                                HomeWidget.routeName,
                                context.mounted,
                                extra: <String, dynamic>{
                                  '__transition_info__': const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              if (currentUserDocument
                                      ?.userInfo.isEmailVerificationStatus ==
                                  false) {
                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e
                                    ..userEmailOtp =
                                        random_data.randomInteger(6, 6)
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
                                            'This is an ${FFAppState().UserDataFlow.userEmailOtp.toString()} email CODE.',
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                    ));

                                context.goNamedAuth(
                                  RegisterVerificationWidget.routeName,
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    '__transition_info__': const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                if (currentUserDocument
                                        ?.userInfo.isPhoneVerificationStatus ==
                                    false) {
                                  context.goNamedAuth(
                                    PhoneWidget.routeName,
                                    context.mounted,
                                    extra: <String, dynamic>{
                                      '__transition_info__': const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  if (currentUserDocument
                                          ?.userInfo.isStep1Status ==
                                      false) {
                                    context.goNamedAuth(
                                      Step1PersonalWidget.routeName,
                                      context.mounted,
                                      extra: <String, dynamic>{
                                        '__transition_info__': const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    if (currentUserDocument
                                            ?.userInfo.isStep2Status ==
                                        false) {
                                      context.goNamedAuth(
                                        Step2MeasurementsWidget.routeName,
                                        context.mounted,
                                        extra: <String, dynamic>{
                                          '__transition_info__': const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    } else {
                                      if (currentUserDocument
                                              ?.userInfo.isStep3Status ==
                                          false) {
                                        context.goNamedAuth(
                                          Step3PreferredStyleWidget.routeName,
                                          context.mounted,
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
                                      } else {
                                        context.goNamedAuth(
                                          Step4ReferralCodeWidget.routeName,
                                          context.mounted,
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
                                    content: Text(FFLocalizations.of(context)
                                        .getVariableText(
                                      enText:
                                          'Please contact us as your account has been blocked.',
                                      arText:
                                          'يرجى الاتصال بنا حيث تم حظر حسابك.',
                                    )),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text(FFLocalizations.of(context)
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
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                              LoginWidget.routeName,
                              context.mounted,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).buttonBorder,
                            width: 1.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            if (_model.applestatus == 'hide')
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/facebook-logo-2019_1.png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'wpu9hjb9' /* Facebook */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(const SizedBox(width: 12.0)),
                                ),
                              ),
                            if (_model.applestatus == 'show')
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Lottie.asset(
                                  'assets/jsons/Animation_-_1747305540589.json',
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
                ),
            ],
          );
        },
      ),
    );
  }
}
