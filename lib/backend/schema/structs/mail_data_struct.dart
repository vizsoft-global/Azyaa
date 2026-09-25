// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MailDataStruct extends FFFirebaseStruct {
  MailDataStruct({
    String? name,
    String? orderId,
    String? storeName,
    String? storeAddress,
    String? storeCity,
    String? storeCountry,
    String? storePhone,
    String? orderTime,
    String? paymentMethod,
    String? subtotal,
    String? total,
    String? deliveryCharge,
    String? deliveryName,
    String? deliveryAddress,
    String? deliveryCity,
    String? deliveryCountry,
    String? deliveryPhone,
    List<EmailProductDataStruct>? purchasedItems,
    String? email,
    String? couponSave,
    String? supportEmail,
    String? supportPhone,
    String? wallet,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _orderId = orderId,
        _storeName = storeName,
        _storeAddress = storeAddress,
        _storeCity = storeCity,
        _storeCountry = storeCountry,
        _storePhone = storePhone,
        _orderTime = orderTime,
        _paymentMethod = paymentMethod,
        _subtotal = subtotal,
        _total = total,
        _deliveryCharge = deliveryCharge,
        _deliveryName = deliveryName,
        _deliveryAddress = deliveryAddress,
        _deliveryCity = deliveryCity,
        _deliveryCountry = deliveryCountry,
        _deliveryPhone = deliveryPhone,
        _purchasedItems = purchasedItems,
        _email = email,
        _couponSave = couponSave,
        _supportEmail = supportEmail,
        _supportPhone = supportPhone,
        _wallet = wallet,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "store_name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  set storeName(String? val) => _storeName = val;

  bool hasStoreName() => _storeName != null;

  // "store_address" field.
  String? _storeAddress;
  String get storeAddress => _storeAddress ?? '';
  set storeAddress(String? val) => _storeAddress = val;

  bool hasStoreAddress() => _storeAddress != null;

  // "store_city" field.
  String? _storeCity;
  String get storeCity => _storeCity ?? '';
  set storeCity(String? val) => _storeCity = val;

  bool hasStoreCity() => _storeCity != null;

  // "store_country" field.
  String? _storeCountry;
  String get storeCountry => _storeCountry ?? '';
  set storeCountry(String? val) => _storeCountry = val;

  bool hasStoreCountry() => _storeCountry != null;

  // "store_phone" field.
  String? _storePhone;
  String get storePhone => _storePhone ?? '';
  set storePhone(String? val) => _storePhone = val;

  bool hasStorePhone() => _storePhone != null;

  // "order_time" field.
  String? _orderTime;
  String get orderTime => _orderTime ?? '';
  set orderTime(String? val) => _orderTime = val;

  bool hasOrderTime() => _orderTime != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  // "subtotal" field.
  String? _subtotal;
  String get subtotal => _subtotal ?? '';
  set subtotal(String? val) => _subtotal = val;

  bool hasSubtotal() => _subtotal != null;

  // "total" field.
  String? _total;
  String get total => _total ?? '';
  set total(String? val) => _total = val;

  bool hasTotal() => _total != null;

  // "delivery_charge" field.
  String? _deliveryCharge;
  String get deliveryCharge => _deliveryCharge ?? '';
  set deliveryCharge(String? val) => _deliveryCharge = val;

  bool hasDeliveryCharge() => _deliveryCharge != null;

  // "delivery_name" field.
  String? _deliveryName;
  String get deliveryName => _deliveryName ?? '';
  set deliveryName(String? val) => _deliveryName = val;

  bool hasDeliveryName() => _deliveryName != null;

  // "delivery_address" field.
  String? _deliveryAddress;
  String get deliveryAddress => _deliveryAddress ?? '';
  set deliveryAddress(String? val) => _deliveryAddress = val;

  bool hasDeliveryAddress() => _deliveryAddress != null;

  // "delivery_city" field.
  String? _deliveryCity;
  String get deliveryCity => _deliveryCity ?? '';
  set deliveryCity(String? val) => _deliveryCity = val;

  bool hasDeliveryCity() => _deliveryCity != null;

  // "delivery_country" field.
  String? _deliveryCountry;
  String get deliveryCountry => _deliveryCountry ?? '';
  set deliveryCountry(String? val) => _deliveryCountry = val;

  bool hasDeliveryCountry() => _deliveryCountry != null;

  // "delivery_phone" field.
  String? _deliveryPhone;
  String get deliveryPhone => _deliveryPhone ?? '';
  set deliveryPhone(String? val) => _deliveryPhone = val;

  bool hasDeliveryPhone() => _deliveryPhone != null;

  // "purchased_items" field.
  List<EmailProductDataStruct>? _purchasedItems;
  List<EmailProductDataStruct> get purchasedItems =>
      _purchasedItems ?? const [];
  set purchasedItems(List<EmailProductDataStruct>? val) =>
      _purchasedItems = val;

  void updatePurchasedItems(Function(List<EmailProductDataStruct>) updateFn) {
    updateFn(_purchasedItems ??= []);
  }

  bool hasPurchasedItems() => _purchasedItems != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "coupon_save" field.
  String? _couponSave;
  String get couponSave => _couponSave ?? '';
  set couponSave(String? val) => _couponSave = val;

  bool hasCouponSave() => _couponSave != null;

  // "support_email" field.
  String? _supportEmail;
  String get supportEmail => _supportEmail ?? '';
  set supportEmail(String? val) => _supportEmail = val;

  bool hasSupportEmail() => _supportEmail != null;

  // "support_phone" field.
  String? _supportPhone;
  String get supportPhone => _supportPhone ?? '';
  set supportPhone(String? val) => _supportPhone = val;

  bool hasSupportPhone() => _supportPhone != null;

  // "wallet" field.
  String? _wallet;
  String get wallet => _wallet ?? '';
  set wallet(String? val) => _wallet = val;

  bool hasWallet() => _wallet != null;

  static MailDataStruct fromMap(Map<String, dynamic> data) => MailDataStruct(
        name: data['name'] as String?,
        orderId: data['order_id'] as String?,
        storeName: data['store_name'] as String?,
        storeAddress: data['store_address'] as String?,
        storeCity: data['store_city'] as String?,
        storeCountry: data['store_country'] as String?,
        storePhone: data['store_phone'] as String?,
        orderTime: data['order_time'] as String?,
        paymentMethod: data['payment_method'] as String?,
        subtotal: data['subtotal'] as String?,
        total: data['total'] as String?,
        deliveryCharge: data['delivery_charge'] as String?,
        deliveryName: data['delivery_name'] as String?,
        deliveryAddress: data['delivery_address'] as String?,
        deliveryCity: data['delivery_city'] as String?,
        deliveryCountry: data['delivery_country'] as String?,
        deliveryPhone: data['delivery_phone'] as String?,
        purchasedItems: getStructList(
          data['purchased_items'],
          EmailProductDataStruct.fromMap,
        ),
        email: data['email'] as String?,
        couponSave: data['coupon_save'] as String?,
        supportEmail: data['support_email'] as String?,
        supportPhone: data['support_phone'] as String?,
        wallet: data['wallet'] as String?,
      );

  static MailDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MailDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'order_id': _orderId,
        'store_name': _storeName,
        'store_address': _storeAddress,
        'store_city': _storeCity,
        'store_country': _storeCountry,
        'store_phone': _storePhone,
        'order_time': _orderTime,
        'payment_method': _paymentMethod,
        'subtotal': _subtotal,
        'total': _total,
        'delivery_charge': _deliveryCharge,
        'delivery_name': _deliveryName,
        'delivery_address': _deliveryAddress,
        'delivery_city': _deliveryCity,
        'delivery_country': _deliveryCountry,
        'delivery_phone': _deliveryPhone,
        'purchased_items': _purchasedItems?.map((e) => e.toMap()).toList(),
        'email': _email,
        'coupon_save': _couponSave,
        'support_email': _supportEmail,
        'support_phone': _supportPhone,
        'wallet': _wallet,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'order_id': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'store_name': serializeParam(
          _storeName,
          ParamType.String,
        ),
        'store_address': serializeParam(
          _storeAddress,
          ParamType.String,
        ),
        'store_city': serializeParam(
          _storeCity,
          ParamType.String,
        ),
        'store_country': serializeParam(
          _storeCountry,
          ParamType.String,
        ),
        'store_phone': serializeParam(
          _storePhone,
          ParamType.String,
        ),
        'order_time': serializeParam(
          _orderTime,
          ParamType.String,
        ),
        'payment_method': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
        'subtotal': serializeParam(
          _subtotal,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.String,
        ),
        'delivery_charge': serializeParam(
          _deliveryCharge,
          ParamType.String,
        ),
        'delivery_name': serializeParam(
          _deliveryName,
          ParamType.String,
        ),
        'delivery_address': serializeParam(
          _deliveryAddress,
          ParamType.String,
        ),
        'delivery_city': serializeParam(
          _deliveryCity,
          ParamType.String,
        ),
        'delivery_country': serializeParam(
          _deliveryCountry,
          ParamType.String,
        ),
        'delivery_phone': serializeParam(
          _deliveryPhone,
          ParamType.String,
        ),
        'purchased_items': serializeParam(
          _purchasedItems,
          ParamType.DataStruct,
          isList: true,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'coupon_save': serializeParam(
          _couponSave,
          ParamType.String,
        ),
        'support_email': serializeParam(
          _supportEmail,
          ParamType.String,
        ),
        'support_phone': serializeParam(
          _supportPhone,
          ParamType.String,
        ),
        'wallet': serializeParam(
          _wallet,
          ParamType.String,
        ),
      }.withoutNulls;

  static MailDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MailDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        orderId: deserializeParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        storeName: deserializeParam(
          data['store_name'],
          ParamType.String,
          false,
        ),
        storeAddress: deserializeParam(
          data['store_address'],
          ParamType.String,
          false,
        ),
        storeCity: deserializeParam(
          data['store_city'],
          ParamType.String,
          false,
        ),
        storeCountry: deserializeParam(
          data['store_country'],
          ParamType.String,
          false,
        ),
        storePhone: deserializeParam(
          data['store_phone'],
          ParamType.String,
          false,
        ),
        orderTime: deserializeParam(
          data['order_time'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.String,
          false,
        ),
        deliveryCharge: deserializeParam(
          data['delivery_charge'],
          ParamType.String,
          false,
        ),
        deliveryName: deserializeParam(
          data['delivery_name'],
          ParamType.String,
          false,
        ),
        deliveryAddress: deserializeParam(
          data['delivery_address'],
          ParamType.String,
          false,
        ),
        deliveryCity: deserializeParam(
          data['delivery_city'],
          ParamType.String,
          false,
        ),
        deliveryCountry: deserializeParam(
          data['delivery_country'],
          ParamType.String,
          false,
        ),
        deliveryPhone: deserializeParam(
          data['delivery_phone'],
          ParamType.String,
          false,
        ),
        purchasedItems: deserializeStructParam<EmailProductDataStruct>(
          data['purchased_items'],
          ParamType.DataStruct,
          true,
          structBuilder: EmailProductDataStruct.fromSerializableMap,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        couponSave: deserializeParam(
          data['coupon_save'],
          ParamType.String,
          false,
        ),
        supportEmail: deserializeParam(
          data['support_email'],
          ParamType.String,
          false,
        ),
        supportPhone: deserializeParam(
          data['support_phone'],
          ParamType.String,
          false,
        ),
        wallet: deserializeParam(
          data['wallet'],
          ParamType.String,
          false,
        ),
      );

  static MailDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MailDataStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        orderId: convertAlgoliaParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        storeName: convertAlgoliaParam(
          data['store_name'],
          ParamType.String,
          false,
        ),
        storeAddress: convertAlgoliaParam(
          data['store_address'],
          ParamType.String,
          false,
        ),
        storeCity: convertAlgoliaParam(
          data['store_city'],
          ParamType.String,
          false,
        ),
        storeCountry: convertAlgoliaParam(
          data['store_country'],
          ParamType.String,
          false,
        ),
        storePhone: convertAlgoliaParam(
          data['store_phone'],
          ParamType.String,
          false,
        ),
        orderTime: convertAlgoliaParam(
          data['order_time'],
          ParamType.String,
          false,
        ),
        paymentMethod: convertAlgoliaParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        subtotal: convertAlgoliaParam(
          data['subtotal'],
          ParamType.String,
          false,
        ),
        total: convertAlgoliaParam(
          data['total'],
          ParamType.String,
          false,
        ),
        deliveryCharge: convertAlgoliaParam(
          data['delivery_charge'],
          ParamType.String,
          false,
        ),
        deliveryName: convertAlgoliaParam(
          data['delivery_name'],
          ParamType.String,
          false,
        ),
        deliveryAddress: convertAlgoliaParam(
          data['delivery_address'],
          ParamType.String,
          false,
        ),
        deliveryCity: convertAlgoliaParam(
          data['delivery_city'],
          ParamType.String,
          false,
        ),
        deliveryCountry: convertAlgoliaParam(
          data['delivery_country'],
          ParamType.String,
          false,
        ),
        deliveryPhone: convertAlgoliaParam(
          data['delivery_phone'],
          ParamType.String,
          false,
        ),
        purchasedItems: convertAlgoliaParam<EmailProductDataStruct>(
          data['purchased_items'],
          ParamType.DataStruct,
          true,
          structBuilder: EmailProductDataStruct.fromAlgoliaData,
        ),
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        couponSave: convertAlgoliaParam(
          data['coupon_save'],
          ParamType.String,
          false,
        ),
        supportEmail: convertAlgoliaParam(
          data['support_email'],
          ParamType.String,
          false,
        ),
        supportPhone: convertAlgoliaParam(
          data['support_phone'],
          ParamType.String,
          false,
        ),
        wallet: convertAlgoliaParam(
          data['wallet'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MailDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MailDataStruct &&
        name == other.name &&
        orderId == other.orderId &&
        storeName == other.storeName &&
        storeAddress == other.storeAddress &&
        storeCity == other.storeCity &&
        storeCountry == other.storeCountry &&
        storePhone == other.storePhone &&
        orderTime == other.orderTime &&
        paymentMethod == other.paymentMethod &&
        subtotal == other.subtotal &&
        total == other.total &&
        deliveryCharge == other.deliveryCharge &&
        deliveryName == other.deliveryName &&
        deliveryAddress == other.deliveryAddress &&
        deliveryCity == other.deliveryCity &&
        deliveryCountry == other.deliveryCountry &&
        deliveryPhone == other.deliveryPhone &&
        listEquality.equals(purchasedItems, other.purchasedItems) &&
        email == other.email &&
        couponSave == other.couponSave &&
        supportEmail == other.supportEmail &&
        supportPhone == other.supportPhone &&
        wallet == other.wallet;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        orderId,
        storeName,
        storeAddress,
        storeCity,
        storeCountry,
        storePhone,
        orderTime,
        paymentMethod,
        subtotal,
        total,
        deliveryCharge,
        deliveryName,
        deliveryAddress,
        deliveryCity,
        deliveryCountry,
        deliveryPhone,
        purchasedItems,
        email,
        couponSave,
        supportEmail,
        supportPhone,
        wallet
      ]);
}

MailDataStruct createMailDataStruct({
  String? name,
  String? orderId,
  String? storeName,
  String? storeAddress,
  String? storeCity,
  String? storeCountry,
  String? storePhone,
  String? orderTime,
  String? paymentMethod,
  String? subtotal,
  String? total,
  String? deliveryCharge,
  String? deliveryName,
  String? deliveryAddress,
  String? deliveryCity,
  String? deliveryCountry,
  String? deliveryPhone,
  String? email,
  String? couponSave,
  String? supportEmail,
  String? supportPhone,
  String? wallet,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MailDataStruct(
      name: name,
      orderId: orderId,
      storeName: storeName,
      storeAddress: storeAddress,
      storeCity: storeCity,
      storeCountry: storeCountry,
      storePhone: storePhone,
      orderTime: orderTime,
      paymentMethod: paymentMethod,
      subtotal: subtotal,
      total: total,
      deliveryCharge: deliveryCharge,
      deliveryName: deliveryName,
      deliveryAddress: deliveryAddress,
      deliveryCity: deliveryCity,
      deliveryCountry: deliveryCountry,
      deliveryPhone: deliveryPhone,
      email: email,
      couponSave: couponSave,
      supportEmail: supportEmail,
      supportPhone: supportPhone,
      wallet: wallet,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MailDataStruct? updateMailDataStruct(
  MailDataStruct? mailData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mailData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMailDataStructData(
  Map<String, dynamic> firestoreData,
  MailDataStruct? mailData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mailData == null) {
    return;
  }
  if (mailData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mailData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mailDataData = getMailDataFirestoreData(mailData, forFieldValue);
  final nestedData = mailDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mailData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMailDataFirestoreData(
  MailDataStruct? mailData, [
  bool forFieldValue = false,
]) {
  if (mailData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mailData.toMap());

  // Add any Firestore field values
  mapToFirestore(mailData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMailDataListFirestoreData(
  List<MailDataStruct>? mailDatas,
) =>
    mailDatas?.map((e) => getMailDataFirestoreData(e, true)).toList() ?? [];
