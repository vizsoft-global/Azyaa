// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TryonStruct extends FFFirebaseStruct {
  TryonStruct({
    String? aspectRatio,
    List<String>? assetIds,
    String? baseImageVersionId,
    String? caption,
    String? characteristics,
    String? createdTimestamp,
    int? creditsUsed,
    String? denoise,
    String? estFinishTimestamp,
    String? extension,
    String? externalProviderRequestId,
    bool? favorite,
    String? finishTimestamp,
    bool? forTraining,
    bool? freePlan,
    String? heightPx,
    String? id,
    bool? isGenerated,
    bool? isNsfw,
    String? modelText,
    String? outfitText,
    String? path,
    bool? public,
    String? resolution,
    String? s3Key,
    String? seed,
    String? setId,
    String? setText,
    String? sizeBytes,
    List<String>? sourceImageIds,
    String? startGeneratingTimestamp,
    String? status,
    String? style,
    String? task,
    String? type,
    String? userId,
    String? watermarkedPath,
    String? widthPx,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _aspectRatio = aspectRatio,
        _assetIds = assetIds,
        _baseImageVersionId = baseImageVersionId,
        _caption = caption,
        _characteristics = characteristics,
        _createdTimestamp = createdTimestamp,
        _creditsUsed = creditsUsed,
        _denoise = denoise,
        _estFinishTimestamp = estFinishTimestamp,
        _extension = extension,
        _externalProviderRequestId = externalProviderRequestId,
        _favorite = favorite,
        _finishTimestamp = finishTimestamp,
        _forTraining = forTraining,
        _freePlan = freePlan,
        _heightPx = heightPx,
        _id = id,
        _isGenerated = isGenerated,
        _isNsfw = isNsfw,
        _modelText = modelText,
        _outfitText = outfitText,
        _path = path,
        _public = public,
        _resolution = resolution,
        _s3Key = s3Key,
        _seed = seed,
        _setId = setId,
        _setText = setText,
        _sizeBytes = sizeBytes,
        _sourceImageIds = sourceImageIds,
        _startGeneratingTimestamp = startGeneratingTimestamp,
        _status = status,
        _style = style,
        _task = task,
        _type = type,
        _userId = userId,
        _watermarkedPath = watermarkedPath,
        _widthPx = widthPx,
        super(firestoreUtilData);

  // "aspect_ratio" field.
  String? _aspectRatio;
  String get aspectRatio => _aspectRatio ?? '';
  set aspectRatio(String? val) => _aspectRatio = val;

  bool hasAspectRatio() => _aspectRatio != null;

  // "asset_ids" field.
  List<String>? _assetIds;
  List<String> get assetIds => _assetIds ?? const [];
  set assetIds(List<String>? val) => _assetIds = val;

  void updateAssetIds(Function(List<String>) updateFn) {
    updateFn(_assetIds ??= []);
  }

  bool hasAssetIds() => _assetIds != null;

  // "base_image_version_id" field.
  String? _baseImageVersionId;
  String get baseImageVersionId => _baseImageVersionId ?? '';
  set baseImageVersionId(String? val) => _baseImageVersionId = val;

  bool hasBaseImageVersionId() => _baseImageVersionId != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  set caption(String? val) => _caption = val;

  bool hasCaption() => _caption != null;

  // "characteristics" field.
  String? _characteristics;
  String get characteristics => _characteristics ?? '';
  set characteristics(String? val) => _characteristics = val;

  bool hasCharacteristics() => _characteristics != null;

  // "created_timestamp" field.
  String? _createdTimestamp;
  String get createdTimestamp => _createdTimestamp ?? '';
  set createdTimestamp(String? val) => _createdTimestamp = val;

  bool hasCreatedTimestamp() => _createdTimestamp != null;

  // "credits_used" field.
  int? _creditsUsed;
  int get creditsUsed => _creditsUsed ?? 0;
  set creditsUsed(int? val) => _creditsUsed = val;

  void incrementCreditsUsed(int amount) => creditsUsed = creditsUsed + amount;

  bool hasCreditsUsed() => _creditsUsed != null;

  // "denoise" field.
  String? _denoise;
  String get denoise => _denoise ?? '';
  set denoise(String? val) => _denoise = val;

  bool hasDenoise() => _denoise != null;

  // "est_finish_timestamp" field.
  String? _estFinishTimestamp;
  String get estFinishTimestamp => _estFinishTimestamp ?? '';
  set estFinishTimestamp(String? val) => _estFinishTimestamp = val;

  bool hasEstFinishTimestamp() => _estFinishTimestamp != null;

  // "extension" field.
  String? _extension;
  String get extension => _extension ?? '';
  set extension(String? val) => _extension = val;

  bool hasExtension() => _extension != null;

  // "external_provider_request_id" field.
  String? _externalProviderRequestId;
  String get externalProviderRequestId => _externalProviderRequestId ?? '';
  set externalProviderRequestId(String? val) =>
      _externalProviderRequestId = val;

  bool hasExternalProviderRequestId() => _externalProviderRequestId != null;

  // "favorite" field.
  bool? _favorite;
  bool get favorite => _favorite ?? false;
  set favorite(bool? val) => _favorite = val;

  bool hasFavorite() => _favorite != null;

  // "finish_timestamp" field.
  String? _finishTimestamp;
  String get finishTimestamp => _finishTimestamp ?? '';
  set finishTimestamp(String? val) => _finishTimestamp = val;

  bool hasFinishTimestamp() => _finishTimestamp != null;

  // "for_training" field.
  bool? _forTraining;
  bool get forTraining => _forTraining ?? false;
  set forTraining(bool? val) => _forTraining = val;

  bool hasForTraining() => _forTraining != null;

  // "free_plan" field.
  bool? _freePlan;
  bool get freePlan => _freePlan ?? false;
  set freePlan(bool? val) => _freePlan = val;

  bool hasFreePlan() => _freePlan != null;

  // "height_px" field.
  String? _heightPx;
  String get heightPx => _heightPx ?? '';
  set heightPx(String? val) => _heightPx = val;

  bool hasHeightPx() => _heightPx != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "is_generated" field.
  bool? _isGenerated;
  bool get isGenerated => _isGenerated ?? false;
  set isGenerated(bool? val) => _isGenerated = val;

  bool hasIsGenerated() => _isGenerated != null;

  // "is_nsfw" field.
  bool? _isNsfw;
  bool get isNsfw => _isNsfw ?? false;
  set isNsfw(bool? val) => _isNsfw = val;

  bool hasIsNsfw() => _isNsfw != null;

  // "model_text" field.
  String? _modelText;
  String get modelText => _modelText ?? '';
  set modelText(String? val) => _modelText = val;

  bool hasModelText() => _modelText != null;

  // "outfit_text" field.
  String? _outfitText;
  String get outfitText => _outfitText ?? '';
  set outfitText(String? val) => _outfitText = val;

  bool hasOutfitText() => _outfitText != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  set public(bool? val) => _public = val;

  bool hasPublic() => _public != null;

  // "resolution" field.
  String? _resolution;
  String get resolution => _resolution ?? '';
  set resolution(String? val) => _resolution = val;

  bool hasResolution() => _resolution != null;

  // "s3_key" field.
  String? _s3Key;
  String get s3Key => _s3Key ?? '';
  set s3Key(String? val) => _s3Key = val;

  bool hasS3Key() => _s3Key != null;

  // "seed" field.
  String? _seed;
  String get seed => _seed ?? '';
  set seed(String? val) => _seed = val;

  bool hasSeed() => _seed != null;

  // "set_id" field.
  String? _setId;
  String get setId => _setId ?? '';
  set setId(String? val) => _setId = val;

  bool hasSetId() => _setId != null;

  // "set_text" field.
  String? _setText;
  String get setText => _setText ?? '';
  set setText(String? val) => _setText = val;

  bool hasSetText() => _setText != null;

  // "size_bytes" field.
  String? _sizeBytes;
  String get sizeBytes => _sizeBytes ?? '';
  set sizeBytes(String? val) => _sizeBytes = val;

  bool hasSizeBytes() => _sizeBytes != null;

  // "source_image_ids" field.
  List<String>? _sourceImageIds;
  List<String> get sourceImageIds => _sourceImageIds ?? const [];
  set sourceImageIds(List<String>? val) => _sourceImageIds = val;

  void updateSourceImageIds(Function(List<String>) updateFn) {
    updateFn(_sourceImageIds ??= []);
  }

  bool hasSourceImageIds() => _sourceImageIds != null;

  // "start_generating_timestamp" field.
  String? _startGeneratingTimestamp;
  String get startGeneratingTimestamp => _startGeneratingTimestamp ?? '';
  set startGeneratingTimestamp(String? val) => _startGeneratingTimestamp = val;

  bool hasStartGeneratingTimestamp() => _startGeneratingTimestamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  set style(String? val) => _style = val;

  bool hasStyle() => _style != null;

  // "task" field.
  String? _task;
  String get task => _task ?? '';
  set task(String? val) => _task = val;

  bool hasTask() => _task != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "watermarked_path" field.
  String? _watermarkedPath;
  String get watermarkedPath => _watermarkedPath ?? '';
  set watermarkedPath(String? val) => _watermarkedPath = val;

  bool hasWatermarkedPath() => _watermarkedPath != null;

  // "width_px" field.
  String? _widthPx;
  String get widthPx => _widthPx ?? '';
  set widthPx(String? val) => _widthPx = val;

  bool hasWidthPx() => _widthPx != null;

  static TryonStruct fromMap(Map<String, dynamic> data) => TryonStruct(
        aspectRatio: data['aspect_ratio'] as String?,
        assetIds: getDataList(data['asset_ids']),
        baseImageVersionId: data['base_image_version_id'] as String?,
        caption: data['caption'] as String?,
        characteristics: data['characteristics'] as String?,
        createdTimestamp: data['created_timestamp'] as String?,
        creditsUsed: castToType<int>(data['credits_used']),
        denoise: data['denoise'] as String?,
        estFinishTimestamp: data['est_finish_timestamp'] as String?,
        extension: data['extension'] as String?,
        externalProviderRequestId:
            data['external_provider_request_id'] as String?,
        favorite: data['favorite'] as bool?,
        finishTimestamp: data['finish_timestamp'] as String?,
        forTraining: data['for_training'] as bool?,
        freePlan: data['free_plan'] as bool?,
        heightPx: data['height_px'] as String?,
        id: data['id'] as String?,
        isGenerated: data['is_generated'] as bool?,
        isNsfw: data['is_nsfw'] as bool?,
        modelText: data['model_text'] as String?,
        outfitText: data['outfit_text'] as String?,
        path: data['path'] as String?,
        public: data['public'] as bool?,
        resolution: data['resolution'] as String?,
        s3Key: data['s3_key'] as String?,
        seed: data['seed'] as String?,
        setId: data['set_id'] as String?,
        setText: data['set_text'] as String?,
        sizeBytes: data['size_bytes'] as String?,
        sourceImageIds: getDataList(data['source_image_ids']),
        startGeneratingTimestamp: data['start_generating_timestamp'] as String?,
        status: data['status'] as String?,
        style: data['style'] as String?,
        task: data['task'] as String?,
        type: data['type'] as String?,
        userId: data['user_id'] as String?,
        watermarkedPath: data['watermarked_path'] as String?,
        widthPx: data['width_px'] as String?,
      );

  static TryonStruct? maybeFromMap(dynamic data) =>
      data is Map ? TryonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'aspect_ratio': _aspectRatio,
        'asset_ids': _assetIds,
        'base_image_version_id': _baseImageVersionId,
        'caption': _caption,
        'characteristics': _characteristics,
        'created_timestamp': _createdTimestamp,
        'credits_used': _creditsUsed,
        'denoise': _denoise,
        'est_finish_timestamp': _estFinishTimestamp,
        'extension': _extension,
        'external_provider_request_id': _externalProviderRequestId,
        'favorite': _favorite,
        'finish_timestamp': _finishTimestamp,
        'for_training': _forTraining,
        'free_plan': _freePlan,
        'height_px': _heightPx,
        'id': _id,
        'is_generated': _isGenerated,
        'is_nsfw': _isNsfw,
        'model_text': _modelText,
        'outfit_text': _outfitText,
        'path': _path,
        'public': _public,
        'resolution': _resolution,
        's3_key': _s3Key,
        'seed': _seed,
        'set_id': _setId,
        'set_text': _setText,
        'size_bytes': _sizeBytes,
        'source_image_ids': _sourceImageIds,
        'start_generating_timestamp': _startGeneratingTimestamp,
        'status': _status,
        'style': _style,
        'task': _task,
        'type': _type,
        'user_id': _userId,
        'watermarked_path': _watermarkedPath,
        'width_px': _widthPx,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'aspect_ratio': serializeParam(
          _aspectRatio,
          ParamType.String,
        ),
        'asset_ids': serializeParam(
          _assetIds,
          ParamType.String,
          isList: true,
        ),
        'base_image_version_id': serializeParam(
          _baseImageVersionId,
          ParamType.String,
        ),
        'caption': serializeParam(
          _caption,
          ParamType.String,
        ),
        'characteristics': serializeParam(
          _characteristics,
          ParamType.String,
        ),
        'created_timestamp': serializeParam(
          _createdTimestamp,
          ParamType.String,
        ),
        'credits_used': serializeParam(
          _creditsUsed,
          ParamType.int,
        ),
        'denoise': serializeParam(
          _denoise,
          ParamType.String,
        ),
        'est_finish_timestamp': serializeParam(
          _estFinishTimestamp,
          ParamType.String,
        ),
        'extension': serializeParam(
          _extension,
          ParamType.String,
        ),
        'external_provider_request_id': serializeParam(
          _externalProviderRequestId,
          ParamType.String,
        ),
        'favorite': serializeParam(
          _favorite,
          ParamType.bool,
        ),
        'finish_timestamp': serializeParam(
          _finishTimestamp,
          ParamType.String,
        ),
        'for_training': serializeParam(
          _forTraining,
          ParamType.bool,
        ),
        'free_plan': serializeParam(
          _freePlan,
          ParamType.bool,
        ),
        'height_px': serializeParam(
          _heightPx,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'is_generated': serializeParam(
          _isGenerated,
          ParamType.bool,
        ),
        'is_nsfw': serializeParam(
          _isNsfw,
          ParamType.bool,
        ),
        'model_text': serializeParam(
          _modelText,
          ParamType.String,
        ),
        'outfit_text': serializeParam(
          _outfitText,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'public': serializeParam(
          _public,
          ParamType.bool,
        ),
        'resolution': serializeParam(
          _resolution,
          ParamType.String,
        ),
        's3_key': serializeParam(
          _s3Key,
          ParamType.String,
        ),
        'seed': serializeParam(
          _seed,
          ParamType.String,
        ),
        'set_id': serializeParam(
          _setId,
          ParamType.String,
        ),
        'set_text': serializeParam(
          _setText,
          ParamType.String,
        ),
        'size_bytes': serializeParam(
          _sizeBytes,
          ParamType.String,
        ),
        'source_image_ids': serializeParam(
          _sourceImageIds,
          ParamType.String,
          isList: true,
        ),
        'start_generating_timestamp': serializeParam(
          _startGeneratingTimestamp,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'style': serializeParam(
          _style,
          ParamType.String,
        ),
        'task': serializeParam(
          _task,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'watermarked_path': serializeParam(
          _watermarkedPath,
          ParamType.String,
        ),
        'width_px': serializeParam(
          _widthPx,
          ParamType.String,
        ),
      }.withoutNulls;

  static TryonStruct fromSerializableMap(Map<String, dynamic> data) =>
      TryonStruct(
        aspectRatio: deserializeParam(
          data['aspect_ratio'],
          ParamType.String,
          false,
        ),
        assetIds: deserializeParam<String>(
          data['asset_ids'],
          ParamType.String,
          true,
        ),
        baseImageVersionId: deserializeParam(
          data['base_image_version_id'],
          ParamType.String,
          false,
        ),
        caption: deserializeParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        characteristics: deserializeParam(
          data['characteristics'],
          ParamType.String,
          false,
        ),
        createdTimestamp: deserializeParam(
          data['created_timestamp'],
          ParamType.String,
          false,
        ),
        creditsUsed: deserializeParam(
          data['credits_used'],
          ParamType.int,
          false,
        ),
        denoise: deserializeParam(
          data['denoise'],
          ParamType.String,
          false,
        ),
        estFinishTimestamp: deserializeParam(
          data['est_finish_timestamp'],
          ParamType.String,
          false,
        ),
        extension: deserializeParam(
          data['extension'],
          ParamType.String,
          false,
        ),
        externalProviderRequestId: deserializeParam(
          data['external_provider_request_id'],
          ParamType.String,
          false,
        ),
        favorite: deserializeParam(
          data['favorite'],
          ParamType.bool,
          false,
        ),
        finishTimestamp: deserializeParam(
          data['finish_timestamp'],
          ParamType.String,
          false,
        ),
        forTraining: deserializeParam(
          data['for_training'],
          ParamType.bool,
          false,
        ),
        freePlan: deserializeParam(
          data['free_plan'],
          ParamType.bool,
          false,
        ),
        heightPx: deserializeParam(
          data['height_px'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isGenerated: deserializeParam(
          data['is_generated'],
          ParamType.bool,
          false,
        ),
        isNsfw: deserializeParam(
          data['is_nsfw'],
          ParamType.bool,
          false,
        ),
        modelText: deserializeParam(
          data['model_text'],
          ParamType.String,
          false,
        ),
        outfitText: deserializeParam(
          data['outfit_text'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        public: deserializeParam(
          data['public'],
          ParamType.bool,
          false,
        ),
        resolution: deserializeParam(
          data['resolution'],
          ParamType.String,
          false,
        ),
        s3Key: deserializeParam(
          data['s3_key'],
          ParamType.String,
          false,
        ),
        seed: deserializeParam(
          data['seed'],
          ParamType.String,
          false,
        ),
        setId: deserializeParam(
          data['set_id'],
          ParamType.String,
          false,
        ),
        setText: deserializeParam(
          data['set_text'],
          ParamType.String,
          false,
        ),
        sizeBytes: deserializeParam(
          data['size_bytes'],
          ParamType.String,
          false,
        ),
        sourceImageIds: deserializeParam<String>(
          data['source_image_ids'],
          ParamType.String,
          true,
        ),
        startGeneratingTimestamp: deserializeParam(
          data['start_generating_timestamp'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        style: deserializeParam(
          data['style'],
          ParamType.String,
          false,
        ),
        task: deserializeParam(
          data['task'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        watermarkedPath: deserializeParam(
          data['watermarked_path'],
          ParamType.String,
          false,
        ),
        widthPx: deserializeParam(
          data['width_px'],
          ParamType.String,
          false,
        ),
      );

  static TryonStruct fromAlgoliaData(Map<String, dynamic> data) => TryonStruct(
        aspectRatio: convertAlgoliaParam(
          data['aspect_ratio'],
          ParamType.String,
          false,
        ),
        assetIds: convertAlgoliaParam<String>(
          data['asset_ids'],
          ParamType.String,
          true,
        ),
        baseImageVersionId: convertAlgoliaParam(
          data['base_image_version_id'],
          ParamType.String,
          false,
        ),
        caption: convertAlgoliaParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        characteristics: convertAlgoliaParam(
          data['characteristics'],
          ParamType.String,
          false,
        ),
        createdTimestamp: convertAlgoliaParam(
          data['created_timestamp'],
          ParamType.String,
          false,
        ),
        creditsUsed: convertAlgoliaParam(
          data['credits_used'],
          ParamType.int,
          false,
        ),
        denoise: convertAlgoliaParam(
          data['denoise'],
          ParamType.String,
          false,
        ),
        estFinishTimestamp: convertAlgoliaParam(
          data['est_finish_timestamp'],
          ParamType.String,
          false,
        ),
        extension: convertAlgoliaParam(
          data['extension'],
          ParamType.String,
          false,
        ),
        externalProviderRequestId: convertAlgoliaParam(
          data['external_provider_request_id'],
          ParamType.String,
          false,
        ),
        favorite: convertAlgoliaParam(
          data['favorite'],
          ParamType.bool,
          false,
        ),
        finishTimestamp: convertAlgoliaParam(
          data['finish_timestamp'],
          ParamType.String,
          false,
        ),
        forTraining: convertAlgoliaParam(
          data['for_training'],
          ParamType.bool,
          false,
        ),
        freePlan: convertAlgoliaParam(
          data['free_plan'],
          ParamType.bool,
          false,
        ),
        heightPx: convertAlgoliaParam(
          data['height_px'],
          ParamType.String,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isGenerated: convertAlgoliaParam(
          data['is_generated'],
          ParamType.bool,
          false,
        ),
        isNsfw: convertAlgoliaParam(
          data['is_nsfw'],
          ParamType.bool,
          false,
        ),
        modelText: convertAlgoliaParam(
          data['model_text'],
          ParamType.String,
          false,
        ),
        outfitText: convertAlgoliaParam(
          data['outfit_text'],
          ParamType.String,
          false,
        ),
        path: convertAlgoliaParam(
          data['path'],
          ParamType.String,
          false,
        ),
        public: convertAlgoliaParam(
          data['public'],
          ParamType.bool,
          false,
        ),
        resolution: convertAlgoliaParam(
          data['resolution'],
          ParamType.String,
          false,
        ),
        s3Key: convertAlgoliaParam(
          data['s3_key'],
          ParamType.String,
          false,
        ),
        seed: convertAlgoliaParam(
          data['seed'],
          ParamType.String,
          false,
        ),
        setId: convertAlgoliaParam(
          data['set_id'],
          ParamType.String,
          false,
        ),
        setText: convertAlgoliaParam(
          data['set_text'],
          ParamType.String,
          false,
        ),
        sizeBytes: convertAlgoliaParam(
          data['size_bytes'],
          ParamType.String,
          false,
        ),
        sourceImageIds: convertAlgoliaParam<String>(
          data['source_image_ids'],
          ParamType.String,
          true,
        ),
        startGeneratingTimestamp: convertAlgoliaParam(
          data['start_generating_timestamp'],
          ParamType.String,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        style: convertAlgoliaParam(
          data['style'],
          ParamType.String,
          false,
        ),
        task: convertAlgoliaParam(
          data['task'],
          ParamType.String,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        userId: convertAlgoliaParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        watermarkedPath: convertAlgoliaParam(
          data['watermarked_path'],
          ParamType.String,
          false,
        ),
        widthPx: convertAlgoliaParam(
          data['width_px'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TryonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TryonStruct &&
        aspectRatio == other.aspectRatio &&
        listEquality.equals(assetIds, other.assetIds) &&
        baseImageVersionId == other.baseImageVersionId &&
        caption == other.caption &&
        characteristics == other.characteristics &&
        createdTimestamp == other.createdTimestamp &&
        creditsUsed == other.creditsUsed &&
        denoise == other.denoise &&
        estFinishTimestamp == other.estFinishTimestamp &&
        extension == other.extension &&
        externalProviderRequestId == other.externalProviderRequestId &&
        favorite == other.favorite &&
        finishTimestamp == other.finishTimestamp &&
        forTraining == other.forTraining &&
        freePlan == other.freePlan &&
        heightPx == other.heightPx &&
        id == other.id &&
        isGenerated == other.isGenerated &&
        isNsfw == other.isNsfw &&
        modelText == other.modelText &&
        outfitText == other.outfitText &&
        path == other.path &&
        public == other.public &&
        resolution == other.resolution &&
        s3Key == other.s3Key &&
        seed == other.seed &&
        setId == other.setId &&
        setText == other.setText &&
        sizeBytes == other.sizeBytes &&
        listEquality.equals(sourceImageIds, other.sourceImageIds) &&
        startGeneratingTimestamp == other.startGeneratingTimestamp &&
        status == other.status &&
        style == other.style &&
        task == other.task &&
        type == other.type &&
        userId == other.userId &&
        watermarkedPath == other.watermarkedPath &&
        widthPx == other.widthPx;
  }

  @override
  int get hashCode => const ListEquality().hash([
        aspectRatio,
        assetIds,
        baseImageVersionId,
        caption,
        characteristics,
        createdTimestamp,
        creditsUsed,
        denoise,
        estFinishTimestamp,
        extension,
        externalProviderRequestId,
        favorite,
        finishTimestamp,
        forTraining,
        freePlan,
        heightPx,
        id,
        isGenerated,
        isNsfw,
        modelText,
        outfitText,
        path,
        public,
        resolution,
        s3Key,
        seed,
        setId,
        setText,
        sizeBytes,
        sourceImageIds,
        startGeneratingTimestamp,
        status,
        style,
        task,
        type,
        userId,
        watermarkedPath,
        widthPx
      ]);
}

TryonStruct createTryonStruct({
  String? aspectRatio,
  String? baseImageVersionId,
  String? caption,
  String? characteristics,
  String? createdTimestamp,
  int? creditsUsed,
  String? denoise,
  String? estFinishTimestamp,
  String? extension,
  String? externalProviderRequestId,
  bool? favorite,
  String? finishTimestamp,
  bool? forTraining,
  bool? freePlan,
  String? heightPx,
  String? id,
  bool? isGenerated,
  bool? isNsfw,
  String? modelText,
  String? outfitText,
  String? path,
  bool? public,
  String? resolution,
  String? s3Key,
  String? seed,
  String? setId,
  String? setText,
  String? sizeBytes,
  String? startGeneratingTimestamp,
  String? status,
  String? style,
  String? task,
  String? type,
  String? userId,
  String? watermarkedPath,
  String? widthPx,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TryonStruct(
      aspectRatio: aspectRatio,
      baseImageVersionId: baseImageVersionId,
      caption: caption,
      characteristics: characteristics,
      createdTimestamp: createdTimestamp,
      creditsUsed: creditsUsed,
      denoise: denoise,
      estFinishTimestamp: estFinishTimestamp,
      extension: extension,
      externalProviderRequestId: externalProviderRequestId,
      favorite: favorite,
      finishTimestamp: finishTimestamp,
      forTraining: forTraining,
      freePlan: freePlan,
      heightPx: heightPx,
      id: id,
      isGenerated: isGenerated,
      isNsfw: isNsfw,
      modelText: modelText,
      outfitText: outfitText,
      path: path,
      public: public,
      resolution: resolution,
      s3Key: s3Key,
      seed: seed,
      setId: setId,
      setText: setText,
      sizeBytes: sizeBytes,
      startGeneratingTimestamp: startGeneratingTimestamp,
      status: status,
      style: style,
      task: task,
      type: type,
      userId: userId,
      watermarkedPath: watermarkedPath,
      widthPx: widthPx,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TryonStruct? updateTryonStruct(
  TryonStruct? tryon, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tryon
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTryonStructData(
  Map<String, dynamic> firestoreData,
  TryonStruct? tryon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tryon == null) {
    return;
  }
  if (tryon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tryon.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tryonData = getTryonFirestoreData(tryon, forFieldValue);
  final nestedData = tryonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tryon.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTryonFirestoreData(
  TryonStruct? tryon, [
  bool forFieldValue = false,
]) {
  if (tryon == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tryon.toMap());

  // Add any Firestore field values
  mapToFirestore(tryon.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTryonListFirestoreData(
  List<TryonStruct>? tryons,
) =>
    tryons?.map((e) => getTryonFirestoreData(e, true)).toList() ?? [];
