import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_initial_widget.dart' show UserInitialWidget;
import 'package:flutter/material.dart';

class UserInitialModel extends FlutterFlowModel<UserInitialWidget> {
  ///  Local state fields for this component.

  DocumentReference? userRef;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in User_Initial widget.
  UsersRecord? currentUserResult1;
  // Stores action output result for [Firestore Query - Query a collection] action in User_Initial widget.
  SettingsRecord? settingsDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
