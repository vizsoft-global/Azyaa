import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creator_form_success_widget.dart' show CreatorFormSuccessWidget;
import 'package:flutter/material.dart';

class CreatorFormSuccessModel
    extends FlutterFlowModel<CreatorFormSuccessWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for User_Initial component.
  late UserInitialModel userInitialModel;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
  }

  @override
  void dispose() {
    userInitialModel.dispose();
  }
}
