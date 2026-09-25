import '/azyaa_group_b/creator_space/creator_space/components/creatorspace_productview/creatorspace_productview_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creator_spacetestpage_widget.dart' show CreatorSpacetestpageWidget;
import 'package:flutter/material.dart';

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
