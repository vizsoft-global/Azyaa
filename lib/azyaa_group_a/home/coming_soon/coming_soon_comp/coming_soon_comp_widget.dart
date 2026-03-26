import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coming_soon_comp_model.dart';
export 'coming_soon_comp_model.dart';

class ComingSoonCompWidget extends StatefulWidget {
  const ComingSoonCompWidget({
    super.key,
    this.image,
    this.text,
  });

  final String? image;
  final String? text;

  @override
  State<ComingSoonCompWidget> createState() => _ComingSoonCompWidgetState();
}

class _ComingSoonCompWidgetState extends State<ComingSoonCompWidget> {
  late ComingSoonCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).border,
                  borderRadius: 100.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget!.image!,
              height: 120.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget!.text,
              'Coming Soon...',
            ),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Aileron',
                  letterSpacing: 0.0,
                ),
          ),
        ]
            .divide(SizedBox(height: 8.0))
            .addToStart(SizedBox(height: 24.0))
            .addToEnd(SizedBox(height: 24.0)),
      ),
    );
  }
}
