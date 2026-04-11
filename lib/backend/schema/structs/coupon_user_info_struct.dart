// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponUserInfoStruct extends FFFirebaseStruct {
  CouponUserInfoStruct({
    String? userEmail,
    String? userName,
    String? userPhone,
    String? userImage,
    String? userId,
    String? userRole,
    DocumentReference? userOrderRef,
    String? userOrderId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userEmail = userEmail,
        _userName = userName,
        _userPhone = userPhone,
        _userImage = userImage,
        _userId = userId,
        _userRole = userRole,
        _userOrderRef = userOrderRef,
        _userOrderId = userOrderId,
        super(firestoreUtilData);

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;

  bool hasUserEmail() => _userEmail != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "user_phone" field.
  String? _userPhone;
  String get userPhone => _userPhone ?? '';
  set userPhone(String? val) => _userPhone = val;

  bool hasUserPhone() => _userPhone != null;

  // "user_image" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  set userImage(String? val) => _userImage = val;

  bool hasUserImage() => _userImage != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;

  bool hasUserRole() => _userRole != null;

  // "user_order_ref" field.
  DocumentReference? _userOrderRef;
  DocumentReference? get userOrderRef => _userOrderRef;
  set userOrderRef(DocumentReference? val) => _userOrderRef = val;

  bool hasUserOrderRef() => _userOrderRef != null;

  // "user_order_id" field.
  String? _userOrderId;
  String get userOrderId => _userOrderId ?? '';
  set userOrderId(String? val) => _userOrderId = val;

  bool hasUserOrderId() => _userOrderId != null;

  static CouponUserInfoStruct fromMap(Map<String, dynamic> data) =>
      CouponUserInfoStruct(
        userEmail: data['user_email'] as String?,
        userName: data['user_name'] as String?,
        userPhone: data['user_phone'] as String?,
        userImage: data['user_image'] as String?,
        userId: data['user_id'] as String?,
        userRole: data['user_role'] as String?,
        userOrderRef: data['user_order_ref'] as DocumentReference?,
        userOrderId: data['user_order_id'] as String?,
      );

  static CouponUserInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CouponUserInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_email': _userEmail,
        'user_name': _userName,
        'user_phone': _userPhone,
        'user_image': _userImage,
        'user_id': _userId,
        'user_role': _userRole,
        'user_order_ref': _userOrderRef,
        'user_order_id': _userOrderId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_email': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user_phone': serializeParam(
          _userPhone,
          ParamType.String,
        ),
        'user_image': serializeParam(
          _userImage,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'user_role': serializeParam(
          _userRole,
          ParamType.String,
        ),
        'user_order_ref': serializeParam(
          _userOrderRef,
          ParamType.DocumentReference,
        ),
        'user_order_id': serializeParam(
          _userOrderId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CouponUserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CouponUserInfoStruct(
        userEmail: deserializeParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userPhone: deserializeParam(
          data['user_phone'],
          ParamType.String,
          false,
        ),
        userImage: deserializeParam(
          data['user_image'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        userRole: deserializeParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
        userOrderRef: deserializeParam(
          data['user_order_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['orders'],
        ),
        userOrderId: deserializeParam(
          data['user_order_id'],
          ParamType.String,
          false,
        ),
      );

  static CouponUserInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CouponUserInfoStruct(
        userEmail: convertAlgoliaParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userName: convertAlgoliaParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userPhone: convertAlgoliaParam(
          data['user_phone'],
          ParamType.String,
          false,
        ),
        userImage: convertAlgoliaParam(
          data['user_image'],
          ParamType.String,
          false,
        ),
        userId: convertAlgoliaParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        userRole: convertAlgoliaParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
        userOrderRef: convertAlgoliaParam(
          data['user_order_ref'],
          ParamType.DocumentReference,
          false,
        ),
        userOrderId: convertAlgoliaParam(
          data['user_order_id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CouponUserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponUserInfoStruct &&
        userEmail == other.userEmail &&
        userName == other.userName &&
        userPhone == other.userPhone &&
        userImage == other.userImage &&
        userId == other.userId &&
        userRole == other.userRole &&
        userOrderRef == other.userOrderRef &&
        userOrderId == other.userOrderId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userEmail,
        userName,
        userPhone,
        userImage,
        userId,
        userRole,
        userOrderRef,
        userOrderId
      ]);
}

CouponUserInfoStruct createCouponUserInfoStruct({
  String? userEmail,
  String? userName,
  String? userPhone,
  String? userImage,
  String? userId,
  String? userRole,
  DocumentReference? userOrderRef,
  String? userOrderId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CouponUserInfoStruct(
      userEmail: userEmail,
      userName: userName,
      userPhone: userPhone,
      userImage: userImage,
      userId: userId,
      userRole: userRole,
      userOrderRef: userOrderRef,
      userOrderId: userOrderId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CouponUserInfoStruct? updateCouponUserInfoStruct(
  CouponUserInfoStruct? couponUserInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    couponUserInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCouponUserInfoStructData(
  Map<String, dynamic> firestoreData,
  CouponUserInfoStruct? couponUserInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (couponUserInfo == null) {
    return;
  }
  if (couponUserInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && couponUserInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final couponUserInfoData =
      getCouponUserInfoFirestoreData(couponUserInfo, forFieldValue);
  final nestedData =
      couponUserInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = couponUserInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCouponUserInfoFirestoreData(
  CouponUserInfoStruct? couponUserInfo, [
  bool forFieldValue = false,
]) {
  if (couponUserInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(couponUserInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(couponUserInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCouponUserInfoListFirestoreData(
  List<CouponUserInfoStruct>? couponUserInfos,
) =>
    couponUserInfos
        ?.map((e) => getCouponUserInfoFirestoreData(e, true))
        .toList() ??
    [];
