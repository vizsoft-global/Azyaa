import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'user_initial_widget.dart' show UserInitialWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
