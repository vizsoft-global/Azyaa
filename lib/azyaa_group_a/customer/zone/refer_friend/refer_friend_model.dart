import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'refer_friend_widget.dart' show ReferFriendWidget;
import 'package:flutter/material.dart';

class ReferFriendModel extends FlutterFlowModel<ReferFriendWidget> {
  ///  Local state fields for this page.

  /// True while a missing referral code is being created for an older account.
  bool creatingCode = false;

  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
  }
}
