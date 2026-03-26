// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStockStruct extends FFFirebaseStruct {
  ProductStockStruct({
    String? productSku,
    String? productType,
    String? productSizechartUk,
    String? productSizechartUs,
    double? productRegularPrice,
    double? productSalePrice,
    double? productPrice,
    double? weightGm,
    String? inventoryId,
    DocumentReference? inventoryRef,
    bool? isPreferredVendor,
    bool? isProductReturn,
    int? returnProductNumberDay,
    bool? isProductRefundable,
    int? sku,
    double? procurementCost,
    double? procurementPrice,
    bool? orderInventoryProcessed,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productSku = productSku,
        _productType = productType,
        _productSizechartUk = productSizechartUk,
        _productSizechartUs = productSizechartUs,
        _productRegularPrice = productRegularPrice,
        _productSalePrice = productSalePrice,
        _productPrice = productPrice,
        _weightGm = weightGm,
        _inventoryId = inventoryId,
        _inventoryRef = inventoryRef,
        _isPreferredVendor = isPreferredVendor,
        _isProductReturn = isProductReturn,
        _returnProductNumberDay = returnProductNumberDay,
        _isProductRefundable = isProductRefundable,
        _sku = sku,
        _procurementCost = procurementCost,
        _procurementPrice = procurementPrice,
        _orderInventoryProcessed = orderInventoryProcessed,
        super(firestoreUtilData);

  // "product_sku" field.
  String? _productSku;
  String get productSku => _productSku ?? '';
  set productSku(String? val) => _productSku = val;

  bool hasProductSku() => _productSku != null;

  // "product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  set productType(String? val) => _productType = val;

  bool hasProductType() => _productType != null;

  // "product_sizechart_uk" field.
  String? _productSizechartUk;
  String get productSizechartUk => _productSizechartUk ?? '';
  set productSizechartUk(String? val) => _productSizechartUk = val;

  bool hasProductSizechartUk() => _productSizechartUk != null;

  // "product_sizechart_us" field.
  String? _productSizechartUs;
  String get productSizechartUs => _productSizechartUs ?? '';
  set productSizechartUs(String? val) => _productSizechartUs = val;

  bool hasProductSizechartUs() => _productSizechartUs != null;

  // "product_regular_price" field.
  double? _productRegularPrice;
  double get productRegularPrice => _productRegularPrice ?? 0.0;
  set productRegularPrice(double? val) => _productRegularPrice = val;

  void incrementProductRegularPrice(double amount) =>
      productRegularPrice = productRegularPrice + amount;

  bool hasProductRegularPrice() => _productRegularPrice != null;

  // "product_sale_price" field.
  double? _productSalePrice;
  double get productSalePrice => _productSalePrice ?? 0.0;
  set productSalePrice(double? val) => _productSalePrice = val;

  void incrementProductSalePrice(double amount) =>
      productSalePrice = productSalePrice + amount;

  bool hasProductSalePrice() => _productSalePrice != null;

  // "product_price" field.
  double? _productPrice;
  double get productPrice => _productPrice ?? 0.0;
  set productPrice(double? val) => _productPrice = val;

  void incrementProductPrice(double amount) =>
      productPrice = productPrice + amount;

  bool hasProductPrice() => _productPrice != null;

  // "weight_gm" field.
  double? _weightGm;
  double get weightGm => _weightGm ?? 0.0;
  set weightGm(double? val) => _weightGm = val;

  void incrementWeightGm(double amount) => weightGm = weightGm + amount;

  bool hasWeightGm() => _weightGm != null;

  // "inventory_id" field.
  String? _inventoryId;
  String get inventoryId => _inventoryId ?? '';
  set inventoryId(String? val) => _inventoryId = val;

  bool hasInventoryId() => _inventoryId != null;

  // "inventory_ref" field.
  DocumentReference? _inventoryRef;
  DocumentReference? get inventoryRef => _inventoryRef;
  set inventoryRef(DocumentReference? val) => _inventoryRef = val;

  bool hasInventoryRef() => _inventoryRef != null;

  // "is_preferred_vendor" field.
  bool? _isPreferredVendor;
  bool get isPreferredVendor => _isPreferredVendor ?? false;
  set isPreferredVendor(bool? val) => _isPreferredVendor = val;

  bool hasIsPreferredVendor() => _isPreferredVendor != null;

  // "is_product_return" field.
  bool? _isProductReturn;
  bool get isProductReturn => _isProductReturn ?? false;
  set isProductReturn(bool? val) => _isProductReturn = val;

  bool hasIsProductReturn() => _isProductReturn != null;

  // "return_product_number_day" field.
  int? _returnProductNumberDay;
  int get returnProductNumberDay => _returnProductNumberDay ?? 0;
  set returnProductNumberDay(int? val) => _returnProductNumberDay = val;

  void incrementReturnProductNumberDay(int amount) =>
      returnProductNumberDay = returnProductNumberDay + amount;

  bool hasReturnProductNumberDay() => _returnProductNumberDay != null;

  // "is_product_refundable" field.
  bool? _isProductRefundable;
  bool get isProductRefundable => _isProductRefundable ?? false;
  set isProductRefundable(bool? val) => _isProductRefundable = val;

  bool hasIsProductRefundable() => _isProductRefundable != null;

  // "SKU" field.
  int? _sku;
  int get sku => _sku ?? 0;
  set sku(int? val) => _sku = val;

  void incrementSku(int amount) => sku = sku + amount;

  bool hasSku() => _sku != null;

  // "procurement_cost" field.
  double? _procurementCost;
  double get procurementCost => _procurementCost ?? 0.0;
  set procurementCost(double? val) => _procurementCost = val;

  void incrementProcurementCost(double amount) =>
      procurementCost = procurementCost + amount;

  bool hasProcurementCost() => _procurementCost != null;

  // "procurement_price" field.
  double? _procurementPrice;
  double get procurementPrice => _procurementPrice ?? 0.0;
  set procurementPrice(double? val) => _procurementPrice = val;

  void incrementProcurementPrice(double amount) =>
      procurementPrice = procurementPrice + amount;

  bool hasProcurementPrice() => _procurementPrice != null;

  // "order_inventory_processed" field.
  bool? _orderInventoryProcessed;
  bool get orderInventoryProcessed => _orderInventoryProcessed ?? false;
  set orderInventoryProcessed(bool? val) => _orderInventoryProcessed = val;

  bool hasOrderInventoryProcessed() => _orderInventoryProcessed != null;

  static ProductStockStruct fromMap(Map<String, dynamic> data) =>
      ProductStockStruct(
        productSku: data['product_sku'] as String?,
        productType: data['product_type'] as String?,
        productSizechartUk: data['product_sizechart_uk'] as String?,
        productSizechartUs: data['product_sizechart_us'] as String?,
        productRegularPrice: castToType<double>(data['product_regular_price']),
        productSalePrice: castToType<double>(data['product_sale_price']),
        productPrice: castToType<double>(data['product_price']),
        weightGm: castToType<double>(data['weight_gm']),
        inventoryId: data['inventory_id'] as String?,
        inventoryRef: data['inventory_ref'] as DocumentReference?,
        isPreferredVendor: data['is_preferred_vendor'] as bool?,
        isProductReturn: data['is_product_return'] as bool?,
        returnProductNumberDay:
            castToType<int>(data['return_product_number_day']),
        isProductRefundable: data['is_product_refundable'] as bool?,
        sku: castToType<int>(data['SKU']),
        procurementCost: castToType<double>(data['procurement_cost']),
        procurementPrice: castToType<double>(data['procurement_price']),
        orderInventoryProcessed: data['order_inventory_processed'] as bool?,
      );

  static ProductStockStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductStockStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_sku': _productSku,
        'product_type': _productType,
        'product_sizechart_uk': _productSizechartUk,
        'product_sizechart_us': _productSizechartUs,
        'product_regular_price': _productRegularPrice,
        'product_sale_price': _productSalePrice,
        'product_price': _productPrice,
        'weight_gm': _weightGm,
        'inventory_id': _inventoryId,
        'inventory_ref': _inventoryRef,
        'is_preferred_vendor': _isPreferredVendor,
        'is_product_return': _isProductReturn,
        'return_product_number_day': _returnProductNumberDay,
        'is_product_refundable': _isProductRefundable,
        'SKU': _sku,
        'procurement_cost': _procurementCost,
        'procurement_price': _procurementPrice,
        'order_inventory_processed': _orderInventoryProcessed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_sku': serializeParam(
          _productSku,
          ParamType.String,
        ),
        'product_type': serializeParam(
          _productType,
          ParamType.String,
        ),
        'product_sizechart_uk': serializeParam(
          _productSizechartUk,
          ParamType.String,
        ),
        'product_sizechart_us': serializeParam(
          _productSizechartUs,
          ParamType.String,
        ),
        'product_regular_price': serializeParam(
          _productRegularPrice,
          ParamType.double,
        ),
        'product_sale_price': serializeParam(
          _productSalePrice,
          ParamType.double,
        ),
        'product_price': serializeParam(
          _productPrice,
          ParamType.double,
        ),
        'weight_gm': serializeParam(
          _weightGm,
          ParamType.double,
        ),
        'inventory_id': serializeParam(
          _inventoryId,
          ParamType.String,
        ),
        'inventory_ref': serializeParam(
          _inventoryRef,
          ParamType.DocumentReference,
        ),
        'is_preferred_vendor': serializeParam(
          _isPreferredVendor,
          ParamType.bool,
        ),
        'is_product_return': serializeParam(
          _isProductReturn,
          ParamType.bool,
        ),
        'return_product_number_day': serializeParam(
          _returnProductNumberDay,
          ParamType.int,
        ),
        'is_product_refundable': serializeParam(
          _isProductRefundable,
          ParamType.bool,
        ),
        'SKU': serializeParam(
          _sku,
          ParamType.int,
        ),
        'procurement_cost': serializeParam(
          _procurementCost,
          ParamType.double,
        ),
        'procurement_price': serializeParam(
          _procurementPrice,
          ParamType.double,
        ),
        'order_inventory_processed': serializeParam(
          _orderInventoryProcessed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProductStockStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStockStruct(
        productSku: deserializeParam(
          data['product_sku'],
          ParamType.String,
          false,
        ),
        productType: deserializeParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        productSizechartUk: deserializeParam(
          data['product_sizechart_uk'],
          ParamType.String,
          false,
        ),
        productSizechartUs: deserializeParam(
          data['product_sizechart_us'],
          ParamType.String,
          false,
        ),
        productRegularPrice: deserializeParam(
          data['product_regular_price'],
          ParamType.double,
          false,
        ),
        productSalePrice: deserializeParam(
          data['product_sale_price'],
          ParamType.double,
          false,
        ),
        productPrice: deserializeParam(
          data['product_price'],
          ParamType.double,
          false,
        ),
        weightGm: deserializeParam(
          data['weight_gm'],
          ParamType.double,
          false,
        ),
        inventoryId: deserializeParam(
          data['inventory_id'],
          ParamType.String,
          false,
        ),
        inventoryRef: deserializeParam(
          data['inventory_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['inventory'],
        ),
        isPreferredVendor: deserializeParam(
          data['is_preferred_vendor'],
          ParamType.bool,
          false,
        ),
        isProductReturn: deserializeParam(
          data['is_product_return'],
          ParamType.bool,
          false,
        ),
        returnProductNumberDay: deserializeParam(
          data['return_product_number_day'],
          ParamType.int,
          false,
        ),
        isProductRefundable: deserializeParam(
          data['is_product_refundable'],
          ParamType.bool,
          false,
        ),
        sku: deserializeParam(
          data['SKU'],
          ParamType.int,
          false,
        ),
        procurementCost: deserializeParam(
          data['procurement_cost'],
          ParamType.double,
          false,
        ),
        procurementPrice: deserializeParam(
          data['procurement_price'],
          ParamType.double,
          false,
        ),
        orderInventoryProcessed: deserializeParam(
          data['order_inventory_processed'],
          ParamType.bool,
          false,
        ),
      );

  static ProductStockStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductStockStruct(
        productSku: convertAlgoliaParam(
          data['product_sku'],
          ParamType.String,
          false,
        ),
        productType: convertAlgoliaParam(
          data['product_type'],
          ParamType.String,
          false,
        ),
        productSizechartUk: convertAlgoliaParam(
          data['product_sizechart_uk'],
          ParamType.String,
          false,
        ),
        productSizechartUs: convertAlgoliaParam(
          data['product_sizechart_us'],
          ParamType.String,
          false,
        ),
        productRegularPrice: convertAlgoliaParam(
          data['product_regular_price'],
          ParamType.double,
          false,
        ),
        productSalePrice: convertAlgoliaParam(
          data['product_sale_price'],
          ParamType.double,
          false,
        ),
        productPrice: convertAlgoliaParam(
          data['product_price'],
          ParamType.double,
          false,
        ),
        weightGm: convertAlgoliaParam(
          data['weight_gm'],
          ParamType.double,
          false,
        ),
        inventoryId: convertAlgoliaParam(
          data['inventory_id'],
          ParamType.String,
          false,
        ),
        inventoryRef: convertAlgoliaParam(
          data['inventory_ref'],
          ParamType.DocumentReference,
          false,
        ),
        isPreferredVendor: convertAlgoliaParam(
          data['is_preferred_vendor'],
          ParamType.bool,
          false,
        ),
        isProductReturn: convertAlgoliaParam(
          data['is_product_return'],
          ParamType.bool,
          false,
        ),
        returnProductNumberDay: convertAlgoliaParam(
          data['return_product_number_day'],
          ParamType.int,
          false,
        ),
        isProductRefundable: convertAlgoliaParam(
          data['is_product_refundable'],
          ParamType.bool,
          false,
        ),
        sku: convertAlgoliaParam(
          data['SKU'],
          ParamType.int,
          false,
        ),
        procurementCost: convertAlgoliaParam(
          data['procurement_cost'],
          ParamType.double,
          false,
        ),
        procurementPrice: convertAlgoliaParam(
          data['procurement_price'],
          ParamType.double,
          false,
        ),
        orderInventoryProcessed: convertAlgoliaParam(
          data['order_inventory_processed'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductStockStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductStockStruct &&
        productSku == other.productSku &&
        productType == other.productType &&
        productSizechartUk == other.productSizechartUk &&
        productSizechartUs == other.productSizechartUs &&
        productRegularPrice == other.productRegularPrice &&
        productSalePrice == other.productSalePrice &&
        productPrice == other.productPrice &&
        weightGm == other.weightGm &&
        inventoryId == other.inventoryId &&
        inventoryRef == other.inventoryRef &&
        isPreferredVendor == other.isPreferredVendor &&
        isProductReturn == other.isProductReturn &&
        returnProductNumberDay == other.returnProductNumberDay &&
        isProductRefundable == other.isProductRefundable &&
        sku == other.sku &&
        procurementCost == other.procurementCost &&
        procurementPrice == other.procurementPrice &&
        orderInventoryProcessed == other.orderInventoryProcessed;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productSku,
        productType,
        productSizechartUk,
        productSizechartUs,
        productRegularPrice,
        productSalePrice,
        productPrice,
        weightGm,
        inventoryId,
        inventoryRef,
        isPreferredVendor,
        isProductReturn,
        returnProductNumberDay,
        isProductRefundable,
        sku,
        procurementCost,
        procurementPrice,
        orderInventoryProcessed
      ]);
}

ProductStockStruct createProductStockStruct({
  String? productSku,
  String? productType,
  String? productSizechartUk,
  String? productSizechartUs,
  double? productRegularPrice,
  double? productSalePrice,
  double? productPrice,
  double? weightGm,
  String? inventoryId,
  DocumentReference? inventoryRef,
  bool? isPreferredVendor,
  bool? isProductReturn,
  int? returnProductNumberDay,
  bool? isProductRefundable,
  int? sku,
  double? procurementCost,
  double? procurementPrice,
  bool? orderInventoryProcessed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStockStruct(
      productSku: productSku,
      productType: productType,
      productSizechartUk: productSizechartUk,
      productSizechartUs: productSizechartUs,
      productRegularPrice: productRegularPrice,
      productSalePrice: productSalePrice,
      productPrice: productPrice,
      weightGm: weightGm,
      inventoryId: inventoryId,
      inventoryRef: inventoryRef,
      isPreferredVendor: isPreferredVendor,
      isProductReturn: isProductReturn,
      returnProductNumberDay: returnProductNumberDay,
      isProductRefundable: isProductRefundable,
      sku: sku,
      procurementCost: procurementCost,
      procurementPrice: procurementPrice,
      orderInventoryProcessed: orderInventoryProcessed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStockStruct? updateProductStockStruct(
  ProductStockStruct? productStock, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productStock
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStockStructData(
  Map<String, dynamic> firestoreData,
  ProductStockStruct? productStock,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productStock == null) {
    return;
  }
  if (productStock.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productStock.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productStockData =
      getProductStockFirestoreData(productStock, forFieldValue);
  final nestedData =
      productStockData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productStock.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductStockFirestoreData(
  ProductStockStruct? productStock, [
  bool forFieldValue = false,
]) {
  if (productStock == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productStock.toMap());

  // Add any Firestore field values
  productStock.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductStockListFirestoreData(
  List<ProductStockStruct>? productStocks,
) =>
    productStocks?.map((e) => getProductStockFirestoreData(e, true)).toList() ??
    [];
