import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'phone_verification_widget.dart' show PhoneVerificationWidget;
import 'package:flutter/material.dart';

class PhoneVerificationModel extends FlutterFlowModel<PhoneVerificationWidget> {
  ///  Local state fields for this page.

  int? refresh = 1;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'exzlk6xc' /* Please enter valid code */,
      );
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in verify widget.
  SettingsRecord? settingsResultPhoneOtpType;
  // Stores action output result for [Backend Call - API (VerifySMS)] action in verify widget.
  ApiCallResponse? otpSmsVerificationApiStatus;
  // Stores action output result for [Backend Call - API (Verify)] action in verify widget.
  ApiCallResponse? otpVerificationApiStatus;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 60000;
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (Resend)] action in resend widget.
  ApiCallResponse? otpResendApiStatus;
  // Stores action output result for [Backend Call - API (SendSMS)] action in resend widget.
  ApiCallResponse? otpSmsSendApiStatus;
  // Stores action output result for [Firestore Query - Query a collection] action in resend widget.
  SettingsRecord? settingsSMSResultPhoneOtpType;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();

    timerController.dispose();
  }
}
