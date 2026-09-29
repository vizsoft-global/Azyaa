import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'creatorproduct_video_model.dart';
export 'creatorproduct_video_model.dart';

class CreatorproductVideoWidget extends StatefulWidget {
  const CreatorproductVideoWidget({super.key});

  @override
  State<CreatorproductVideoWidget> createState() =>
      _CreatorproductVideoWidgetState();
}

class _CreatorproductVideoWidgetState extends State<CreatorproductVideoWidget> {
  late CreatorproductVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorproductVideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).border,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/kylm6cx4lequ/dress1.jpg',
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.0, -1.0),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 100.0,
                    buttonSize: 30.0,
                    fillColor: const Color(0xFF9597A4),
                    icon: Icon(
                      Icons.play_arrow,
                      color: FlutterFlowTheme.of(context).info,
                      size: 14.0,
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'tl7wszaq' /* Video99817_9280.mp4 */,
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'almarai',
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    '7jcuyggh' /* 13.67  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                      ),
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    '9knob9gi' /* MB  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    '1911undl' /* |  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    'sqtrkhby' /* 1800 */,
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                      ),
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    'rr1066lv' /*  x  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    '6p66rxjk' /* 679 */,
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                      ),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'almarai',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'pw90ci9d' /* 100 */,
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '670i1ix8' /* 150 KD */,
                  ),
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'almarai',
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ].divide(const SizedBox(width: 2.0)),
            ),
          ),
      ].divide(const SizedBox(height: 4.0)),
    );
  }
}
