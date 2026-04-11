// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsCreatorBannerListStruct extends FFFirebaseStruct {
  SettingsCreatorBannerListStruct({
    String? titleEn,
    String? subtitleEn,
    String? titleAr,
    String? subtitleAr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titleEn = titleEn,
        _subtitleEn = subtitleEn,
        _titleAr = titleAr,
        _subtitleAr = subtitleAr,
        super(firestoreUtilData);

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  set titleEn(String? val) => _titleEn = val;

  bool hasTitleEn() => _titleEn != null;

  // "subtitle_en" field.
  String? _subtitleEn;
  String get subtitleEn => _subtitleEn ?? '';
  set subtitleEn(String? val) => _subtitleEn = val;

  bool hasSubtitleEn() => _subtitleEn != null;

  // "title_ar" field.
  String? _titleAr;
  String get titleAr => _titleAr ?? '';
  set titleAr(String? val) => _titleAr = val;

  bool hasTitleAr() => _titleAr != null;

  // "subtitle_ar" field.
  String? _subtitleAr;
  String get subtitleAr => _subtitleAr ?? '';
  set subtitleAr(String? val) => _subtitleAr = val;

  bool hasSubtitleAr() => _subtitleAr != null;

  static SettingsCreatorBannerListStruct fromMap(Map<String, dynamic> data) =>
      SettingsCreatorBannerListStruct(
        titleEn: data['title_en'] as String?,
        subtitleEn: data['subtitle_en'] as String?,
        titleAr: data['title_ar'] as String?,
        subtitleAr: data['subtitle_ar'] as String?,
      );

  static SettingsCreatorBannerListStruct? maybeFromMap(dynamic data) => data
          is Map
      ? SettingsCreatorBannerListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title_en': _titleEn,
        'subtitle_en': _subtitleEn,
        'title_ar': _titleAr,
        'subtitle_ar': _subtitleAr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title_en': serializeParam(
          _titleEn,
          ParamType.String,
        ),
        'subtitle_en': serializeParam(
          _subtitleEn,
          ParamType.String,
        ),
        'title_ar': serializeParam(
          _titleAr,
          ParamType.String,
        ),
        'subtitle_ar': serializeParam(
          _subtitleAr,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettingsCreatorBannerListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsCreatorBannerListStruct(
        titleEn: deserializeParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        subtitleEn: deserializeParam(
          data['subtitle_en'],
          ParamType.String,
          false,
        ),
        titleAr: deserializeParam(
          data['title_ar'],
          ParamType.String,
          false,
        ),
        subtitleAr: deserializeParam(
          data['subtitle_ar'],
          ParamType.String,
          false,
        ),
      );

  static SettingsCreatorBannerListStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SettingsCreatorBannerListStruct(
        titleEn: convertAlgoliaParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        subtitleEn: convertAlgoliaParam(
          data['subtitle_en'],
          ParamType.String,
          false,
        ),
        titleAr: convertAlgoliaParam(
          data['title_ar'],
          ParamType.String,
          false,
        ),
        subtitleAr: convertAlgoliaParam(
          data['subtitle_ar'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsCreatorBannerListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsCreatorBannerListStruct &&
        titleEn == other.titleEn &&
        subtitleEn == other.subtitleEn &&
        titleAr == other.titleAr &&
        subtitleAr == other.subtitleAr;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([titleEn, subtitleEn, titleAr, subtitleAr]);
}

SettingsCreatorBannerListStruct createSettingsCreatorBannerListStruct({
  String? titleEn,
  String? subtitleEn,
  String? titleAr,
  String? subtitleAr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsCreatorBannerListStruct(
      titleEn: titleEn,
      subtitleEn: subtitleEn,
      titleAr: titleAr,
      subtitleAr: subtitleAr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsCreatorBannerListStruct? updateSettingsCreatorBannerListStruct(
  SettingsCreatorBannerListStruct? settingsCreatorBannerList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsCreatorBannerList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsCreatorBannerListStructData(
  Map<String, dynamic> firestoreData,
  SettingsCreatorBannerListStruct? settingsCreatorBannerList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsCreatorBannerList == null) {
    return;
  }
  if (settingsCreatorBannerList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      settingsCreatorBannerList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsCreatorBannerListData =
      getSettingsCreatorBannerListFirestoreData(
          settingsCreatorBannerList, forFieldValue);
  final nestedData =
      settingsCreatorBannerListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingsCreatorBannerList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsCreatorBannerListFirestoreData(
  SettingsCreatorBannerListStruct? settingsCreatorBannerList, [
  bool forFieldValue = false,
]) {
  if (settingsCreatorBannerList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsCreatorBannerList.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsCreatorBannerList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsCreatorBannerListListFirestoreData(
  List<SettingsCreatorBannerListStruct>? settingsCreatorBannerLists,
) =>
    settingsCreatorBannerLists
        ?.map((e) => getSettingsCreatorBannerListFirestoreData(e, true))
        .toList() ??
    [];
