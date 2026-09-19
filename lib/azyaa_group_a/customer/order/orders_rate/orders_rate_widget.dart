import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_rate_model.dart';
export 'orders_rate_model.dart';

class OrdersRateWidget extends StatefulWidget {
  const OrdersRateWidget({
    super.key,
    required this.productsRef,
  });

  final DocumentReference? productsRef;

  @override
  State<OrdersRateWidget> createState() => _OrdersRateWidgetState();
}

class _OrdersRateWidgetState extends State<OrdersRateWidget> {
  late OrdersRateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersRateModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: StreamBuilder<ProductsRecord>(
        stream: ProductsRecord.getDocument(widget!.productsRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 10.0,
                height: 10.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }

          final rowProductsRecord = snapshot.data!;

          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    if (rowProductsRecord.productReview
                            .where((e) => currentUserReference == e.customerRef)
                            .toList()
                            .length ==
                        0)
                      Text(
                        FFLocalizations.of(context).getText(
                          '62h6anio' /* How was the dress? */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'almarai',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    if (rowProductsRecord.productReview
                            .where((e) => currentUserReference == e.customerRef)
                            .toList()
                            .length >
                        0)
                      Text(
                        FFLocalizations.of(context).getText(
                          '1op04c0n' /* Thank You for rating the produ... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'almarai',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                  ],
                ),
              ),
              Stack(
                children: [
                  if (rowProductsRecord.productReview
                          .where((e) => currentUserReference == e.customerRef)
                          .toList()
                          .length ==
                      0)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) async {
                          safeSetState(() => _model.ratingBarValue1 = newValue);
                          _model.iDMapResult = await queryIdMapRecordOnce(
                            queryBuilder: (idMapRecord) => idMapRecord.where(
                              'type',
                              isEqualTo: 'Main',
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);

                          await widget!.productsRef!.update({
                            ...mapToFirestore(
                              {
                                'product_review': FieldValue.arrayUnion([
                                  getProductReviewsFirestoreData(
                                    updateProductReviewsStruct(
                                      ProductReviewsStruct(
                                        createdAt: getCurrentTimestamp,
                                        updatedAt: getCurrentTimestamp,
                                        reviewId: _model.iDMapResult?.reviewId,
                                        customerId: currentUserUid,
                                        customerRef: currentUserReference,
                                        reviewRate: _model.ratingBarValue1,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });

                          await _model.iDMapResult!.reference.update({
                            ...mapToFirestore(
                              {
                                'review_id': FieldValue.increment(1),
                              },
                            ),
                          });

                          safeSetState(() {});
                        },
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarValue1 ??= 0.0,
                        unratedColor: FlutterFlowTheme.of(context).accent1,
                        itemCount: 5,
                        itemSize: 20.0,
                        glowColor: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  if (rowProductsRecord.productReview
                          .where((e) => currentUserReference == e.customerRef)
                          .toList()
                          .length >
                      0)
                    RatingBarIndicator(
                      itemBuilder: (context, index) => Icon(
                        Icons.star_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      direction: Axis.horizontal,
                      rating: rowProductsRecord.productReview
                          .where((e) => currentUserReference == e.customerRef)
                          .toList()
                          .firstOrNull!
                          .reviewRate,
                      unratedColor: FlutterFlowTheme.of(context).accent1,
                      itemCount: 5,
                      itemSize: 20.0,
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
