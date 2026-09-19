import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loglist_model.dart';
export 'loglist_model.dart';

class LoglistWidget extends StatefulWidget {
  const LoglistWidget({super.key});

  @override
  State<LoglistWidget> createState() => _LoglistWidgetState();
}

class _LoglistWidgetState extends State<LoglistWidget> {
  late LoglistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoglistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3416202A),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
        ),
        child: Builder(
          builder: (context) {
            final logs = FFAppState().branchDebugLogs.toList();

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: List.generate(logs.length, (logsIndex) {
                  final logsItem = logs[logsIndex];
                  return Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 8.0),
                      child: SelectionArea(
                          child: AutoSizeText(
                        valueOrDefault<String>(
                          logsItem,
                          '-',
                        ),
                        maxLines: 3,
                        minFontSize: 14.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'almarai',
                              letterSpacing: 0.0,
                            ),
                        overflow: TextOverflow.visible,
                      )),
                    ),
                  );
                })
                    .divide(SizedBox(height: 4.0))
                    .addToStart(SizedBox(height: 4.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}
