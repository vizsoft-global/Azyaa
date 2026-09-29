import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'payment_checker_model.dart';
export 'payment_checker_model.dart';

class PaymentCheckerWidget extends StatefulWidget {
  const PaymentCheckerWidget({super.key});

  @override
  State<PaymentCheckerWidget> createState() => _PaymentCheckerWidgetState();
}

class _PaymentCheckerWidgetState extends State<PaymentCheckerWidget> {
  late PaymentCheckerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentCheckerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 10000),
        callback: (timer) async {
          if (FFAppState().PaymentFlow.paymentProcessesStatus == 'initialize') {
            _model.paymentResponseResult = await queryPaymentResponseRecordOnce(
              queryBuilder: (paymentResponseRecord) =>
                  paymentResponseRecord.where(
                'order_id',
                isEqualTo: FFAppState().PaymentFlow.orderId,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            if ((_model.paymentResponseResult != null) == true) {
              _model.presentOrderResult = await queryOrdersRecordOnce(
                queryBuilder: (ordersRecord) => ordersRecord.where(
                  'order_id',
                  isEqualTo: FFAppState().PaymentFlow.orderId,
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if ((_model.paymentResponseResult?.status == 'CAPTURED') ||
                  (_model.paymentResponseResult?.status == 'Succss') ||
                  (_model.paymentResponseResult?.status == 'Paid') ||
                  (_model.paymentResponseResult?.status == 'SUCCESS')) {
                unawaited(
                  () async {
                    await _model.presentOrderResult!.reference
                        .update(createOrdersRecordData(
                      paymentId: _model.paymentResponseResult?.paymentId,
                      paymentMethod: _model.paymentResponseResult?.paymentType,
                      paymentType: _model.paymentResponseResult?.paymentType,
                    ));
                  }(),
                );
                if (FFAppState().PaymentFlow.paymentType == 'upayment') {
                  _model.upaymentApiResult =
                      await UpaymentGroup.statusCall.call(
                    trackId: _model.paymentResponseResult?.trackId,
                    aPIkey: FFAppState().PaymentFlow.secretKey,
                    url: FFAppState().PaymentFlow.paymentBaseUrl,
                  );

                  if ((_model.upaymentApiResult?.succeeded ?? true)) {
                    _model.instantTimer?.cancel();

                    await _model.presentOrderResult!.reference
                        .update(createOrdersRecordData(
                      orderStatus: _model.paymentResponseResult?.status,
                      paymentStatus: _model.paymentResponseResult?.status,
                      paymentId: UpaymentGroup.statusCall.paymentID(
                        (_model.upaymentApiResult?.jsonBody ?? ''),
                      ),
                      paymentMethod: UpaymentGroup.statusCall.paymentMETHOD(
                        (_model.upaymentApiResult?.jsonBody ?? ''),
                      ),
                      paymentType: UpaymentGroup.statusCall.paymentTYPE(
                        (_model.upaymentApiResult?.jsonBody ?? ''),
                      ),
                      updatedAt: getCurrentTimestamp,
                    ));
                    _model.updatedPresentOrderResult =
                        await queryOrdersRecordOnce(
                      queryBuilder: (ordersRecord) => ordersRecord.where(
                        'order_id',
                        isEqualTo: FFAppState().PaymentFlow.orderId,
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    _model.idMapResult = await queryIdMapRecordOnce(
                      queryBuilder: (idMapRecord) => idMapRecord.where(
                        'type',
                        isEqualTo: 'Main',
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    FFAppState().updatePaymentFlowStruct(
                      (e) => e
                        ..paymentCart =
                            _model.updatedPresentOrderResult?.orderItems
                        ..paymentCartBackup =
                            _model.updatedPresentOrderResult?.orderItems
                        ..paymentCartCount = _model.updatedPresentOrderResult
                            ?.orderItems.cartItems.length
                        ..paymentId = UpaymentGroup.statusCall.paymentID(
                          (_model.upaymentApiResult?.jsonBody ?? ''),
                        )
                        ..paymentMethod =
                            UpaymentGroup.statusCall.paymentMETHOD(
                          (_model.upaymentApiResult?.jsonBody ?? ''),
                        )
                        ..paymentMethodType =
                            UpaymentGroup.statusCall.paymentTYPE(
                          (_model.upaymentApiResult?.jsonBody ?? ''),
                        ),
                    );
                    while (FFAppState().PaymentFlow.paymentCartCount > 0) {
                      if (FFAppState()
                              .PaymentFlow
                              .paymentCart
                              .cartItems
                              .elementAtOrNull(
                                  FFAppState().PaymentFlow.paymentCartCount - 1)
                              ?.productType ==
                          'membership') {
                        if (currentUserDocument?.userMemberships.status ==
                            'active') {
                          unawaited(
                            () async {
                              await FFAppState()
                                  .PaymentFlow
                                  .presentUserRef!
                                  .update(createUsersRecordData(
                                    userMemberships:
                                        createUserMembershipsStruct(
                                      planId: int.parse(FFAppState()
                                          .PaymentFlow
                                          .paymentCart
                                          .cartItems
                                          .elementAtOrNull(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCartCount -
                                              1)!
                                          .productId),
                                      startDate: currentUserDocument!
                                                  .userMemberships.endDate! <=
                                              getCurrentTimestamp
                                          ? functions.getDateForSubscription(
                                              currentUserDocument!
                                                  .userMemberships.endDate!,
                                              1)
                                          : functions.presentDateFromZerotime(),
                                      endDate: functions.getDateForSubscription(
                                          currentUserDocument!.userMemberships
                                                      .endDate! <=
                                                  getCurrentTimestamp
                                              ? functions
                                                  .getDateForSubscription(
                                                      currentUserDocument!
                                                          .userMemberships
                                                          .endDate!,
                                                      1)
                                              : functions
                                                  .presentDateFromZerotime(),
                                          30),
                                      renewalDate:
                                          functions.getDateForSubscription(
                                              currentUserDocument!
                                                          .userMemberships
                                                          .endDate! <=
                                                      getCurrentTimestamp
                                                  ? functions
                                                      .getDateForSubscription(
                                                          currentUserDocument!
                                                              .userMemberships
                                                              .endDate!,
                                                          1)
                                                  : functions
                                                      .presentDateFromZerotime(),
                                              29),
                                      updatedAt: getCurrentTimestamp,
                                      fieldValues: {
                                        'order_history': FieldValue.arrayUnion([
                                          getUserMembershipsOrderHistoryFirestoreData(
                                            createUserMembershipsOrderHistoryStruct(
                                              orderId: FFAppState()
                                                  .PaymentFlow
                                                  .orderId,
                                              planId: int.parse(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCart
                                                  .cartItems
                                                  .elementAtOrNull(FFAppState()
                                                          .PaymentFlow
                                                          .paymentCartCount -
                                                      1)!
                                                  .productId),
                                              planName: FFAppState()
                                                  .PaymentFlow
                                                  .paymentCart
                                                  .cartItems
                                                  .elementAtOrNull(FFAppState()
                                                          .PaymentFlow
                                                          .paymentCartCount -
                                                      1)
                                                  ?.productInfo
                                                  .name,
                                              purchaseDate: getCurrentTimestamp,
                                              amountPaid: FFAppState()
                                                  .PaymentFlow
                                                  .paymentCart
                                                  .cartItems
                                                  .elementAtOrNull(FFAppState()
                                                          .PaymentFlow
                                                          .paymentCartCount -
                                                      1)
                                                  ?.totalPrice,
                                              currency: 'KWD',
                                              paymentMethod: UpaymentGroup
                                                  .statusCall
                                                  .paymentMETHOD(
                                                (_model.upaymentApiResult
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              paymentId: UpaymentGroup
                                                  .statusCall
                                                  .paymentID(
                                                (_model.upaymentApiResult
                                                        ?.jsonBody ??
                                                    ''),
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
                            }(),
                          );
                        } else {
                          unawaited(
                            () async {
                              await FFAppState()
                                  .PaymentFlow
                                  .presentUserRef!
                                  .update(createUsersRecordData(
                                    userMemberships:
                                        createUserMembershipsStruct(
                                      membershipId:
                                          _model.idMapResult?.membershipId,
                                      status: 'active',
                                      planId: int.parse(FFAppState()
                                          .PaymentFlow
                                          .paymentCart
                                          .cartItems
                                          .elementAtOrNull(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCartCount -
                                              1)!
                                          .productId),
                                      startDate:
                                          functions.presentDateFromZerotime(),
                                      endDate: functions.getDateForSubscription(
                                          functions.presentDateFromZerotime(),
                                          30),
                                      renewalDate:
                                          functions.getDateForSubscription(
                                              functions
                                                  .presentDateFromZerotime(),
                                              29),
                                      createdAt: getCurrentTimestamp,
                                      updatedAt: getCurrentTimestamp,
                                      fieldValues: {
                                        'order_history': FieldValue.arrayUnion([
                                          getUserMembershipsOrderHistoryFirestoreData(
                                            createUserMembershipsOrderHistoryStruct(
                                              orderId: FFAppState()
                                                  .PaymentFlow
                                                  .orderId,
                                              planId: int.parse(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCart
                                                  .cartItems
                                                  .elementAtOrNull(FFAppState()
                                                          .PaymentFlow
                                                          .paymentCartCount -
                                                      1)!
                                                  .productId),
                                              planName: FFAppState()
                                                  .PaymentFlow
                                                  .paymentCart
                                                  .cartItems
                                                  .elementAtOrNull(FFAppState()
                                                          .PaymentFlow
                                                          .paymentCartCount -
                                                      1)
                                                  ?.productInfo
                                                  .name,
                                              purchaseDate: getCurrentTimestamp,
                                              amountPaid: FFAppState()
                                                  .PaymentFlow
                                                  .paymentCart
                                                  .cartItems
                                                  .elementAtOrNull(FFAppState()
                                                          .PaymentFlow
                                                          .paymentCartCount -
                                                      1)
                                                  ?.totalPrice,
                                              currency: 'KWD',
                                              paymentMethod: UpaymentGroup
                                                  .statusCall
                                                  .paymentMETHOD(
                                                (_model.upaymentApiResult
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              paymentId: UpaymentGroup
                                                  .statusCall
                                                  .paymentID(
                                                (_model.upaymentApiResult
                                                        ?.jsonBody ??
                                                    ''),
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
                            }(),
                          );

                          await _model.idMapResult!.reference.update({
                            ...mapToFirestore(
                              {
                                'membership_id': FieldValue.increment(1),
                              },
                            ),
                          });
                        }
                      } else {
                        if (FFAppState()
                                .PaymentFlow
                                .paymentCart
                                .cartItems
                                .elementAtOrNull(
                                    FFAppState().PaymentFlow.paymentCartCount -
                                        1)
                                ?.productType ==
                            'virtualtryon') {
                          await currentUserReference!
                              .update(createUsersRecordData(
                            userVto: createUserVirtualtryonStruct(
                              updatedAt: getCurrentTimestamp,
                              fieldValues: {
                                'user_vto_credit_points': FieldValue.increment(
                                    FFAppState()
                                        .PaymentFlow
                                        .paymentCart
                                        .cartItems
                                        .elementAtOrNull(FFAppState()
                                                .PaymentFlow
                                                .paymentCartCount -
                                            1)!
                                        .vtoPoint
                                        .vtoPoint),
                                'user_vto_history': FieldValue.arrayUnion([
                                  _model.updatedPresentOrderResult?.orderId
                                ]),
                              },
                              clearUnsetFields: false,
                            ),
                          ));
                        } else {
                          if (FFAppState()
                                  .PaymentFlow
                                  .paymentCart
                                  .cartItems
                                  .elementAtOrNull(FFAppState()
                                          .PaymentFlow
                                          .paymentCartCount -
                                      1)
                                  ?.productType ==
                              'product') {
                            _model.upayCartProductResult =
                                await queryProductsRecordOnce(
                              queryBuilder: (productsRecord) =>
                                  productsRecord.where(
                                'product_id',
                                isEqualTo: FFAppState()
                                    .PaymentFlow
                                    .paymentCart
                                    .cartItems
                                    .elementAtOrNull(FFAppState()
                                            .PaymentFlow
                                            .paymentCartCount -
                                        1)
                                    ?.productId,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (FFAppState()
                                    .PaymentFlow
                                    .paymentCart
                                    .cartItems
                                    .elementAtOrNull(FFAppState()
                                            .PaymentFlow
                                            .paymentCartCount -
                                        1)
                                    ?.productMainType ==
                                'ready') {
                              await _model
                                  .upayCartProductResult!.product.inventoryRef!
                                  .update({
                                ...createInventoryRecordData(
                                  updatedAt: getCurrentTimestamp,
                                ),
                                ...mapToFirestore(
                                  {
                                    'stock_reserved': FieldValue.increment(
                                        FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)!
                                            .quantity),
                                    'stock': FieldValue.increment(-(FFAppState()
                                        .PaymentFlow
                                        .paymentCart
                                        .cartItems
                                        .elementAtOrNull(FFAppState()
                                                .PaymentFlow
                                                .paymentCartCount -
                                            1)!
                                        .quantity)),
                                  },
                                ),
                              });
                            }
                            _model.upaymentdesignerSalesDoc =
                                await querySalesHistoryRecordOnce(
                              queryBuilder: (salesHistoryRecord) =>
                                  salesHistoryRecord.where(
                                'user_ref',
                                isEqualTo: FFAppState()
                                    .PaymentFlow
                                    .paymentCart
                                    .cartItems
                                    .elementAtOrNull(FFAppState()
                                            .PaymentFlow
                                            .paymentCartCount -
                                        1)
                                    ?.productDesignerRef,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            await _model.upaymentdesignerSalesDoc!.reference
                                .update({
                              ...createSalesHistoryRecordData(
                                updatedAt: getCurrentTimestamp,
                              ),
                              ...mapToFirestore(
                                {
                                  'sale_history': FieldValue.arrayUnion([
                                    getSaleInfoFirestoreData(
                                      createSaleInfoStruct(
                                        saleDate: getCurrentTimestamp,
                                        saleQuantity: FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)
                                            ?.quantity,
                                        saleProductId: FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)
                                            ?.productId,
                                        saleProductRef: FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)
                                            ?.productRef,
                                        salePayoutStatus: false,
                                        saleWaitingPeriod: false,
                                        saleOrderStatus: 'pending',
                                        saleOrderId:
                                            _model.presentOrderResult?.orderId,
                                        clearUnsetFields: false,
                                      ),
                                      true,
                                    )
                                  ]),
                                },
                              ),
                            });
                            if ((FFAppState()
                                        .PaymentFlow
                                        .paymentCart
                                        .cartItems
                                        .elementAtOrNull(FFAppState()
                                                .PaymentFlow
                                                .paymentCartCount -
                                            1)
                                        ?.creatorRef !=
                                    null) &&
                                (FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)
                                            ?.promotionId !=
                                        null &&
                                    FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)
                                            ?.promotionId !=
                                        '')) {
                              _model.upaymentcreatorSalesDoc =
                                  await querySalesHistoryRecordOnce(
                                queryBuilder: (salesHistoryRecord) =>
                                    salesHistoryRecord.where(
                                  'user_ref',
                                  isEqualTo: FFAppState()
                                      .PaymentFlow
                                      .paymentCart
                                      .cartItems
                                      .elementAtOrNull(FFAppState()
                                              .PaymentFlow
                                              .paymentCartCount -
                                          1)
                                      ?.creatorRef,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.upaymentcreatorSalesDoc!.reference
                                  .update({
                                ...createSalesHistoryRecordData(
                                  updatedAt: getCurrentTimestamp,
                                ),
                                ...mapToFirestore(
                                  {
                                    'sale_history': FieldValue.arrayUnion([
                                      getSaleInfoFirestoreData(
                                        createSaleInfoStruct(
                                          saleDate: getCurrentTimestamp,
                                          saleQuantity: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.quantity,
                                          saleProductId: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.productId,
                                          saleProductRef: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.productRef,
                                          salePayoutStatus: false,
                                          saleWaitingPeriod: false,
                                          saleOrderStatus: 'pending',
                                          salePromotionId: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.promotionId,
                                          saleOrderId: _model
                                              .presentOrderResult?.orderId,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            }

                            await _model.upayCartProductResult!.reference
                                .update(createProductsRecordData(
                              updatedAt: getCurrentTimestamp,
                              productMarketing: createMarketingStruct(
                                fieldValues: {
                                  'product_sales_history':
                                      FieldValue.arrayUnion([
                                    getProductSalesHistoryFirestoreData(
                                      createProductSalesHistoryStruct(
                                        createdAt: getCurrentTimestamp,
                                        orderId:
                                            _model.presentOrderResult?.orderId,
                                        quantity: FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)
                                            ?.quantity,
                                        salesUserInfo:
                                            createSalesUserInfoStruct(
                                          customerId: currentUserDocument
                                              ?.userInfo.userId,
                                          customerRef: currentUserReference,
                                          customerName: currentUserDisplayName,
                                          email: currentUserEmail,
                                          phoneNumber: currentUserDocument
                                              ?.userInfo.phoneNumber,
                                          shippingAddress:
                                              updateUserShippingaddressStruct(
                                            _model.presentOrderResult
                                                ?.shippingInfo,
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
                            if (_model.upayCartProductResult?.product
                                    .productType ==
                                'custom') {
                              _model.notiificationIdmap3 =
                                  await queryIdMapRecordOnce(
                                queryBuilder: (idMapRecord) =>
                                    idMapRecord.where(
                                  'type',
                                  isEqualTo: 'Main',
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await NotificationRecord.collection
                                  .doc()
                                  .set(createNotificationRecordData(
                                    createdAt: getCurrentTimestamp,
                                    notificationId: _model
                                        .notiificationIdmap3?.notificationId
                                        .toString(),
                                    updatedAt: getCurrentTimestamp,
                                    notificationType: 'customorder',
                                    messageType: 'CUSTOM ORDER PLACED',
                                    message:
                                        'Order for Custom Product ${_model.upayCartProductResult?.productId} || ${_model.upayCartProductResult?.productInfo.name} is placed Order ID : ${_model.presentOrderResult?.orderId}',
                                    toUserRef: _model.upayCartProductResult
                                        ?.productAuthorizer.productDesignerRef,
                                    sentFrom: 'system',
                                    markAsRead: false,
                                  ));

                              await _model.notiificationIdmap3!.reference
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'notification_id': FieldValue.increment(1),
                                  },
                                ),
                              });
                            }
                          }
                        }
                      }

                      FFAppState().updatePaymentFlowStruct(
                        (e) => e
                          ..paymentCartCount =
                              FFAppState().PaymentFlow.paymentCartCount - 1,
                      );
                    }
                    if (currentUserDocument?.userCart.couponInfo.couponId !=
                            null &&
                        currentUserDocument?.userCart.couponInfo.couponId !=
                            '') {
                      await currentUserDocument!.userCart.couponInfo.couponRef!
                          .update({
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
                                  userRole: valueOrDefault(
                                      currentUserDocument?.userRole, ''),
                                  userOrderRef:
                                      _model.presentOrderResult?.reference,
                                  userOrderId:
                                      _model.presentOrderResult?.orderId,
                                  clearUnsetFields: false,
                                ),
                                true,
                              )
                            ]),
                            'coupon_limit': FieldValue.increment(-(1)),
                          },
                        ),
                      });

                      await FFAppState()
                          .PaymentFlow
                          .presentUserRef!
                          .update(createUsersRecordData(
                            userCart: createUserCartStruct(
                              updatedAt: getCurrentTimestamp,
                              couponInfo:
                                  createCouponCartInfoStruct(delete: true),
                              fieldValues: {
                                'cart_items': FieldValue.delete(),
                              },
                              clearUnsetFields: false,
                            ),
                          ));
                    } else {
                      await FFAppState()
                          .PaymentFlow
                          .presentUserRef!
                          .update(createUsersRecordData(
                            userCart: createUserCartStruct(
                              updatedAt: getCurrentTimestamp,
                              fieldValues: {
                                'cart_items': FieldValue.delete(),
                              },
                              clearUnsetFields: false,
                            ),
                          ));
                    }

                    _model.count = _model
                        .presentOrderResult?.orderItems.cartItems.length;
                    while (_model.count! > 0) {
                      _model.cartAttCount = (_model
                              .presentOrderResult?.orderItems.cartItems
                              .elementAtOrNull((_model.count!) - 1))
                          ?.cartItemAttribute
                          .length;
                      safeSetState(() {});
                      while (_model.cartAttCount! > 0) {
                        _model.brandCartResult = await queryBrandsRecordOnce(
                          queryBuilder: (brandsRecord) => brandsRecord.where(
                            'brand_id',
                            isEqualTo: ((_model.presentOrderResult?.orderItems
                                        .cartItems
                                        .elementAtOrNull((_model.count!) - 1))
                                    ?.cartItemAttribute
                                    .elementAtOrNull(
                                        (_model.cartAttCount!) - 1))
                                ?.attributesDefaultTermId,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        _model.attributeCartResult =
                            await queryAttributesRecordOnce(
                          queryBuilder: (attributesRecord) =>
                              attributesRecord.where(
                            'attribute_id',
                            isEqualTo: ((_model.presentOrderResult?.orderItems
                                        .cartItems
                                        .elementAtOrNull((_model.count!) - 1))
                                    ?.cartItemAttribute
                                    .elementAtOrNull(
                                        (_model.cartAttCount!) - 1))
                                ?.attributesId,
                          ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.attributeCartResult?.attributeId == '1001') {
                          _model.colorName =
                              _model.brandCartResult?.brandInfo.name;
                          safeSetState(() {});
                        } else {
                          _model.sizeName =
                              _model.brandCartResult?.brandInfo.name;
                          safeSetState(() {});
                        }

                        _model.cartAttCount = _model.cartAttCount! + -1;
                        safeSetState(() {});
                      }
                      _model.addToItems(EmailProductDataStruct(
                        productName: (_model
                                .presentOrderResult?.orderItems.cartItems
                                .elementAtOrNull((_model.count!) - 1))
                            ?.productInfo
                            .name,
                        productQty: (_model
                                .presentOrderResult?.orderItems.cartItems
                                .elementAtOrNull((_model.count!) - 1))
                            ?.quantity
                            .toString(),
                        productPrice: (_model
                                .presentOrderResult?.orderItems.cartItems
                                .elementAtOrNull((_model.count!) - 1))
                            ?.totalPrice
                            .toString(),
                        productSize: _model.sizeName,
                        productColor: _model.colorName,
                        productImage: (_model
                                .presentOrderResult?.orderItems.cartItems
                                .elementAtOrNull((_model.count!) - 1))
                            ?.productInfo
                            .featureImage,
                      ));
                      safeSetState(() {});
                      _model.count = _model.count! + -1;
                      safeSetState(() {});
                    }

                    await MailRecord.collection.doc().set(createMailRecordData(
                          createdAt: getCurrentTimestamp,
                          to: currentUserEmail,
                          template: createMailInfoStruct(
                            name: 'Order_summary',
                            data: createMailDataStruct(
                              name: currentUserDisplayName,
                              orderId: _model.presentOrderResult?.orderId,
                              storeName: 'Azyaa',
                              orderTime: _model
                                  .presentOrderResult?.orderItems.createdAt
                                  ?.toString(),
                              storeAddress: 'Azyaa',
                              paymentMethod:
                                  _model.presentOrderResult?.paymentMethod,
                              total: _model.presentOrderResult?.totalPrice
                                  .toString(),
                              subtotal: _model.presentOrderResult?.totalPrice
                                  .toString(),
                              deliveryCharge: _model
                                  .presentOrderResult?.shippingPrice
                                  .toString(),
                              couponSave: _model.presentOrderResult?.orderItems
                                  .couponInfo.couponDiscountedPrice
                                  .toString(),
                              supportPhone: '+965 65690900',
                              supportEmail: 'info@azyaa.ai',
                              email: currentUserEmail,
                              fieldValues: {
                                'purchased_items':
                                    getEmailProductDataListFirestoreData(
                                  _model.items,
                                ),
                              },
                              clearUnsetFields: false,
                              create: true,
                            ),
                            clearUnsetFields: false,
                            create: true,
                          ),
                        ));
                    if ((currentUserDocument?.userBody.toList() ?? [])
                            .where((e) => e.isDefault == true)
                            .toList()
                            .length >
                        0) {
                      FFAppState().updateUserDataFlowStruct(
                        (e) => e
                          ..userSelectedBody =
                              (currentUserDocument?.userBody.toList() ?? [])
                                  .where((e) => e.isDefault == true)
                                  .toList()
                                  .firstOrNull,
                      );
                    }

                    context.goNamed(
                      SuccessWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  } else {
                    _model.instantTimer?.cancel();

                    await _model.presentOrderResult!.reference
                        .update(createOrdersRecordData(
                      orderStatus: _model.paymentResponseResult?.status,
                      paymentStatus: _model.paymentResponseResult?.status,
                    ));
                    FFAppState().PaymentFlow = PaymentProcessingTimeStruct();
                    FFAppState().updatePaymentFlowStruct(
                      (e) => e..paymentProcessesStatus = 'DONE',
                    );

                    context.goNamed(
                      FailedWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );

                    return;
                  }
                } else {
                  if (FFAppState().PaymentFlow.paymentType == 'tap') {
                    _model.tappaymentApiResult =
                        await TapGroup.statusAPICall.call(
                      chargeid: FFAppState().PaymentFlow.paymentId,
                      secreatKey: FFAppState().PaymentFlow.secretKey,
                      url: isWeb == true
                          ? 'https://proxy.vizsoft.in/https://api.tap.company/'
                          : 'https://api.tap.company/',
                    );

                    if ((_model.tappaymentApiResult?.succeeded ?? true)) {
                      _model.instantTimer?.cancel();

                      await _model.presentOrderResult!.reference
                          .update(createOrdersRecordData(
                        orderStatus: _model.paymentResponseResult?.status,
                        paymentStatus: _model.paymentResponseResult?.status,
                        paymentId: TapGroup.statusAPICall.chargeId(
                          (_model.tappaymentApiResult?.jsonBody ?? ''),
                        ),
                        paymentMethod: TapGroup.statusAPICall.paymentMethod(
                          (_model.tappaymentApiResult?.jsonBody ?? ''),
                        ),
                        paymentType: TapGroup.statusAPICall.paymentType(
                          (_model.tappaymentApiResult?.jsonBody ?? ''),
                        ),
                        updatedAt: getCurrentTimestamp,
                      ));
                      _model.tapUpdatedPresentOrderResult =
                          await queryOrdersRecordOnce(
                        queryBuilder: (ordersRecord) => ordersRecord.where(
                          'order_id',
                          isEqualTo: FFAppState().PaymentFlow.orderId,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _model.tapIdMapResult = await queryIdMapRecordOnce(
                        queryBuilder: (idMapRecord) => idMapRecord.where(
                          'type',
                          isEqualTo: 'Main',
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      FFAppState().updatePaymentFlowStruct(
                        (e) => e
                          ..paymentCart =
                              _model.tapUpdatedPresentOrderResult?.orderItems
                          ..paymentCartBackup =
                              _model.tapUpdatedPresentOrderResult?.orderItems
                          ..paymentCartCount = _model
                              .tapUpdatedPresentOrderResult
                              ?.orderItems
                              .cartItems
                              .length
                          ..paymentId = TapGroup.statusAPICall.chargeId(
                            (_model.tappaymentApiResult?.jsonBody ?? ''),
                          )
                          ..paymentMethod =
                              TapGroup.statusAPICall.paymentMethod(
                            (_model.tappaymentApiResult?.jsonBody ?? ''),
                          )
                          ..paymentMethodType =
                              TapGroup.statusAPICall.paymentType(
                            (_model.tappaymentApiResult?.jsonBody ?? ''),
                          ),
                      );
                      while (FFAppState().PaymentFlow.paymentCartCount > 0) {
                        if (FFAppState()
                                .PaymentFlow
                                .paymentCart
                                .cartItems
                                .elementAtOrNull(
                                    FFAppState().PaymentFlow.paymentCartCount -
                                        1)
                                ?.productType ==
                            'membership') {
                          if (currentUserDocument?.userMemberships.status ==
                              'active') {
                            unawaited(
                              () async {
                                await FFAppState()
                                    .PaymentFlow
                                    .presentUserRef!
                                    .update(createUsersRecordData(
                                      userMemberships:
                                          createUserMembershipsStruct(
                                        planId: int.parse(FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)!
                                            .productId),
                                        startDate: currentUserDocument!
                                                    .userMemberships.endDate! <=
                                                getCurrentTimestamp
                                            ? functions.getDateForSubscription(
                                                currentUserDocument!
                                                    .userMemberships.endDate!,
                                                1)
                                            : functions
                                                .presentDateFromZerotime(),
                                        endDate: functions.getDateForSubscription(
                                            currentUserDocument!.userMemberships
                                                        .endDate! <=
                                                    getCurrentTimestamp
                                                ? functions
                                                    .getDateForSubscription(
                                                        currentUserDocument!
                                                            .userMemberships
                                                            .endDate!,
                                                        1)
                                                : functions
                                                    .presentDateFromZerotime(),
                                            30),
                                        renewalDate:
                                            functions.getDateForSubscription(
                                                currentUserDocument!
                                                            .userMemberships
                                                            .endDate! <=
                                                        getCurrentTimestamp
                                                    ? functions
                                                        .getDateForSubscription(
                                                            currentUserDocument!
                                                                .userMemberships
                                                                .endDate!,
                                                            1)
                                                    : functions
                                                        .presentDateFromZerotime(),
                                                29),
                                        updatedAt: getCurrentTimestamp,
                                        fieldValues: {
                                          'order_history':
                                              FieldValue.arrayUnion([
                                            getUserMembershipsOrderHistoryFirestoreData(
                                              createUserMembershipsOrderHistoryStruct(
                                                orderId: FFAppState()
                                                    .PaymentFlow
                                                    .orderId,
                                                planId: int.parse(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)!
                                                    .productId),
                                                planName: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.productInfo
                                                    .name,
                                                purchaseDate:
                                                    getCurrentTimestamp,
                                                amountPaid: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.totalPrice,
                                                currency: 'KWD',
                                                paymentMethod: TapGroup
                                                    .statusAPICall
                                                    .paymentMethod(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                paymentId: TapGroup
                                                    .statusAPICall
                                                    .chargeId(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
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
                              }(),
                            );
                          } else {
                            unawaited(
                              () async {
                                await FFAppState()
                                    .PaymentFlow
                                    .presentUserRef!
                                    .update(createUsersRecordData(
                                      userMemberships:
                                          createUserMembershipsStruct(
                                        membershipId: _model
                                            .tapIdMapResult?.measurementId,
                                        status: 'active',
                                        planId: int.parse(FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)!
                                            .productId),
                                        startDate:
                                            functions.presentDateFromZerotime(),
                                        endDate:
                                            functions.getDateForSubscription(
                                                functions
                                                    .presentDateFromZerotime(),
                                                30),
                                        renewalDate:
                                            functions.getDateForSubscription(
                                                functions
                                                    .presentDateFromZerotime(),
                                                29),
                                        createdAt: getCurrentTimestamp,
                                        updatedAt: getCurrentTimestamp,
                                        fieldValues: {
                                          'order_history':
                                              FieldValue.arrayUnion([
                                            getUserMembershipsOrderHistoryFirestoreData(
                                              createUserMembershipsOrderHistoryStruct(
                                                orderId: FFAppState()
                                                    .PaymentFlow
                                                    .orderId,
                                                planId: int.parse(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)!
                                                    .productId),
                                                planName: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.productInfo
                                                    .name,
                                                purchaseDate:
                                                    getCurrentTimestamp,
                                                amountPaid: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.totalPrice,
                                                currency: 'KWD',
                                                paymentMethod: TapGroup
                                                    .statusAPICall
                                                    .paymentMethod(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                paymentId: TapGroup
                                                    .statusAPICall
                                                    .chargeId(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
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
                              }(),
                            );

                            await _model.tapIdMapResult!.reference.update({
                              ...mapToFirestore(
                                {
                                  'membership_id': FieldValue.increment(1),
                                },
                              ),
                            });
                          }
                        } else {
                          if (FFAppState()
                                  .PaymentFlow
                                  .paymentCart
                                  .cartItems
                                  .elementAtOrNull(FFAppState()
                                          .PaymentFlow
                                          .paymentCartCount -
                                      1)
                                  ?.productType ==
                              'virtualtryon') {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              userVto: createUserVirtualtryonStruct(
                                updatedAt: getCurrentTimestamp,
                                fieldValues: {
                                  'user_vto_credit_points':
                                      FieldValue.increment(FFAppState()
                                          .PaymentFlow
                                          .paymentCart
                                          .cartItems
                                          .elementAtOrNull(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCartCount -
                                              1)!
                                          .vtoPoint
                                          .vtoPoint),
                                  'user_vto_history': FieldValue.arrayUnion([
                                    _model.tapUpdatedPresentOrderResult?.orderId
                                  ]),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                          } else {
                            if (FFAppState()
                                    .PaymentFlow
                                    .paymentCart
                                    .cartItems
                                    .elementAtOrNull(FFAppState()
                                            .PaymentFlow
                                            .paymentCartCount -
                                        1)
                                    ?.productType ==
                                'product') {
                              _model.tapCartProductResult =
                                  await queryProductsRecordOnce(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'product_id',
                                  isEqualTo: FFAppState()
                                      .PaymentFlow
                                      .paymentCart
                                      .cartItems
                                      .elementAtOrNull(FFAppState()
                                              .PaymentFlow
                                              .paymentCartCount -
                                          1)
                                      ?.productId,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (FFAppState()
                                      .PaymentFlow
                                      .paymentCart
                                      .cartItems
                                      .elementAtOrNull(FFAppState()
                                              .PaymentFlow
                                              .paymentCartCount -
                                          1)
                                      ?.productMainType ==
                                  'ready') {
                                await _model
                                    .tapCartProductResult!.product.inventoryRef!
                                    .update({
                                  ...createInventoryRecordData(
                                    updatedAt: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'stock_reserved': FieldValue.increment(
                                          FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)!
                                              .quantity),
                                      'stock': FieldValue.increment(
                                          -(FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)!
                                              .quantity)),
                                    },
                                  ),
                                });
                              }
                              _model.tapdesignerSalesDoc =
                                  await querySalesHistoryRecordOnce(
                                queryBuilder: (salesHistoryRecord) =>
                                    salesHistoryRecord.where(
                                  'user_ref',
                                  isEqualTo: FFAppState()
                                      .PaymentFlow
                                      .paymentCart
                                      .cartItems
                                      .elementAtOrNull(FFAppState()
                                              .PaymentFlow
                                              .paymentCartCount -
                                          1)
                                      ?.productDesignerRef,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.tapdesignerSalesDoc!.reference
                                  .update({
                                ...createSalesHistoryRecordData(
                                  updatedAt: getCurrentTimestamp,
                                ),
                                ...mapToFirestore(
                                  {
                                    'sale_history': FieldValue.arrayUnion([
                                      getSaleInfoFirestoreData(
                                        createSaleInfoStruct(
                                          saleDate: getCurrentTimestamp,
                                          saleQuantity: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.quantity,
                                          saleProductId: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.productId,
                                          saleProductRef: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.productRef,
                                          salePayoutStatus: false,
                                          saleWaitingPeriod: false,
                                          saleOrderStatus: 'pending',
                                          saleOrderId: _model
                                              .presentOrderResult?.orderId,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                              if ((FFAppState()
                                          .PaymentFlow
                                          .paymentCart
                                          .cartItems
                                          .elementAtOrNull(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCartCount -
                                              1)
                                          ?.creatorRef !=
                                      null) &&
                                  (FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.promotionId !=
                                          null &&
                                      FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.promotionId !=
                                          '')) {
                                _model.tapcreatorSalesDoc =
                                    await querySalesHistoryRecordOnce(
                                  queryBuilder: (salesHistoryRecord) =>
                                      salesHistoryRecord.where(
                                    'user_ref',
                                    isEqualTo: FFAppState()
                                        .PaymentFlow
                                        .paymentCart
                                        .cartItems
                                        .elementAtOrNull(FFAppState()
                                                .PaymentFlow
                                                .paymentCartCount -
                                            1)
                                        ?.creatorRef,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                await _model.tapcreatorSalesDoc!.reference
                                    .update({
                                  ...createSalesHistoryRecordData(
                                    updatedAt: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'sale_history': FieldValue.arrayUnion([
                                        getSaleInfoFirestoreData(
                                          createSaleInfoStruct(
                                            saleDate: getCurrentTimestamp,
                                            saleQuantity: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.quantity,
                                            saleProductId: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.productId,
                                            saleProductRef: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.productRef,
                                            salePayoutStatus: false,
                                            saleWaitingPeriod: false,
                                            saleOrderStatus: 'pending',
                                            salePromotionId: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.promotionId,
                                            saleOrderId: _model
                                                .presentOrderResult?.orderId,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                              }

                              await _model.tapCartProductResult!.reference
                                  .update(createProductsRecordData(
                                updatedAt: getCurrentTimestamp,
                                productMarketing: createMarketingStruct(
                                  fieldValues: {
                                    'product_sales_history':
                                        FieldValue.arrayUnion([
                                      getProductSalesHistoryFirestoreData(
                                        createProductSalesHistoryStruct(
                                          createdAt: getCurrentTimestamp,
                                          orderId: _model
                                              .presentOrderResult?.orderId,
                                          quantity: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.quantity,
                                          salesUserInfo:
                                              createSalesUserInfoStruct(
                                            customerId: currentUserDocument
                                                ?.userInfo.userId,
                                            customerRef: currentUserReference,
                                            customerName:
                                                currentUserDisplayName,
                                            email: currentUserEmail,
                                            phoneNumber: currentUserDocument
                                                ?.userInfo.phoneNumber,
                                            shippingAddress:
                                                updateUserShippingaddressStruct(
                                              _model.presentOrderResult
                                                  ?.shippingInfo,
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
                              if (_model.tapCartProductResult?.product
                                      .productType ==
                                  'custom') {
                                _model.notiificationIdmap2 =
                                    await queryIdMapRecordOnce(
                                  queryBuilder: (idMapRecord) =>
                                      idMapRecord.where(
                                    'type',
                                    isEqualTo: 'Main',
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                await NotificationRecord.collection
                                    .doc()
                                    .set(createNotificationRecordData(
                                      createdAt: getCurrentTimestamp,
                                      notificationId: _model
                                          .notiificationIdmap2?.notificationId
                                          .toString(),
                                      updatedAt: getCurrentTimestamp,
                                      notificationType: 'customorder',
                                      messageType: 'CUSTOM ORDER PLACED',
                                      message:
                                          'Order for Custom Product ${_model.tapCartProductResult?.productId} || ${_model.tapCartProductResult?.productInfo.name} is placed Order ID : ${_model.presentOrderResult?.orderId}',
                                      toUserRef: _model
                                          .tapCartProductResult
                                          ?.productAuthorizer
                                          .productDesignerRef,
                                      sentFrom: 'system',
                                      markAsRead: false,
                                    ));

                                await _model.notiificationIdmap2!.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'notification_id':
                                          FieldValue.increment(1),
                                    },
                                  ),
                                });
                              }
                            }
                          }
                        }

                        FFAppState().updatePaymentFlowStruct(
                          (e) => e
                            ..paymentCartCount =
                                FFAppState().PaymentFlow.paymentCartCount - 1,
                        );
                      }
                      if (currentUserDocument?.userCart.couponInfo.couponId !=
                              null &&
                          currentUserDocument?.userCart.couponInfo.couponId !=
                              '') {
                        await currentUserDocument!
                            .userCart.couponInfo.couponRef!
                            .update({
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
                                    userRole: valueOrDefault(
                                        currentUserDocument?.userRole, ''),
                                    userOrderRef:
                                        _model.presentOrderResult?.reference,
                                    userOrderId:
                                        _model.presentOrderResult?.orderId,
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                              'coupon_limit': FieldValue.increment(-(1)),
                            },
                          ),
                        });

                        await FFAppState()
                            .PaymentFlow
                            .presentUserRef!
                            .update(createUsersRecordData(
                              userCart: createUserCartStruct(
                                updatedAt: getCurrentTimestamp,
                                couponInfo:
                                    createCouponCartInfoStruct(delete: true),
                                fieldValues: {
                                  'cart_items': FieldValue.delete(),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                      } else {
                        await FFAppState()
                            .PaymentFlow
                            .presentUserRef!
                            .update(createUsersRecordData(
                              userCart: createUserCartStruct(
                                updatedAt: getCurrentTimestamp,
                                fieldValues: {
                                  'cart_items': FieldValue.delete(),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                      }

                      _model.count = _model
                          .presentOrderResult?.orderItems.cartItems.length;
                      while (_model.count! > 0) {
                        _model.cartAttCount = (_model
                                .presentOrderResult?.orderItems.cartItems
                                .elementAtOrNull((_model.count!) - 1))
                            ?.cartItemAttribute
                            .length;
                        safeSetState(() {});
                        while (_model.cartAttCount! > 0) {
                          _model.brandCartResult1 = await queryBrandsRecordOnce(
                            queryBuilder: (brandsRecord) => brandsRecord.where(
                              'brand_id',
                              isEqualTo: ((_model.presentOrderResult?.orderItems
                                          .cartItems
                                          .elementAtOrNull(
                                              (_model.count!) - 1))
                                      ?.cartItemAttribute
                                      .elementAtOrNull(
                                          (_model.cartAttCount!) - 1))
                                  ?.attributesDefaultTermId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.attributeCartResult1 =
                              await queryAttributesRecordOnce(
                            queryBuilder: (attributesRecord) =>
                                attributesRecord.where(
                              'attribute_id',
                              isEqualTo: ((_model.presentOrderResult?.orderItems
                                          .cartItems
                                          .elementAtOrNull(
                                              (_model.count!) - 1))
                                      ?.cartItemAttribute
                                      .elementAtOrNull(
                                          (_model.cartAttCount!) - 1))
                                  ?.attributesId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if (_model.attributeCartResult1?.attributeId ==
                              '1001') {
                            _model.colorName =
                                _model.brandCartResult1?.brandInfo.name;
                            safeSetState(() {});
                          } else {
                            _model.sizeName =
                                _model.brandCartResult1?.brandInfo.name;
                            safeSetState(() {});
                          }

                          _model.cartAttCount = _model.cartAttCount! + -1;
                          safeSetState(() {});
                        }
                        _model.addToItems(EmailProductDataStruct(
                          productName: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.productInfo
                              .name,
                          productQty: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.quantity
                              .toString(),
                          productPrice: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.totalPrice
                              .toString(),
                          productSize: _model.sizeName,
                          productColor: _model.colorName,
                          productImage: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.productInfo
                              .featureImage,
                        ));
                        safeSetState(() {});
                        _model.count = _model.count! + -1;
                        safeSetState(() {});
                      }

                      await MailRecord.collection
                          .doc()
                          .set(createMailRecordData(
                            createdAt: getCurrentTimestamp,
                            to: currentUserEmail,
                            template: createMailInfoStruct(
                              name: 'Order_summary',
                              data: createMailDataStruct(
                                name: currentUserDisplayName,
                                orderId: _model.presentOrderResult?.orderId,
                                storeName: 'Azyaa',
                                orderTime: _model
                                    .presentOrderResult?.orderItems.createdAt
                                    ?.toString(),
                                storeAddress: 'Azyaa',
                                paymentMethod:
                                    _model.presentOrderResult?.paymentMethod,
                                total: _model.presentOrderResult?.totalPrice
                                    .toString(),
                                subtotal: _model.presentOrderResult?.totalPrice
                                    .toString(),
                                deliveryCharge: _model
                                    .presentOrderResult?.shippingPrice
                                    .toString(),
                                couponSave: _model
                                    .presentOrderResult
                                    ?.orderItems
                                    .couponInfo
                                    .couponDiscountedPrice
                                    .toString(),
                                supportPhone: '+965 65690900',
                                supportEmail: 'info@azyaa.ai',
                                fieldValues: {
                                  'purchased_items':
                                      getEmailProductDataListFirestoreData(
                                    _model.items,
                                  ),
                                },
                                clearUnsetFields: false,
                                create: true,
                              ),
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ));
                      if ((currentUserDocument?.userBody.toList() ?? [])
                              .where((e) => e.isDefault == true)
                              .toList()
                              .length >
                          0) {
                        FFAppState().updateUserDataFlowStruct(
                          (e) => e
                            ..userSelectedBody =
                                (currentUserDocument?.userBody.toList() ?? [])
                                    .where((e) => e.isDefault == true)
                                    .toList()
                                    .firstOrNull,
                        );
                      }

                      context.goNamed(
                        SuccessWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      _model.instantTimer?.cancel();

                      await _model.presentOrderResult!.reference
                          .update(createOrdersRecordData(
                        orderStatus: _model.paymentResponseResult?.status,
                        paymentStatus: _model.paymentResponseResult?.status,
                      ));
                      FFAppState().PaymentFlow = PaymentProcessingTimeStruct();
                      FFAppState().updatePaymentFlowStruct(
                        (e) => e..paymentProcessesStatus = 'DONE',
                      );

                      context.goNamed(FailedWidget.routeName);

                      return;
                    }
                  } else {
                    _model.myfatoorahpaymentApiResult =
                        await MyfatoorahGroup.invoiceStatusCall.call(
                      url: valueOrDefault<String>(
                        FFAppState().PaymentFlow.paymentBaseUrl,
                        'apitest',
                      ),
                      token: valueOrDefault<String>(
                        FFAppState().PaymentFlow.secretKey,
                        'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
                      ),
                      invoiceId: FFAppState().PaymentFlow.paymentId,
                    );

                    if ((_model.myfatoorahpaymentApiResult?.succeeded ??
                        true)) {
                      _model.instantTimer?.cancel();

                      await _model.presentOrderResult!.reference
                          .update(createOrdersRecordData(
                        orderStatus: _model.paymentResponseResult?.status,
                        paymentStatus: _model.paymentResponseResult?.status,
                        paymentId: MyfatoorahGroup.invoiceStatusCall.paymentID(
                          (_model.myfatoorahpaymentApiResult?.jsonBody ?? ''),
                        ),
                        paymentMethod:
                            MyfatoorahGroup.invoiceStatusCall.invoiceMethod(
                          (_model.myfatoorahpaymentApiResult?.jsonBody ?? ''),
                        ),
                        paymentType:
                            MyfatoorahGroup.invoiceStatusCall.invoiceMethod(
                          (_model.myfatoorahpaymentApiResult?.jsonBody ?? ''),
                        ),
                        updatedAt: getCurrentTimestamp,
                      ));
                      _model.myfatoorahUpdatedPresentOrderResult =
                          await queryOrdersRecordOnce(
                        queryBuilder: (ordersRecord) => ordersRecord.where(
                          'order_id',
                          isEqualTo: FFAppState().PaymentFlow.orderId,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _model.myfatoorahIdMapResult = await queryIdMapRecordOnce(
                        queryBuilder: (idMapRecord) => idMapRecord.where(
                          'type',
                          isEqualTo: 'Main',
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      FFAppState().updatePaymentFlowStruct(
                        (e) => e
                          ..paymentCart = _model
                              .myfatoorahUpdatedPresentOrderResult?.orderItems
                          ..paymentCartBackup = _model
                              .myfatoorahUpdatedPresentOrderResult?.orderItems
                          ..paymentCartCount = _model
                              .myfatoorahUpdatedPresentOrderResult
                              ?.orderItems
                              .cartItems
                              .length
                          ..paymentId =
                              MyfatoorahGroup.invoiceStatusCall.paymentID(
                            (_model.myfatoorahpaymentApiResult?.jsonBody ?? ''),
                          )
                          ..paymentMethod =
                              MyfatoorahGroup.invoiceStatusCall.invoiceMethod(
                            (_model.myfatoorahpaymentApiResult?.jsonBody ?? ''),
                          )
                          ..paymentMethodType =
                              MyfatoorahGroup.invoiceStatusCall.invoiceMethod(
                            (_model.myfatoorahpaymentApiResult?.jsonBody ?? ''),
                          ),
                      );
                      while (FFAppState().PaymentFlow.paymentCartCount > 0) {
                        if (FFAppState()
                                .PaymentFlow
                                .paymentCart
                                .cartItems
                                .elementAtOrNull(
                                    FFAppState().PaymentFlow.paymentCartCount -
                                        1)
                                ?.productType ==
                            'membership') {
                          if (currentUserDocument?.userMemberships.status ==
                              'active') {
                            unawaited(
                              () async {
                                await FFAppState()
                                    .PaymentFlow
                                    .presentUserRef!
                                    .update(createUsersRecordData(
                                      userMemberships:
                                          createUserMembershipsStruct(
                                        planId: int.parse(FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)!
                                            .productId),
                                        startDate: currentUserDocument!
                                                    .userMemberships.endDate! <=
                                                getCurrentTimestamp
                                            ? functions.getDateForSubscription(
                                                currentUserDocument!
                                                    .userMemberships.endDate!,
                                                1)
                                            : functions
                                                .presentDateFromZerotime(),
                                        endDate: functions.getDateForSubscription(
                                            currentUserDocument!.userMemberships
                                                        .endDate! <=
                                                    getCurrentTimestamp
                                                ? functions
                                                    .getDateForSubscription(
                                                        currentUserDocument!
                                                            .userMemberships
                                                            .endDate!,
                                                        1)
                                                : functions
                                                    .presentDateFromZerotime(),
                                            30),
                                        renewalDate:
                                            functions.getDateForSubscription(
                                                currentUserDocument!
                                                            .userMemberships
                                                            .endDate! <=
                                                        getCurrentTimestamp
                                                    ? functions
                                                        .getDateForSubscription(
                                                            currentUserDocument!
                                                                .userMemberships
                                                                .endDate!,
                                                            1)
                                                    : functions
                                                        .presentDateFromZerotime(),
                                                29),
                                        updatedAt: getCurrentTimestamp,
                                        fieldValues: {
                                          'order_history':
                                              FieldValue.arrayUnion([
                                            getUserMembershipsOrderHistoryFirestoreData(
                                              createUserMembershipsOrderHistoryStruct(
                                                orderId: FFAppState()
                                                    .PaymentFlow
                                                    .orderId,
                                                planId: int.parse(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)!
                                                    .productId),
                                                planName: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.productInfo
                                                    .name,
                                                purchaseDate:
                                                    getCurrentTimestamp,
                                                amountPaid: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.totalPrice,
                                                currency: 'KWD',
                                                paymentMethod: TapGroup
                                                    .statusAPICall
                                                    .paymentMethod(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                paymentId: TapGroup
                                                    .statusAPICall
                                                    .chargeId(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
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
                              }(),
                            );
                          } else {
                            unawaited(
                              () async {
                                await FFAppState()
                                    .PaymentFlow
                                    .presentUserRef!
                                    .update(createUsersRecordData(
                                      userMemberships:
                                          createUserMembershipsStruct(
                                        membershipId: _model
                                            .tapIdMapResult?.measurementId,
                                        status: 'active',
                                        planId: int.parse(FFAppState()
                                            .PaymentFlow
                                            .paymentCart
                                            .cartItems
                                            .elementAtOrNull(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCartCount -
                                                1)!
                                            .productId),
                                        startDate:
                                            functions.presentDateFromZerotime(),
                                        endDate:
                                            functions.getDateForSubscription(
                                                functions
                                                    .presentDateFromZerotime(),
                                                30),
                                        renewalDate:
                                            functions.getDateForSubscription(
                                                functions
                                                    .presentDateFromZerotime(),
                                                29),
                                        createdAt: getCurrentTimestamp,
                                        updatedAt: getCurrentTimestamp,
                                        fieldValues: {
                                          'order_history':
                                              FieldValue.arrayUnion([
                                            getUserMembershipsOrderHistoryFirestoreData(
                                              createUserMembershipsOrderHistoryStruct(
                                                orderId: FFAppState()
                                                    .PaymentFlow
                                                    .orderId,
                                                planId: int.parse(FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)!
                                                    .productId),
                                                planName: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.productInfo
                                                    .name,
                                                purchaseDate:
                                                    getCurrentTimestamp,
                                                amountPaid: FFAppState()
                                                    .PaymentFlow
                                                    .paymentCart
                                                    .cartItems
                                                    .elementAtOrNull(FFAppState()
                                                            .PaymentFlow
                                                            .paymentCartCount -
                                                        1)
                                                    ?.totalPrice,
                                                currency: 'KWD',
                                                paymentMethod: TapGroup
                                                    .statusAPICall
                                                    .paymentMethod(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                paymentId: TapGroup
                                                    .statusAPICall
                                                    .chargeId(
                                                  (_model.tappaymentApiResult
                                                          ?.jsonBody ??
                                                      ''),
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
                              }(),
                            );

                            await _model.myfatoorahIdMapResult!.reference
                                .update({
                              ...mapToFirestore(
                                {
                                  'membership_id': FieldValue.increment(1),
                                },
                              ),
                            });
                          }
                        } else {
                          if (FFAppState()
                                  .PaymentFlow
                                  .paymentCart
                                  .cartItems
                                  .elementAtOrNull(FFAppState()
                                          .PaymentFlow
                                          .paymentCartCount -
                                      1)
                                  ?.productType ==
                              'virtualtryon') {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              userVto: createUserVirtualtryonStruct(
                                updatedAt: getCurrentTimestamp,
                                fieldValues: {
                                  'user_vto_credit_points':
                                      FieldValue.increment(FFAppState()
                                          .PaymentFlow
                                          .paymentCart
                                          .cartItems
                                          .elementAtOrNull(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCartCount -
                                              1)!
                                          .vtoPoint
                                          .vtoPoint),
                                  'user_vto_history': FieldValue.arrayUnion([
                                    _model.myfatoorahUpdatedPresentOrderResult
                                        ?.orderId
                                  ]),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                          } else {
                            if (FFAppState()
                                    .PaymentFlow
                                    .paymentCart
                                    .cartItems
                                    .elementAtOrNull(FFAppState()
                                            .PaymentFlow
                                            .paymentCartCount -
                                        1)
                                    ?.productType ==
                                'product') {
                              _model.myfatoorahCartProductResult =
                                  await queryProductsRecordOnce(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'product_id',
                                  isEqualTo: FFAppState()
                                      .PaymentFlow
                                      .paymentCart
                                      .cartItems
                                      .elementAtOrNull(FFAppState()
                                              .PaymentFlow
                                              .paymentCartCount -
                                          1)
                                      ?.productId,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (FFAppState()
                                      .PaymentFlow
                                      .paymentCart
                                      .cartItems
                                      .elementAtOrNull(FFAppState()
                                              .PaymentFlow
                                              .paymentCartCount -
                                          1)
                                      ?.productMainType ==
                                  'ready') {
                                await _model.myfatoorahCartProductResult!
                                    .product.inventoryRef!
                                    .update({
                                  ...createInventoryRecordData(
                                    updatedAt: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'stock_reserved': FieldValue.increment(
                                          FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)!
                                              .quantity),
                                      'stock': FieldValue.increment(
                                          -(FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)!
                                              .quantity)),
                                    },
                                  ),
                                });
                              }
                              _model.myfatoorahdesignerSalesDoc =
                                  await querySalesHistoryRecordOnce(
                                queryBuilder: (salesHistoryRecord) =>
                                    salesHistoryRecord.where(
                                  'user_ref',
                                  isEqualTo: FFAppState()
                                      .PaymentFlow
                                      .paymentCart
                                      .cartItems
                                      .elementAtOrNull(FFAppState()
                                              .PaymentFlow
                                              .paymentCartCount -
                                          1)
                                      ?.productDesignerRef,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);

                              await _model.myfatoorahdesignerSalesDoc!.reference
                                  .update({
                                ...createSalesHistoryRecordData(
                                  updatedAt: getCurrentTimestamp,
                                ),
                                ...mapToFirestore(
                                  {
                                    'sale_history': FieldValue.arrayUnion([
                                      getSaleInfoFirestoreData(
                                        createSaleInfoStruct(
                                          saleDate: getCurrentTimestamp,
                                          saleQuantity: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.quantity,
                                          saleProductId: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.productId,
                                          saleProductRef: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.productRef,
                                          salePayoutStatus: false,
                                          saleWaitingPeriod: false,
                                          saleOrderStatus: 'pending',
                                          saleOrderId: _model
                                              .presentOrderResult?.orderId,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                              if ((FFAppState()
                                          .PaymentFlow
                                          .paymentCart
                                          .cartItems
                                          .elementAtOrNull(FFAppState()
                                                  .PaymentFlow
                                                  .paymentCartCount -
                                              1)
                                          ?.creatorRef !=
                                      null) &&
                                  (FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.promotionId !=
                                          null &&
                                      FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.promotionId !=
                                          '')) {
                                _model.myfatoorahcreatorSalesDoc =
                                    await querySalesHistoryRecordOnce(
                                  queryBuilder: (salesHistoryRecord) =>
                                      salesHistoryRecord.where(
                                    'user_ref',
                                    isEqualTo: FFAppState()
                                        .PaymentFlow
                                        .paymentCart
                                        .cartItems
                                        .elementAtOrNull(FFAppState()
                                                .PaymentFlow
                                                .paymentCartCount -
                                            1)
                                        ?.creatorRef,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                await _model
                                    .myfatoorahcreatorSalesDoc!.reference
                                    .update({
                                  ...createSalesHistoryRecordData(
                                    updatedAt: getCurrentTimestamp,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'sale_history': FieldValue.arrayUnion([
                                        getSaleInfoFirestoreData(
                                          createSaleInfoStruct(
                                            saleDate: getCurrentTimestamp,
                                            saleQuantity: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.quantity,
                                            saleProductId: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.productId,
                                            saleProductRef: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.productRef,
                                            salePayoutStatus: false,
                                            saleWaitingPeriod: false,
                                            saleOrderStatus: 'pending',
                                            salePromotionId: FFAppState()
                                                .PaymentFlow
                                                .paymentCart
                                                .cartItems
                                                .elementAtOrNull(FFAppState()
                                                        .PaymentFlow
                                                        .paymentCartCount -
                                                    1)
                                                ?.promotionId,
                                            saleOrderId: _model
                                                .presentOrderResult?.orderId,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                              }

                              await _model
                                  .myfatoorahCartProductResult!.reference
                                  .update(createProductsRecordData(
                                updatedAt: getCurrentTimestamp,
                                productMarketing: createMarketingStruct(
                                  fieldValues: {
                                    'product_sales_history':
                                        FieldValue.arrayUnion([
                                      getProductSalesHistoryFirestoreData(
                                        createProductSalesHistoryStruct(
                                          createdAt: getCurrentTimestamp,
                                          orderId: _model
                                              .presentOrderResult?.orderId,
                                          quantity: FFAppState()
                                              .PaymentFlow
                                              .paymentCart
                                              .cartItems
                                              .elementAtOrNull(FFAppState()
                                                      .PaymentFlow
                                                      .paymentCartCount -
                                                  1)
                                              ?.quantity,
                                          salesUserInfo:
                                              createSalesUserInfoStruct(
                                            customerId: currentUserDocument
                                                ?.userInfo.userId,
                                            customerRef: currentUserReference,
                                            customerName:
                                                currentUserDisplayName,
                                            email: currentUserEmail,
                                            phoneNumber: currentUserDocument
                                                ?.userInfo.phoneNumber,
                                            shippingAddress:
                                                updateUserShippingaddressStruct(
                                              _model.presentOrderResult
                                                  ?.shippingInfo,
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
                              if (_model.myfatoorahCartProductResult?.product
                                      .productType ==
                                  'custom') {
                                _model.notiificationIdmap1 =
                                    await queryIdMapRecordOnce(
                                  queryBuilder: (idMapRecord) =>
                                      idMapRecord.where(
                                    'type',
                                    isEqualTo: 'Main',
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                await NotificationRecord.collection
                                    .doc()
                                    .set(createNotificationRecordData(
                                      createdAt: getCurrentTimestamp,
                                      notificationId: _model
                                          .notiificationIdmap1?.notificationId
                                          .toString(),
                                      updatedAt: getCurrentTimestamp,
                                      notificationType: 'customorder',
                                      messageType: 'CUSTOM ORDER PLACED',
                                      message:
                                          'Order for Custom Product ${_model.myfatoorahCartProductResult?.productId} || ${_model.myfatoorahCartProductResult?.productInfo.name} is placed Order ID : ${_model.presentOrderResult?.orderId}',
                                      toUserRef: _model
                                          .myfatoorahCartProductResult
                                          ?.productAuthorizer
                                          .productDesignerRef,
                                      sentFrom: 'system',
                                      markAsRead: false,
                                    ));

                                await _model.notiificationIdmap1!.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'notification_id':
                                          FieldValue.increment(1),
                                    },
                                  ),
                                });
                              }
                            }
                          }
                        }

                        FFAppState().updatePaymentFlowStruct(
                          (e) => e
                            ..paymentCartCount =
                                FFAppState().PaymentFlow.paymentCartCount - 1,
                        );
                      }
                      if (currentUserDocument?.userCart.couponInfo.couponId !=
                              null &&
                          currentUserDocument?.userCart.couponInfo.couponId !=
                              '') {
                        await currentUserDocument!
                            .userCart.couponInfo.couponRef!
                            .update({
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
                                    userRole: valueOrDefault(
                                        currentUserDocument?.userRole, ''),
                                    userOrderRef:
                                        _model.presentOrderResult?.reference,
                                    userOrderId:
                                        _model.presentOrderResult?.orderId,
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                              'coupon_limit': FieldValue.increment(-(1)),
                            },
                          ),
                        });

                        await FFAppState()
                            .PaymentFlow
                            .presentUserRef!
                            .update(createUsersRecordData(
                              userCart: createUserCartStruct(
                                updatedAt: getCurrentTimestamp,
                                couponInfo:
                                    createCouponCartInfoStruct(delete: true),
                                fieldValues: {
                                  'cart_items': FieldValue.delete(),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                      } else {
                        await FFAppState()
                            .PaymentFlow
                            .presentUserRef!
                            .update(createUsersRecordData(
                              userCart: createUserCartStruct(
                                updatedAt: getCurrentTimestamp,
                                fieldValues: {
                                  'cart_items': FieldValue.delete(),
                                },
                                clearUnsetFields: false,
                              ),
                            ));
                      }

                      _model.count = _model
                          .presentOrderResult?.orderItems.cartItems.length;
                      while (_model.count! > 0) {
                        _model.cartAttCount = (_model
                                .presentOrderResult?.orderItems.cartItems
                                .elementAtOrNull((_model.count!) - 1))
                            ?.cartItemAttribute
                            .length;
                        safeSetState(() {});
                        while (_model.cartAttCount! > 0) {
                          _model.brandCartResult2 = await queryBrandsRecordOnce(
                            queryBuilder: (brandsRecord) => brandsRecord.where(
                              'brand_id',
                              isEqualTo: ((_model.presentOrderResult?.orderItems
                                          .cartItems
                                          .elementAtOrNull(
                                              (_model.count!) - 1))
                                      ?.cartItemAttribute
                                      .elementAtOrNull(
                                          (_model.cartAttCount!) - 1))
                                  ?.attributesDefaultTermId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.attributeCartResult2 =
                              await queryAttributesRecordOnce(
                            queryBuilder: (attributesRecord) =>
                                attributesRecord.where(
                              'attribute_id',
                              isEqualTo: ((_model.presentOrderResult?.orderItems
                                          .cartItems
                                          .elementAtOrNull(
                                              (_model.count!) - 1))
                                      ?.cartItemAttribute
                                      .elementAtOrNull(
                                          (_model.cartAttCount!) - 1))
                                  ?.attributesId,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          if (_model.attributeCartResult2?.attributeId ==
                              '1001') {
                            _model.colorName =
                                _model.brandCartResult2?.brandInfo.name;
                            safeSetState(() {});
                          } else {
                            _model.sizeName =
                                _model.brandCartResult2?.brandInfo.name;
                            safeSetState(() {});
                          }

                          _model.cartAttCount = _model.cartAttCount! + -1;
                          safeSetState(() {});
                        }
                        _model.addToItems(EmailProductDataStruct(
                          productName: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.productInfo
                              .name,
                          productQty: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.quantity
                              .toString(),
                          productPrice: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.totalPrice
                              .toString(),
                          productSize: _model.sizeName,
                          productColor: _model.colorName,
                          productImage: (_model
                                  .presentOrderResult?.orderItems.cartItems
                                  .elementAtOrNull((_model.count!) - 1))
                              ?.productInfo
                              .featureImage,
                        ));
                        safeSetState(() {});
                        _model.count = _model.count! + -1;
                        safeSetState(() {});
                      }

                      await MailRecord.collection
                          .doc()
                          .set(createMailRecordData(
                            createdAt: getCurrentTimestamp,
                            to: currentUserEmail,
                            template: createMailInfoStruct(
                              name: 'Order_summary',
                              data: createMailDataStruct(
                                name: currentUserDisplayName,
                                orderId: _model.presentOrderResult?.orderId,
                                storeName: 'Azyaa',
                                orderTime: _model
                                    .presentOrderResult?.orderItems.createdAt
                                    ?.toString(),
                                storeAddress: 'Azyaa',
                                paymentMethod:
                                    _model.presentOrderResult?.paymentMethod,
                                total: _model.presentOrderResult?.totalPrice
                                    .toString(),
                                subtotal: _model.presentOrderResult?.totalPrice
                                    .toString(),
                                deliveryCharge: _model
                                    .presentOrderResult?.shippingPrice
                                    .toString(),
                                couponSave: _model
                                    .presentOrderResult
                                    ?.orderItems
                                    .couponInfo
                                    .couponDiscountedPrice
                                    .toString(),
                                supportPhone: '+965 65690900',
                                supportEmail: 'info@azyaa.ai',
                                fieldValues: {
                                  'purchased_items':
                                      getEmailProductDataListFirestoreData(
                                    _model.items,
                                  ),
                                },
                                clearUnsetFields: false,
                                create: true,
                              ),
                              clearUnsetFields: false,
                              create: true,
                            ),
                          ));
                      if ((currentUserDocument?.userBody.toList() ?? [])
                              .where((e) => e.isDefault == true)
                              .toList()
                              .length >
                          0) {
                        FFAppState().updateUserDataFlowStruct(
                          (e) => e
                            ..userSelectedBody =
                                (currentUserDocument?.userBody.toList() ?? [])
                                    .where((e) => e.isDefault == true)
                                    .toList()
                                    .firstOrNull,
                        );
                      }

                      context.goNamed(
                        SuccessWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );

                      return;
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text(
                                  FFLocalizations.of(context).getVariableText(
                                enText: 'API failed.',
                                arText: 'فشلت واجهة برمجة التطبيقات.',
                              )),
                              content: Text(
                                  FFLocalizations.of(context).getVariableText(
                                enText: 'myfatoorah',
                                arText: 'com.myfatoorah',
                              )),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text(FFLocalizations.of(context)
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
                      _model.instantTimer?.cancel();

                      await _model.presentOrderResult!.reference
                          .update(createOrdersRecordData(
                        orderStatus: _model.paymentResponseResult?.status,
                        paymentStatus: _model.paymentResponseResult?.status,
                      ));
                      FFAppState().PaymentFlow = PaymentProcessingTimeStruct();
                      FFAppState().updatePaymentFlowStruct(
                        (e) => e..paymentProcessesStatus = 'DONE',
                      );

                      context.goNamed(
                        FailedWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );

                      return;
                    }
                  }
                }
              } else {
                _model.instantTimer?.cancel();
                unawaited(
                  () async {
                    await _model.presentOrderResult!.reference
                        .update(createOrdersRecordData(
                      paymentId: _model.paymentResponseResult?.paymentId,
                      paymentMethod: _model.paymentResponseResult?.paymentType,
                      paymentType: _model.paymentResponseResult?.paymentType,
                    ));
                  }(),
                );

                await _model.presentOrderResult!.reference
                    .update(createOrdersRecordData(
                  orderStatus: _model.paymentResponseResult?.status,
                  paymentStatus: _model.paymentResponseResult?.status,
                ));
                FFAppState().PaymentFlow = PaymentProcessingTimeStruct();
                FFAppState().updatePaymentFlowStruct(
                  (e) => e..paymentProcessesStatus = 'DONE',
                );

                context.goNamed(
                  FailedWidget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );

                return;
              }
            } else {
              await Future.delayed(
                const Duration(
                  milliseconds: 5000,
                ),
              );
            }

            _model.refresh = (_model.refresh!) + 1;
            safeSetState(() {});
          } else {
            _model.instantTimer?.cancel();
            return;
          }
        },
        startImmediately: true,
      );
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

    return Container();
  }
}
