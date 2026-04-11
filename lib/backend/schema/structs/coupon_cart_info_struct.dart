// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponCartInfoStruct extends FFFirebaseStruct {
  CouponCartInfoStruct({
    DocumentReference? couponRef,
    String? couponId,
    String? couponValue,
    double? couponDiscountedPrice,
    CouponUserInfoStruct? couponUserInfo,
    String? couponDiscountType,
    double? couponPrice,
    double? couponMaximumDiscount,
    String? couponFor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _couponRef = couponRef,
        _couponId = couponId,
        _couponValue = couponValue,
        _couponDiscountedPrice = couponDiscountedPrice,
        _couponUserInfo = couponUserInfo,
        _couponDiscountType = couponDiscountType,
        _couponPrice = couponPrice,
        _couponMaximumDiscount = couponMaximumDiscount,
        _couponFor = couponFor,
        super(firestoreUtilData);

  // "coupon_ref" field.
  DocumentReference? _couponRef;
  DocumentReference? get couponRef => _couponRef;
  set couponRef(DocumentReference? val) => _couponRef = val;

  bool hasCouponRef() => _couponRef != null;

  // "coupon_id" field.
  String? _couponId;
  String get couponId => _couponId ?? '';
  set couponId(String? val) => _couponId = val;

  bool hasCouponId() => _couponId != null;

  // "coupon_value" field.
  String? _couponValue;
  String get couponValue => _couponValue ?? '';
  set couponValue(String? val) => _couponValue = val;

  bool hasCouponValue() => _couponValue != null;

  // "coupon_discounted_price" field.
  double? _couponDiscountedPrice;
  double get couponDiscountedPrice => _couponDiscountedPrice ?? 0.0;
  set couponDiscountedPrice(double? val) => _couponDiscountedPrice = val;

  void incrementCouponDiscountedPrice(double amount) =>
      couponDiscountedPrice = couponDiscountedPrice + amount;

  bool hasCouponDiscountedPrice() => _couponDiscountedPrice != null;

  // "coupon_user_info" field.
  CouponUserInfoStruct? _couponUserInfo;
  CouponUserInfoStruct get couponUserInfo =>
      _couponUserInfo ?? CouponUserInfoStruct();
  set couponUserInfo(CouponUserInfoStruct? val) => _couponUserInfo = val;

  void updateCouponUserInfo(Function(CouponUserInfoStruct) updateFn) {
    updateFn(_couponUserInfo ??= CouponUserInfoStruct());
  }

  bool hasCouponUserInfo() => _couponUserInfo != null;

  // "coupon_discount_type" field.
  String? _couponDiscountType;
  String get couponDiscountType => _couponDiscountType ?? '';
  set couponDiscountType(String? val) => _couponDiscountType = val;

  bool hasCouponDiscountType() => _couponDiscountType != null;

  // "coupon_price" field.
  double? _couponPrice;
  double get couponPrice => _couponPrice ?? 0.0;
  set couponPrice(double? val) => _couponPrice = val;

  void incrementCouponPrice(double amount) =>
      couponPrice = couponPrice + amount;

  bool hasCouponPrice() => _couponPrice != null;

  // "coupon_maximum_discount" field.
  double? _couponMaximumDiscount;
  double get couponMaximumDiscount => _couponMaximumDiscount ?? 0.0;
  set couponMaximumDiscount(double? val) => _couponMaximumDiscount = val;

  void incrementCouponMaximumDiscount(double amount) =>
      couponMaximumDiscount = couponMaximumDiscount + amount;

  bool hasCouponMaximumDiscount() => _couponMaximumDiscount != null;

  // "coupon_for" field.
  String? _couponFor;
  String get couponFor => _couponFor ?? '';
  set couponFor(String? val) => _couponFor = val;

  bool hasCouponFor() => _couponFor != null;

  static CouponCartInfoStruct fromMap(Map<String, dynamic> data) =>
      CouponCartInfoStruct(
        couponRef: data['coupon_ref'] as DocumentReference?,
        couponId: data['coupon_id'] as String?,
        couponValue: data['coupon_value'] as String?,
        couponDiscountedPrice:
            castToType<double>(data['coupon_discounted_price']),
        couponUserInfo: data['coupon_user_info'] is CouponUserInfoStruct
            ? data['coupon_user_info']
            : CouponUserInfoStruct.maybeFromMap(data['coupon_user_info']),
        couponDiscountType: data['coupon_discount_type'] as String?,
        couponPrice: castToType<double>(data['coupon_price']),
        couponMaximumDiscount:
            castToType<double>(data['coupon_maximum_discount']),
        couponFor: data['coupon_for'] as String?,
      );

  static CouponCartInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CouponCartInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'coupon_ref': _couponRef,
        'coupon_id': _couponId,
        'coupon_value': _couponValue,
        'coupon_discounted_price': _couponDiscountedPrice,
        'coupon_user_info': _couponUserInfo?.toMap(),
        'coupon_discount_type': _couponDiscountType,
        'coupon_price': _couponPrice,
        'coupon_maximum_discount': _couponMaximumDiscount,
        'coupon_for': _couponFor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coupon_ref': serializeParam(
          _couponRef,
          ParamType.DocumentReference,
        ),
        'coupon_id': serializeParam(
          _couponId,
          ParamType.String,
        ),
        'coupon_value': serializeParam(
          _couponValue,
          ParamType.String,
        ),
        'coupon_discounted_price': serializeParam(
          _couponDiscountedPrice,
          ParamType.double,
        ),
        'coupon_user_info': serializeParam(
          _couponUserInfo,
          ParamType.DataStruct,
        ),
        'coupon_discount_type': serializeParam(
          _couponDiscountType,
          ParamType.String,
        ),
        'coupon_price': serializeParam(
          _couponPrice,
          ParamType.double,
        ),
        'coupon_maximum_discount': serializeParam(
          _couponMaximumDiscount,
          ParamType.double,
        ),
        'coupon_for': serializeParam(
          _couponFor,
          ParamType.String,
        ),
      }.withoutNulls;

  static CouponCartInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CouponCartInfoStruct(
        couponRef: deserializeParam(
          data['coupon_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['coupon'],
        ),
        couponId: deserializeParam(
          data['coupon_id'],
          ParamType.String,
          false,
        ),
        couponValue: deserializeParam(
          data['coupon_value'],
          ParamType.String,
          false,
        ),
        couponDiscountedPrice: deserializeParam(
          data['coupon_discounted_price'],
          ParamType.double,
          false,
        ),
        couponUserInfo: deserializeStructParam(
          data['coupon_user_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CouponUserInfoStruct.fromSerializableMap,
        ),
        couponDiscountType: deserializeParam(
          data['coupon_discount_type'],
          ParamType.String,
          false,
        ),
        couponPrice: deserializeParam(
          data['coupon_price'],
          ParamType.double,
          false,
        ),
        couponMaximumDiscount: deserializeParam(
          data['coupon_maximum_discount'],
          ParamType.double,
          false,
        ),
        couponFor: deserializeParam(
          data['coupon_for'],
          ParamType.String,
          false,
        ),
      );

  static CouponCartInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CouponCartInfoStruct(
        couponRef: convertAlgoliaParam(
          data['coupon_ref'],
          ParamType.DocumentReference,
          false,
        ),
        couponId: convertAlgoliaParam(
          data['coupon_id'],
          ParamType.String,
          false,
        ),
        couponValue: convertAlgoliaParam(
          data['coupon_value'],
          ParamType.String,
          false,
        ),
        couponDiscountedPrice: convertAlgoliaParam(
          data['coupon_discounted_price'],
          ParamType.double,
          false,
        ),
        couponUserInfo: convertAlgoliaParam(
          data['coupon_user_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CouponUserInfoStruct.fromAlgoliaData,
        ),
        couponDiscountType: convertAlgoliaParam(
          data['coupon_discount_type'],
          ParamType.String,
          false,
        ),
        couponPrice: convertAlgoliaParam(
          data['coupon_price'],
          ParamType.double,
          false,
        ),
        couponMaximumDiscount: convertAlgoliaParam(
          data['coupon_maximum_discount'],
          ParamType.double,
          false,
        ),
        couponFor: convertAlgoliaParam(
          data['coupon_for'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CouponCartInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponCartInfoStruct &&
        couponRef == other.couponRef &&
        couponId == other.couponId &&
        couponValue == other.couponValue &&
        couponDiscountedPrice == other.couponDiscountedPrice &&
        couponUserInfo == other.couponUserInfo &&
        couponDiscountType == other.couponDiscountType &&
        couponPrice == other.couponPrice &&
        couponMaximumDiscount == other.couponMaximumDiscount &&
        couponFor == other.couponFor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        couponRef,
        couponId,
        couponValue,
        couponDiscountedPrice,
        couponUserInfo,
        couponDiscountType,
        couponPrice,
        couponMaximumDiscount,
        couponFor
      ]);
}

CouponCartInfoStruct createCouponCartInfoStruct({
  DocumentReference? couponRef,
  String? couponId,
  String? couponValue,
  double? couponDiscountedPrice,
  CouponUserInfoStruct? couponUserInfo,
  String? couponDiscountType,
  double? couponPrice,
  double? couponMaximumDiscount,
  String? couponFor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CouponCartInfoStruct(
      couponRef: couponRef,
      couponId: couponId,
      couponValue: couponValue,
      couponDiscountedPrice: couponDiscountedPrice,
      couponUserInfo:
          couponUserInfo ?? (clearUnsetFields ? CouponUserInfoStruct() : null),
      couponDiscountType: couponDiscountType,
      couponPrice: couponPrice,
      couponMaximumDiscount: couponMaximumDiscount,
      couponFor: couponFor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CouponCartInfoStruct? updateCouponCartInfoStruct(
  CouponCartInfoStruct? couponCartInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    couponCartInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCouponCartInfoStructData(
  Map<String, dynamic> firestoreData,
  CouponCartInfoStruct? couponCartInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (couponCartInfo == null) {
    return;
  }
  if (couponCartInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && couponCartInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final couponCartInfoData =
      getCouponCartInfoFirestoreData(couponCartInfo, forFieldValue);
  final nestedData =
      couponCartInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = couponCartInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCouponCartInfoFirestoreData(
  CouponCartInfoStruct? couponCartInfo, [
  bool forFieldValue = false,
]) {
  if (couponCartInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(couponCartInfo.toMap());

  // Handle nested data for "coupon_user_info" field.
  addCouponUserInfoStructData(
    firestoreData,
    couponCartInfo.hasCouponUserInfo() ? couponCartInfo.couponUserInfo : null,
    'coupon_user_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(couponCartInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCouponCartInfoListFirestoreData(
  List<CouponCartInfoStruct>? couponCartInfos,
) =>
    couponCartInfos
        ?.map((e) => getCouponCartInfoFirestoreData(e, true))
        .toList() ??
    [];
