// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFiltersStruct extends FFFirebaseStruct {
  UserFiltersStruct({
    String? filterStatus,
    String? productType,
    int? categoryCount,
    List<String>? categoryId,
    int? productCount,
    List<String>? productId,
    int? attributeCount,
    List<String>? attributeId,
    int? brandCount,
    List<String>? brandId,
    String? sortStatus,
    bool? isSortNewer,
    bool? isSortPopular,
    bool? isSortRecommended,
    bool? isSortLtoH,
    bool? isSortHtoL,
    String? priceRange,
    double? priceMinimum,
    double? priceMaximum,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _filterStatus = filterStatus,
        _productType = productType,
        _categoryCount = categoryCount,
        _categoryId = categoryId,
        _productCount = productCount,
        _productId = productId,
        _attributeCount = attributeCount,
        _attributeId = attributeId,
        _brandCount = brandCount,
        _brandId = brandId,
        _sortStatus = sortStatus,
        _isSortNewer = isSortNewer,
        _isSortPopular = isSortPopular,
        _isSortRecommended = isSortRecommended,
        _isSortLtoH = isSortLtoH,
        _isSortHtoL = isSortHtoL,
        _priceRange = priceRange,
        _priceMinimum = priceMinimum,
        _priceMaximum = priceMaximum,
        super(firestoreUtilData);

  // "filter_status" field.
  String? _filterStatus;
  String get filterStatus => _filterStatus ?? '';
  set filterStatus(String? val) => _filterStatus = val;

  bool hasFilterStatus() => _filterStatus != null;

  // "product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  set productType(String? val) => _productType = val;

  bool hasProductType() => _productType != null;

  // "category_count" field.
  int? _categoryCount;
  int get categoryCount => _categoryCount ?? 0;
  set categoryCount(int? val) => _categoryCount = val;

  void incrementCategoryCount(int amount) =>
      categoryCount = categoryCount + amount;

  bool hasCategoryCount() => _categoryCount != null;

  // "category_id" field.
  List<String>? _categoryId;
  List<String> get categoryId => _categoryId ?? const [];
  set categoryId(List<String>? val) => _categoryId = val;

  void updateCategoryId(Function(List<String>) updateFn) {
    updateFn(_categoryId ??= []);
  }

  bool hasCategoryId() => _categoryId != null;

  // "product_count" field.
  int? _productCount;
  int get productCount => _productCount ?? 0;
  set productCount(int? val) => _productCount = val;

  void incrementProductCount(int amount) =>
      productCount = productCount + amount;

  bool hasProductCount() => _productCount != null;

  // "product_id" field.
  List<String>? _productId;
  List<String> get productId => _productId ?? const [];
  set productId(List<String>? val) => _productId = val;

  void updateProductId(Function(List<String>) updateFn) {
    updateFn(_productId ??= []);
  }

  bool hasProductId() => _productId != null;

  // "attribute_count" field.
  int? _attributeCount;
  int get attributeCount => _attributeCount ?? 0;
  set attributeCount(int? val) => _attributeCount = val;

  void incrementAttributeCount(int amount) =>
      attributeCount = attributeCount + amount;

  bool hasAttributeCount() => _attributeCount != null;

  // "attribute_id" field.
  List<String>? _attributeId;
  List<String> get attributeId => _attributeId ?? const [];
  set attributeId(List<String>? val) => _attributeId = val;

  void updateAttributeId(Function(List<String>) updateFn) {
    updateFn(_attributeId ??= []);
  }

  bool hasAttributeId() => _attributeId != null;

  // "brand_count" field.
  int? _brandCount;
  int get brandCount => _brandCount ?? 0;
  set brandCount(int? val) => _brandCount = val;

  void incrementBrandCount(int amount) => brandCount = brandCount + amount;

  bool hasBrandCount() => _brandCount != null;

  // "brand_id" field.
  List<String>? _brandId;
  List<String> get brandId => _brandId ?? const [];
  set brandId(List<String>? val) => _brandId = val;

  void updateBrandId(Function(List<String>) updateFn) {
    updateFn(_brandId ??= []);
  }

  bool hasBrandId() => _brandId != null;

  // "sort_status" field.
  String? _sortStatus;
  String get sortStatus => _sortStatus ?? '';
  set sortStatus(String? val) => _sortStatus = val;

  bool hasSortStatus() => _sortStatus != null;

  // "is_sort_newer" field.
  bool? _isSortNewer;
  bool get isSortNewer => _isSortNewer ?? false;
  set isSortNewer(bool? val) => _isSortNewer = val;

  bool hasIsSortNewer() => _isSortNewer != null;

  // "is_sort_popular" field.
  bool? _isSortPopular;
  bool get isSortPopular => _isSortPopular ?? false;
  set isSortPopular(bool? val) => _isSortPopular = val;

  bool hasIsSortPopular() => _isSortPopular != null;

  // "is_sort_recommended" field.
  bool? _isSortRecommended;
  bool get isSortRecommended => _isSortRecommended ?? false;
  set isSortRecommended(bool? val) => _isSortRecommended = val;

  bool hasIsSortRecommended() => _isSortRecommended != null;

  // "is_sort_LtoH" field.
  bool? _isSortLtoH;
  bool get isSortLtoH => _isSortLtoH ?? false;
  set isSortLtoH(bool? val) => _isSortLtoH = val;

  bool hasIsSortLtoH() => _isSortLtoH != null;

  // "is_sort_HtoL" field.
  bool? _isSortHtoL;
  bool get isSortHtoL => _isSortHtoL ?? false;
  set isSortHtoL(bool? val) => _isSortHtoL = val;

  bool hasIsSortHtoL() => _isSortHtoL != null;

  // "price_range" field.
  String? _priceRange;
  String get priceRange => _priceRange ?? '';
  set priceRange(String? val) => _priceRange = val;

  bool hasPriceRange() => _priceRange != null;

  // "price_minimum" field.
  double? _priceMinimum;
  double get priceMinimum => _priceMinimum ?? 0.0;
  set priceMinimum(double? val) => _priceMinimum = val;

  void incrementPriceMinimum(double amount) =>
      priceMinimum = priceMinimum + amount;

  bool hasPriceMinimum() => _priceMinimum != null;

  // "price_maximum" field.
  double? _priceMaximum;
  double get priceMaximum => _priceMaximum ?? 0.0;
  set priceMaximum(double? val) => _priceMaximum = val;

  void incrementPriceMaximum(double amount) =>
      priceMaximum = priceMaximum + amount;

  bool hasPriceMaximum() => _priceMaximum != null;

  static UserFiltersStruct fromMap(Map<String, dynamic> data) =>
      UserFiltersStruct(
        filterStatus: data['filter_status'] as String?,
        productType: data['product_type'] as String?,
        categoryCount: castToType<int>(data['category_count']),
        categoryId: getDataList(data['category_id']),
        productCount: castToType<int>(data['product_count']),
        productId: getDataList(data['product_id']),
        attributeCount: castToType<int>(data['attribute_count']),
        attributeId: getDataList(data['attribute_id']),
        brandCount: castToType<int>(data['brand_count']),
        brandId: getDataList(data['brand_id']),
        sortStatus: data['sort_status'] as String?,
        isSortNewer: data['is_sort_newer'] as bool?,
        isSortPopular: data['is_sort_popular'] as bool?,
        isSortRecommended: data['is_sort_recommended'] as bool?,
        isSortLtoH: data['is_sort_LtoH'] as bool?,
        isSortHtoL: data['is_sort_HtoL'] as bool?,
        priceRange: data['price_range'] as String?,
        priceMinimum: castToType<double>(data['price_minimum']),
        priceMaximum: castToType<double>(data['price_maximum']),
      );

  static UserFiltersStruct? maybeFromMap(dynamic data) => data is Map
      ? UserFiltersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'filter_status': _filterStatus,
        'product_type': _productType,
        'category_count': _categoryCount,
        'category_id': _categoryId,
        'product_count': _productCount,
        'product_id': _productId,
        'attribute_count': _attributeCount,
        'attribute_id': _attributeId,
        'brand_count': _brandCount,
        'brand_id': _brandId,
        'sort_status': _sortStatus,
        'is_sort_newer': _isSortNewer,
        'is_sort_popular': _isSortPopular,
        'is_sort_recommended': _isSortRecommended,
        'is_sort_LtoH': _isSortLtoH,
        'is_sort_HtoL': _isSortHtoL,
        'price_range': _priceRange,
        'price_minimum': _priceMinimum,
        'price_maximum': _priceMaximum,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'filter_status': serializeParam(
          _filterStatus,
          ParamType.String,
        ),
        'product_type': serializeParam(
          _productType,
          ParamType.String,
        ),
        'category_count': serializeParam(
          _categoryCount,
          ParamType.int,
        ),
        'category_id': serializeParam(
          _categoryId,
          ParamType.String,
          isList: true,
        ),
        'product_count': serializeParam(
          _productCount,
          ParamType.int,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
          isList: true,
        ),
        'attribute_count': serializeParam(
          _attributeCount,
          ParamType.int,
        ),
        'attribute_id': serializeParam(
          _attributeId,
          ParamType.String,
          isList: true,
        ),
        'brand_count': serializeParam(
          _brandCount,
          ParamType.int,
        ),
        'brand_id': serializeParam(
          _brandId,
          ParamType.String,
          isList: true,
        ),
        'sort_status': serializeParam(
          _sortStatus,
          ParamType.String,
        ),
        'is_sort_newer': serializeParam(
          _isSortNewer,
          ParamType.bool,
        ),
        'is_sort_popular': serializeParam(
          _isSortPopular,
          ParamType.bool,
        ),
        'is_sort_recommended': serializeParam(
          _isSortRecommended,
          ParamType.bool,
        ),
        'is_sort_LtoH': serializeParam(
          _isSortLtoH,
          ParamType.bool,
        ),
        'is_sort_HtoL': serializeParam(
          _isSortHtoL,
          ParamType.bool,
        ),
        'price_range': serializeParam(
          _priceRange,
          ParamType.String,
        ),
        'price_minimum': serializeParam(
          _priceMinimum,
          ParamType.double,
        ),
        'price_maximum': serializeParam(
          _priceMaximum,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserFiltersStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserFiltersStruct(
        filterStatus: deserializeParam(
          data['filter_status'],
          ParamType.String,
          false,
        ),
        productType: deserializeParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        categoryCount: deserializeParam(
          data['category_count'],
          ParamType.int,
          false,
        ),
        categoryId: deserializeParam<String>(
          data['category_id'],
          ParamType.String,
          true,
        ),
        productCount: deserializeParam(
          data['product_count'],
          ParamType.int,
          false,
        ),
        productId: deserializeParam<String>(
          data['product_id'],
          ParamType.String,
          true,
        ),
        attributeCount: deserializeParam(
          data['attribute_count'],
          ParamType.int,
          false,
        ),
        attributeId: deserializeParam<String>(
          data['attribute_id'],
          ParamType.String,
          true,
        ),
        brandCount: deserializeParam(
          data['brand_count'],
          ParamType.int,
          false,
        ),
        brandId: deserializeParam<String>(
          data['brand_id'],
          ParamType.String,
          true,
        ),
        sortStatus: deserializeParam(
          data['sort_status'],
          ParamType.String,
          false,
        ),
        isSortNewer: deserializeParam(
          data['is_sort_newer'],
          ParamType.bool,
          false,
        ),
        isSortPopular: deserializeParam(
          data['is_sort_popular'],
          ParamType.bool,
          false,
        ),
        isSortRecommended: deserializeParam(
          data['is_sort_recommended'],
          ParamType.bool,
          false,
        ),
        isSortLtoH: deserializeParam(
          data['is_sort_LtoH'],
          ParamType.bool,
          false,
        ),
        isSortHtoL: deserializeParam(
          data['is_sort_HtoL'],
          ParamType.bool,
          false,
        ),
        priceRange: deserializeParam(
          data['price_range'],
          ParamType.String,
          false,
        ),
        priceMinimum: deserializeParam(
          data['price_minimum'],
          ParamType.double,
          false,
        ),
        priceMaximum: deserializeParam(
          data['price_maximum'],
          ParamType.double,
          false,
        ),
      );

  static UserFiltersStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserFiltersStruct(
        filterStatus: convertAlgoliaParam(
          data['filter_status'],
          ParamType.String,
          false,
        ),
        productType: convertAlgoliaParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        categoryCount: convertAlgoliaParam(
          data['category_count'],
          ParamType.int,
          false,
        ),
        categoryId: convertAlgoliaParam<String>(
          data['category_id'],
          ParamType.String,
          true,
        ),
        productCount: convertAlgoliaParam(
          data['product_count'],
          ParamType.int,
          false,
        ),
        productId: convertAlgoliaParam<String>(
          data['product_id'],
          ParamType.String,
          true,
        ),
        attributeCount: convertAlgoliaParam(
          data['attribute_count'],
          ParamType.int,
          false,
        ),
        attributeId: convertAlgoliaParam<String>(
          data['attribute_id'],
          ParamType.String,
          true,
        ),
        brandCount: convertAlgoliaParam(
          data['brand_count'],
          ParamType.int,
          false,
        ),
        brandId: convertAlgoliaParam<String>(
          data['brand_id'],
          ParamType.String,
          true,
        ),
        sortStatus: convertAlgoliaParam(
          data['sort_status'],
          ParamType.String,
          false,
        ),
        isSortNewer: convertAlgoliaParam(
          data['is_sort_newer'],
          ParamType.bool,
          false,
        ),
        isSortPopular: convertAlgoliaParam(
          data['is_sort_popular'],
          ParamType.bool,
          false,
        ),
        isSortRecommended: convertAlgoliaParam(
          data['is_sort_recommended'],
          ParamType.bool,
          false,
        ),
        isSortLtoH: convertAlgoliaParam(
          data['is_sort_LtoH'],
          ParamType.bool,
          false,
        ),
        isSortHtoL: convertAlgoliaParam(
          data['is_sort_HtoL'],
          ParamType.bool,
          false,
        ),
        priceRange: convertAlgoliaParam(
          data['price_range'],
          ParamType.String,
          false,
        ),
        priceMinimum: convertAlgoliaParam(
          data['price_minimum'],
          ParamType.double,
          false,
        ),
        priceMaximum: convertAlgoliaParam(
          data['price_maximum'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserFiltersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserFiltersStruct &&
        filterStatus == other.filterStatus &&
        productType == other.productType &&
        categoryCount == other.categoryCount &&
        listEquality.equals(categoryId, other.categoryId) &&
        productCount == other.productCount &&
        listEquality.equals(productId, other.productId) &&
        attributeCount == other.attributeCount &&
        listEquality.equals(attributeId, other.attributeId) &&
        brandCount == other.brandCount &&
        listEquality.equals(brandId, other.brandId) &&
        sortStatus == other.sortStatus &&
        isSortNewer == other.isSortNewer &&
        isSortPopular == other.isSortPopular &&
        isSortRecommended == other.isSortRecommended &&
        isSortLtoH == other.isSortLtoH &&
        isSortHtoL == other.isSortHtoL &&
        priceRange == other.priceRange &&
        priceMinimum == other.priceMinimum &&
        priceMaximum == other.priceMaximum;
  }

  @override
  int get hashCode => const ListEquality().hash([
        filterStatus,
        productType,
        categoryCount,
        categoryId,
        productCount,
        productId,
        attributeCount,
        attributeId,
        brandCount,
        brandId,
        sortStatus,
        isSortNewer,
        isSortPopular,
        isSortRecommended,
        isSortLtoH,
        isSortHtoL,
        priceRange,
        priceMinimum,
        priceMaximum
      ]);
}

UserFiltersStruct createUserFiltersStruct({
  String? filterStatus,
  String? productType,
  int? categoryCount,
  int? productCount,
  int? attributeCount,
  int? brandCount,
  String? sortStatus,
  bool? isSortNewer,
  bool? isSortPopular,
  bool? isSortRecommended,
  bool? isSortLtoH,
  bool? isSortHtoL,
  String? priceRange,
  double? priceMinimum,
  double? priceMaximum,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserFiltersStruct(
      filterStatus: filterStatus,
      productType: productType,
      categoryCount: categoryCount,
      productCount: productCount,
      attributeCount: attributeCount,
      brandCount: brandCount,
      sortStatus: sortStatus,
      isSortNewer: isSortNewer,
      isSortPopular: isSortPopular,
      isSortRecommended: isSortRecommended,
      isSortLtoH: isSortLtoH,
      isSortHtoL: isSortHtoL,
      priceRange: priceRange,
      priceMinimum: priceMinimum,
      priceMaximum: priceMaximum,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserFiltersStruct? updateUserFiltersStruct(
  UserFiltersStruct? userFilters, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userFilters
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserFiltersStructData(
  Map<String, dynamic> firestoreData,
  UserFiltersStruct? userFilters,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userFilters == null) {
    return;
  }
  if (userFilters.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userFilters.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userFiltersData =
      getUserFiltersFirestoreData(userFilters, forFieldValue);
  final nestedData =
      userFiltersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userFilters.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFiltersFirestoreData(
  UserFiltersStruct? userFilters, [
  bool forFieldValue = false,
]) {
  if (userFilters == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userFilters.toMap());

  // Add any Firestore field values
  userFilters.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserFiltersListFirestoreData(
  List<UserFiltersStruct>? userFilterss,
) =>
    userFilterss?.map((e) => getUserFiltersFirestoreData(e, true)).toList() ??
    [];
