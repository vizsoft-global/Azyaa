// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranslateInfoStruct extends FFFirebaseStruct {
  TranslateInfoStruct({
    TranslateLangStruct? slug,
    TranslateLangStruct? name,
    TranslateLangStruct? shortDescription,
    TranslateLangStruct? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _slug = slug,
        _name = name,
        _shortDescription = shortDescription,
        _description = description,
        super(firestoreUtilData);

  // "slug" field.
  TranslateLangStruct? _slug;
  TranslateLangStruct get slug => _slug ?? TranslateLangStruct();
  set slug(TranslateLangStruct? val) => _slug = val;

  void updateSlug(Function(TranslateLangStruct) updateFn) {
    updateFn(_slug ??= TranslateLangStruct());
  }

  bool hasSlug() => _slug != null;

  // "name" field.
  TranslateLangStruct? _name;
  TranslateLangStruct get name => _name ?? TranslateLangStruct();
  set name(TranslateLangStruct? val) => _name = val;

  void updateName(Function(TranslateLangStruct) updateFn) {
    updateFn(_name ??= TranslateLangStruct());
  }

  bool hasName() => _name != null;

  // "short_description" field.
  TranslateLangStruct? _shortDescription;
  TranslateLangStruct get shortDescription =>
      _shortDescription ?? TranslateLangStruct();
  set shortDescription(TranslateLangStruct? val) => _shortDescription = val;

  void updateShortDescription(Function(TranslateLangStruct) updateFn) {
    updateFn(_shortDescription ??= TranslateLangStruct());
  }

  bool hasShortDescription() => _shortDescription != null;

  // "description" field.
  TranslateLangStruct? _description;
  TranslateLangStruct get description => _description ?? TranslateLangStruct();
  set description(TranslateLangStruct? val) => _description = val;

  void updateDescription(Function(TranslateLangStruct) updateFn) {
    updateFn(_description ??= TranslateLangStruct());
  }

  bool hasDescription() => _description != null;

  static TranslateInfoStruct fromMap(Map<String, dynamic> data) =>
      TranslateInfoStruct(
        slug: data['slug'] is TranslateLangStruct
            ? data['slug']
            : TranslateLangStruct.maybeFromMap(data['slug']),
        name: data['name'] is TranslateLangStruct
            ? data['name']
            : TranslateLangStruct.maybeFromMap(data['name']),
        shortDescription: data['short_description'] is TranslateLangStruct
            ? data['short_description']
            : TranslateLangStruct.maybeFromMap(data['short_description']),
        description: data['description'] is TranslateLangStruct
            ? data['description']
            : TranslateLangStruct.maybeFromMap(data['description']),
      );

  static TranslateInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? TranslateInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'slug': _slug?.toMap(),
        'name': _name?.toMap(),
        'short_description': _shortDescription?.toMap(),
        'description': _description?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slug': serializeParam(
          _slug,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.DataStruct,
        ),
        'short_description': serializeParam(
          _shortDescription,
          ParamType.DataStruct,
        ),
        'description': serializeParam(
          _description,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TranslateInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      TranslateInfoStruct(
        slug: deserializeStructParam(
          data['slug'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromSerializableMap,
        ),
        name: deserializeStructParam(
          data['name'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromSerializableMap,
        ),
        shortDescription: deserializeStructParam(
          data['short_description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromSerializableMap,
        ),
        description: deserializeStructParam(
          data['description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromSerializableMap,
        ),
      );

  static TranslateInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TranslateInfoStruct(
        slug: convertAlgoliaParam(
          data['slug'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromAlgoliaData,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromAlgoliaData,
        ),
        shortDescription: convertAlgoliaParam(
          data['short_description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromAlgoliaData,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLangStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TranslateInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TranslateInfoStruct &&
        slug == other.slug &&
        name == other.name &&
        shortDescription == other.shortDescription &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([slug, name, shortDescription, description]);
}

TranslateInfoStruct createTranslateInfoStruct({
  TranslateLangStruct? slug,
  TranslateLangStruct? name,
  TranslateLangStruct? shortDescription,
  TranslateLangStruct? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TranslateInfoStruct(
      slug: slug ?? (clearUnsetFields ? TranslateLangStruct() : null),
      name: name ?? (clearUnsetFields ? TranslateLangStruct() : null),
      shortDescription:
          shortDescription ?? (clearUnsetFields ? TranslateLangStruct() : null),
      description:
          description ?? (clearUnsetFields ? TranslateLangStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TranslateInfoStruct? updateTranslateInfoStruct(
  TranslateInfoStruct? translateInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    translateInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTranslateInfoStructData(
  Map<String, dynamic> firestoreData,
  TranslateInfoStruct? translateInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (translateInfo == null) {
    return;
  }
  if (translateInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && translateInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final translateInfoData =
      getTranslateInfoFirestoreData(translateInfo, forFieldValue);
  final nestedData =
      translateInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = translateInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTranslateInfoFirestoreData(
  TranslateInfoStruct? translateInfo, [
  bool forFieldValue = false,
]) {
  if (translateInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(translateInfo.toMap());

  // Handle nested data for "slug" field.
  addTranslateLangStructData(
    firestoreData,
    translateInfo.hasSlug() ? translateInfo.slug : null,
    'slug',
    forFieldValue,
  );

  // Handle nested data for "name" field.
  addTranslateLangStructData(
    firestoreData,
    translateInfo.hasName() ? translateInfo.name : null,
    'name',
    forFieldValue,
  );

  // Handle nested data for "short_description" field.
  addTranslateLangStructData(
    firestoreData,
    translateInfo.hasShortDescription() ? translateInfo.shortDescription : null,
    'short_description',
    forFieldValue,
  );

  // Handle nested data for "description" field.
  addTranslateLangStructData(
    firestoreData,
    translateInfo.hasDescription() ? translateInfo.description : null,
    'description',
    forFieldValue,
  );

  // Add any Firestore field values
  translateInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTranslateInfoListFirestoreData(
  List<TranslateInfoStruct>? translateInfos,
) =>
    translateInfos
        ?.map((e) => getTranslateInfoFirestoreData(e, true))
        .toList() ??
    [];
