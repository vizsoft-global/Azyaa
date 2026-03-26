import '/azyaa_group_a/home/coming_soon/coming_soon_comp/coming_soon_comp_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'coming_soon_widget.dart' show ComingSoonWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ComingSoonModel extends FlutterFlowModel<ComingSoonWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Universal_AppBar component.
  late UniversalAppBarModel universalAppBarModel;
  // Model for ComingSoon_Comp component.
  late ComingSoonCompModel comingSoonCompModel;

  @override
  void initState(BuildContext context) {
    universalAppBarModel = createModel(context, () => UniversalAppBarModel());
    comingSoonCompModel = createModel(context, () => ComingSoonCompModel());
  }

  @override
  void dispose() {
    universalAppBarModel.dispose();
    comingSoonCompModel.dispose();
  }
}
