import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TryonRequestsRecord extends FirestoreRecord {
  TryonRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  bool hasResult() => _result != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "person_image" field.
  String? _personImage;
  String get personImage => _personImage ?? '';
  bool hasPersonImage() => _personImage != null;

  // "outfit_image" field.
  String? _outfitImage;
  String get outfitImage => _outfitImage ?? '';
  bool hasOutfitImage() => _outfitImage != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _result = snapshotData['result'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userId = snapshotData['user_id'] as String?;
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _personImage = snapshotData['person_image'] as String?;
    _outfitImage = snapshotData['outfit_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tryon_requests');

  static Stream<TryonRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TryonRequestsRecord.fromSnapshot(s));

  static Future<TryonRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TryonRequestsRecord.fromSnapshot(s));

  static TryonRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TryonRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TryonRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TryonRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TryonRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TryonRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTryonRequestsRecordData({
  String? id,
  String? result,
  String? status,
  DateTime? createdAt,
  String? userId,
  DocumentReference? productRef,
  String? personImage,
  String? outfitImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'result': result,
      'status': status,
      'created_at': createdAt,
      'user_id': userId,
      'product_ref': productRef,
      'person_image': personImage,
      'outfit_image': outfitImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class TryonRequestsRecordDocumentEquality
    implements Equality<TryonRequestsRecord> {
  const TryonRequestsRecordDocumentEquality();

  @override
  bool equals(TryonRequestsRecord? e1, TryonRequestsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.result == e2?.result &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userId == e2?.userId &&
        e1?.productRef == e2?.productRef &&
        e1?.personImage == e2?.personImage &&
        e1?.outfitImage == e2?.outfitImage;
  }

  @override
  int hash(TryonRequestsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.result,
        e?.status,
        e?.createdAt,
        e?.userId,
        e?.productRef,
        e?.personImage,
        e?.outfitImage
      ]);

  @override
  bool isValidKey(Object? o) => o is TryonRequestsRecord;
}
