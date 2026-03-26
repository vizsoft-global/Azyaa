// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedProductAttrbuitesStruct extends FFFirebaseStruct {
  SelectedProductAttrbuitesStruct({
    DocumentReference? productRef,
    String? productId,
    List<ProductAttributesNewStruct>? productAttribuites,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productRef = productRef,
        _productId = productId,
        _productAttribuites = productAttribuites,
        super(firestoreUtilData);

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "product_attribuites" field.
  List<ProductAttributesNewStruct>? _productAttribuites;
  List<ProductAttributesNewStruct> get productAttribuites =>
      _productAttribuites ?? const [];
  set productAttribuites(List<ProductAttributesNewStruct>? val) =>
      _productAttribuites = val;

  void updateProductAttribuites(
      Function(List<ProductAttributesNewStruct>) updateFn) {
    updateFn(_productAttribuites ??= []);
  }

  bool hasProductAttribuites() => _productAttribuites != null;

  static SelectedProductAttrbuitesStruct fromMap(Map<String, dynamic> data) =>
      SelectedProductAttrbuitesStruct(
        productRef: data['product_ref'] as DocumentReference?,
        productId: data['product_id'] as String?,
        productAttribuites: getStructList(
          data['product_attribuites'],
          ProductAttributesNewStruct.fromMap,
        ),
      );

  static SelectedProductAttrbuitesStruct? maybeFromMap(dynamic data) => data
          is Map
      ? SelectedProductAttrbuitesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_ref': _productRef,
        'product_id': _productId,
        'product_attribuites':
            _productAttribuites?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'product_attribuites': serializeParam(
          _productAttribuites,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SelectedProductAttrbuitesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SelectedProductAttrbuitesStruct(
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productAttribuites: deserializeStructParam<ProductAttributesNewStruct>(
          data['product_attribuites'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesNewStruct.fromSerializableMap,
        ),
      );

  static SelectedProductAttrbuitesStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SelectedProductAttrbuitesStruct(
        productRef: convertAlgoliaParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
        ),
        productId: convertAlgoliaParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productAttribuites: convertAlgoliaParam<ProductAttributesNewStruct>(
          data['product_attribuites'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesNewStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SelectedProductAttrbuitesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SelectedProductAttrbuitesStruct &&
        productRef == other.productRef &&
        productId == other.productId &&
        listEquality.equals(productAttribuites, other.productAttribuites);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([productRef, productId, productAttribuites]);
}

SelectedProductAttrbuitesStruct createSelectedProductAttrbuitesStruct({
  DocumentReference? productRef,
  String? productId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedProductAttrbuitesStruct(
      productRef: productRef,
      productId: productId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedProductAttrbuitesStruct? updateSelectedProductAttrbuitesStruct(
  SelectedProductAttrbuitesStruct? selectedProductAttrbuites, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedProductAttrbuites
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedProductAttrbuitesStructData(
  Map<String, dynamic> firestoreData,
  SelectedProductAttrbuitesStruct? selectedProductAttrbuites,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedProductAttrbuites == null) {
    return;
  }
  if (selectedProductAttrbuites.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      selectedProductAttrbuites.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedProductAttrbuitesData =
      getSelectedProductAttrbuitesFirestoreData(
          selectedProductAttrbuites, forFieldValue);
  final nestedData =
      selectedProductAttrbuitesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      selectedProductAttrbuites.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedProductAttrbuitesFirestoreData(
  SelectedProductAttrbuitesStruct? selectedProductAttrbuites, [
  bool forFieldValue = false,
]) {
  if (selectedProductAttrbuites == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedProductAttrbuites.toMap());

  // Add any Firestore field values
  selectedProductAttrbuites.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedProductAttrbuitesListFirestoreData(
  List<SelectedProductAttrbuitesStruct>? selectedProductAttrbuitess,
) =>
    selectedProductAttrbuitess
        ?.map((e) => getSelectedProductAttrbuitesFirestoreData(e, true))
        .toList() ??
    [];
