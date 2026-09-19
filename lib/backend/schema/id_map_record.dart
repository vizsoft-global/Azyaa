import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdMapRecord extends FirestoreRecord {
  IdMapRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  bool hasUserId() => _userId != null;

  // "measurement_id" field.
  int? _measurementId;
  int get measurementId => _measurementId ?? 0;
  bool hasMeasurementId() => _measurementId != null;

  // "relation_id" field.
  int? _relationId;
  int get relationId => _relationId ?? 0;
  bool hasRelationId() => _relationId != null;

  // "address_id" field.
  int? _addressId;
  int get addressId => _addressId ?? 0;
  bool hasAddressId() => _addressId != null;

  // "cart_id" field.
  int? _cartId;
  int get cartId => _cartId ?? 0;
  bool hasCartId() => _cartId != null;

  // "cart_item_id" field.
  int? _cartItemId;
  int get cartItemId => _cartItemId ?? 0;
  bool hasCartItemId() => _cartItemId != null;

  // "wishlist_id" field.
  int? _wishlistId;
  int get wishlistId => _wishlistId ?? 0;
  bool hasWishlistId() => _wishlistId != null;

  // "wishlist_item_id" field.
  int? _wishlistItemId;
  int get wishlistItemId => _wishlistItemId ?? 0;
  bool hasWishlistItemId() => _wishlistItemId != null;

  // "user_referral_id" field.
  int? _userReferralId;
  int get userReferralId => _userReferralId ?? 0;
  bool hasUserReferralId() => _userReferralId != null;

  // "designer_request_id" field.
  int? _designerRequestId;
  int get designerRequestId => _designerRequestId ?? 0;
  bool hasDesignerRequestId() => _designerRequestId != null;

  // "creator_request_id" field.
  int? _creatorRequestId;
  int get creatorRequestId => _creatorRequestId ?? 0;
  bool hasCreatorRequestId() => _creatorRequestId != null;

  // "order_id" field.
  int? _orderId;
  int get orderId => _orderId ?? 0;
  bool hasOrderId() => _orderId != null;

  // "form_id" field.
  int? _formId;
  int get formId => _formId ?? 0;
  bool hasFormId() => _formId != null;

  // "membership_id" field.
  int? _membershipId;
  int get membershipId => _membershipId ?? 0;
  bool hasMembershipId() => _membershipId != null;

  // "subscription_id" field.
  int? _subscriptionId;
  int get subscriptionId => _subscriptionId ?? 0;
  bool hasSubscriptionId() => _subscriptionId != null;

  // "review_id" field.
  int? _reviewId;
  int get reviewId => _reviewId ?? 0;
  bool hasReviewId() => _reviewId != null;

  // "promotion_id" field.
  int? _promotionId;
  int get promotionId => _promotionId ?? 0;
  bool hasPromotionId() => _promotionId != null;

  // "preferences_id" field.
  int? _preferencesId;
  int get preferencesId => _preferencesId ?? 0;
  bool hasPreferencesId() => _preferencesId != null;

  // "user_waitlist_id" field.
  int? _userWaitlistId;
  int get userWaitlistId => _userWaitlistId ?? 0;
  bool hasUserWaitlistId() => _userWaitlistId != null;

  // "return_request_id" field.
  int? _returnRequestId;
  int get returnRequestId => _returnRequestId ?? 0;
  bool hasReturnRequestId() => _returnRequestId != null;

  // "vto_id" field.
  int? _vtoId;
  int get vtoId => _vtoId ?? 0;
  bool hasVtoId() => _vtoId != null;

  // "sale_history_id" field.
  int? _saleHistoryId;
  int get saleHistoryId => _saleHistoryId ?? 0;
  bool hasSaleHistoryId() => _saleHistoryId != null;

  // "notification_id" field.
  int? _notificationId;
  int get notificationId => _notificationId ?? 0;
  bool hasNotificationId() => _notificationId != null;

  // "share_link_id" field.
  int? _shareLinkId;
  int get shareLinkId => _shareLinkId ?? 0;
  bool hasShareLinkId() => _shareLinkId != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _userId = castToType<int>(snapshotData['user_id']);
    _measurementId = castToType<int>(snapshotData['measurement_id']);
    _relationId = castToType<int>(snapshotData['relation_id']);
    _addressId = castToType<int>(snapshotData['address_id']);
    _cartId = castToType<int>(snapshotData['cart_id']);
    _cartItemId = castToType<int>(snapshotData['cart_item_id']);
    _wishlistId = castToType<int>(snapshotData['wishlist_id']);
    _wishlistItemId = castToType<int>(snapshotData['wishlist_item_id']);
    _userReferralId = castToType<int>(snapshotData['user_referral_id']);
    _designerRequestId = castToType<int>(snapshotData['designer_request_id']);
    _creatorRequestId = castToType<int>(snapshotData['creator_request_id']);
    _orderId = castToType<int>(snapshotData['order_id']);
    _formId = castToType<int>(snapshotData['form_id']);
    _membershipId = castToType<int>(snapshotData['membership_id']);
    _subscriptionId = castToType<int>(snapshotData['subscription_id']);
    _reviewId = castToType<int>(snapshotData['review_id']);
    _promotionId = castToType<int>(snapshotData['promotion_id']);
    _preferencesId = castToType<int>(snapshotData['preferences_id']);
    _userWaitlistId = castToType<int>(snapshotData['user_waitlist_id']);
    _returnRequestId = castToType<int>(snapshotData['return_request_id']);
    _vtoId = castToType<int>(snapshotData['vto_id']);
    _saleHistoryId = castToType<int>(snapshotData['sale_history_id']);
    _notificationId = castToType<int>(snapshotData['notification_id']);
    _shareLinkId = castToType<int>(snapshotData['share_link_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('id_map');

  static Stream<IdMapRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdMapRecord.fromSnapshot(s));

  static Future<IdMapRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdMapRecord.fromSnapshot(s));

  static IdMapRecord fromSnapshot(DocumentSnapshot snapshot) => IdMapRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdMapRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdMapRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdMapRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdMapRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdMapRecordData({
  String? type,
  int? userId,
  int? measurementId,
  int? relationId,
  int? addressId,
  int? cartId,
  int? cartItemId,
  int? wishlistId,
  int? wishlistItemId,
  int? userReferralId,
  int? designerRequestId,
  int? creatorRequestId,
  int? orderId,
  int? formId,
  int? membershipId,
  int? subscriptionId,
  int? reviewId,
  int? promotionId,
  int? preferencesId,
  int? userWaitlistId,
  int? returnRequestId,
  int? vtoId,
  int? saleHistoryId,
  int? notificationId,
  int? shareLinkId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'user_id': userId,
      'measurement_id': measurementId,
      'relation_id': relationId,
      'address_id': addressId,
      'cart_id': cartId,
      'cart_item_id': cartItemId,
      'wishlist_id': wishlistId,
      'wishlist_item_id': wishlistItemId,
      'user_referral_id': userReferralId,
      'designer_request_id': designerRequestId,
      'creator_request_id': creatorRequestId,
      'order_id': orderId,
      'form_id': formId,
      'membership_id': membershipId,
      'subscription_id': subscriptionId,
      'review_id': reviewId,
      'promotion_id': promotionId,
      'preferences_id': preferencesId,
      'user_waitlist_id': userWaitlistId,
      'return_request_id': returnRequestId,
      'vto_id': vtoId,
      'sale_history_id': saleHistoryId,
      'notification_id': notificationId,
      'share_link_id': shareLinkId,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdMapRecordDocumentEquality implements Equality<IdMapRecord> {
  const IdMapRecordDocumentEquality();

  @override
  bool equals(IdMapRecord? e1, IdMapRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.userId == e2?.userId &&
        e1?.measurementId == e2?.measurementId &&
        e1?.relationId == e2?.relationId &&
        e1?.addressId == e2?.addressId &&
        e1?.cartId == e2?.cartId &&
        e1?.cartItemId == e2?.cartItemId &&
        e1?.wishlistId == e2?.wishlistId &&
        e1?.wishlistItemId == e2?.wishlistItemId &&
        e1?.userReferralId == e2?.userReferralId &&
        e1?.designerRequestId == e2?.designerRequestId &&
        e1?.creatorRequestId == e2?.creatorRequestId &&
        e1?.orderId == e2?.orderId &&
        e1?.formId == e2?.formId &&
        e1?.membershipId == e2?.membershipId &&
        e1?.subscriptionId == e2?.subscriptionId &&
        e1?.reviewId == e2?.reviewId &&
        e1?.promotionId == e2?.promotionId &&
        e1?.preferencesId == e2?.preferencesId &&
        e1?.userWaitlistId == e2?.userWaitlistId &&
        e1?.returnRequestId == e2?.returnRequestId &&
        e1?.vtoId == e2?.vtoId &&
        e1?.saleHistoryId == e2?.saleHistoryId &&
        e1?.notificationId == e2?.notificationId &&
        e1?.shareLinkId == e2?.shareLinkId;
  }

  @override
  int hash(IdMapRecord? e) => const ListEquality().hash([
        e?.type,
        e?.userId,
        e?.measurementId,
        e?.relationId,
        e?.addressId,
        e?.cartId,
        e?.cartItemId,
        e?.wishlistId,
        e?.wishlistItemId,
        e?.userReferralId,
        e?.designerRequestId,
        e?.creatorRequestId,
        e?.orderId,
        e?.formId,
        e?.membershipId,
        e?.subscriptionId,
        e?.reviewId,
        e?.promotionId,
        e?.preferencesId,
        e?.userWaitlistId,
        e?.returnRequestId,
        e?.vtoId,
        e?.saleHistoryId,
        e?.notificationId,
        e?.shareLinkId
      ]);

  @override
  bool isValidKey(Object? o) => o is IdMapRecord;
}
