import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'apply_coupon_widget.dart' show ApplyCouponWidget;
import 'package:flutter/material.dart';

class ApplyCouponModel extends FlutterFlowModel<ApplyCouponWidget> {
  ///  Local state fields for this component.

  int? count;

  double? discountedTotal;

  CouponCartInfoStruct? couponInfo;
  void updateCouponInfoStruct(Function(CouponCartInfoStruct) updateFn) {
    updateFn(couponInfo ??= CouponCartInfoStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for coupon widget.
  FocusNode? couponFocusNode;
  TextEditingController? couponTextController;
  String? Function(BuildContext, String?)? couponTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in apply widget.
  CouponRecord? couponResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    couponFocusNode?.dispose();
    couponTextController?.dispose();
  }
}
