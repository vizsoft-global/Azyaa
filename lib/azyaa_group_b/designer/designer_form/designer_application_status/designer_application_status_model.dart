import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'designer_application_status_widget.dart'
    show DesignerApplicationStatusWidget;
import 'package:flutter/material.dart';

class DesignerApplicationStatusModel
    extends FlutterFlowModel<DesignerApplicationStatusWidget> {
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
