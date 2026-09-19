import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkout_payment_method_model.dart';
export 'checkout_payment_method_model.dart';

class CheckoutPaymentMethodWidget extends StatefulWidget {
  const CheckoutPaymentMethodWidget({
    super.key,
    required this.id,
    required this.setting,
    required this.orderInfo,
    double? shippingCharge,
  }) : this.shippingCharge = shippingCharge ?? 0.0;

  final IdMapRecord? id;
  final SettingsRecord? setting;
  final String? orderInfo;
  final double shippingCharge;

  @override
  State<CheckoutPaymentMethodWidget> createState() =>
      _CheckoutPaymentMethodWidgetState();
}

class _CheckoutPaymentMethodWidgetState
    extends State<CheckoutPaymentMethodWidget> {
  late CheckoutPaymentMethodModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutPaymentMethodModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().updatePaymentFlowStruct(
        (e) => e
          ..selectedPaymentType = 'KNET'
          ..selectedPaymentId = 1,
      );
      _model.selectedMethod = 'KNET';
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(
                  0.0,
                  -3.0,
                ),
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: Container(
                      width: 35.0,
                      height: 3.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFCCBBCC),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '2dn1kjvx' /* How do you pay */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'almarai',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).border,
                        borderRadius: 100.0,
                        buttonSize: 36.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
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

                          context.goNamed(
                            CheckoutWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.payStatus == 'clickable') {
                        FFAppState().updatePaymentFlowStruct(
                          (e) => e
                            ..selectedPaymentType = 'KNET'
                            ..selectedPaymentId = 1,
                        );
                        _model.selectedMethod = 'KNET';
                        safeSetState(() {});
                      }
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: _model.selectedMethod == 'KNET'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).accent1,
                          width: _model.selectedMethod == 'KNET' ? 2.0 : 0.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sdhgcktd' /* Pay with K-Net */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/Group_(6).png',
                                width: 50.0,
                                height: 30.0,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 8.0))
                              .addToStart(SizedBox(width: 8.0))
                              .addToEnd(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.payStatus == 'clickable') {
                        FFAppState().updatePaymentFlowStruct(
                          (e) => e
                            ..selectedPaymentType = 'VISA/MASTER'
                            ..selectedPaymentId = 2,
                        );
                        _model.selectedMethod = 'VISA/MASTER';
                        safeSetState(() {});
                      }
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent1,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: _model.selectedMethod == 'VISA/MASTER'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).accent1,
                          width: _model.selectedMethod == 'VISA/MASTER'
                              ? 2.0
                              : 0.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'h4tvsidt' /* Pay with Card */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/master_card.png',
                                width: 80.0,
                                height: 30.0,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 8.0))
                              .addToStart(SizedBox(width: 8.0))
                              .addToEnd(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue ??= true,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue = newValue!);
                            },
                            side: (FlutterFlowTheme.of(context).alternate !=
                                    null)
                                ? BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate!,
                                  )
                                : null,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'i8gz6h3u' /* Remember my choice */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'almarai',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.payStatus == 'clickable') {
                          FFAppState().updatePaymentFlowStruct(
                            (e) => e
                              ..selectedPaymentType = 'Google Pay'
                              ..selectedPaymentId = 2,
                          );
                          _model.selectedMethod = 'Google Pay';
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: _model.selectedMethod == 'Google Pay'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6eekr0uw' /* Pay with G-Pay */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'almarai',
                                        color: _model.selectedMethod ==
                                                'Google Pay'
                                            ? FlutterFlowTheme.of(context).info
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Google_Pay_Logo_1.png',
                                  width: 50.0,
                                  height: 30.0,
                                  fit: BoxFit.contain,
                                  alignment: Alignment(0.0, 0.0),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 8.0))
                                .addToStart(SizedBox(width: 8.0))
                                .addToEnd(SizedBox(width: 8.0)),
                          ),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_model.payStatus == 'clickable') {
                          FFAppState().updatePaymentFlowStruct(
                            (e) => e
                              ..selectedPaymentType = 'Apple Pay'
                              ..selectedPaymentId = 8,
                          );
                          _model.selectedMethod = 'Apple Pay';
                          safeSetState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: _model.selectedMethod == 'Apple Pay'
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'j499zkbz' /* Pay with Apple Pay */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'almarai',
                                        color: _model.selectedMethod ==
                                                'Apple Pay'
                                            ? FlutterFlowTheme.of(context).info
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Apple_Pay_logo.png',
                                  width: 50.0,
                                  height: 30.0,
                                  fit: BoxFit.contain,
                                  alignment: Alignment(0.0, 0.0),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 8.0))
                                .addToStart(SizedBox(width: 8.0))
                                .addToEnd(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            FFLocalizations.of(context).getVariableText(
                              enText: 'Payment Processing..',
                              arText: 'معالجة الدفع..',
                            ),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                        ),
                      );
                      if (_model.payStatus == 'clickable') {
                        _model.payStatus = 'DONE';
                        _model.myfatoorahPaymentResult1 =
                            await MyfatoorahGroup.executeCall.call(
                          token: widget!.setting?.settingsPaymentInfo
                                      ?.where((e) => e.isPrimaryStatus == true)
                                      .toList()
                                      ?.firstOrNull
                                      ?.isProductionStatus ==
                                  true
                              ? widget!.setting?.settingsPaymentInfo
                                  ?.where((e) => e.isPrimaryStatus == true)
                                  .toList()
                                  ?.firstOrNull
                                  ?.productionSecretKey
                              : widget!.setting?.settingsPaymentInfo
                                  ?.where((e) => e.isPrimaryStatus == true)
                                  .toList()
                                  ?.firstOrNull
                                  ?.testSecretKey,
                          url: widget!.setting?.settingsPaymentInfo
                                      ?.where((e) => e.isPrimaryStatus == true)
                                      .toList()
                                      ?.firstOrNull
                                      ?.isProductionStatus ==
                                  true
                              ? 'api'
                              : 'apitest',
                          customerName: currentUserDisplayName,
                          customerDailCode: currentUserDocument
                              ?.userInfo?.phoneNumberDailCode,
                          customerPhone: currentUserDocument
                              ?.userInfo?.phoneNumberWithoutDailcode,
                          customerEmail: currentUserEmail,
                          programPrice: currentUserDocument
                                          ?.userCart?.couponInfo?.couponId !=
                                      null &&
                                  currentUserDocument
                                          ?.userCart?.couponInfo?.couponId !=
                                      ''
                              ? (currentUserDocument!.userCart.couponInfo
                                      .couponDiscountedPrice +
                                  widget!.shippingCharge)
                              : (functions.newCartTotal(currentUserDocument!
                                      .userCart.cartItems
                                      .map((e) => e.totalPrice)
                                      .toList()) +
                                  widget!.shippingCharge),
                          returnURL:
                              'https://azyaa.flutterflow.app/azyaa-verify?orderid=${'ORDAZYA${widget!.id?.orderId?.toString()}'}',
                          orderId: 'ORDAZYA${widget!.id?.orderId?.toString()}',
                          cartInfo: widget!.orderInfo,
                          paymentMethodID: FFAppState()
                              .PaymentFlow
                              .selectedPaymentId
                              .toString(),
                          webhookUrl: widget!.setting?.settingsPaymentInfo
                                      ?.where((e) => e.isPrimaryStatus == true)
                                      .toList()
                                      ?.firstOrNull
                                      ?.isProductionStatus ==
                                  true
                              ? 'https://hook.us1.make.com/p7og7qm3g9v7amn2rdx6odh24brwvypj?project=azyaa&&paymenttype=myfatoorah&&paytype=live'
                              : 'https://hook.us1.make.com/p7og7qm3g9v7amn2rdx6odh24brwvypj?project=azyaa&&paymenttype=myfatoorah&&paytype=test',
                        );

                        _shouldSetState = true;
                        if ((_model.myfatoorahPaymentResult1?.succeeded ??
                            true)) {
                          FFAppState().updatePaymentFlowStruct(
                            (e) => e
                              ..paymentProcessesStatus = 'initialize'
                              ..paymentId = MyfatoorahGroup.executeCall
                                  .invoiceID(
                                    (_model.myfatoorahPaymentResult1
                                            ?.jsonBody ??
                                        ''),
                                  )
                                  ?.toString()
                              ..orderId =
                                  'ORDAZYA${widget!.id?.orderId?.toString()}'
                              ..mainPaymentUrl =
                                  MyfatoorahGroup.executeCall.paymentURL(
                                (_model.myfatoorahPaymentResult1?.jsonBody ??
                                    ''),
                              )
                              ..paymentUrl =
                                  MyfatoorahGroup.executeCall.paymentURL(
                                (_model.myfatoorahPaymentResult1?.jsonBody ??
                                    ''),
                              )
                              ..secretKey = widget!.setting?.settingsPaymentInfo
                                          ?.where(
                                              (e) => e.isPrimaryStatus == true)
                                          .toList()
                                          ?.firstOrNull
                                          ?.isProductionStatus ==
                                      true
                                  ? widget!.setting?.settingsPaymentInfo
                                      ?.where((e) => e.isPrimaryStatus == true)
                                      .toList()
                                      ?.firstOrNull
                                      ?.productionSecretKey
                                  : widget!.setting?.settingsPaymentInfo
                                      ?.where((e) => e.isPrimaryStatus == true)
                                      .toList()
                                      ?.firstOrNull
                                      ?.testSecretKey
                              ..paymentType = 'myfatoorah'
                              ..presentUserRef = currentUserReference
                              ..paymentBaseUrl = widget!
                                          .setting?.settingsPaymentInfo
                                          ?.where(
                                              (e) => e.isPrimaryStatus == true)
                                          .toList()
                                          ?.firstOrNull
                                          ?.isProductionStatus ==
                                      true
                                  ? 'api'
                                  : 'apitest',
                          );

                          var ordersRecordReference =
                              OrdersRecord.collection.doc();
                          await ordersRecordReference
                              .set(createOrdersRecordData(
                            orderStatus: 'Initialization',
                            createdAt: getCurrentTimestamp,
                            orderId:
                                'ORDAZYA${widget!.id?.orderId?.toString()}',
                            customerRef: currentUserReference,
                            totalPrice: currentUserDocument
                                            ?.userCart?.couponInfo?.couponId !=
                                        null &&
                                    currentUserDocument
                                            ?.userCart?.couponInfo?.couponId !=
                                        ''
                                ? (currentUserDocument!.userCart.couponInfo
                                        .couponDiscountedPrice +
                                    widget!.shippingCharge)
                                : (functions.newCartTotal(currentUserDocument!
                                        .userCart.cartItems
                                        .map((e) => e.totalPrice)
                                        .toList()) +
                                    widget!.shippingCharge),
                            orderItems: updateUserCartStruct(
                              currentUserDocument?.userCart,
                              clearUnsetFields: false,
                              create: true,
                            ),
                            customerId: currentUserUid,
                            shippingPrice: widget!.shippingCharge,
                          ));
                          _model.orderMyfatoorahpaymentNew =
                              OrdersRecord.getDocumentFromData(
                                  createOrdersRecordData(
                                    orderStatus: 'Initialization',
                                    createdAt: getCurrentTimestamp,
                                    orderId:
                                        'ORDAZYA${widget!.id?.orderId?.toString()}',
                                    customerRef: currentUserReference,
                                    totalPrice: currentUserDocument?.userCart
                                                    ?.couponInfo?.couponId !=
                                                null &&
                                            currentUserDocument?.userCart
                                                    ?.couponInfo?.couponId !=
                                                ''
                                        ? (currentUserDocument!
                                                .userCart
                                                .couponInfo
                                                .couponDiscountedPrice +
                                            widget!.shippingCharge)
                                        : (functions.newCartTotal(
                                                currentUserDocument!
                                                    .userCart.cartItems
                                                    .map((e) => e.totalPrice)
                                                    .toList()) +
                                            widget!.shippingCharge),
                                    orderItems: updateUserCartStruct(
                                      currentUserDocument?.userCart,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                    customerId: currentUserUid,
                                    shippingPrice: widget!.shippingCharge,
                                  ),
                                  ordersRecordReference);
                          _shouldSetState = true;
                          if (currentUserDocument!.userCart.cartItems
                                  .where((e) => e.productType == 'product')
                                  .toList()
                                  .length >
                              0) {
                            await _model.orderMyfatoorahpaymentNew!.reference
                                .update(createOrdersRecordData(
                              shippingAddress:
                                  updateUserShippingaddressInfoStruct(
                                (currentUserDocument?.userShippingaddress
                                            ?.toList() ??
                                        [])
                                    .where((e) => e.isDefault == true)
                                    .toList()
                                    .firstOrNull
                                    ?.shippingAddressInfo,
                                clearUnsetFields: false,
                              ),
                              shippingInfo: updateUserShippingaddressStruct(
                                (currentUserDocument?.userShippingaddress
                                            ?.toList() ??
                                        [])
                                    .where((e) => e.isDefault == true)
                                    .toList()
                                    .firstOrNull,
                                clearUnsetFields: false,
                              ),
                              readyShippingRequestStatus: _model
                                          .orderMyfatoorahpaymentNew!
                                          .orderItems
                                          .cartItems
                                          .where((e) =>
                                              e.productMainType == 'ready')
                                          .toList()
                                          .length >
                                      0
                                  ? 'Notyet'
                                  : '',
                              customShippingRequestStatus: _model
                                          .orderMyfatoorahpaymentNew!
                                          .orderItems
                                          .cartItems
                                          .where((e) =>
                                              e.productMainType == 'custom')
                                          .toList()
                                          .length >
                                      0
                                  ? 'Notyet'
                                  : '',
                            ));
                          }

                          await widget!.id!.reference.update({
                            ...mapToFirestore(
                              {
                                'order_id': FieldValue.increment(1),
                              },
                            ),
                          });
                          unawaited(
                            () async {
                              Navigator.pop(context);
                            }(),
                          );

                          context.goNamed(
                            PaymentWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                FFLocalizations.of(context).getVariableText(
                                  enText:
                                      'TAP payment server is busy. Please try again.',
                                  arText:
                                      'خادم دفع TAP مشغول. يُرجى المحاولة مرة أخرى.',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                            ),
                          );
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'x2mcjqyu' /* Proceed to Pay */,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'almarai',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'kx4ptps8' /* Your payment method and type w... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'almarai',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
              ]
                  .addToStart(SizedBox(height: 16.0))
                  .addToEnd(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ],
    );
  }
}
