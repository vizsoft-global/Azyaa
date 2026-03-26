import '/azyaa_group_a/home/components/bar/home_app_bar/home_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 't_e_s_theader_widget.dart' show TESTheaderWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
