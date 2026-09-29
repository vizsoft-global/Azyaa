import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'designer_grid_model.dart';
export 'designer_grid_model.dart';

class DesignerGridWidget extends StatefulWidget {
  const DesignerGridWidget({
    super.key,
    this.product,
  });

  final ProductsRecord? product;

  @override
  State<DesignerGridWidget> createState() => _DesignerGridWidgetState();
}

class _DesignerGridWidgetState extends State<DesignerGridWidget> {
  late DesignerGridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DesignerGridModel());

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
                      imageUrl: () {
                        if (widget.product?.productInfo.featureImage !=
                                null &&
                            widget.product?.productInfo.featureImage != '') {
                          return widget.product!.productInfo.featureImage;
                        } else if (widget.product?.productInfo.iconImage !=
                                null &&
                            widget.product?.productInfo.iconImage != '') {
                          return widget.product!.productInfo.iconImage;
                        } else if (widget
                                .product!.productInfo.galleryImage.length >
                            0) {
                          return widget
                              .product!.productInfo.galleryImage.firstOrNull!;
                        } else {
                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg';
                        }
                      }(),
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.0, 0.0),
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
            FFLocalizations.of(context).getText(
              '2rtkyofo' /* Designer Name */,
            ),
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'almarai',
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 8.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '0i7jo3pi' /* Brand name */,
            ),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'almarai',
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ].divide(const SizedBox(height: 4.0)),
    );
  }
}
