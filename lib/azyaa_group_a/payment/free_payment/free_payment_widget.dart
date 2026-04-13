import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'free_payment_model.dart';
export 'free_payment_model.dart';

class FreePaymentWidget extends StatefulWidget {
  const FreePaymentWidget({super.key});

  static String routeName = 'freePayment';
  static String routePath = '/azyaa-freepayment';

  @override
  State<FreePaymentWidget> createState() => _FreePaymentWidgetState();
}

class _FreePaymentWidgetState extends State<FreePaymentWidget> {
  late FreePaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreePaymentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.idmapResult = await queryIdMapRecordOnce(
        queryBuilder: (idMapRecord) => idMapRecord.where(
          'type',
          isEqualTo: 'Main',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);

      var ordersRecordReference = OrdersRecord.collection.doc();
      await ordersRecordReference.set(createOrdersRecordData(
        orderId: 'ORDAZYA${_model.idmapResult?.orderId?.toString()}',
        customerId: currentUserUid,
        customerRef: currentUserReference,
        orderItems: updateUserCartStruct(
          currentUserDocument?.userCart,
          clearUnsetFields: false,
          create: true,
        ),
        totalPrice: 0.0,
        orderStatus: 'CAPTURED',
        paymentStatus: 'CAPTURED',
        createdAt: getCurrentTimestamp,
        updatedAt: getCurrentTimestamp,
        paymentId: 'COUPONFREE',
        paymentMethod: 'COUPONFREE',
        shippingPrice: 0.0,
        paymentType: 'COUPON',
        shippingAddress: updateUserShippingaddressInfoStruct(
          (currentUserDocument?.userShippingaddress?.toList() ?? [])
              .where((e) => e.isDefault == true)
              .toList()
              .firstOrNull
              ?.shippingAddressInfo,
          clearUnsetFields: false,
          create: true,
        ),
        shippingInfo: updateUserShippingaddressStruct(
          (currentUserDocument?.userShippingaddress?.toList() ?? [])
              .where((e) => e.isDefault == true)
              .toList()
              .firstOrNull,
          clearUnsetFields: false,
          create: true,
        ),
      ));
      _model.freeOrderDocument = OrdersRecord.getDocumentFromData(
          createOrdersRecordData(
            orderId: 'ORDAZYA${_model.idmapResult?.orderId?.toString()}',
            customerId: currentUserUid,
            customerRef: currentUserReference,
            orderItems: updateUserCartStruct(
              currentUserDocument?.userCart,
              clearUnsetFields: false,
              create: true,
            ),
            totalPrice: 0.0,
            orderStatus: 'CAPTURED',
            paymentStatus: 'CAPTURED',
            createdAt: getCurrentTimestamp,
            updatedAt: getCurrentTimestamp,
            paymentId: 'COUPONFREE',
            paymentMethod: 'COUPONFREE',
            shippingPrice: 0.0,
            paymentType: 'COUPON',
            shippingAddress: updateUserShippingaddressInfoStruct(
              (currentUserDocument?.userShippingaddress?.toList() ?? [])
                  .where((e) => e.isDefault == true)
                  .toList()
                  .firstOrNull
                  ?.shippingAddressInfo,
              clearUnsetFields: false,
              create: true,
            ),
            shippingInfo: updateUserShippingaddressStruct(
              (currentUserDocument?.userShippingaddress?.toList() ?? [])
                  .where((e) => e.isDefault == true)
                  .toList()
                  .firstOrNull,
              clearUnsetFields: false,
              create: true,
            ),
          ),
          ordersRecordReference);
      _model.myfatoorahIdMapResult = await queryIdMapRecordOnce(
        queryBuilder: (idMapRecord) => idMapRecord.where(
          'type',
          isEqualTo: 'Main',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().updatePaymentFlowStruct(
        (e) => e
          ..paymentCart = currentUserDocument?.userCart
          ..paymentCartBackup = currentUserDocument?.userCart
          ..paymentCartCount = currentUserDocument?.userCart?.cartItems?.length
          ..orderId = _model.freeOrderDocument?.orderId,
      );
      while (FFAppState().PaymentFlow.paymentCartCount > 0) {
        if (FFAppState()
                .PaymentFlow
                .paymentCart
                .cartItems
                .elementAtOrNull(FFAppState().PaymentFlow.paymentCartCount - 1)
                ?.productType ==
            'product') {
          _model.freeCartProductResult = await queryProductsRecordOnce(
            queryBuilder: (productsRecord) => productsRecord.where(
              'product_id',
              isEqualTo: FFAppState()
                  .PaymentFlow
                  .paymentCart
                  .cartItems
                  .elementAtOrNull(
                      FFAppState().PaymentFlow.paymentCartCount - 1)
                  ?.productId,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);

          await _model.freeCartProductResult!.product.inventoryRef!.update({
            ...createInventoryRecordData(
              updatedAt: getCurrentTimestamp,
            ),
            ...mapToFirestore(
              {
                'stock_reserved': FieldValue.increment(FFAppState()
                    .PaymentFlow
                    .paymentCart
                    .cartItems
                    .elementAtOrNull(
                        FFAppState().PaymentFlow.paymentCartCount - 1)!
                    .quantity),
                'stock': FieldValue.increment(-(FFAppState()
                    .PaymentFlow
                    .paymentCart
                    .cartItems
                    .elementAtOrNull(
                        FFAppState().PaymentFlow.paymentCartCount - 1)!
                    .quantity)),
              },
            ),
          });

          await _model.freeCartProductResult!.reference
              .update(createProductsRecordData(
            updatedAt: getCurrentTimestamp,
            productMarketing: createMarketingStruct(
              fieldValues: {
                'product_sales_history': FieldValue.arrayUnion([
                  getProductSalesHistoryFirestoreData(
                    createProductSalesHistoryStruct(
                      createdAt: getCurrentTimestamp,
                      orderId: _model.freeOrderDocument?.orderId,
                      quantity: FFAppState()
                          .PaymentFlow
                          .paymentCart
                          .cartItems
                          .elementAtOrNull(
                              FFAppState().PaymentFlow.paymentCartCount - 1)
                          ?.quantity,
                      salesUserInfo: createSalesUserInfoStruct(
                        customerId: currentUserDocument?.userInfo?.userId,
                        customerRef: currentUserReference,
                        customerName: currentUserDisplayName,
                        email: currentUserEmail,
                        phoneNumber: currentUserDocument?.userInfo?.phoneNumber,
                        shippingAddress: updateUserShippingaddressStruct(
                          _model.freeOrderDocument?.shippingInfo,
                          clearUnsetFields: false,
                        ),
                        clearUnsetFields: false,
                      ),
                      clearUnsetFields: false,
                    ),
                    true,
                  )
                ]),
              },
              clearUnsetFields: false,
            ),
          ));
        }
        FFAppState().updatePaymentFlowStruct(
          (e) => e
            ..paymentCartCount = FFAppState().PaymentFlow.paymentCartCount - 1,
        );
      }

      await currentUserDocument!.userCart.couponInfo.couponRef!.update({
        ...mapToFirestore(
          {
            'coupon_used_user_list': FieldValue.arrayUnion([
              getCouponUserInfoFirestoreData(
                createCouponUserInfoStruct(
                  userEmail: currentUserEmail,
                  userName: currentUserDisplayName,
                  userPhone: currentPhoneNumber,
                  userImage: currentUserPhoto,
                  userId: currentUserUid,
                  userRole: valueOrDefault(currentUserDocument?.userRole, ''),
                  userOrderRef: _model.freeOrderDocument?.reference,
                  userOrderId: _model.freeOrderDocument?.orderId,
                  clearUnsetFields: false,
                ),
                true,
              )
            ]),
            'coupon_limit': FieldValue.increment(-(1)),
          },
        ),
      });

      await _model.idmapResult!.reference.update({
        ...mapToFirestore(
          {
            'order_id': FieldValue.increment(1),
          },
        ),
      });

      await currentUserReference!.update(createUsersRecordData(
        userCart: createUserCartStruct(
          updatedAt: getCurrentTimestamp,
          couponInfo: createCouponCartInfoStruct(delete: true),
          fieldValues: {
            'cart_items': FieldValue.delete(),
          },
          clearUnsetFields: false,
        ),
      ));

      context.goNamed(
        SuccessWidget.routeName,
        extra: <String, dynamic>{
          '__transition_info__': TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'freePayment',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).border,
                                borderRadius: 100.0,
                                buttonSize: 42.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    CartWidget.routeName,
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
                            ),
                          wrapWithModel(
                            model: _model.userInitialModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: UserInitialWidget(),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.orderCancelForBack =
                                      await queryOrdersRecordOnce(
                                    queryBuilder: (ordersRecord) =>
                                        ordersRecord.where(
                                      'order_id',
                                      isEqualTo:
                                          FFAppState().PaymentFlow.orderId,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  unawaited(
                                    () async {
                                      await _model.orderCancelForBack!.reference
                                          .update(createOrdersRecordData(
                                        orderStatus: 'CANCELLED',
                                      ));
                                    }(),
                                  );
                                  FFAppState().PaymentFlow =
                                      PaymentProcessingTimeStruct();

                                  context.goNamed(
                                    CartWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 75.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.chevron_left_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 26.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ywmc6gjf' /* back */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0.0,
                ),
              ),
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Lottie.asset(
                                          'assets/jsons/debit-card.json',
                                          width: 150.0,
                                          height: 150.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '1cq5tdoa' /* Order Confirming... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Cairo',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
