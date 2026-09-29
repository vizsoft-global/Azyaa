import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'step4_referral_code_widget.dart' show Step4ReferralCodeWidget;
import 'package:flutter/material.dart';

class Step4ReferralCodeModel extends FlutterFlowModel<Step4ReferralCodeWidget> {
  ///  Local state fields for this page.

  String referralStatys = 'notYet';

  UsersRecord? referredUserRef;

  int? referralPoints = 30;

  ///  State fields for stateful widgets in this page.

  // State field(s) for referralcode-field widget.
  FocusNode? referralcodeFieldFocusNode;
  TextEditingController? referralcodeFieldTextController;
  String? Function(BuildContext, String?)?
      referralcodeFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in referralcode-field widget.
  UsersRecord? userReferralResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in save widget.
  IdMapRecord? idMapResult;
  // Stores action output result for [Backend Call - Create Document] action in save widget.
  UserReferralActivitiesRecord? rewardResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    referralcodeFieldFocusNode?.dispose();
    referralcodeFieldTextController?.dispose();
  }
}
