import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'reject_reason_model.dart';
export 'reject_reason_model.dart';

class RejectReasonWidget extends StatefulWidget {
  const RejectReasonWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String? title;
  final String? description;

  @override
  State<RejectReasonWidget> createState() => _RejectReasonWidgetState();
}

class _RejectReasonWidgetState extends State<RejectReasonWidget> {
  late RejectReasonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RejectReasonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const AlignmentDirectional(1.0, -1.0),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.0,
                  color: Color(0x3B1D2429),
                  offset: Offset(
                    0.0,
                    -3.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '73b3jtx8' /* Reason for Rejection */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'almarai',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '1t1k7txm' /* Product used or damaged  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'almarai',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'm95r8ezw' /* Additional message for Rejecti... */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'almarai',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'g749i7b8' /* The product did not meet my ex... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'almarai',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
              ]
                  .addToStart(const SizedBox(height: 16.0))
                  .addToEnd(const SizedBox(height: 16.0)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 24.0, 0.0),
          child: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).border,
            borderRadius: 100.0,
            buttonSize: 36.0,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            icon: Icon(
              Icons.close,
              color: FlutterFlowTheme.of(context).primary,
              size: 20.0,
            ),
            onPressed: () async {
              unawaited(
                () async {
                  Navigator.pop(context);
                }(),
              );
            },
          ),
        ),
      ],
    );
  }
}
