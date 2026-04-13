import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'creatorspace_productview_model.dart';
export 'creatorspace_productview_model.dart';

class CreatorspaceProductviewWidget extends StatefulWidget {
  const CreatorspaceProductviewWidget({
    super.key,
    required this.promotionInfo,
  });

  final CreatorPromotionsStruct? promotionInfo;

  @override
  State<CreatorspaceProductviewWidget> createState() =>
      _CreatorspaceProductviewWidgetState();
}

class _CreatorspaceProductviewWidgetState
    extends State<CreatorspaceProductviewWidget> {
  late CreatorspaceProductviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorspaceProductviewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.count = widget!.promotionInfo!.productDocReference.length;
      while (_model.count > 0) {
        _model.productresult1 = await ProductsRecord.getDocumentOnce(widget!
            .promotionInfo!.productDocReference
            .elementAtOrNull(_model.count)!);
        _model.totalCommission = _model.totalCommission +
            _model.productresult1!.product.productPrice;
        _model.updatePage(() {});
        _model.count = _model.count - 1;
      }
    });

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
          child: Stack(
            children: [
              Container(
                width: 200.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).secondary,
                      FlutterFlowTheme.of(context).primary
                    ],
                    stops: [0.6, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget!.promotionInfo?.promotionInfo?.featureImage !=
                                null &&
                            widget!.promotionInfo?.promotionInfo
                                    ?.featureImage !=
                                ''
                        ? widget!.promotionInfo!.promotionInfo.featureImage
                        : widget!.promotionInfo!.promotionInfo.galleryImage
                            .firstOrNull!,
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    fit: BoxFit.cover,
                    alignment: Alignment(0.0, -1.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Container(
                  width: 200.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Color(0xB2000000)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Visibility(
                    visible: widget!
                            .promotionInfo!.promotionInfo.galleryImage.length >
                        0,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) {
                              final imageList = (widget!.promotionInfo
                                          ?.promotionInfo?.galleryImage
                                          ?.toList() ??
                                      [])
                                  .take(2)
                                  .toList();

                              return Wrap(
                                spacing: 2.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(imageList.length,
                                    (imageListIndex) {
                                  final imageListItem =
                                      imageList[imageListIndex];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      imageListItem,
                                      width: 45.0,
                                      height: 45.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(0.0, -1.0),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                          if (widget!.promotionInfo!.promotionInfo.galleryImage
                                  .length >=
                              3)
                            Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x80000000),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Visibility(
                                    visible: widget!
                                            .promotionInfo!
                                            .promotionInfo
                                            .galleryImage
                                            .length >=
                                        3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        widget!.promotionInfo!.promotionInfo
                                            .galleryImage
                                            .elementAtOrNull(2)!,
                                        width: 45.0,
                                        height: 45.0,
                                        fit: BoxFit.cover,
                                        alignment: Alignment(0.0, -1.0),
                                      ),
                                    ),
                                  ),
                                ),
                                if (widget!.promotionInfo!.promotionInfo
                                        .galleryImage.length >=
                                    4)
                                  Text(
                                    '+${(widget!.promotionInfo!.promotionInfo.galleryImage.length - 3).toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                              ],
                            ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: FFLocalizations.of(context).getText(
                    'ycspy4gb' /* ID :  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Cairo',
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                TextSpan(
                  text: widget!.promotionInfo!.promotionId,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Cairo',
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Cairo',
                    fontSize: 10.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
          child: Text(
            widget!.promotionInfo!.promotionCaption,
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Cairo',
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        if (widget!.promotionInfo!.promotionSales > 0)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget!.promotionInfo!.promotionSales.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      '1ddjksyv' /*  Sold  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  TextSpan(
                    text: widget!.promotionInfo!.promotionEarnings.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      '7ibl4mix' /*  KD  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      'fhe5vo8k' /* Earned */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Cairo',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Cairo',
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
      ].divide(SizedBox(height: 4.0)),
    );
  }
}
