// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsAppAccessStruct extends FFFirebaseStruct {
  SettingsAppAccessStruct({
    bool? settingsCategoryFeature,
    bool? settingsCatllogFeature,
    bool? settingsSecretFeature,
    List<SettingsAppAccessDataStruct>? settingsAppAccessList,
    bool? settingsWaitlistFeature,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _settingsCategoryFeature = settingsCategoryFeature,
        _settingsCatllogFeature = settingsCatllogFeature,
        _settingsSecretFeature = settingsSecretFeature,
        _settingsAppAccessList = settingsAppAccessList,
        _settingsWaitlistFeature = settingsWaitlistFeature,
        super(firestoreUtilData);

  // "settings_category_feature" field.
  bool? _settingsCategoryFeature;
  bool get settingsCategoryFeature => _settingsCategoryFeature ?? false;
  set settingsCategoryFeature(bool? val) => _settingsCategoryFeature = val;

  bool hasSettingsCategoryFeature() => _settingsCategoryFeature != null;

  // "settings_catllog_feature" field.
  bool? _settingsCatllogFeature;
  bool get settingsCatllogFeature => _settingsCatllogFeature ?? false;
  set settingsCatllogFeature(bool? val) => _settingsCatllogFeature = val;

  bool hasSettingsCatllogFeature() => _settingsCatllogFeature != null;

  // "settings_secret_feature" field.
  bool? _settingsSecretFeature;
  bool get settingsSecretFeature => _settingsSecretFeature ?? false;
  set settingsSecretFeature(bool? val) => _settingsSecretFeature = val;

  bool hasSettingsSecretFeature() => _settingsSecretFeature != null;

  // "settings_app_access_list" field.
  List<SettingsAppAccessDataStruct>? _settingsAppAccessList;
  List<SettingsAppAccessDataStruct> get settingsAppAccessList =>
      _settingsAppAccessList ?? const [];
  set settingsAppAccessList(List<SettingsAppAccessDataStruct>? val) =>
      _settingsAppAccessList = val;

  void updateSettingsAppAccessList(
      Function(List<SettingsAppAccessDataStruct>) updateFn) {
    updateFn(_settingsAppAccessList ??= []);
  }

  bool hasSettingsAppAccessList() => _settingsAppAccessList != null;

  // "settings_waitlist_feature" field.
  bool? _settingsWaitlistFeature;
  bool get settingsWaitlistFeature => _settingsWaitlistFeature ?? false;
  set settingsWaitlistFeature(bool? val) => _settingsWaitlistFeature = val;

  bool hasSettingsWaitlistFeature() => _settingsWaitlistFeature != null;

  static SettingsAppAccessStruct fromMap(Map<String, dynamic> data) =>
      SettingsAppAccessStruct(
        settingsCategoryFeature: data['settings_category_feature'] as bool?,
        settingsCatllogFeature: data['settings_catllog_feature'] as bool?,
        settingsSecretFeature: data['settings_secret_feature'] as bool?,
        settingsAppAccessList: getStructList(
          data['settings_app_access_list'],
          SettingsAppAccessDataStruct.fromMap,
        ),
        settingsWaitlistFeature: data['settings_waitlist_feature'] as bool?,
      );

  static SettingsAppAccessStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsAppAccessStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'settings_category_feature': _settingsCategoryFeature,
        'settings_catllog_feature': _settingsCatllogFeature,
        'settings_secret_feature': _settingsSecretFeature,
        'settings_app_access_list':
            _settingsAppAccessList?.map((e) => e.toMap()).toList(),
        'settings_waitlist_feature': _settingsWaitlistFeature,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'settings_category_feature': serializeParam(
          _settingsCategoryFeature,
          ParamType.bool,
        ),
        'settings_catllog_feature': serializeParam(
          _settingsCatllogFeature,
          ParamType.bool,
        ),
        'settings_secret_feature': serializeParam(
          _settingsSecretFeature,
          ParamType.bool,
        ),
        'settings_app_access_list': serializeParam(
          _settingsAppAccessList,
          ParamType.DataStruct,
          isList: true,
        ),
        'settings_waitlist_feature': serializeParam(
          _settingsWaitlistFeature,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SettingsAppAccessStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsAppAccessStruct(
        settingsCategoryFeature: deserializeParam(
          data['settings_category_feature'],
          ParamType.bool,
          false,
        ),
        settingsCatllogFeature: deserializeParam(
          data['settings_catllog_feature'],
          ParamType.bool,
          false,
        ),
        settingsSecretFeature: deserializeParam(
          data['settings_secret_feature'],
          ParamType.bool,
          false,
        ),
        settingsAppAccessList:
            deserializeStructParam<SettingsAppAccessDataStruct>(
          data['settings_app_access_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SettingsAppAccessDataStruct.fromSerializableMap,
        ),
        settingsWaitlistFeature: deserializeParam(
          data['settings_waitlist_feature'],
          ParamType.bool,
          false,
        ),
      );

  static SettingsAppAccessStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsAppAccessStruct(
        settingsCategoryFeature: convertAlgoliaParam(
          data['settings_category_feature'],
          ParamType.bool,
          false,
        ),
        settingsCatllogFeature: convertAlgoliaParam(
          data['settings_catllog_feature'],
          ParamType.bool,
          false,
        ),
        settingsSecretFeature: convertAlgoliaParam(
          data['settings_secret_feature'],
          ParamType.bool,
          false,
        ),
        settingsAppAccessList: convertAlgoliaParam<SettingsAppAccessDataStruct>(
          data['settings_app_access_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SettingsAppAccessDataStruct.fromAlgoliaData,
        ),
        settingsWaitlistFeature: convertAlgoliaParam(
          data['settings_waitlist_feature'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsAppAccessStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SettingsAppAccessStruct &&
        settingsCategoryFeature == other.settingsCategoryFeature &&
        settingsCatllogFeature == other.settingsCatllogFeature &&
        settingsSecretFeature == other.settingsSecretFeature &&
        listEquality.equals(
            settingsAppAccessList, other.settingsAppAccessList) &&
        settingsWaitlistFeature == other.settingsWaitlistFeature;
  }

  @override
  int get hashCode => const ListEquality().hash([
        settingsCategoryFeature,
        settingsCatllogFeature,
        settingsSecretFeature,
        settingsAppAccessList,
        settingsWaitlistFeature
      ]);
}

SettingsAppAccessStruct createSettingsAppAccessStruct({
  bool? settingsCategoryFeature,
  bool? settingsCatllogFeature,
  bool? settingsSecretFeature,
  bool? settingsWaitlistFeature,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsAppAccessStruct(
      settingsCategoryFeature: settingsCategoryFeature,
      settingsCatllogFeature: settingsCatllogFeature,
      settingsSecretFeature: settingsSecretFeature,
      settingsWaitlistFeature: settingsWaitlistFeature,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsAppAccessStruct? updateSettingsAppAccessStruct(
  SettingsAppAccessStruct? settingsAppAccess, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsAppAccess
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsAppAccessStructData(
  Map<String, dynamic> firestoreData,
  SettingsAppAccessStruct? settingsAppAccess,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsAppAccess == null) {
    return;
  }
  if (settingsAppAccess.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsAppAccess.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsAppAccessData =
      getSettingsAppAccessFirestoreData(settingsAppAccess, forFieldValue);
  final nestedData =
      settingsAppAccessData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settingsAppAccess.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsAppAccessFirestoreData(
  SettingsAppAccessStruct? settingsAppAccess, [
  bool forFieldValue = false,
]) {
  if (settingsAppAccess == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsAppAccess.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsAppAccess.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsAppAccessListFirestoreData(
  List<SettingsAppAccessStruct>? settingsAppAccesss,
) =>
    settingsAppAccesss
        ?.map((e) => getSettingsAppAccessFirestoreData(e, true))
        .toList() ??
    [];
