import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'salebanner_model.dart';
export 'salebanner_model.dart';

class SalebannerWidget extends StatefulWidget {
  const SalebannerWidget({super.key});

  @override
  State<SalebannerWidget> createState() => _SalebannerWidgetState();
}

class _SalebannerWidgetState extends State<SalebannerWidget> {
  late SalebannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SalebannerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).purple,
              FlutterFlowTheme.of(context).purple
            ],
            stops: const [0.0, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Group_2085662551-min.png',
                  width: 150.0,
                  height: MediaQuery.sizeOf(context).width < kBreakpointMedium
                      ? 80.0
                      : 120.0,
                  fit: BoxFit.contain,
                  alignment: const Alignment(-1.0, 1.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'sb5rmt1a' /* Biggest Ramadan
Sale Now */
                    ,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 100.0,
                buttonSize: 32.0,
                fillColor: const Color(0x32FFFFFF),
                icon: Icon(
                  Icons.navigate_next_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 16.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
