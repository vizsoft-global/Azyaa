// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MainStruct extends FFFirebaseStruct {
  MainStruct({
    String? mainName,
    String? mainDescription,
    String? mainImage,
    String? mainShortDescription,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mainName = mainName,
        _mainDescription = mainDescription,
        _mainImage = mainImage,
        _mainShortDescription = mainShortDescription,
        super(firestoreUtilData);

  // "main_name" field.
  String? _mainName;
  String get mainName => _mainName ?? '';
  set mainName(String? val) => _mainName = val;

  bool hasMainName() => _mainName != null;

  // "main_description" field.
  String? _mainDescription;
  String get mainDescription => _mainDescription ?? '';
  set mainDescription(String? val) => _mainDescription = val;

  bool hasMainDescription() => _mainDescription != null;

  // "main_image" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  set mainImage(String? val) => _mainImage = val;

  bool hasMainImage() => _mainImage != null;

  // "main_short_description" field.
  String? _mainShortDescription;
  String get mainShortDescription => _mainShortDescription ?? '';
  set mainShortDescription(String? val) => _mainShortDescription = val;

  bool hasMainShortDescription() => _mainShortDescription != null;

  static MainStruct fromMap(Map<String, dynamic> data) => MainStruct(
        mainName: data['main_name'] as String?,
        mainDescription: data['main_description'] as String?,
        mainImage: data['main_image'] as String?,
        mainShortDescription: data['main_short_description'] as String?,
      );

  static MainStruct? maybeFromMap(dynamic data) =>
      data is Map ? MainStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'main_name': _mainName,
        'main_description': _mainDescription,
        'main_image': _mainImage,
        'main_short_description': _mainShortDescription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_name': serializeParam(
          _mainName,
          ParamType.String,
        ),
        'main_description': serializeParam(
          _mainDescription,
          ParamType.String,
        ),
        'main_image': serializeParam(
          _mainImage,
          ParamType.String,
        ),
        'main_short_description': serializeParam(
          _mainShortDescription,
          ParamType.String,
        ),
      }.withoutNulls;

  static MainStruct fromSerializableMap(Map<String, dynamic> data) =>
      MainStruct(
        mainName: deserializeParam(
          data['main_name'],
          ParamType.String,
          false,
        ),
        mainDescription: deserializeParam(
          data['main_description'],
          ParamType.String,
          false,
        ),
        mainImage: deserializeParam(
          data['main_image'],
          ParamType.String,
          false,
        ),
        mainShortDescription: deserializeParam(
          data['main_short_description'],
          ParamType.String,
          false,
        ),
      );

  static MainStruct fromAlgoliaData(Map<String, dynamic> data) => MainStruct(
        mainName: convertAlgoliaParam(
          data['main_name'],
          ParamType.String,
          false,
        ),
        mainDescription: convertAlgoliaParam(
          data['main_description'],
          ParamType.String,
          false,
        ),
        mainImage: convertAlgoliaParam(
          data['main_image'],
          ParamType.String,
          false,
        ),
        mainShortDescription: convertAlgoliaParam(
          data['main_short_description'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MainStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MainStruct &&
        mainName == other.mainName &&
        mainDescription == other.mainDescription &&
        mainImage == other.mainImage &&
        mainShortDescription == other.mainShortDescription;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([mainName, mainDescription, mainImage, mainShortDescription]);
}

MainStruct createMainStruct({
  String? mainName,
  String? mainDescription,
  String? mainImage,
  String? mainShortDescription,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MainStruct(
      mainName: mainName,
      mainDescription: mainDescription,
      mainImage: mainImage,
      mainShortDescription: mainShortDescription,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MainStruct? updateMainStruct(
  MainStruct? main, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    main
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMainStructData(
  Map<String, dynamic> firestoreData,
  MainStruct? main,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (main == null) {
    return;
  }
  if (main.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && main.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mainData = getMainFirestoreData(main, forFieldValue);
  final nestedData = mainData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = main.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMainFirestoreData(
  MainStruct? main, [
  bool forFieldValue = false,
]) {
  if (main == null) {
    return {};
  }
  final firestoreData = mapToFirestore(main.toMap());

  // Add any Firestore field values
  main.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMainListFirestoreData(
  List<MainStruct>? mains,
) =>
    mains?.map((e) => getMainFirestoreData(e, true)).toList() ?? [];
