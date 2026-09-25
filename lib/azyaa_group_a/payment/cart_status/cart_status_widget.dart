import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'cart_status_model.dart';
export 'cart_status_model.dart';

class CartStatusWidget extends StatefulWidget {
  const CartStatusWidget({super.key});

  @override
  State<CartStatusWidget> createState() => _CartStatusWidgetState();
}

class _CartStatusWidgetState extends State<CartStatusWidget> {
  late CartStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartStatusModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 10000),
        callback: (timer) async {
          if (currentUserDocument!.userCart.cartItems.length > 0) {
            FFAppState().updateUserDataFlowStruct(
              (e) => e
                ..userCartCount =
                    currentUserDocument?.userCart.cartItems.length
                ..userCartItemList =
                    currentUserDocument!.userCart.cartItems.toList(),
            );
            while (FFAppState().UserDataFlow.userCartCount > 0) {
              if (FFAppState()
                      .UserDataFlow
                      .userCartItemList
                      .elementAtOrNull(
                          FFAppState().UserDataFlow.userCartCount - 1)
                      ?.productType ==
                  'product') {
                _model.productResult1 = await queryProductsRecordOnce(
                  queryBuilder: (productsRecord) => productsRecord.where(
                    'product_id',
                    isEqualTo: FFAppState()
                        .UserDataFlow
                        .userCartItemList
                        .elementAtOrNull(
                            FFAppState().UserDataFlow.userCartCount - 1)
                        ?.productId,
                  ),
                  singleRecord: true,
                ).then((s) => s.firstOrNull);
                _model.inventoryResult1 = await queryInventoryRecordOnce(
                  queryBuilder: (inventoryRecord) => inventoryRecord.where(
                    'inventory_id',
                    isEqualTo: _model.productResult1?.product.inventoryId,
                  ),
                  singleRecord: true,
                ).then((s) => s.firstOrNull);
                if (FFAppState()
                        .UserDataFlow
                        .userCartItemList
                        .elementAtOrNull(
                            FFAppState().UserDataFlow.userCartCount - 1)!
                        .quantity <=
                    _model.inventoryResult1!.stock) {
                  if (FFAppState()
                          .UserDataFlow
                          .userCartItemList
                          .elementAtOrNull(
                              FFAppState().UserDataFlow.userCartCount - 1)
                          ?.price !=
                      _model.productResult1?.product.productPrice) {
                    FFAppState().updateUserDataFlowStruct(
                      (e) => e
                        ..updateUserCartItemList(
                          (e) => e[FFAppState().UserDataFlow.userCartCount - 1]
                            ..productInfo = _model.productResult1?.productInfo
                            ..quantity = FFAppState()
                                .UserDataFlow
                                .userCartItemList
                                .elementAtOrNull(
                                    FFAppState().UserDataFlow.userCartCount - 1)
                                ?.quantity
                            ..price =
                                _model.productResult1?.product.productPrice
                            ..totalPrice = FFAppState()
                                    .UserDataFlow
                                    .userCartItemList
                                    .elementAtOrNull(FFAppState()
                                            .UserDataFlow
                                            .userCartCount -
                                        1)!
                                    .quantity *
                                _model.productResult1!.product.productPrice,
                        ),
                    );
                  }
                } else {
                  if (_model.inventoryResult1!.stock <= 0) {
                    FFAppState().updateUserDataFlowStruct(
                      (e) => e
                        ..updateUserCartItemList(
                          (e) => e.removeAt(
                              FFAppState().UserDataFlow.userCartCount - 1),
                        ),
                    );
                  } else {
                    FFAppState().updateUserDataFlowStruct(
                      (e) => e
                        ..updateUserCartItemList(
                          (e) => e[FFAppState().UserDataFlow.userCartCount - 1]
                            ..productInfo = _model.productResult1?.productInfo
                            ..quantity = _model.inventoryResult1?.stock
                            ..price =
                                _model.productResult1?.product.productPrice
                            ..totalPrice = _model.inventoryResult1!.stock *
                                _model.productResult1!.product.productPrice
                            ..updateProductInventoryInfo(
                              (e) => e
                                ..stock = _model.inventoryResult1?.stock
                                ..stockOnHand =
                                    _model.inventoryResult1?.stockOnHand
                                ..stockReserved =
                                    _model.inventoryResult1?.stockReserved
                                ..stockUnavailable =
                                    _model.inventoryResult1?.stockUnavailable,
                            ),
                        ),
                    );
                  }
                }
              } else {
                if (FFAppState()
                        .UserDataFlow
                        .userCartItemList
                        .elementAtOrNull(
                            FFAppState().UserDataFlow.userCartCount - 1)
                        ?.productType ==
                    'membership') {
                  _model.membershipResult1 =
                      await queryUserMembershipPlansRecordOnce(
                    queryBuilder: (userMembershipPlansRecord) =>
                        userMembershipPlansRecord.where(
                      'membership_plan_id',
                      isEqualTo: int.parse(FFAppState()
                          .UserDataFlow
                          .userCartItemList
                          .elementAtOrNull(
                              FFAppState().UserDataFlow.userCartCount - 1)!
                          .productId),
                    ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  if (FFAppState()
                          .UserDataFlow
                          .userCartItemList
                          .elementAtOrNull(
                              FFAppState().UserDataFlow.userCartCount - 1)
                          ?.price !=
                      _model.membershipResult1?.price) {
                    FFAppState().updateUserDataFlowStruct(
                      (e) => e
                        ..updateUserCartItemList(
                          (e) => e[FFAppState().UserDataFlow.userCartCount - 1]
                            ..productInfo = _model.membershipResult1?.planInfo
                            ..quantity = FFAppState()
                                .UserDataFlow
                                .userCartItemList
                                .elementAtOrNull(
                                    FFAppState().UserDataFlow.userCartCount - 1)
                                ?.quantity
                            ..price = _model.membershipResult1?.price
                            ..totalPrice = FFAppState()
                                    .UserDataFlow
                                    .userCartItemList
                                    .elementAtOrNull(FFAppState()
                                            .UserDataFlow
                                            .userCartCount -
                                        1)!
                                    .quantity *
                                _model.membershipResult1!.price,
                        ),
                    );
                  }
                }
                FFAppState().updateUserDataFlowStruct(
                  (e) => e
                    ..userCartCount =
                        FFAppState().UserDataFlow.userCartCount - 1,
                );
              }

              FFAppState().updateUserDataFlowStruct(
                (e) => e
                  ..userCartCount = FFAppState().UserDataFlow.userCartCount - 1,
              );
            }

            await currentUserReference!.update(createUsersRecordData(
              userCart: createUserCartStruct(
                updatedAt: getCurrentTimestamp,
                subtotal: functions.newCartTotal(FFAppState()
                    .UserDataFlow
                    .userCartItemList
                    .map((e) => e.totalPrice)
                    .toList()
                    .toList()),
                total: functions.newCartTotal(FFAppState()
                    .UserDataFlow
                    .userCartItemList
                    .map((e) => e.totalPrice)
                    .toList()
                    .toList()),
                fieldValues: {
                  'cart_items': getUserCartItemsListFirestoreData(
                    FFAppState().UserDataFlow.userCartItemList,
                  ),
                },
                clearUnsetFields: false,
              ),
            ));
            FFAppState().updateUserDataFlowStruct(
              (e) => e..refresh = FFAppState().UserDataFlow.refresh + 1,
            );
          }
          _model.refresh = (_model.refresh!) + 1;
          _model.updatePage(() {});
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
