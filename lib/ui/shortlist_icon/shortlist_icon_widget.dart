import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'shortlist_icon_model.dart';
export 'shortlist_icon_model.dart';

class ShortlistIconWidget extends StatefulWidget {
  const ShortlistIconWidget({super.key});

  @override
  State<ShortlistIconWidget> createState() => _ShortlistIconWidgetState();
}

class _ShortlistIconWidgetState extends State<ShortlistIconWidget> {
  late ShortlistIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortlistIconModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderColor: const Color(0x33FFFFFF),
      borderRadius: 100.0,
      buttonSize: 55.0,
      fillColor: const Color(0xFF553680),
      icon: Icon(
        FFIcons.kicon16,
        color: FlutterFlowTheme.of(context).info,
        size: 24.0,
      ),
      onPressed: () {
        print('IconButton pressed ...');
      },
    );
  }
}
