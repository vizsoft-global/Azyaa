import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'creatorproduct_img_model.dart';
export 'creatorproduct_img_model.dart';

class CreatorproductImgWidget extends StatefulWidget {
  const CreatorproductImgWidget({
    super.key,
    required this.productInfo,
    this.productPrices,
  });

  final InfoStruct? productInfo;
  final ProductStockStruct? productPrices;

  @override
  State<CreatorproductImgWidget> createState() =>
      _CreatorproductImgWidgetState();
}

class _CreatorproductImgWidgetState extends State<CreatorproductImgWidget> {
  late CreatorproductImgModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorproductImgModel());

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
                      imageUrl: widget.productInfo!.featureImage,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.0, -1.0),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.count =
                            FFAppState().promotionflow.productRef.length;
                        while (_model.count > 0) {
                          if (FFAppState()
                                  .promotionflow
                                  .productRef
                                  .elementAtOrNull(_model.count - 1) ==
                              FFAppState()
                                  .promotionflow
                                  .productRef
                                  .elementAtOrNull(_model.count - 1)) {
                            FFAppState().updatePromotionflowStruct(
                              (e) => e
                                ..updateProductDetails(
                                  (e) => e.removeAt(_model.count - 1),
                                )
                                ..updateProductRef(
                                  (e) => e.removeAt(_model.count - 1),
                                )
                                ..updateProductPricesInfo(
                                  (e) => e.removeAt(_model.count - 1),
                                ),
                            );
                            _model.updatePage(() {});
                            return;
                          } else {
                            _model.count = _model.count - 1;
                          }
                        }
                      },
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
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getVariableText(
              enText: () {
                if (widget.productInfo?.infoTranslate.name.en != '') {
                  return widget.productInfo?.infoTranslate.name.en;
                } else if (widget.productInfo?.infoCustomTranslate.name.en !=
                    '') {
                  return widget.productInfo?.infoCustomTranslate.name.en;
                } else {
                  return widget.productInfo?.name;
                }
              }(),
              arText: () {
                if (widget.productInfo?.infoTranslate.name.ar != '') {
                  return widget.productInfo?.infoTranslate.name.ar;
                } else if (widget.productInfo?.infoCustomTranslate.name.ar !=
                    '') {
                  return widget.productInfo?.infoCustomTranslate.name.ar;
                } else {
                  return widget.productInfo?.name;
                }
              }(),
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'almarai',
                  fontSize: 14.0,
                  letterSpacing: 0.0,
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
                    'l51fkrjz' /* 100 */,
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
                    'ochzch1r' /* 150 KD */,
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
