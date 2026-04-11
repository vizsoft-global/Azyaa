// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCartVtoPlanStruct extends FFFirebaseStruct {
  UserCartVtoPlanStruct({
    int? vtoPlanId,
    DocumentReference? vtoPlanRef,
    int? vtoPoint,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vtoPlanId = vtoPlanId,
        _vtoPlanRef = vtoPlanRef,
        _vtoPoint = vtoPoint,
        super(firestoreUtilData);

  // "vto_plan_id" field.
  int? _vtoPlanId;
  int get vtoPlanId => _vtoPlanId ?? 0;
  set vtoPlanId(int? val) => _vtoPlanId = val;

  void incrementVtoPlanId(int amount) => vtoPlanId = vtoPlanId + amount;

  bool hasVtoPlanId() => _vtoPlanId != null;

  // "vto_plan_ref" field.
  DocumentReference? _vtoPlanRef;
  DocumentReference? get vtoPlanRef => _vtoPlanRef;
  set vtoPlanRef(DocumentReference? val) => _vtoPlanRef = val;

  bool hasVtoPlanRef() => _vtoPlanRef != null;

  // "vto_point" field.
  int? _vtoPoint;
  int get vtoPoint => _vtoPoint ?? 0;
  set vtoPoint(int? val) => _vtoPoint = val;

  void incrementVtoPoint(int amount) => vtoPoint = vtoPoint + amount;

  bool hasVtoPoint() => _vtoPoint != null;

  static UserCartVtoPlanStruct fromMap(Map<String, dynamic> data) =>
      UserCartVtoPlanStruct(
        vtoPlanId: castToType<int>(data['vto_plan_id']),
        vtoPlanRef: data['vto_plan_ref'] as DocumentReference?,
        vtoPoint: castToType<int>(data['vto_point']),
      );

  static UserCartVtoPlanStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCartVtoPlanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vto_plan_id': _vtoPlanId,
        'vto_plan_ref': _vtoPlanRef,
        'vto_point': _vtoPoint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vto_plan_id': serializeParam(
          _vtoPlanId,
          ParamType.int,
        ),
        'vto_plan_ref': serializeParam(
          _vtoPlanRef,
          ParamType.DocumentReference,
        ),
        'vto_point': serializeParam(
          _vtoPoint,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserCartVtoPlanStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserCartVtoPlanStruct(
        vtoPlanId: deserializeParam(
          data['vto_plan_id'],
          ParamType.int,
          false,
        ),
        vtoPlanRef: deserializeParam(
          data['vto_plan_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user_vto_plans'],
        ),
        vtoPoint: deserializeParam(
          data['vto_point'],
          ParamType.int,
          false,
        ),
      );

  static UserCartVtoPlanStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserCartVtoPlanStruct(
        vtoPlanId: convertAlgoliaParam(
          data['vto_plan_id'],
          ParamType.int,
          false,
        ),
        vtoPlanRef: convertAlgoliaParam(
          data['vto_plan_ref'],
          ParamType.DocumentReference,
          false,
        ),
        vtoPoint: convertAlgoliaParam(
          data['vto_point'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserCartVtoPlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCartVtoPlanStruct &&
        vtoPlanId == other.vtoPlanId &&
        vtoPlanRef == other.vtoPlanRef &&
        vtoPoint == other.vtoPoint;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([vtoPlanId, vtoPlanRef, vtoPoint]);
}

UserCartVtoPlanStruct createUserCartVtoPlanStruct({
  int? vtoPlanId,
  DocumentReference? vtoPlanRef,
  int? vtoPoint,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCartVtoPlanStruct(
      vtoPlanId: vtoPlanId,
      vtoPlanRef: vtoPlanRef,
      vtoPoint: vtoPoint,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCartVtoPlanStruct? updateUserCartVtoPlanStruct(
  UserCartVtoPlanStruct? userCartVtoPlan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCartVtoPlan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCartVtoPlanStructData(
  Map<String, dynamic> firestoreData,
  UserCartVtoPlanStruct? userCartVtoPlan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCartVtoPlan == null) {
    return;
  }
  if (userCartVtoPlan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userCartVtoPlan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCartVtoPlanData =
      getUserCartVtoPlanFirestoreData(userCartVtoPlan, forFieldValue);
  final nestedData =
      userCartVtoPlanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userCartVtoPlan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCartVtoPlanFirestoreData(
  UserCartVtoPlanStruct? userCartVtoPlan, [
  bool forFieldValue = false,
]) {
  if (userCartVtoPlan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCartVtoPlan.toMap());

  // Add any Firestore field values
  mapToFirestore(userCartVtoPlan.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCartVtoPlanListFirestoreData(
  List<UserCartVtoPlanStruct>? userCartVtoPlans,
) =>
    userCartVtoPlans
        ?.map((e) => getUserCartVtoPlanFirestoreData(e, true))
        .toList() ??
    [];
