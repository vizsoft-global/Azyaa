import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'cart_item_out_of_stock_model.dart';
export 'cart_item_out_of_stock_model.dart';

class CartItemOutOfStockWidget extends StatefulWidget {
  const CartItemOutOfStockWidget({
    super.key,
    required this.cartIndex,
  });

  final int? cartIndex;

  @override
  State<CartItemOutOfStockWidget> createState() =>
      _CartItemOutOfStockWidgetState();
}

class _CartItemOutOfStockWidgetState extends State<CartItemOutOfStockWidget> {
  late CartItemOutOfStockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemOutOfStockModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().updateUserDataFlowStruct(
        (e) => e
          ..userCartItemList = currentUserDocument!.userCart.cartItems.toList(),
      );
      FFAppState().updateUserDataFlowStruct(
        (e) => e
          ..updateUserCartItemList(
            (e) => e.removeAt(widget.cartIndex!),
          ),
      );

      await currentUserReference!.update(createUsersRecordData(
        userCart: createUserCartStruct(
          fieldValues: {
            'cart_items': getUserCartItemsListFirestoreData(
              FFAppState().UserDataFlow.userCartItemList,
            ),
          },
          clearUnsetFields: false,
        ),
      ));
      FFAppState().updateUserDataFlowStruct(
        (e) => e..refresh = FFAppState().UserDataFlow.refresh - 1,
      );
      FFAppState().update(() {});
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
