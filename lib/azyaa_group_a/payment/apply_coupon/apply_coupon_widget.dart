import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'apply_coupon_model.dart';
export 'apply_coupon_model.dart';

class ApplyCouponWidget extends StatefulWidget {
  const ApplyCouponWidget({
    super.key,
    required this.shippingCharges,
  });

  final double? shippingCharges;

  @override
  State<ApplyCouponWidget> createState() => _ApplyCouponWidgetState();
}

class _ApplyCouponWidgetState extends State<ApplyCouponWidget> {
  late ApplyCouponModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApplyCouponModel());

    _model.couponTextController ??= TextEditingController();
    _model.couponFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F1F1),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7gd4ax2q' /* Apply Coupon */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'almarai',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                  child: Stack(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        child: TextFormField(
                          controller: _model.couponTextController,
                          focusNode: _model.couponFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'almarai',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '38x7sap7' /* Discount code or Gift card */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'almarai',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).border,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).border,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.couponTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              _model.couponResult = await queryCouponRecordOnce(
                                queryBuilder: (couponRecord) =>
                                    couponRecord.where(
                                  'coupon_value',
                                  isEqualTo: _model.couponTextController.text,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              if ((_model.couponResult != null) == false) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText: 'Invalid coupon code',
                                          arText: 'رمز قسيمة غير صالح',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.couponResult?.couponStatus !=
                                  'active') {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText: 'Coupon is expired',
                                          arText: 'انتهت صلاحية القسيمة',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.couponResult!.couponStartDate! >
                                  functions.presentDateFromZerotime()) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText: 'Coupon is not yet active',
                                          arText: 'القسيمة غير نشطة بعد',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.couponResult!.couponEndDate! <
                                  functions.presentDateFromZerotime()) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText: 'Coupon is expired',
                                          arText: 'انتهت صلاحية القسيمة',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.couponResult!.couponUsedUserList
                                      .where((e) => e.userId == currentUserUid)
                                      .toList()
                                      .length >
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText:
                                              'Coupon has been used already',
                                          arText:
                                              'لقد تم استخدام القسيمة بالفعل',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.couponResult!.couponLimit <=
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText:
                                              'Coupon limit has been reached',
                                          arText: 'تم الوصول إلى حد القسيمة',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.couponResult?.couponFor !=
                                  valueOrDefault(
                                      currentUserDocument?.userRole, '')) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText:
                                              'Your are not eligiable to use this coupon ',
                                          arText:
                                              'أنت غير مؤهل لاستخدام هذه القسيمة',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (currentUserDocument
                                      ?.userCart.cartItems.length !=
                                  currentUserDocument?.userCart.cartItems
                                      .where((e) => e.productType == 'product')
                                      .toList()
                                      .length) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            FFLocalizations.of(context)
                                                .getVariableText(
                                          enText:
                                              'Coupon is applicable on products only',
                                          arText:
                                              'القسيمة سارية على المنتجات فقط',
                                        )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                              enText: 'Ok',
                                              arText: 'نعم',
                                            )),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                safeSetState(() {
                                  _model.couponTextController?.clear();
                                });
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else if (_model.couponResult?.couponFor ==
                                  'Creator') {
                                if (_model.couponResult?.couponDiscountType ==
                                    'Amount') {
                                  _model.discountedTotal = (functions
                                              .newCartTotal(currentUserDocument!
                                                  .userCart.cartItems
                                                  .map((e) => e.totalPrice)
                                                  .toList()) +
                                          (widget.shippingCharges!)) -
                                      _model
                                          .couponResult!.couponMaximumDiscount;
                                  _model.updateCouponInfoStruct(
                                    (e) => e
                                      ..couponRef =
                                          _model.couponResult?.reference
                                      ..couponId = _model.couponResult?.couponId
                                      ..couponValue =
                                          _model.couponResult?.couponValue
                                      ..couponDiscountedPrice =
                                          _model.discountedTotal
                                      ..couponDiscountType = _model
                                          .couponResult?.couponDiscountType
                                      ..couponMaximumDiscount = _model
                                          .couponResult?.couponMaximumDiscount
                                      ..updateCouponUserInfo(
                                        (e) => e
                                          ..userEmail = currentUserEmail
                                          ..userName = currentUserDisplayName
                                          ..userPhone = currentPhoneNumber
                                          ..userId = currentUserUid
                                          ..userRole = valueOrDefault(
                                              currentUserDocument?.userRole,
                                              ''),
                                      )
                                      ..couponPrice =
                                          _model.couponResult?.couponPrice
                                      ..couponFor =
                                          _model.couponResult?.couponFor,
                                  );

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    userCart: createUserCartStruct(
                                      couponInfo: updateCouponCartInfoStruct(
                                        _model.couponInfo,
                                        clearUnsetFields: false,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                } else {
                                  _model.discountedTotal =
                                      (_model.couponResult!.couponPrice / 100) *
                                          (currentUserDocument!
                                                  .userCart.subtotal +
                                              (widget.shippingCharges!));
                                  _model.discountedTotal = (functions
                                              .newCartTotal(currentUserDocument!
                                                  .userCart.cartItems
                                                  .map((e) => e.totalPrice)
                                                  .toList()) +
                                          (widget.shippingCharges!)) -
                                      (_model.discountedTotal!);
                                  _model.updateCouponInfoStruct(
                                    (e) => e
                                      ..couponRef =
                                          _model.couponResult?.reference
                                      ..couponId = _model.couponResult?.couponId
                                      ..couponValue =
                                          _model.couponResult?.couponValue
                                      ..couponDiscountedPrice =
                                          _model.discountedTotal
                                      ..couponDiscountType = _model
                                          .couponResult?.couponDiscountType
                                      ..couponMaximumDiscount = _model
                                          .couponResult?.couponMaximumDiscount
                                      ..updateCouponUserInfo(
                                        (e) => e
                                          ..userEmail = currentUserEmail
                                          ..userName = currentUserDisplayName
                                          ..userPhone = currentPhoneNumber
                                          ..userId = currentUserUid
                                          ..userRole = valueOrDefault(
                                              currentUserDocument?.userRole,
                                              ''),
                                      )
                                      ..couponPrice =
                                          _model.couponResult?.couponPrice
                                      ..couponFor =
                                          _model.couponResult?.couponFor,
                                  );

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    userCart: createUserCartStruct(
                                      couponInfo: updateCouponCartInfoStruct(
                                        _model.couponInfo,
                                        clearUnsetFields: false,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                }

                                FFAppState().updateUserDataFlowStruct(
                                  (e) => e..incrementRefresh(1),
                                );
                                _model.updatePage(() {});
                                Navigator.pop(context);
                              } else {
                                if (_model.couponResult!
                                        .couponMinimumOrderAmount <
                                    currentUserDocument!.userCart.subtotal) {
                                  if (_model.couponResult?.couponDiscountType ==
                                      'Amount') {
                                    _model.discountedTotal = functions
                                            .newCartTotal(currentUserDocument!
                                                .userCart.cartItems
                                                .map((e) => e.totalPrice)
                                                .toList()) -
                                        _model.couponResult!
                                            .couponMaximumDiscount;
                                    _model.updateCouponInfoStruct(
                                      (e) => e
                                        ..couponRef =
                                            _model.couponResult?.reference
                                        ..couponId =
                                            _model.couponResult?.couponId
                                        ..couponValue =
                                            _model.couponResult?.couponValue
                                        ..couponDiscountedPrice =
                                            _model.discountedTotal
                                        ..couponDiscountType = _model
                                            .couponResult?.couponDiscountType
                                        ..couponMaximumDiscount = _model
                                            .couponResult?.couponMaximumDiscount
                                        ..updateCouponUserInfo(
                                          (e) => e
                                            ..userEmail = currentUserEmail
                                            ..userName = currentUserDisplayName
                                            ..userPhone = currentPhoneNumber
                                            ..userId = currentUserUid
                                            ..userRole = valueOrDefault(
                                                currentUserDocument?.userRole,
                                                ''),
                                        )
                                        ..couponPrice =
                                            _model.couponResult?.couponPrice
                                        ..couponFor =
                                            _model.couponResult?.couponFor,
                                    );

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      userCart: createUserCartStruct(
                                        couponInfo: updateCouponCartInfoStruct(
                                          _model.couponInfo,
                                          clearUnsetFields: false,
                                        ),
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                  } else {
                                    _model.discountedTotal = (_model
                                                .couponResult!.couponPrice /
                                            100) *
                                        currentUserDocument!.userCart.subtotal;
                                    if (_model.discountedTotal! <
                                        _model.couponResult!
                                            .couponMaximumDiscount) {
                                      _model.discountedTotal = functions
                                              .newCartTotal(currentUserDocument!
                                                  .userCart.cartItems
                                                  .map((e) => e.totalPrice)
                                                  .toList()) -
                                          (_model.discountedTotal!);
                                      _model.updateCouponInfoStruct(
                                        (e) => e
                                          ..couponRef =
                                              _model.couponResult?.reference
                                          ..couponId =
                                              _model.couponResult?.couponId
                                          ..couponValue =
                                              _model.couponResult?.couponValue
                                          ..couponDiscountedPrice =
                                              _model.discountedTotal
                                          ..couponDiscountType = _model
                                              .couponResult?.couponDiscountType
                                          ..couponMaximumDiscount = _model
                                              .couponResult
                                              ?.couponMaximumDiscount
                                          ..updateCouponUserInfo(
                                            (e) => e
                                              ..userEmail = currentUserEmail
                                              ..userName =
                                                  currentUserDisplayName
                                              ..userPhone = currentPhoneNumber
                                              ..userId = currentUserUid
                                              ..userRole = valueOrDefault(
                                                  currentUserDocument?.userRole,
                                                  ''),
                                          )
                                          ..couponPrice =
                                              _model.couponResult?.couponPrice
                                          ..couponFor =
                                              _model.couponResult?.couponFor,
                                      );

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        userCart: createUserCartStruct(
                                          couponInfo:
                                              updateCouponCartInfoStruct(
                                            _model.couponInfo,
                                            clearUnsetFields: false,
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                    } else {
                                      _model.discountedTotal = functions
                                              .newCartTotal(currentUserDocument!
                                                  .userCart.cartItems
                                                  .map((e) => e.totalPrice)
                                                  .toList()) -
                                          _model.couponResult!
                                              .couponMaximumDiscount;
                                      _model.updateCouponInfoStruct(
                                        (e) => e
                                          ..couponRef =
                                              _model.couponResult?.reference
                                          ..couponId =
                                              _model.couponResult?.couponId
                                          ..couponValue =
                                              _model.couponResult?.couponValue
                                          ..couponDiscountedPrice =
                                              _model.discountedTotal
                                          ..couponDiscountType = _model
                                              .couponResult?.couponDiscountType
                                          ..couponMaximumDiscount = _model
                                              .couponResult
                                              ?.couponMaximumDiscount
                                          ..updateCouponUserInfo(
                                            (e) => e
                                              ..userEmail = currentUserEmail
                                              ..userName =
                                                  currentUserDisplayName
                                              ..userPhone = currentPhoneNumber
                                              ..userId = currentUserUid
                                              ..userRole = valueOrDefault(
                                                  currentUserDocument?.userRole,
                                                  ''),
                                          )
                                          ..couponPrice =
                                              _model.couponResult?.couponPrice
                                          ..couponFor =
                                              _model.couponResult?.couponFor,
                                      );

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        userCart: createUserCartStruct(
                                          couponInfo:
                                              updateCouponCartInfoStruct(
                                            _model.couponInfo,
                                            clearUnsetFields: false,
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                    }
                                  }

                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e..incrementRefresh(1),
                                  );
                                  _model.updatePage(() {});
                                  Navigator.pop(context);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              '${FFLocalizations.of(context).getVariableText(
                                            enText:
                                                'Total amount should be greater than ',
                                            arText:
                                                'يجب أن يكون المبلغ الإجمالي أكبر من',
                                          )}${_model.couponResult?.couponMinimumOrderAmount.toString()}${FFLocalizations.of(context).getVariableText(
                                            enText: 'KD',
                                            arText: 'KD',
                                          )}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Ok',
                                                arText: 'نعم',
                                              )),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  safeSetState(() {
                                    _model.couponTextController?.clear();
                                  });
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'ep1lpnyz' /* Apply */,
                            ),
                            options: FFButtonOptions(
                              height: 30.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 8.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(const SizedBox(height: 12.0)),
            ),
          ),
          Flexible(
            child: StreamBuilder<List<CouponRecord>>(
              stream: queryCouponRecord(
                queryBuilder: (couponRecord) => couponRecord.where(
                  'coupon_status',
                  isEqualTo: 'active',
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
                List<CouponRecord> containerCouponRecordList = snapshot.data!;

                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F1F1),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '9ug8moss' /* Available Coupons */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).purple,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 2.0, 6.0, 4.0),
                                  child: Text(
                                    containerCouponRecordList
                                        .where((e) =>
                                            functions.isDateWithinRange(
                                                e.couponStartDate!,
                                                e.couponEndDate!,
                                                getCurrentTimestamp) ==
                                            true)
                                        .toList()
                                        .length
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final coupons = containerCouponRecordList
                                .where((e) =>
                                    functions.isDateWithinRange(
                                        e.couponStartDate!,
                                        e.couponEndDate!,
                                        getCurrentTimestamp) ==
                                    true)
                                .toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: coupons.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12.0),
                              itemBuilder: (context, couponsIndex) {
                                final couponsItem = coupons[couponsIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 4.0),
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      couponsItem.couponUsedUserList
                                                                  .where((e) =>
                                                                      e.userId ==
                                                                      currentUserUid)
                                                                  .toList()
                                                                  .length >
                                                              0
                                                          ? const Color(0xFFCBCBCB)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .purple,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .purple,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(16.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        couponsItem.couponUsedUserList
                                                                    .where((e) =>
                                                                        e.userId ==
                                                                        currentUserUid)
                                                                    .toList()
                                                                    .length >
                                                                0
                                                            ? const Color(0xFFCBCBCB)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .purple,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .purple,
                                                      ),
                                                      width: 0.01,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                4.0),
                                                    child: Text(
                                                      '${'${couponsItem.couponPrice.toString()}${couponsItem.couponDiscountType == 'Percentage' ? ' % ' : ' KD '}'}OFF',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 8.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        couponsItem.couponUsedUserList
                                                                    .where((e) =>
                                                                        e.userId ==
                                                                        currentUserUid)
                                                                    .toList()
                                                                    .length >
                                                                0
                                                            ? const Color(0xFFCBCBCB)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .purple,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .purple,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        topRight:
                                                            Radius.circular(
                                                                16.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(12.0),
                                                      child: Text(
                                                        '${'${couponsItem.couponPrice.toString()}${couponsItem.couponDiscountType == 'Percentage' ? ' % ' : ' KD '}'}OFF',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  couponsItem.couponUsedUserList
                                                              .where((e) =>
                                                                  e.userId ==
                                                                  currentUserUid)
                                                              .toList()
                                                              .length >
                                                          0
                                                      ? const Color(0xFFCBCBCB)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .purple,
                                                  FlutterFlowTheme.of(context)
                                                      .purple,
                                                ),
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(16.0),
                                                  bottomRight:
                                                      Radius.circular(16.0),
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    couponsItem.couponUsedUserList
                                                                .where((e) =>
                                                                    e.userId ==
                                                                    currentUserUid)
                                                                .toList()
                                                                .length >
                                                            0
                                                        ? const Color(0xFFCBCBCB)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .purple,
                                                    FlutterFlowTheme.of(context)
                                                        .purple,
                                                  ),
                                                  width: 0.01,
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  16.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  16.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    4.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    couponsItem
                                                                        .couponValue,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                  tablet: false,
                                                                  tabletLandscape:
                                                                      false,
                                                                  desktop:
                                                                      false,
                                                                ))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      if (couponsItem
                                                                              .couponUsedUserList
                                                                              .where((e) => e.userId == currentUserUid)
                                                                              .toList()
                                                                              .length <=
                                                                          0) {
                                                                        if (couponsItem.couponLimit <=
                                                                            0) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  content: Text(FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Coupon limit has been reached',
                                                                                    arText: 'تم الوصول إلى حد القسيمة',
                                                                                  )),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Ok',
                                                                                        arText: 'نعم',
                                                                                      )),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                          safeSetState(
                                                                              () {
                                                                            _model.couponTextController?.clear();
                                                                          });
                                                                          return;
                                                                        } else if (couponsItem.couponFor !=
                                                                            valueOrDefault(
                                                                                currentUserDocument
                                                                                    ?.userRole,
                                                                                '')) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  content: Text(FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Your are not eligiable to use this coupon ',
                                                                                    arText: 'أنت غير مؤهل لاستخدام هذه القسيمة',
                                                                                  )),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Ok',
                                                                                        arText: 'نعم',
                                                                                      )),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                          safeSetState(
                                                                              () {
                                                                            _model.couponTextController?.clear();
                                                                          });
                                                                          return;
                                                                        } else if (currentUserDocument?.userCart.cartItems.length !=
                                                                            currentUserDocument?.userCart.cartItems.where((e) => e.productType == 'product').toList().length) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  content: Text(FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Coupon is applicable on products only',
                                                                                    arText: 'القسيمة سارية على المنتجات فقط',
                                                                                  )),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Ok',
                                                                                        arText: 'نعم',
                                                                                      )),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                          safeSetState(
                                                                              () {
                                                                            _model.couponTextController?.clear();
                                                                          });
                                                                          return;
                                                                        } else if (couponsItem.couponFor == 'Creator') {
                                                                          if (couponsItem.couponDiscountType ==
                                                                              'Amount') {
                                                                            _model.discountedTotal =
                                                                                (functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) + (widget.shippingCharges!)) - couponsItem.couponMaximumDiscount;
                                                                            _model.updateCouponInfoStruct(
                                                                              (e) => e
                                                                                ..couponRef = _model.couponResult?.reference
                                                                                ..couponId = _model.couponResult?.couponId
                                                                                ..couponValue = _model.couponResult?.couponValue
                                                                                ..couponDiscountedPrice = _model.discountedTotal
                                                                                ..couponDiscountType = _model.couponResult?.couponDiscountType
                                                                                ..couponMaximumDiscount = _model.couponResult?.couponMaximumDiscount
                                                                                ..updateCouponUserInfo(
                                                                                  (e) => e
                                                                                    ..userEmail = currentUserEmail
                                                                                    ..userName = currentUserDisplayName
                                                                                    ..userPhone = currentPhoneNumber
                                                                                    ..userId = currentUserUid
                                                                                    ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                ),
                                                                            );

                                                                            await currentUserReference!.update(createUsersRecordData(
                                                                              userCart: createUserCartStruct(
                                                                                couponInfo: updateCouponCartInfoStruct(
                                                                                  _model.couponInfo,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                          } else {
                                                                            _model.discountedTotal =
                                                                                (couponsItem.couponPrice / 100) * (currentUserDocument!.userCart.subtotal + (widget.shippingCharges!));
                                                                            _model.discountedTotal =
                                                                                (functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) + (widget.shippingCharges!)) - (_model.discountedTotal!);
                                                                            _model.updateCouponInfoStruct(
                                                                              (e) => e
                                                                                ..couponRef = _model.couponResult?.reference
                                                                                ..couponId = _model.couponResult?.couponId
                                                                                ..couponValue = _model.couponResult?.couponValue
                                                                                ..couponDiscountedPrice = _model.discountedTotal
                                                                                ..couponDiscountType = _model.couponResult?.couponDiscountType
                                                                                ..couponMaximumDiscount = _model.couponResult?.couponMaximumDiscount
                                                                                ..updateCouponUserInfo(
                                                                                  (e) => e
                                                                                    ..userEmail = currentUserEmail
                                                                                    ..userName = currentUserDisplayName
                                                                                    ..userPhone = currentPhoneNumber
                                                                                    ..userId = currentUserUid
                                                                                    ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                ),
                                                                            );

                                                                            await currentUserReference!.update(createUsersRecordData(
                                                                              userCart: createUserCartStruct(
                                                                                couponInfo: updateCouponCartInfoStruct(
                                                                                  _model.couponInfo,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));
                                                                          }

                                                                          FFAppState()
                                                                              .updateUserDataFlowStruct(
                                                                            (e) => e
                                                                              ..incrementRefresh(1),
                                                                          );
                                                                          _model
                                                                              .updatePage(() {});
                                                                          Navigator.pop(
                                                                              context);
                                                                        } else {
                                                                          if (couponsItem.couponMinimumOrderAmount <
                                                                              currentUserDocument!.userCart.subtotal) {
                                                                            if (couponsItem.couponDiscountType ==
                                                                                'Amount') {
                                                                              _model.discountedTotal = functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) - couponsItem.couponMaximumDiscount;
                                                                              _model.updateCouponInfoStruct(
                                                                                (e) => e
                                                                                  ..couponRef = _model.couponResult?.reference
                                                                                  ..couponId = _model.couponResult?.couponId
                                                                                  ..couponValue = _model.couponResult?.couponValue
                                                                                  ..couponDiscountedPrice = _model.discountedTotal
                                                                                  ..couponDiscountType = _model.couponResult?.couponDiscountType
                                                                                  ..couponMaximumDiscount = _model.couponResult?.couponMaximumDiscount
                                                                                  ..updateCouponUserInfo(
                                                                                    (e) => e
                                                                                      ..userEmail = currentUserEmail
                                                                                      ..userName = currentUserDisplayName
                                                                                      ..userPhone = currentPhoneNumber
                                                                                      ..userId = currentUserUid
                                                                                      ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                  )
                                                                                  ..couponPrice = _model.couponResult?.couponPrice,
                                                                              );

                                                                              await currentUserReference!.update(createUsersRecordData(
                                                                                userCart: createUserCartStruct(
                                                                                  couponInfo: updateCouponCartInfoStruct(
                                                                                    _model.couponInfo,
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                              ));
                                                                            } else {
                                                                              _model.discountedTotal = (couponsItem.couponPrice / 100) * currentUserDocument!.userCart.subtotal;
                                                                              if (_model.discountedTotal! < couponsItem.couponMaximumDiscount) {
                                                                                _model.discountedTotal = functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) - (_model.discountedTotal!);
                                                                                _model.updateCouponInfoStruct(
                                                                                  (e) => e
                                                                                    ..couponRef = _model.couponResult?.reference
                                                                                    ..couponId = _model.couponResult?.couponId
                                                                                    ..couponValue = _model.couponResult?.couponValue
                                                                                    ..couponDiscountedPrice = _model.discountedTotal
                                                                                    ..couponDiscountType = _model.couponResult?.couponDiscountType
                                                                                    ..couponMaximumDiscount = _model.couponResult?.couponMaximumDiscount
                                                                                    ..updateCouponUserInfo(
                                                                                      (e) => e
                                                                                        ..userEmail = currentUserEmail
                                                                                        ..userName = currentUserDisplayName
                                                                                        ..userPhone = currentPhoneNumber
                                                                                        ..userId = currentUserUid
                                                                                        ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                    )
                                                                                    ..couponPrice = _model.couponResult?.couponPrice,
                                                                                );

                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                  userCart: createUserCartStruct(
                                                                                    couponInfo: updateCouponCartInfoStruct(
                                                                                      _model.couponInfo,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                              } else {
                                                                                _model.discountedTotal = functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) - couponsItem.couponMaximumDiscount;
                                                                                _model.updateCouponInfoStruct(
                                                                                  (e) => e
                                                                                    ..couponRef = _model.couponResult?.reference
                                                                                    ..couponId = _model.couponResult?.couponId
                                                                                    ..couponValue = _model.couponResult?.couponValue
                                                                                    ..couponDiscountedPrice = _model.discountedTotal
                                                                                    ..couponDiscountType = _model.couponResult?.couponDiscountType
                                                                                    ..couponMaximumDiscount = _model.couponResult?.couponMaximumDiscount
                                                                                    ..updateCouponUserInfo(
                                                                                      (e) => e
                                                                                        ..userEmail = currentUserEmail
                                                                                        ..userName = currentUserDisplayName
                                                                                        ..userPhone = currentPhoneNumber
                                                                                        ..userId = currentUserUid
                                                                                        ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                    )
                                                                                    ..couponPrice = _model.couponResult?.couponPrice,
                                                                                );

                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                  userCart: createUserCartStruct(
                                                                                    couponInfo: updateCouponCartInfoStruct(
                                                                                      _model.couponInfo,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                              }
                                                                            }

                                                                            FFAppState().updateUserDataFlowStruct(
                                                                              (e) => e..incrementRefresh(1),
                                                                            );
                                                                            _model.updatePage(() {});
                                                                            Navigator.pop(context);
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    content: Text('${FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'Total amount should be greater than ',
                                                                                      arText: 'يجب أن يكون المبلغ الإجمالي أكبر من',
                                                                                    )}${_model.couponResult?.couponMinimumOrderAmount.toString()}${FFLocalizations.of(context).getVariableText(
                                                                                      enText: 'KD',
                                                                                      arText: 'KD',
                                                                                    )}'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text(FFLocalizations.of(context).getVariableText(
                                                                                          enText: 'Ok',
                                                                                          arText: 'نعم',
                                                                                        )),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                            safeSetState(() {
                                                                              _model.couponTextController?.clear();
                                                                            });
                                                                            return;
                                                                          }
                                                                        }
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '7s9t8th5' /* Apply */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'almarai',
                                                                            color: couponsItem.couponUsedUserList.where((e) => e.userId == currentUserUid).toList().length > 0
                                                                                ? const Color(0xFFCBCBCB)
                                                                                : FlutterFlowTheme.of(context).velvet,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                FFButtonWidget(
                                                                  onPressed: (couponsItem
                                                                              .couponUsedUserList
                                                                              .where((e) => e.userId == currentUserUid)
                                                                              .toList()
                                                                              .length >
                                                                          0)
                                                                      ? null
                                                                      : () async {
                                                                          if (couponsItem.couponUsedUserList.where((e) => e.userId == currentUserUid).toList().length <=
                                                                              0) {
                                                                            if (couponsItem.couponLimit <=
                                                                                0) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Coupon limit has been reached',
                                                                                        arText: 'تم الوصول إلى حد القسيمة',
                                                                                      )),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text(FFLocalizations.of(context).getVariableText(
                                                                                            enText: 'Ok',
                                                                                            arText: 'نعم',
                                                                                          )),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                              safeSetState(() {
                                                                                _model.couponTextController?.clear();
                                                                              });
                                                                              return;
                                                                            } else if (couponsItem.couponFor !=
                                                                                valueOrDefault(currentUserDocument?.userRole, '')) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Your are not eligiable to use this coupon ',
                                                                                        arText: 'أنت غير مؤهل لاستخدام هذه القسيمة',
                                                                                      )),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text(FFLocalizations.of(context).getVariableText(
                                                                                            enText: 'Ok',
                                                                                            arText: 'نعم',
                                                                                          )),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                              safeSetState(() {
                                                                                _model.couponTextController?.clear();
                                                                              });
                                                                              return;
                                                                            } else if (currentUserDocument?.userCart.cartItems.length != currentUserDocument?.userCart.cartItems.where((e) => e.productType == 'product').toList().length) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text(FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Coupon is applicable on products only',
                                                                                        arText: 'القسيمة سارية على المنتجات فقط',
                                                                                      )),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text(FFLocalizations.of(context).getVariableText(
                                                                                            enText: 'Ok',
                                                                                            arText: 'نعم',
                                                                                          )),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                              safeSetState(() {
                                                                                _model.couponTextController?.clear();
                                                                              });
                                                                              return;
                                                                            } else if (couponsItem.couponFor == 'Creator') {
                                                                              if (couponsItem.couponDiscountType == 'Amount') {
                                                                                _model.discountedTotal = (functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) + (widget.shippingCharges!)) - couponsItem.couponMaximumDiscount;
                                                                                _model.updateCouponInfoStruct(
                                                                                  (e) => e
                                                                                    ..couponRef = couponsItem.reference
                                                                                    ..couponId = couponsItem.couponId
                                                                                    ..couponValue = couponsItem.couponValue
                                                                                    ..couponDiscountedPrice = _model.discountedTotal
                                                                                    ..couponDiscountType = couponsItem.couponDiscountType
                                                                                    ..couponMaximumDiscount = couponsItem.couponMaximumDiscount
                                                                                    ..updateCouponUserInfo(
                                                                                      (e) => e
                                                                                        ..userEmail = currentUserEmail
                                                                                        ..userName = currentUserDisplayName
                                                                                        ..userPhone = currentPhoneNumber
                                                                                        ..userId = currentUserUid
                                                                                        ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                    )
                                                                                    ..couponPrice = couponsItem.couponPrice
                                                                                    ..couponFor = couponsItem.couponFor,
                                                                                );

                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                  userCart: createUserCartStruct(
                                                                                    couponInfo: updateCouponCartInfoStruct(
                                                                                      _model.couponInfo,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                              } else {
                                                                                _model.discountedTotal = (couponsItem.couponPrice / 100) * (currentUserDocument!.userCart.subtotal + (widget.shippingCharges!));
                                                                                _model.discountedTotal = (functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) + (widget.shippingCharges!)) - (_model.discountedTotal!);
                                                                                _model.updateCouponInfoStruct(
                                                                                  (e) => e
                                                                                    ..couponRef = couponsItem.reference
                                                                                    ..couponId = couponsItem.couponId
                                                                                    ..couponValue = couponsItem.couponValue
                                                                                    ..couponDiscountedPrice = _model.discountedTotal
                                                                                    ..couponDiscountType = couponsItem.couponDiscountType
                                                                                    ..couponMaximumDiscount = couponsItem.couponMaximumDiscount
                                                                                    ..updateCouponUserInfo(
                                                                                      (e) => e
                                                                                        ..userEmail = currentUserEmail
                                                                                        ..userName = currentUserDisplayName
                                                                                        ..userPhone = currentPhoneNumber
                                                                                        ..userId = currentUserUid
                                                                                        ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                    )
                                                                                    ..couponPrice = couponsItem.couponPrice
                                                                                    ..couponFor = couponsItem.couponFor,
                                                                                );

                                                                                await currentUserReference!.update(createUsersRecordData(
                                                                                  userCart: createUserCartStruct(
                                                                                    couponInfo: updateCouponCartInfoStruct(
                                                                                      _model.couponInfo,
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                ));
                                                                              }

                                                                              FFAppState().updateUserDataFlowStruct(
                                                                                (e) => e..incrementRefresh(1),
                                                                              );
                                                                              _model.updatePage(() {});
                                                                              Navigator.pop(context);
                                                                            } else {
                                                                              if (couponsItem.couponMinimumOrderAmount < currentUserDocument!.userCart.subtotal) {
                                                                                if (couponsItem.couponDiscountType == 'Amount') {
                                                                                  _model.discountedTotal = functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) - couponsItem.couponMaximumDiscount;
                                                                                  _model.updateCouponInfoStruct(
                                                                                    (e) => e
                                                                                      ..couponRef = couponsItem.reference
                                                                                      ..couponId = couponsItem.couponId
                                                                                      ..couponValue = couponsItem.couponValue
                                                                                      ..couponDiscountedPrice = _model.discountedTotal
                                                                                      ..couponDiscountType = couponsItem.couponDiscountType
                                                                                      ..couponMaximumDiscount = couponsItem.couponMaximumDiscount
                                                                                      ..updateCouponUserInfo(
                                                                                        (e) => e
                                                                                          ..userEmail = currentUserEmail
                                                                                          ..userName = currentUserDisplayName
                                                                                          ..userPhone = currentPhoneNumber
                                                                                          ..userId = currentUserUid
                                                                                          ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                      )
                                                                                      ..couponPrice = couponsItem.couponPrice
                                                                                      ..couponFor = couponsItem.couponFor,
                                                                                  );

                                                                                  await currentUserReference!.update(createUsersRecordData(
                                                                                    userCart: createUserCartStruct(
                                                                                      couponInfo: updateCouponCartInfoStruct(
                                                                                        _model.couponInfo,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                  ));
                                                                                } else {
                                                                                  _model.discountedTotal = (couponsItem.couponPrice / 100) * currentUserDocument!.userCart.subtotal;
                                                                                  if (_model.discountedTotal! < couponsItem.couponMaximumDiscount) {
                                                                                    _model.discountedTotal = functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) - (_model.discountedTotal!);
                                                                                    _model.updateCouponInfoStruct(
                                                                                      (e) => e
                                                                                        ..couponRef = couponsItem.reference
                                                                                        ..couponId = couponsItem.couponId
                                                                                        ..couponValue = couponsItem.couponValue
                                                                                        ..couponDiscountedPrice = _model.discountedTotal
                                                                                        ..couponDiscountType = couponsItem.couponDiscountType
                                                                                        ..couponMaximumDiscount = couponsItem.couponMaximumDiscount
                                                                                        ..updateCouponUserInfo(
                                                                                          (e) => e
                                                                                            ..userEmail = currentUserEmail
                                                                                            ..userName = currentUserDisplayName
                                                                                            ..userPhone = currentPhoneNumber
                                                                                            ..userId = currentUserUid
                                                                                            ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                        )
                                                                                        ..couponPrice = couponsItem.couponPrice
                                                                                        ..couponFor = couponsItem.couponFor,
                                                                                    );

                                                                                    await currentUserReference!.update(createUsersRecordData(
                                                                                      userCart: createUserCartStruct(
                                                                                        couponInfo: updateCouponCartInfoStruct(
                                                                                          _model.couponInfo,
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  } else {
                                                                                    _model.discountedTotal = functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) - couponsItem.couponMaximumDiscount;
                                                                                    _model.updateCouponInfoStruct(
                                                                                      (e) => e
                                                                                        ..couponRef = couponsItem.reference
                                                                                        ..couponId = couponsItem.couponId
                                                                                        ..couponValue = couponsItem.couponValue
                                                                                        ..couponDiscountedPrice = _model.discountedTotal
                                                                                        ..couponDiscountType = couponsItem.couponDiscountType
                                                                                        ..couponMaximumDiscount = couponsItem.couponMaximumDiscount
                                                                                        ..updateCouponUserInfo(
                                                                                          (e) => e
                                                                                            ..userEmail = currentUserEmail
                                                                                            ..userName = currentUserDisplayName
                                                                                            ..userPhone = currentPhoneNumber
                                                                                            ..userId = currentUserUid
                                                                                            ..userRole = valueOrDefault(currentUserDocument?.userRole, ''),
                                                                                        )
                                                                                        ..couponPrice = couponsItem.couponPrice
                                                                                        ..couponFor = couponsItem.couponFor,
                                                                                    );

                                                                                    await currentUserReference!.update(createUsersRecordData(
                                                                                      userCart: createUserCartStruct(
                                                                                        couponInfo: updateCouponCartInfoStruct(
                                                                                          _model.couponInfo,
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                    ));
                                                                                  }
                                                                                }

                                                                                FFAppState().updateUserDataFlowStruct(
                                                                                  (e) => e..incrementRefresh(1),
                                                                                );
                                                                                _model.updatePage(() {});
                                                                                Navigator.pop(context);
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text('${FFLocalizations.of(context).getVariableText(
                                                                                          enText: 'Total amount should be greater than ',
                                                                                          arText: 'يجب أن يكون المبلغ الإجمالي أكبر من',
                                                                                        )}${couponsItem.couponMinimumOrderAmount.toString()}${FFLocalizations.of(context).getVariableText(
                                                                                          enText: 'KD',
                                                                                          arText: 'KD',
                                                                                        )}'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text(FFLocalizations.of(context).getVariableText(
                                                                                              enText: 'Ok',
                                                                                              arText: 'نعم',
                                                                                            )),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                                safeSetState(() {
                                                                                  _model.couponTextController?.clear();
                                                                                });
                                                                                return;
                                                                              }
                                                                            }
                                                                          }
                                                                        },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'qrh95x8p' /* Apply */,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        30.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).velvet,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    disabledTextColor:
                                                                        const Color(
                                                                            0xFFCBCBCB),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            if (couponsItem
                                                                        .couponMainInfo
                                                                        .mainShortDescription !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: couponsItem
                                                                            .couponMainInfo
                                                                            .mainShortDescription,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/hr.png',
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 1.0,
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                  alignment:
                                                                      const Alignment(
                                                                          0.0,
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ),
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: couponsItem
                                                                        .couponMainInfo
                                                                        .mainDescription,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(const SizedBox(
                                                                  height: 6.0))
                                                              .addToEnd(const SizedBox(
                                                                  height:
                                                                      12.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.03, -1.0),
                                                    child: Container(
                                                      width: 15.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFF1F1F1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.03, -1.0),
                                                    child: Container(
                                                      width: 15.0,
                                                      height: 15.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFF1F1F1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ]
                          .divide(const SizedBox(height: 8.0))
                          .addToStart(const SizedBox(height: 12.0))
                          .addToEnd(const SizedBox(height: 12.0)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
