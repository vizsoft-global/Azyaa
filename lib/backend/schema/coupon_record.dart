import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponRecord extends FirestoreRecord {
  CouponRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "coupon_status" field.
  String? _couponStatus;
  String get couponStatus => _couponStatus ?? '';
  bool hasCouponStatus() => _couponStatus != null;

  // "coupon_created_at" field.
  DateTime? _couponCreatedAt;
  DateTime? get couponCreatedAt => _couponCreatedAt;
  bool hasCouponCreatedAt() => _couponCreatedAt != null;

  // "coupon_id" field.
  String? _couponId;
  String get couponId => _couponId ?? '';
  bool hasCouponId() => _couponId != null;

  // "coupon_main_info" field.
  MainStruct? _couponMainInfo;
  MainStruct get couponMainInfo => _couponMainInfo ?? MainStruct();
  bool hasCouponMainInfo() => _couponMainInfo != null;

  // "coupon_value" field.
  String? _couponValue;
  String get couponValue => _couponValue ?? '';
  bool hasCouponValue() => _couponValue != null;

  // "coupon_price" field.
  double? _couponPrice;
  double get couponPrice => _couponPrice ?? 0.0;
  bool hasCouponPrice() => _couponPrice != null;

  // "coupon_discount_type" field.
  String? _couponDiscountType;
  String get couponDiscountType => _couponDiscountType ?? '';
  bool hasCouponDiscountType() => _couponDiscountType != null;

  // "coupon_start_date" field.
  DateTime? _couponStartDate;
  DateTime? get couponStartDate => _couponStartDate;
  bool hasCouponStartDate() => _couponStartDate != null;

  // "coupon_end_date" field.
  DateTime? _couponEndDate;
  DateTime? get couponEndDate => _couponEndDate;
  bool hasCouponEndDate() => _couponEndDate != null;

  // "coupon_minimum_order_amount" field.
  double? _couponMinimumOrderAmount;
  double get couponMinimumOrderAmount => _couponMinimumOrderAmount ?? 0.0;
  bool hasCouponMinimumOrderAmount() => _couponMinimumOrderAmount != null;

  // "coupon_maximum_discount" field.
  double? _couponMaximumDiscount;
  double get couponMaximumDiscount => _couponMaximumDiscount ?? 0.0;
  bool hasCouponMaximumDiscount() => _couponMaximumDiscount != null;

  // "coupon_for" field.
  String? _couponFor;
  String get couponFor => _couponFor ?? '';
  bool hasCouponFor() => _couponFor != null;

  // "coupon_limit" field.
  int? _couponLimit;
  int get couponLimit => _couponLimit ?? 0;
  bool hasCouponLimit() => _couponLimit != null;

  // "coupon_used_user_list" field.
  List<CouponUserInfoStruct>? _couponUsedUserList;
  List<CouponUserInfoStruct> get couponUsedUserList =>
      _couponUsedUserList ?? const [];
  bool hasCouponUsedUserList() => _couponUsedUserList != null;

  void _initializeFields() {
    _couponStatus = snapshotData['coupon_status'] as String?;
    _couponCreatedAt = snapshotData['coupon_created_at'] as DateTime?;
    _couponId = snapshotData['coupon_id'] as String?;
    _couponMainInfo = snapshotData['coupon_main_info'] is MainStruct
        ? snapshotData['coupon_main_info']
        : MainStruct.maybeFromMap(snapshotData['coupon_main_info']);
    _couponValue = snapshotData['coupon_value'] as String?;
    _couponPrice = castToType<double>(snapshotData['coupon_price']);
    _couponDiscountType = snapshotData['coupon_discount_type'] as String?;
    _couponStartDate = snapshotData['coupon_start_date'] as DateTime?;
    _couponEndDate = snapshotData['coupon_end_date'] as DateTime?;
    _couponMinimumOrderAmount =
        castToType<double>(snapshotData['coupon_minimum_order_amount']);
    _couponMaximumDiscount =
        castToType<double>(snapshotData['coupon_maximum_discount']);
    _couponFor = snapshotData['coupon_for'] as String?;
    _couponLimit = castToType<int>(snapshotData['coupon_limit']);
    _couponUsedUserList = getStructList(
      snapshotData['coupon_used_user_list'],
      CouponUserInfoStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coupon');

  static Stream<CouponRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponRecord.fromSnapshot(s));

  static Future<CouponRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponRecord.fromSnapshot(s));

  static CouponRecord fromSnapshot(DocumentSnapshot snapshot) => CouponRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponRecordData({
  String? couponStatus,
  DateTime? couponCreatedAt,
  String? couponId,
  MainStruct? couponMainInfo,
  String? couponValue,
  double? couponPrice,
  String? couponDiscountType,
  DateTime? couponStartDate,
  DateTime? couponEndDate,
  double? couponMinimumOrderAmount,
  double? couponMaximumDiscount,
  String? couponFor,
  int? couponLimit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'coupon_status': couponStatus,
      'coupon_created_at': couponCreatedAt,
      'coupon_id': couponId,
      'coupon_main_info': MainStruct().toMap(),
      'coupon_value': couponValue,
      'coupon_price': couponPrice,
      'coupon_discount_type': couponDiscountType,
      'coupon_start_date': couponStartDate,
      'coupon_end_date': couponEndDate,
      'coupon_minimum_order_amount': couponMinimumOrderAmount,
      'coupon_maximum_discount': couponMaximumDiscount,
      'coupon_for': couponFor,
      'coupon_limit': couponLimit,
    }.withoutNulls,
  );

  // Handle nested data for "coupon_main_info" field.
  addMainStructData(firestoreData, couponMainInfo, 'coupon_main_info');

  return firestoreData;
}

class CouponRecordDocumentEquality implements Equality<CouponRecord> {
  const CouponRecordDocumentEquality();

  @override
  bool equals(CouponRecord? e1, CouponRecord? e2) {
    const listEquality = ListEquality();
    return e1?.couponStatus == e2?.couponStatus &&
        e1?.couponCreatedAt == e2?.couponCreatedAt &&
        e1?.couponId == e2?.couponId &&
        e1?.couponMainInfo == e2?.couponMainInfo &&
        e1?.couponValue == e2?.couponValue &&
        e1?.couponPrice == e2?.couponPrice &&
        e1?.couponDiscountType == e2?.couponDiscountType &&
        e1?.couponStartDate == e2?.couponStartDate &&
        e1?.couponEndDate == e2?.couponEndDate &&
        e1?.couponMinimumOrderAmount == e2?.couponMinimumOrderAmount &&
        e1?.couponMaximumDiscount == e2?.couponMaximumDiscount &&
        e1?.couponFor == e2?.couponFor &&
        e1?.couponLimit == e2?.couponLimit &&
        listEquality.equals(e1?.couponUsedUserList, e2?.couponUsedUserList);
  }

  @override
  int hash(CouponRecord? e) => const ListEquality().hash([
        e?.couponStatus,
        e?.couponCreatedAt,
        e?.couponId,
        e?.couponMainInfo,
        e?.couponValue,
        e?.couponPrice,
        e?.couponDiscountType,
        e?.couponStartDate,
        e?.couponEndDate,
        e?.couponMinimumOrderAmount,
        e?.couponMaximumDiscount,
        e?.couponFor,
        e?.couponLimit,
        e?.couponUsedUserList
      ]);

  @override
  bool isValidKey(Object? o) => o is CouponRecord;
}
