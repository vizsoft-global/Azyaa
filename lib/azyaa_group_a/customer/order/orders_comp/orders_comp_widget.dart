import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_comp_model.dart';
export 'orders_comp_model.dart';

class OrdersCompWidget extends StatefulWidget {
  const OrdersCompWidget({
    super.key,
    required this.order,
    String? navigation,
    required this.orderID,
  }) : this.navigation = navigation ?? 'default';

  final OrdersRecord? order;
  final String navigation;
  final String? orderID;

  @override
  State<OrdersCompWidget> createState() => _OrdersCompWidgetState();
}

class _OrdersCompWidgetState extends State<OrdersCompWidget> {
  late OrdersCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DeliveryRecord>>(
      stream: queryDeliveryRecord(
        queryBuilder: (deliveryRecord) => deliveryRecord.where(
          'order_ref',
          isEqualTo: widget!.order?.reference,
        ),
      ),
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
        List<DeliveryRecord> containerDeliveryRecordList = snapshot.data!;

        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (widget!.navigation == 'default') {
              context.pushNamed(
                OrdersDetailsWidget.routeName,
                queryParameters: {
                  'order': serializeParam(
                    widget!.order?.reference,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  '__transition_info__': TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (widget!.navigation == 'default')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                if (((widget!.order?.orderStatus ==
                                            'CAPTURED') ||
                                        (widget!.order?.orderStatus ==
                                            'Succss') ||
                                        (widget!.order?.orderStatus ==
                                            'Paid') ||
                                        (widget!.order?.orderStatus ==
                                            'SUCCESS') ||
                                        (widget!.order?.orderStatus ==
                                            'FAILED')) &&
                                    (widget!.order!.orderItems.cartItems
                                            .where((e) =>
                                                e.productType == 'product')
                                            .toList()
                                            .length >
                                        0) &&
                                    (widget!.order?.returnRequestId == null ||
                                        widget!.order?.returnRequestId == ''))
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (((widget!.order?.orderStatus ==
                                                  'CAPTURED') ||
                                              (widget!.order?.orderStatus ==
                                                  'Succss') ||
                                              (widget!.order?.orderStatus ==
                                                  'Paid') ||
                                              (widget!.order?.orderStatus ==
                                                  'SUCCESS')) &&
                                          (widget!.order!.orderItems.cartItems
                                                  .where((e) =>
                                                      e.productType ==
                                                      'product')
                                                  .toList()
                                                  .length >
                                              0))
                                        Icon(
                                          FFIcons.klayer11,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18.0,
                                        ),
                                      if (((widget!.order?.orderStatus ==
                                                  'CAPTURED') ||
                                              (widget!.order?.orderStatus ==
                                                  'Succss') ||
                                              (widget!.order?.orderStatus ==
                                                  'Paid') ||
                                              (widget!.order?.orderStatus ==
                                                  'SUCCESS')) &&
                                          (widget!.order!.orderItems.cartItems
                                                  .where((e) =>
                                                      e.productType ==
                                                      'product')
                                                  .toList()
                                                  .length >
                                              0))
                                        Expanded(
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'mxs53ke0' /* Estimated arrival in  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: '${dateTimeFormat(
                                                    "yMMMd",
                                                    functions
                                                        .getDateForSubscription(
                                                            widget!.order!
                                                                .updatedAt!,
                                                            7),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}${FFLocalizations.of(context).getVariableText(
                                                    enText: ' to ',
                                                    arText: 'ل',
                                                  )}${dateTimeFormat(
                                                    "yMMMd",
                                                    functions
                                                        .getDateForSubscription(
                                                            widget!.order!
                                                                .updatedAt!,
                                                            8),
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                if ((widget!.order!.orderItems.cartItems
                                            .where((e) =>
                                                e.productType == 'product')
                                            .toList()
                                            .length >
                                        0) &&
                                    (widget!.order?.orderStatus == 'FAILED'))
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'n8xug5du' /* Order ID :  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: widget!.order!.orderId,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .border,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 2.0, 8.0, 2.0),
                                          child: Text(
                                            widget!.order!.orderStatus,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                StreamBuilder<List<ReturnRequestsRecord>>(
                                  stream: queryReturnRequestsRecord(
                                    queryBuilder: (returnRequestsRecord) =>
                                        returnRequestsRecord.where(
                                      'return_request_id',
                                      isEqualTo: widget!.order?.returnRequestId,
                                    ),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Container(
                                          width: 0.0,
                                          height: 0.0,
                                          child: BlankLoadingWidget(),
                                        ),
                                      );
                                    }
                                    List<ReturnRequestsRecord>
                                        rowReturnRequestsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final rowReturnRequestsRecord =
                                        rowReturnRequestsRecordList.isNotEmpty
                                            ? rowReturnRequestsRecordList.first
                                            : null;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.repartition,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18.0,
                                        ),
                                        Icon(
                                          Icons.remove_red_eye,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18.0,
                                        ),
                                        if (((widget!.order?.orderStatus ==
                                                    'CAPTURED') ||
                                                (widget!.order?.orderStatus ==
                                                    'Succss') ||
                                                (widget!.order?.orderStatus ==
                                                    'Paid') ||
                                                (widget!.order?.orderStatus ==
                                                    'SUCCESS')) &&
                                            (widget!.order!.orderItems.cartItems
                                                    .where((e) =>
                                                        e.productType ==
                                                        'product')
                                                    .toList()
                                                    .length >
                                                0))
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ezqh87o9' /* Return request  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: rowReturnRequestsRecord
                                                              ?.status ==
                                                          'Pending'
                                                      ? FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                          enText: 'Initiated',
                                                          arText: 'بدأ',
                                                        )
                                                      : rowReturnRequestsRecord!
                                                          .status,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Aileron',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 8.0)),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              if (((widget!.order?.orderStatus == 'CAPTURED') ||
                                      (widget!.order?.orderStatus ==
                                          'Succss') ||
                                      (widget!.order?.orderStatus == 'Paid') ||
                                      (widget!.order?.orderStatus ==
                                          'SUCCESS')) &&
                                  (widget!.order!.orderItems.cartItems
                                          .where(
                                              (e) => e.productType == 'product')
                                          .toList()
                                          .length >
                                      0))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 8.0, 2.0),
                                        child: Text(
                                          widget!.order!.orderStatus,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'jdmnj42o' /* Order ID :  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: widget!.order!.orderId,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              if (((widget!.order!.orderItems.cartItems
                                              .where((e) =>
                                                  e.productType == 'product')
                                              .toList()
                                              .length >
                                          0) &&
                                      (widget!.order?.orderStatus ==
                                          'FAILED')) &&
                                  responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 8.0, 2.0),
                                        child: Text(
                                          widget!.order!.orderStatus,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 4.0, 8.0, 4.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4jjokbov' /* Order ID :  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              TextSpan(
                                                text: widget!.order!.orderId,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                            ],
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  if (widget!.navigation == 'default')
                    Divider(
                      height: 10.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  Builder(
                    builder: (context) {
                      final activeOrderItems =
                          widget!.order?.orderItems?.cartItems?.toList() ?? [];

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          8.0,
                          0,
                          8.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: activeOrderItems.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16.0),
                        itemBuilder: (context, activeOrderItemsIndex) {
                          final activeOrderItemsItem =
                              activeOrderItems[activeOrderItemsIndex];
                          return Stack(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          activeOrderItemsItem.productType ==
                                                  'membership'
                                              ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/kwcb1kmteqoh/Frame_2087324774.png'
                                              : activeOrderItemsItem
                                                  .productInfo.featureImage,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          fit: BoxFit.cover,
                                          alignment: Alignment(0.0, -1.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            StreamBuilder<List<ProductsRecord>>(
                                              stream: queryProductsRecord(
                                                queryBuilder:
                                                    (productsRecord) =>
                                                        productsRecord.where(
                                                  'product_id',
                                                  isEqualTo:
                                                      activeOrderItemsItem
                                                          .productId,
                                                ),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: Container(
                                                      width: 0.0,
                                                      height: 0.0,
                                                      child:
                                                          BlankLoadingWidget(),
                                                    ),
                                                  );
                                                }
                                                List<ProductsRecord>
                                                    containerProductsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerProductsRecord =
                                                    containerProductsRecordList
                                                            .isNotEmpty
                                                        ? containerProductsRecordList
                                                            .first
                                                        : null;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: () {
                                                        if (containerProductsRecord
                                                                ?.productInfoCustomTranslate
                                                                ?.name
                                                                ?.en !=
                                                            '') {
                                                          return containerProductsRecord
                                                              ?.productInfoCustomTranslate
                                                              ?.name
                                                              ?.en;
                                                        } else if (containerProductsRecord
                                                                ?.productInfoTranslate
                                                                ?.name
                                                                ?.en !=
                                                            '') {
                                                          return containerProductsRecord
                                                              ?.productInfoTranslate
                                                              ?.name
                                                              ?.en;
                                                        } else {
                                                          return activeOrderItemsItem
                                                              .productInfo.name;
                                                        }
                                                      }(),
                                                      arText: () {
                                                        if (containerProductsRecord
                                                                ?.productInfoCustomTranslate
                                                                ?.name
                                                                ?.ar !=
                                                            '') {
                                                          return containerProductsRecord
                                                              ?.productInfoCustomTranslate
                                                              ?.name
                                                              ?.ar;
                                                        } else if (containerProductsRecord
                                                                ?.productInfoTranslate
                                                                ?.name
                                                                ?.ar !=
                                                            '') {
                                                          return containerProductsRecord
                                                              ?.productInfoTranslate
                                                              ?.name
                                                              ?.ar;
                                                        } else {
                                                          return containerProductsRecord
                                                              ?.productInfo
                                                              ?.name;
                                                        }
                                                      }(),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Aileron',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                          Text(
                                            activeOrderItemsItem
                                                .productInfo.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            activeOrderItemsItem.productType ==
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                      enText: 'membership',
                                                      arText: 'عضوية',
                                                    )
                                                ? FFLocalizations.of(context)
                                                    .getVariableText(
                                                    enText: 'Membership plan',
                                                    arText: 'خطة العضوية',
                                                  )
                                                : '${FFLocalizations.of(context).getVariableText(
                                                    enText: 'Quantity : ',
                                                    arText: 'كمية :',
                                                  )}${activeOrderItemsItem.quantity.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Aileron',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final attributeList =
                                                  activeOrderItemsItem
                                                      .cartItemAttribute
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: attributeList.length,
                                                itemBuilder: (context,
                                                    attributeListIndex) {
                                                  final attributeListItem =
                                                      attributeList[
                                                          attributeListIndex];
                                                  return StreamBuilder<
                                                      List<AttributesRecord>>(
                                                    stream:
                                                        queryAttributesRecord(
                                                      queryBuilder:
                                                          (attributesRecord) =>
                                                              attributesRecord
                                                                  .where(
                                                                    'attribute_id',
                                                                    isEqualTo:
                                                                        attributeListItem
                                                                            .attributesId,
                                                                  )
                                                                  .where(
                                                                    'status',
                                                                    isEqualTo:
                                                                        'active',
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 2.0,
                                                            height: 2.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors
                                                                    .transparent,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<AttributesRecord>
                                                          rowAttributesRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final rowAttributesRecord =
                                                          rowAttributesRecordList
                                                                  .isNotEmpty
                                                              ? rowAttributesRecordList
                                                                  .first
                                                              : null;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${FFLocalizations.of(context).getVariableText(
                                                              enText: () {
                                                                if (rowAttributesRecord
                                                                        ?.attributeInfoCustomTranslate
                                                                        ?.name
                                                                        ?.en !=
                                                                    '') {
                                                                  return rowAttributesRecord
                                                                      ?.attributeInfoCustomTranslate
                                                                      ?.name
                                                                      ?.en;
                                                                } else if (rowAttributesRecord
                                                                        ?.attributeInfoTranslate
                                                                        ?.name
                                                                        ?.en !=
                                                                    '') {
                                                                  return rowAttributesRecord
                                                                      ?.attributeInfoTranslate
                                                                      ?.name
                                                                      ?.en;
                                                                } else {
                                                                  return rowAttributesRecord
                                                                      ?.attributeInfo
                                                                      ?.name;
                                                                }
                                                              }(),
                                                              arText: () {
                                                                if (rowAttributesRecord
                                                                        ?.attributeInfoCustomTranslate
                                                                        ?.name
                                                                        ?.ar !=
                                                                    '') {
                                                                  return rowAttributesRecord
                                                                      ?.attributeInfoCustomTranslate
                                                                      ?.name
                                                                      ?.ar;
                                                                } else if (rowAttributesRecord
                                                                        ?.attributeInfoTranslate
                                                                        ?.name
                                                                        ?.ar !=
                                                                    '') {
                                                                  return rowAttributesRecord
                                                                      ?.attributeInfoTranslate
                                                                      ?.name
                                                                      ?.ar;
                                                                } else {
                                                                  return rowAttributesRecord
                                                                      ?.attributeInfo
                                                                      ?.name;
                                                                }
                                                              }(),
                                                            )}${FFLocalizations.of(context).getVariableText(
                                                              enText: ':',
                                                              arText: ':',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  BrandsRecord>>(
                                                            stream:
                                                                queryBrandsRecord(
                                                              queryBuilder:
                                                                  (brandsRecord) =>
                                                                      brandsRecord
                                                                          .where(
                                                                            'brand_id',
                                                                            isEqualTo:
                                                                                attributeListItem.attributesDefaultTermId,
                                                                          )
                                                                          .where(
                                                                            'status',
                                                                            isEqualTo:
                                                                                'active',
                                                                          ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 2.0,
                                                                    height: 2.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<BrandsRecord>
                                                                  attributeDefaultTermBrandsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final attributeDefaultTermBrandsRecord =
                                                                  attributeDefaultTermBrandsRecordList
                                                                          .isNotEmpty
                                                                      ? attributeDefaultTermBrandsRecordList
                                                                          .first
                                                                      : null;

                                                              return Text(
                                                                attributeDefaultTermBrandsRecord!
                                                                    .brandInfo
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Aileron',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                    Text(
                                      activeOrderItemsItem.totalPrice
                                          .toString(),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if ((widget!.order?.paymentStatus ==
                                      'CAPTURED') &&
                                  (valueOrDefault<String>(
                                            containerDeliveryRecordList
                                                .where((e) =>
                                                    widget!
                                                        .order!.deliveryInfoList
                                                        .where((e) =>
                                                            e.productIds.contains(
                                                                activeOrderItemsItem
                                                                    .productId) ==
                                                            true)
                                                        .toList()
                                                        .length >
                                                    0)
                                                .toList()
                                                .firstOrNull
                                                ?.deliveryTrackingId,
                                            '-',
                                          ) !=
                                          null &&
                                      valueOrDefault<String>(
                                            containerDeliveryRecordList
                                                .where((e) =>
                                                    widget!
                                                        .order!.deliveryInfoList
                                                        .where((e) =>
                                                            e.productIds.contains(
                                                                activeOrderItemsItem
                                                                    .productId) ==
                                                            true)
                                                        .toList()
                                                        .length >
                                                    0)
                                                .toList()
                                                .firstOrNull
                                                ?.deliveryTrackingId,
                                            '-',
                                          ) !=
                                          ''))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 2.0, 8.0, 2.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          (widget!.order?.orderStatus ==
                                                      'completed') ||
                                                  ((widget!.order
                                                              ?.orderStatus ==
                                                          'FAILED') ||
                                                      (widget!.order
                                                              ?.orderStatus ==
                                                          'Cancelled') ||
                                                      (widget!.order
                                                              ?.orderStatus ==
                                                          'Initialization') ||
                                                      (widget!.order
                                                              ?.orderStatus ==
                                                          'CAPTURED'))
                                              ? widget!.order?.orderStatus
                                              : valueOrDefault<String>(
                                                  containerDeliveryRecordList
                                                      .where((e) =>
                                                          widget!.order!
                                                              .deliveryInfoList
                                                              .where((e) =>
                                                                  e.productIds.contains(
                                                                      activeOrderItemsItem
                                                                          .productId) ==
                                                                  true)
                                                              .toList()
                                                              .length >
                                                          0)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.status,
                                                  '-',
                                                ),
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Aileron',
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  if (widget!.navigation == 'default')
                    Divider(
                      height: 10.0,
                      thickness: 1.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  if (widget!.navigation == 'default')
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: valueOrDefault<String>(
                                      widget!
                                          .order?.orderItems?.cartItems?.length
                                          ?.toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '2k9psxld' /*  Items   */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      's1t10s7h' /* |   */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${widget!.order?.totalPrice?.toString()}${FFLocalizations.of(context).getVariableText(
                                      enText: ' KD',
                                      arText: ' KD',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Aileron',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Aileron',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
