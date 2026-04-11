// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmailProductDataStruct extends FFFirebaseStruct {
  EmailProductDataStruct({
    String? productName,
    String? productQty,
    String? productPrice,
    String? unit,
    String? productSize,
    String? productColor,
    String? productImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productName = productName,
        _productQty = productQty,
        _productPrice = productPrice,
        _unit = unit,
        _productSize = productSize,
        _productColor = productColor,
        _productImage = productImage,
        super(firestoreUtilData);

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "product_qty" field.
  String? _productQty;
  String get productQty => _productQty ?? '';
  set productQty(String? val) => _productQty = val;

  bool hasProductQty() => _productQty != null;

  // "product_price" field.
  String? _productPrice;
  String get productPrice => _productPrice ?? '';
  set productPrice(String? val) => _productPrice = val;

  bool hasProductPrice() => _productPrice != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;

  bool hasUnit() => _unit != null;

  // "product_size" field.
  String? _productSize;
  String get productSize => _productSize ?? '';
  set productSize(String? val) => _productSize = val;

  bool hasProductSize() => _productSize != null;

  // "product_color" field.
  String? _productColor;
  String get productColor => _productColor ?? '';
  set productColor(String? val) => _productColor = val;

  bool hasProductColor() => _productColor != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  set productImage(String? val) => _productImage = val;

  bool hasProductImage() => _productImage != null;

  static EmailProductDataStruct fromMap(Map<String, dynamic> data) =>
      EmailProductDataStruct(
        productName: data['product_name'] as String?,
        productQty: data['product_qty'] as String?,
        productPrice: data['product_price'] as String?,
        unit: data['unit'] as String?,
        productSize: data['product_size'] as String?,
        productColor: data['product_color'] as String?,
        productImage: data['product_image'] as String?,
      );

  static EmailProductDataStruct? maybeFromMap(dynamic data) => data is Map
      ? EmailProductDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_name': _productName,
        'product_qty': _productQty,
        'product_price': _productPrice,
        'unit': _unit,
        'product_size': _productSize,
        'product_color': _productColor,
        'product_image': _productImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'product_qty': serializeParam(
          _productQty,
          ParamType.String,
        ),
        'product_price': serializeParam(
          _productPrice,
          ParamType.String,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'product_size': serializeParam(
          _productSize,
          ParamType.String,
        ),
        'product_color': serializeParam(
          _productColor,
          ParamType.String,
        ),
        'product_image': serializeParam(
          _productImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static EmailProductDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EmailProductDataStruct(
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        productQty: deserializeParam(
          data['product_qty'],
          ParamType.String,
          false,
        ),
        productPrice: deserializeParam(
          data['product_price'],
          ParamType.String,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        productSize: deserializeParam(
          data['product_size'],
          ParamType.String,
          false,
        ),
        productColor: deserializeParam(
          data['product_color'],
          ParamType.String,
          false,
        ),
        productImage: deserializeParam(
          data['product_image'],
          ParamType.String,
          false,
        ),
      );

  static EmailProductDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EmailProductDataStruct(
        productName: convertAlgoliaParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        productQty: convertAlgoliaParam(
          data['product_qty'],
          ParamType.String,
          false,
        ),
        productPrice: convertAlgoliaParam(
          data['product_price'],
          ParamType.String,
          false,
        ),
        unit: convertAlgoliaParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        productSize: convertAlgoliaParam(
          data['product_size'],
          ParamType.String,
          false,
        ),
        productColor: convertAlgoliaParam(
          data['product_color'],
          ParamType.String,
          false,
        ),
        productImage: convertAlgoliaParam(
          data['product_image'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EmailProductDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmailProductDataStruct &&
        productName == other.productName &&
        productQty == other.productQty &&
        productPrice == other.productPrice &&
        unit == other.unit &&
        productSize == other.productSize &&
        productColor == other.productColor &&
        productImage == other.productImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productName,
        productQty,
        productPrice,
        unit,
        productSize,
        productColor,
        productImage
      ]);
}

EmailProductDataStruct createEmailProductDataStruct({
  String? productName,
  String? productQty,
  String? productPrice,
  String? unit,
  String? productSize,
  String? productColor,
  String? productImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmailProductDataStruct(
      productName: productName,
      productQty: productQty,
      productPrice: productPrice,
      unit: unit,
      productSize: productSize,
      productColor: productColor,
      productImage: productImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmailProductDataStruct? updateEmailProductDataStruct(
  EmailProductDataStruct? emailProductData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    emailProductData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmailProductDataStructData(
  Map<String, dynamic> firestoreData,
  EmailProductDataStruct? emailProductData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (emailProductData == null) {
    return;
  }
  if (emailProductData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && emailProductData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final emailProductDataData =
      getEmailProductDataFirestoreData(emailProductData, forFieldValue);
  final nestedData =
      emailProductDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = emailProductData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmailProductDataFirestoreData(
  EmailProductDataStruct? emailProductData, [
  bool forFieldValue = false,
]) {
  if (emailProductData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(emailProductData.toMap());

  // Add any Firestore field values
  mapToFirestore(emailProductData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmailProductDataListFirestoreData(
  List<EmailProductDataStruct>? emailProductDatas,
) =>
    emailProductDatas
        ?.map((e) => getEmailProductDataFirestoreData(e, true))
        .toList() ??
    [];
