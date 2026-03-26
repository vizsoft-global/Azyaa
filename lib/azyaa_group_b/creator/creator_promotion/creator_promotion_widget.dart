import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'creator_promotion_model.dart';
export 'creator_promotion_model.dart';

class CreatorPromotionWidget extends StatefulWidget {
  const CreatorPromotionWidget({
    super.key,
    required this.promotionInfo,
    required this.creator,
  });

  final CreatorPromotionsStruct? promotionInfo;
  final UsersRecord? creator;

  @override
  State<CreatorPromotionWidget> createState() => _CreatorPromotionWidgetState();
}

class _CreatorPromotionWidgetState extends State<CreatorPromotionWidget> {
  late CreatorPromotionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorPromotionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.count = widget!.promotionInfo!.productDocReference.length;
      _model.total = 0.0;
      while (_model.count > 0) {
        _model.indPromotionProductResult = await ProductsRecord.getDocumentOnce(
            widget!.promotionInfo!.productDocReference
                .elementAtOrNull(_model.count - 1)!);
        _model.total = _model.total +
            _model.indPromotionProductResult!.product.productPrice;
        _model.count = _model.count - 1;
      }
      _model.priceStatus = 'show';
      safeSetState(() {});
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
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        FFAppState().updateUserDataFlowStruct(
          (e) => e..userSelectedProductList = [],
        );

        context.pushNamed(
          CreatorsIndividualPromoWidget.routeName,
          queryParameters: {
            'promo': serializeParam(
              widget!.promotionInfo?.promotionId,
              ParamType.String,
            ),
            'creator': serializeParam(
              widget!.creator?.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
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
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).border,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget!.promotionInfo?.promotionInfo?.featureImage !=
                                      null &&
                                  widget!.promotionInfo?.promotionInfo
                                          ?.featureImage !=
                                      ''
                              ? widget!
                                  .promotionInfo!.promotionInfo.featureImage
                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, -1.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Color(0xB2000000)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                        ),
                        child: Visibility(
                          visible: widget!.promotionInfo!.promotionInfo
                                  .galleryImage.length >
                              0,
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
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
                                      spacing: 4.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(imageList.length,
                                          (imageListIndex) {
                                        final imageListItem =
                                            imageList[imageListIndex];
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            imageListItem,
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 40.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 43.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 45.0;
                                              } else {
                                                return 45.0;
                                              }
                                            }(),
                                            height: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  kBreakpointSmall) {
                                                return 40.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointMedium) {
                                                return 43.0;
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  kBreakpointLarge) {
                                                return 45.0;
                                              } else {
                                                return 45.0;
                                              }
                                            }(),
                                            fit: BoxFit.cover,
                                            alignment: Alignment(0.0, 0.0),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                                if (widget!.promotionInfo!.promotionImages
                                        .length >=
                                    3)
                                  Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          widget!.promotionInfo!.promotionInfo
                                              .galleryImage
                                              .elementAtOrNull(2)!,
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 40.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 43.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 45.0;
                                            } else {
                                              return 45.0;
                                            }
                                          }(),
                                          height: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 40.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 43.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 45.0;
                                            } else {
                                              return 45.0;
                                            }
                                          }(),
                                          fit: BoxFit.cover,
                                          alignment: Alignment(0.0, 0.0),
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
                                                fontFamily: 'Aileron',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
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
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
              child: Text(
                widget!.promotionInfo!.promotionCaption,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Aileron',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            if (_model.priceStatus == 'show')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '${_model.total.toString()} KD',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Aileron',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'atunifb1' /* Full set */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Aileron',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
