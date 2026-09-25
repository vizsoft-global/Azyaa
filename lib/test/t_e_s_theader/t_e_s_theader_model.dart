import '/azyaa_group_a/home/components/bar/home_app_bar/home_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 't_e_s_theader_widget.dart' show TESTheaderWidget;
import 'package:flutter/material.dart';

class TESTheaderModel extends FlutterFlowModel<TESTheaderWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Home_AppBar component.
  late HomeAppBarModel homeAppBarModel;

  @override
  void initState(BuildContext context) {
    homeAppBarModel = createModel(context, () => HomeAppBarModel());
  }

  @override
  void dispose() {
    homeAppBarModel.dispose();
  }
}
