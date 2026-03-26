import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_b/creator_space/creator_space/components/creatorspace_productview/creatorspace_productview_widget.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'creator_spacetestpage_widget.dart' show CreatorSpacetestpageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatorSpacetestpageModel
    extends FlutterFlowModel<CreatorSpacetestpageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for creatorspaceProductview component.
  late CreatorspaceProductviewModel creatorspaceProductviewModel;

  @override
  void initState(BuildContext context) {
    creatorspaceProductviewModel =
        createModel(context, () => CreatorspaceProductviewModel());
  }

  @override
  void dispose() {
    creatorspaceProductviewModel.dispose();
  }
}
