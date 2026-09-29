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
          // Works on a private copy: the bag's shared app-state list and
          // counters are also written by the cart page and the Add to Bag
          // button while this loop awaits the network.
          final items = currentUserDocument!.userCart.cartItems
              .map((e) =>
                  UserCartItemsStruct.fromSerializableMap(e.toSerializableMap()))
              .toList();
          var changed = false;
          for (var i = items.length - 1; i >= 0; i--) {
            final item = items[i];
            if (item.productType == 'product') {
              _model.productResult1 = await queryProductsRecordOnce(
                queryBuilder: (productsRecord) => productsRecord.where(
                  'product_id',
                  isEqualTo: item.productId,
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
              final product = _model.productResult1;
              final inventory = _model.inventoryResult1;
              if (product == null || inventory == null) {
                continue;
              }
              final price = product.product.productPrice;
              if (item.quantity <= inventory.stock) {
                if (item.price != price) {
                  item
                    ..productInfo = product.productInfo
                    ..price = price
                    ..totalPrice = item.quantity * price;
                  changed = true;
                }
              } else if (inventory.stock <= 0) {
                items.removeAt(i);
                changed = true;
              } else {
                item
                  ..productInfo = product.productInfo
                  ..quantity = inventory.stock
                  ..price = price
                  ..totalPrice = inventory.stock * price
                  ..updateProductInventoryInfo(
                    (e) => e
                      ..stock = inventory.stock
                      ..stockOnHand = inventory.stockOnHand
                      ..stockReserved = inventory.stockReserved
                      ..stockUnavailable = inventory.stockUnavailable,
                  );
                changed = true;
              }
            } else if (item.productType == 'membership') {
              final planId = int.tryParse(item.productId);
              if (planId == null) {
                continue;
              }
              _model.membershipResult1 =
                  await queryUserMembershipPlansRecordOnce(
                queryBuilder: (userMembershipPlansRecord) =>
                    userMembershipPlansRecord.where(
                  'membership_plan_id',
                  isEqualTo: planId,
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              final plan = _model.membershipResult1;
              if (plan != null && item.price != plan.price) {
                item
                  ..productInfo = plan.planInfo
                  ..price = plan.price
                  ..totalPrice = item.quantity * plan.price;
                changed = true;
              }
            }
          }

          if (changed) {
            FFAppState().updateUserDataFlowStruct(
              (e) => e
                ..userCartCount = items.length
                ..userCartItemList = items,
            );
            await currentUserReference!.update(createUsersRecordData(
              userCart: createUserCartStruct(
                updatedAt: getCurrentTimestamp,
                subtotal: functions
                    .newCartTotal(items.map((e) => e.totalPrice).toList()),
                total: functions
                    .newCartTotal(items.map((e) => e.totalPrice).toList()),
                fieldValues: {
                  'cart_items': getUserCartItemsListFirestoreData(items),
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
