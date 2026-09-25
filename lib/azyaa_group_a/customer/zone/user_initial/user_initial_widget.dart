import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'user_initial_model.dart';
export 'user_initial_model.dart';

class UserInitialWidget extends StatefulWidget {
  const UserInitialWidget({super.key});

  @override
  State<UserInitialWidget> createState() => _UserInitialWidgetState();
}

class _UserInitialWidgetState extends State<UserInitialWidget> {
  late UserInitialModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserInitialModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn == true) {
        _model.userRef = FFAppState().UserDataFlow.userRef != null
            ? FFAppState().UserDataFlow.userRef
            : currentUserReference;
        _model.currentUserResult1 =
            await UsersRecord.getDocumentOnce(_model.userRef!);
        _model.settingsDoc = await querySettingsRecordOnce(
          queryBuilder: (settingsRecord) => settingsRecord.where(
            'type',
            isEqualTo: 'Company',
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.currentUserResult1?.status == 'Published') {
          if (_model.currentUserResult1?.userInfo.isPofileCompleteStatus ==
              true) {
            return;
          }

          if (_model.currentUserResult1?.userInfo.isEmailVerificationStatus ==
              false) {
            FFAppState().updateUserDataFlowStruct(
              (e) => e
                ..userEmailOtp = random_data.randomInteger(100000, 999999)
                ..userEmail = currentUserEmail
                ..userEmailOtpAttempt = 1
                ..userPhoneOtpOrderId = null,
            );

            await MailRecord.collection.doc().set(createMailRecordData(
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
          } else {
            if (_model.settingsDoc!.settingsPhoneOtpStatus &&
                (_model.currentUserResult1?.userInfo
                        .isPhoneVerificationStatus ==
                    false)) {
              FFAppState().updateUserDataFlowStruct(
                (e) => e..userRef = currentUserReference,
              );

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

              return;
            } else {
              if (_model.currentUserResult1?.userInfo.isStep1Status == false) {
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

                return;
              } else {
                if (_model.currentUserResult1?.userInfo.isStep2Status ==
                    false) {
                  context.goNamedAuth(
                    Step2MeasurementsWidget.routeName,
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
                } else {
                  if (_model.currentUserResult1?.userInfo.isStep3Status ==
                      false) {
                    context.goNamedAuth(
                      Step3PreferredStyleWidget.routeName,
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
                  } else {
                    if (_model.currentUserResult1?.userInfo
                            .isPofileCompleteStatus ==
                        false) {
                      context.goNamedAuth(
                        Step4ReferralCodeWidget.routeName,
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
                    } else {
                      return;
                    }
                  }
                }
              }
            }
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                FFLocalizations.of(context).getVariableText(
                  enText: 'Your account is blocked, Contact Support team.',
                  arText: 'تم حظر حسابك، اتصل بفريق الدعم.',
                ),
                style: TextStyle(
                  fontFamily: 'Aileron',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).primary,
            ),
          );
          FFAppState().UserDataFlow = UserFlowStruct();
          FFAppState().UserFilter = UserFiltersStruct();
          FFAppState().desginerRequestFlow = DesignerRequestsStruct();
          FFAppState().userSessionDate = null;
          FFAppState().usercartFlow = UserFlowStruct();
          FFAppState().promotionflow = PromotionFlowStruct();
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
      } else {
        return;
      }
    });

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

    return Container();
  }
}
