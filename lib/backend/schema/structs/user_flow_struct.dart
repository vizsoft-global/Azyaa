// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFlowStruct extends FFFirebaseStruct {
  UserFlowStruct({
    int? refresh,
    int? count,
    bool? userWaiterStatus,
    List<UserPreferencesCategoriesStruct>? userCategoryPreferenceList,
    String? userCategoryPreferenceFindStatus,
    List<UserRecentViewedListStruct>? userRecentView,
    DocumentReference? userRef,
    String? userEmail,
    int? userEmailOtp,
    int? userEmailOtpAttempt,
    String? phoneNumberCountry,
    String? userPhoneNumber,
    String? phoneNumberWithoutDailcode,
    String? userPhoneOtpOrderId,
    int? userPhoneOtpAttempt,
    String? phoneNumberDailcode,
    String? phoneNumberDailcodeWithPlus,
    int? userCartCount,
    List<UserCartItemsStruct>? userCartItemList,
    List<ProductAttributesNewStruct>? userCartItemProductAttribute,
    List<DocumentReference>? userSelectedProductList,
    int? userSelectedProductCount,
    String? userSelectedProductFoundStatus,
    List<UserRecentViewedListStruct>? userProductSwatchesList,
    List<ProductAttributesNewStruct>? userSwatchesProductAttribute,
    String? userCartItemPAFound,
    int? userCartItemPAIndex,
    int? userWaitlistId,
    String? userWaitlistEmail,
    String? userWaitlistPhoneNumber,
    List<SelectedProductAttrbuitesStruct>? userSelectedProductAttrbuites,
    UserBodyStruct? userSelectedBody,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _refresh = refresh,
        _count = count,
        _userWaiterStatus = userWaiterStatus,
        _userCategoryPreferenceList = userCategoryPreferenceList,
        _userCategoryPreferenceFindStatus = userCategoryPreferenceFindStatus,
        _userRecentView = userRecentView,
        _userRef = userRef,
        _userEmail = userEmail,
        _userEmailOtp = userEmailOtp,
        _userEmailOtpAttempt = userEmailOtpAttempt,
        _phoneNumberCountry = phoneNumberCountry,
        _userPhoneNumber = userPhoneNumber,
        _phoneNumberWithoutDailcode = phoneNumberWithoutDailcode,
        _userPhoneOtpOrderId = userPhoneOtpOrderId,
        _userPhoneOtpAttempt = userPhoneOtpAttempt,
        _phoneNumberDailcode = phoneNumberDailcode,
        _phoneNumberDailcodeWithPlus = phoneNumberDailcodeWithPlus,
        _userCartCount = userCartCount,
        _userCartItemList = userCartItemList,
        _userCartItemProductAttribute = userCartItemProductAttribute,
        _userSelectedProductList = userSelectedProductList,
        _userSelectedProductCount = userSelectedProductCount,
        _userSelectedProductFoundStatus = userSelectedProductFoundStatus,
        _userProductSwatchesList = userProductSwatchesList,
        _userSwatchesProductAttribute = userSwatchesProductAttribute,
        _userCartItemPAFound = userCartItemPAFound,
        _userCartItemPAIndex = userCartItemPAIndex,
        _userWaitlistId = userWaitlistId,
        _userWaitlistEmail = userWaitlistEmail,
        _userWaitlistPhoneNumber = userWaitlistPhoneNumber,
        _userSelectedProductAttrbuites = userSelectedProductAttrbuites,
        _userSelectedBody = userSelectedBody,
        super(firestoreUtilData);

  // "refresh" field.
  int? _refresh;
  int get refresh => _refresh ?? 0;
  set refresh(int? val) => _refresh = val;

  void incrementRefresh(int amount) => refresh = refresh + amount;

  bool hasRefresh() => _refresh != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "user_waiter_status" field.
  bool? _userWaiterStatus;
  bool get userWaiterStatus => _userWaiterStatus ?? false;
  set userWaiterStatus(bool? val) => _userWaiterStatus = val;

  bool hasUserWaiterStatus() => _userWaiterStatus != null;

  // "user_category_preference_list" field.
  List<UserPreferencesCategoriesStruct>? _userCategoryPreferenceList;
  List<UserPreferencesCategoriesStruct> get userCategoryPreferenceList =>
      _userCategoryPreferenceList ?? const [];
  set userCategoryPreferenceList(List<UserPreferencesCategoriesStruct>? val) =>
      _userCategoryPreferenceList = val;

  void updateUserCategoryPreferenceList(
      Function(List<UserPreferencesCategoriesStruct>) updateFn) {
    updateFn(_userCategoryPreferenceList ??= []);
  }

  bool hasUserCategoryPreferenceList() => _userCategoryPreferenceList != null;

  // "user_category_preference_find_status" field.
  String? _userCategoryPreferenceFindStatus;
  String get userCategoryPreferenceFindStatus =>
      _userCategoryPreferenceFindStatus ?? '';
  set userCategoryPreferenceFindStatus(String? val) =>
      _userCategoryPreferenceFindStatus = val;

  bool hasUserCategoryPreferenceFindStatus() =>
      _userCategoryPreferenceFindStatus != null;

  // "user_recent_view" field.
  List<UserRecentViewedListStruct>? _userRecentView;
  List<UserRecentViewedListStruct> get userRecentView =>
      _userRecentView ?? const [];
  set userRecentView(List<UserRecentViewedListStruct>? val) =>
      _userRecentView = val;

  void updateUserRecentView(
      Function(List<UserRecentViewedListStruct>) updateFn) {
    updateFn(_userRecentView ??= []);
  }

  bool hasUserRecentView() => _userRecentView != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;

  bool hasUserEmail() => _userEmail != null;

  // "user_email_otp" field.
  int? _userEmailOtp;
  int get userEmailOtp => _userEmailOtp ?? 0;
  set userEmailOtp(int? val) => _userEmailOtp = val;

  void incrementUserEmailOtp(int amount) =>
      userEmailOtp = userEmailOtp + amount;

  bool hasUserEmailOtp() => _userEmailOtp != null;

  // "user_email_otp_attempt" field.
  int? _userEmailOtpAttempt;
  int get userEmailOtpAttempt => _userEmailOtpAttempt ?? 0;
  set userEmailOtpAttempt(int? val) => _userEmailOtpAttempt = val;

  void incrementUserEmailOtpAttempt(int amount) =>
      userEmailOtpAttempt = userEmailOtpAttempt + amount;

  bool hasUserEmailOtpAttempt() => _userEmailOtpAttempt != null;

  // "phone_number_country" field.
  String? _phoneNumberCountry;
  String get phoneNumberCountry => _phoneNumberCountry ?? '';
  set phoneNumberCountry(String? val) => _phoneNumberCountry = val;

  bool hasPhoneNumberCountry() => _phoneNumberCountry != null;

  // "user_phone_number" field.
  String? _userPhoneNumber;
  String get userPhoneNumber => _userPhoneNumber ?? '';
  set userPhoneNumber(String? val) => _userPhoneNumber = val;

  bool hasUserPhoneNumber() => _userPhoneNumber != null;

  // "phone_number_without_dailcode" field.
  String? _phoneNumberWithoutDailcode;
  String get phoneNumberWithoutDailcode => _phoneNumberWithoutDailcode ?? '';
  set phoneNumberWithoutDailcode(String? val) =>
      _phoneNumberWithoutDailcode = val;

  bool hasPhoneNumberWithoutDailcode() => _phoneNumberWithoutDailcode != null;

  // "user_phone_otp_order_id" field.
  String? _userPhoneOtpOrderId;
  String get userPhoneOtpOrderId => _userPhoneOtpOrderId ?? '';
  set userPhoneOtpOrderId(String? val) => _userPhoneOtpOrderId = val;

  bool hasUserPhoneOtpOrderId() => _userPhoneOtpOrderId != null;

  // "user_phone_otp_attempt" field.
  int? _userPhoneOtpAttempt;
  int get userPhoneOtpAttempt => _userPhoneOtpAttempt ?? 0;
  set userPhoneOtpAttempt(int? val) => _userPhoneOtpAttempt = val;

  void incrementUserPhoneOtpAttempt(int amount) =>
      userPhoneOtpAttempt = userPhoneOtpAttempt + amount;

  bool hasUserPhoneOtpAttempt() => _userPhoneOtpAttempt != null;

  // "phone_number_dailcode" field.
  String? _phoneNumberDailcode;
  String get phoneNumberDailcode => _phoneNumberDailcode ?? '';
  set phoneNumberDailcode(String? val) => _phoneNumberDailcode = val;

  bool hasPhoneNumberDailcode() => _phoneNumberDailcode != null;

  // "phone_number_dailcode_with_plus" field.
  String? _phoneNumberDailcodeWithPlus;
  String get phoneNumberDailcodeWithPlus => _phoneNumberDailcodeWithPlus ?? '';
  set phoneNumberDailcodeWithPlus(String? val) =>
      _phoneNumberDailcodeWithPlus = val;

  bool hasPhoneNumberDailcodeWithPlus() => _phoneNumberDailcodeWithPlus != null;

  // "user_cart_count" field.
  int? _userCartCount;
  int get userCartCount => _userCartCount ?? 0;
  set userCartCount(int? val) => _userCartCount = val;

  void incrementUserCartCount(int amount) =>
      userCartCount = userCartCount + amount;

  bool hasUserCartCount() => _userCartCount != null;

  // "user_cart_item_list" field.
  List<UserCartItemsStruct>? _userCartItemList;
  List<UserCartItemsStruct> get userCartItemList =>
      _userCartItemList ?? const [];
  set userCartItemList(List<UserCartItemsStruct>? val) =>
      _userCartItemList = val;

  void updateUserCartItemList(Function(List<UserCartItemsStruct>) updateFn) {
    updateFn(_userCartItemList ??= []);
  }

  bool hasUserCartItemList() => _userCartItemList != null;

  // "user_cart_item_product_attribute" field.
  List<ProductAttributesNewStruct>? _userCartItemProductAttribute;
  List<ProductAttributesNewStruct> get userCartItemProductAttribute =>
      _userCartItemProductAttribute ?? const [];
  set userCartItemProductAttribute(List<ProductAttributesNewStruct>? val) =>
      _userCartItemProductAttribute = val;

  void updateUserCartItemProductAttribute(
      Function(List<ProductAttributesNewStruct>) updateFn) {
    updateFn(_userCartItemProductAttribute ??= []);
  }

  bool hasUserCartItemProductAttribute() =>
      _userCartItemProductAttribute != null;

  // "user_selected_product_List" field.
  List<DocumentReference>? _userSelectedProductList;
  List<DocumentReference> get userSelectedProductList =>
      _userSelectedProductList ?? const [];
  set userSelectedProductList(List<DocumentReference>? val) =>
      _userSelectedProductList = val;

  void updateUserSelectedProductList(
      Function(List<DocumentReference>) updateFn) {
    updateFn(_userSelectedProductList ??= []);
  }

  bool hasUserSelectedProductList() => _userSelectedProductList != null;

  // "user_selected_product_count" field.
  int? _userSelectedProductCount;
  int get userSelectedProductCount => _userSelectedProductCount ?? 0;
  set userSelectedProductCount(int? val) => _userSelectedProductCount = val;

  void incrementUserSelectedProductCount(int amount) =>
      userSelectedProductCount = userSelectedProductCount + amount;

  bool hasUserSelectedProductCount() => _userSelectedProductCount != null;

  // "user_selected_product_found_status" field.
  String? _userSelectedProductFoundStatus;
  String get userSelectedProductFoundStatus =>
      _userSelectedProductFoundStatus ?? '';
  set userSelectedProductFoundStatus(String? val) =>
      _userSelectedProductFoundStatus = val;

  bool hasUserSelectedProductFoundStatus() =>
      _userSelectedProductFoundStatus != null;

  // "user_product_swatches_list" field.
  List<UserRecentViewedListStruct>? _userProductSwatchesList;
  List<UserRecentViewedListStruct> get userProductSwatchesList =>
      _userProductSwatchesList ?? const [];
  set userProductSwatchesList(List<UserRecentViewedListStruct>? val) =>
      _userProductSwatchesList = val;

  void updateUserProductSwatchesList(
      Function(List<UserRecentViewedListStruct>) updateFn) {
    updateFn(_userProductSwatchesList ??= []);
  }

  bool hasUserProductSwatchesList() => _userProductSwatchesList != null;

  // "user_swatches_product_attribute" field.
  List<ProductAttributesNewStruct>? _userSwatchesProductAttribute;
  List<ProductAttributesNewStruct> get userSwatchesProductAttribute =>
      _userSwatchesProductAttribute ?? const [];
  set userSwatchesProductAttribute(List<ProductAttributesNewStruct>? val) =>
      _userSwatchesProductAttribute = val;

  void updateUserSwatchesProductAttribute(
      Function(List<ProductAttributesNewStruct>) updateFn) {
    updateFn(_userSwatchesProductAttribute ??= []);
  }

  bool hasUserSwatchesProductAttribute() =>
      _userSwatchesProductAttribute != null;

  // "user_cart_item_PA_found" field.
  String? _userCartItemPAFound;
  String get userCartItemPAFound => _userCartItemPAFound ?? '';
  set userCartItemPAFound(String? val) => _userCartItemPAFound = val;

  bool hasUserCartItemPAFound() => _userCartItemPAFound != null;

  // "user_cart_item_PA_Index" field.
  int? _userCartItemPAIndex;
  int get userCartItemPAIndex => _userCartItemPAIndex ?? 0;
  set userCartItemPAIndex(int? val) => _userCartItemPAIndex = val;

  void incrementUserCartItemPAIndex(int amount) =>
      userCartItemPAIndex = userCartItemPAIndex + amount;

  bool hasUserCartItemPAIndex() => _userCartItemPAIndex != null;

  // "user_waitlist_id" field.
  int? _userWaitlistId;
  int get userWaitlistId => _userWaitlistId ?? 0;
  set userWaitlistId(int? val) => _userWaitlistId = val;

  void incrementUserWaitlistId(int amount) =>
      userWaitlistId = userWaitlistId + amount;

  bool hasUserWaitlistId() => _userWaitlistId != null;

  // "user_waitlist_email" field.
  String? _userWaitlistEmail;
  String get userWaitlistEmail => _userWaitlistEmail ?? '';
  set userWaitlistEmail(String? val) => _userWaitlistEmail = val;

  bool hasUserWaitlistEmail() => _userWaitlistEmail != null;

  // "user_waitlist_phone_number" field.
  String? _userWaitlistPhoneNumber;
  String get userWaitlistPhoneNumber => _userWaitlistPhoneNumber ?? '';
  set userWaitlistPhoneNumber(String? val) => _userWaitlistPhoneNumber = val;

  bool hasUserWaitlistPhoneNumber() => _userWaitlistPhoneNumber != null;

  // "user_selected_product_attrbuites" field.
  List<SelectedProductAttrbuitesStruct>? _userSelectedProductAttrbuites;
  List<SelectedProductAttrbuitesStruct> get userSelectedProductAttrbuites =>
      _userSelectedProductAttrbuites ?? const [];
  set userSelectedProductAttrbuites(
          List<SelectedProductAttrbuitesStruct>? val) =>
      _userSelectedProductAttrbuites = val;

  void updateUserSelectedProductAttrbuites(
      Function(List<SelectedProductAttrbuitesStruct>) updateFn) {
    updateFn(_userSelectedProductAttrbuites ??= []);
  }

  bool hasUserSelectedProductAttrbuites() =>
      _userSelectedProductAttrbuites != null;

  // "user_selected_body" field.
  UserBodyStruct? _userSelectedBody;
  UserBodyStruct get userSelectedBody => _userSelectedBody ?? UserBodyStruct();
  set userSelectedBody(UserBodyStruct? val) => _userSelectedBody = val;

  void updateUserSelectedBody(Function(UserBodyStruct) updateFn) {
    updateFn(_userSelectedBody ??= UserBodyStruct());
  }

  bool hasUserSelectedBody() => _userSelectedBody != null;

  static UserFlowStruct fromMap(Map<String, dynamic> data) => UserFlowStruct(
        refresh: castToType<int>(data['refresh']),
        count: castToType<int>(data['count']),
        userWaiterStatus: data['user_waiter_status'] as bool?,
        userCategoryPreferenceList: getStructList(
          data['user_category_preference_list'],
          UserPreferencesCategoriesStruct.fromMap,
        ),
        userCategoryPreferenceFindStatus:
            data['user_category_preference_find_status'] as String?,
        userRecentView: getStructList(
          data['user_recent_view'],
          UserRecentViewedListStruct.fromMap,
        ),
        userRef: data['user_ref'] as DocumentReference?,
        userEmail: data['user_email'] as String?,
        userEmailOtp: castToType<int>(data['user_email_otp']),
        userEmailOtpAttempt: castToType<int>(data['user_email_otp_attempt']),
        phoneNumberCountry: data['phone_number_country'] as String?,
        userPhoneNumber: data['user_phone_number'] as String?,
        phoneNumberWithoutDailcode:
            data['phone_number_without_dailcode'] as String?,
        userPhoneOtpOrderId: data['user_phone_otp_order_id'] as String?,
        userPhoneOtpAttempt: castToType<int>(data['user_phone_otp_attempt']),
        phoneNumberDailcode: data['phone_number_dailcode'] as String?,
        phoneNumberDailcodeWithPlus:
            data['phone_number_dailcode_with_plus'] as String?,
        userCartCount: castToType<int>(data['user_cart_count']),
        userCartItemList: getStructList(
          data['user_cart_item_list'],
          UserCartItemsStruct.fromMap,
        ),
        userCartItemProductAttribute: getStructList(
          data['user_cart_item_product_attribute'],
          ProductAttributesNewStruct.fromMap,
        ),
        userSelectedProductList:
            getDataList(data['user_selected_product_List']),
        userSelectedProductCount:
            castToType<int>(data['user_selected_product_count']),
        userSelectedProductFoundStatus:
            data['user_selected_product_found_status'] as String?,
        userProductSwatchesList: getStructList(
          data['user_product_swatches_list'],
          UserRecentViewedListStruct.fromMap,
        ),
        userSwatchesProductAttribute: getStructList(
          data['user_swatches_product_attribute'],
          ProductAttributesNewStruct.fromMap,
        ),
        userCartItemPAFound: data['user_cart_item_PA_found'] as String?,
        userCartItemPAIndex: castToType<int>(data['user_cart_item_PA_Index']),
        userWaitlistId: castToType<int>(data['user_waitlist_id']),
        userWaitlistEmail: data['user_waitlist_email'] as String?,
        userWaitlistPhoneNumber: data['user_waitlist_phone_number'] as String?,
        userSelectedProductAttrbuites: getStructList(
          data['user_selected_product_attrbuites'],
          SelectedProductAttrbuitesStruct.fromMap,
        ),
        userSelectedBody: data['user_selected_body'] is UserBodyStruct
            ? data['user_selected_body']
            : UserBodyStruct.maybeFromMap(data['user_selected_body']),
      );

  static UserFlowStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserFlowStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'refresh': _refresh,
        'count': _count,
        'user_waiter_status': _userWaiterStatus,
        'user_category_preference_list':
            _userCategoryPreferenceList?.map((e) => e.toMap()).toList(),
        'user_category_preference_find_status':
            _userCategoryPreferenceFindStatus,
        'user_recent_view': _userRecentView?.map((e) => e.toMap()).toList(),
        'user_ref': _userRef,
        'user_email': _userEmail,
        'user_email_otp': _userEmailOtp,
        'user_email_otp_attempt': _userEmailOtpAttempt,
        'phone_number_country': _phoneNumberCountry,
        'user_phone_number': _userPhoneNumber,
        'phone_number_without_dailcode': _phoneNumberWithoutDailcode,
        'user_phone_otp_order_id': _userPhoneOtpOrderId,
        'user_phone_otp_attempt': _userPhoneOtpAttempt,
        'phone_number_dailcode': _phoneNumberDailcode,
        'phone_number_dailcode_with_plus': _phoneNumberDailcodeWithPlus,
        'user_cart_count': _userCartCount,
        'user_cart_item_list':
            _userCartItemList?.map((e) => e.toMap()).toList(),
        'user_cart_item_product_attribute':
            _userCartItemProductAttribute?.map((e) => e.toMap()).toList(),
        'user_selected_product_List': _userSelectedProductList,
        'user_selected_product_count': _userSelectedProductCount,
        'user_selected_product_found_status': _userSelectedProductFoundStatus,
        'user_product_swatches_list':
            _userProductSwatchesList?.map((e) => e.toMap()).toList(),
        'user_swatches_product_attribute':
            _userSwatchesProductAttribute?.map((e) => e.toMap()).toList(),
        'user_cart_item_PA_found': _userCartItemPAFound,
        'user_cart_item_PA_Index': _userCartItemPAIndex,
        'user_waitlist_id': _userWaitlistId,
        'user_waitlist_email': _userWaitlistEmail,
        'user_waitlist_phone_number': _userWaitlistPhoneNumber,
        'user_selected_product_attrbuites':
            _userSelectedProductAttrbuites?.map((e) => e.toMap()).toList(),
        'user_selected_body': _userSelectedBody?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'refresh': serializeParam(
          _refresh,
          ParamType.int,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'user_waiter_status': serializeParam(
          _userWaiterStatus,
          ParamType.bool,
        ),
        'user_category_preference_list': serializeParam(
          _userCategoryPreferenceList,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_category_preference_find_status': serializeParam(
          _userCategoryPreferenceFindStatus,
          ParamType.String,
        ),
        'user_recent_view': serializeParam(
          _userRecentView,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_ref': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'user_email': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'user_email_otp': serializeParam(
          _userEmailOtp,
          ParamType.int,
        ),
        'user_email_otp_attempt': serializeParam(
          _userEmailOtpAttempt,
          ParamType.int,
        ),
        'phone_number_country': serializeParam(
          _phoneNumberCountry,
          ParamType.String,
        ),
        'user_phone_number': serializeParam(
          _userPhoneNumber,
          ParamType.String,
        ),
        'phone_number_without_dailcode': serializeParam(
          _phoneNumberWithoutDailcode,
          ParamType.String,
        ),
        'user_phone_otp_order_id': serializeParam(
          _userPhoneOtpOrderId,
          ParamType.String,
        ),
        'user_phone_otp_attempt': serializeParam(
          _userPhoneOtpAttempt,
          ParamType.int,
        ),
        'phone_number_dailcode': serializeParam(
          _phoneNumberDailcode,
          ParamType.String,
        ),
        'phone_number_dailcode_with_plus': serializeParam(
          _phoneNumberDailcodeWithPlus,
          ParamType.String,
        ),
        'user_cart_count': serializeParam(
          _userCartCount,
          ParamType.int,
        ),
        'user_cart_item_list': serializeParam(
          _userCartItemList,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_cart_item_product_attribute': serializeParam(
          _userCartItemProductAttribute,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_selected_product_List': serializeParam(
          _userSelectedProductList,
          ParamType.DocumentReference,
          isList: true,
        ),
        'user_selected_product_count': serializeParam(
          _userSelectedProductCount,
          ParamType.int,
        ),
        'user_selected_product_found_status': serializeParam(
          _userSelectedProductFoundStatus,
          ParamType.String,
        ),
        'user_product_swatches_list': serializeParam(
          _userProductSwatchesList,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_swatches_product_attribute': serializeParam(
          _userSwatchesProductAttribute,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_cart_item_PA_found': serializeParam(
          _userCartItemPAFound,
          ParamType.String,
        ),
        'user_cart_item_PA_Index': serializeParam(
          _userCartItemPAIndex,
          ParamType.int,
        ),
        'user_waitlist_id': serializeParam(
          _userWaitlistId,
          ParamType.int,
        ),
        'user_waitlist_email': serializeParam(
          _userWaitlistEmail,
          ParamType.String,
        ),
        'user_waitlist_phone_number': serializeParam(
          _userWaitlistPhoneNumber,
          ParamType.String,
        ),
        'user_selected_product_attrbuites': serializeParam(
          _userSelectedProductAttrbuites,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_selected_body': serializeParam(
          _userSelectedBody,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserFlowStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserFlowStruct(
        refresh: deserializeParam(
          data['refresh'],
          ParamType.int,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        userWaiterStatus: deserializeParam(
          data['user_waiter_status'],
          ParamType.bool,
          false,
        ),
        userCategoryPreferenceList:
            deserializeStructParam<UserPreferencesCategoriesStruct>(
          data['user_category_preference_list'],
          ParamType.DataStruct,
          true,
          structBuilder: UserPreferencesCategoriesStruct.fromSerializableMap,
        ),
        userCategoryPreferenceFindStatus: deserializeParam(
          data['user_category_preference_find_status'],
          ParamType.String,
          false,
        ),
        userRecentView: deserializeStructParam<UserRecentViewedListStruct>(
          data['user_recent_view'],
          ParamType.DataStruct,
          true,
          structBuilder: UserRecentViewedListStruct.fromSerializableMap,
        ),
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        userEmail: deserializeParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userEmailOtp: deserializeParam(
          data['user_email_otp'],
          ParamType.int,
          false,
        ),
        userEmailOtpAttempt: deserializeParam(
          data['user_email_otp_attempt'],
          ParamType.int,
          false,
        ),
        phoneNumberCountry: deserializeParam(
          data['phone_number_country'],
          ParamType.String,
          false,
        ),
        userPhoneNumber: deserializeParam(
          data['user_phone_number'],
          ParamType.String,
          false,
        ),
        phoneNumberWithoutDailcode: deserializeParam(
          data['phone_number_without_dailcode'],
          ParamType.String,
          false,
        ),
        userPhoneOtpOrderId: deserializeParam(
          data['user_phone_otp_order_id'],
          ParamType.String,
          false,
        ),
        userPhoneOtpAttempt: deserializeParam(
          data['user_phone_otp_attempt'],
          ParamType.int,
          false,
        ),
        phoneNumberDailcode: deserializeParam(
          data['phone_number_dailcode'],
          ParamType.String,
          false,
        ),
        phoneNumberDailcodeWithPlus: deserializeParam(
          data['phone_number_dailcode_with_plus'],
          ParamType.String,
          false,
        ),
        userCartCount: deserializeParam(
          data['user_cart_count'],
          ParamType.int,
          false,
        ),
        userCartItemList: deserializeStructParam<UserCartItemsStruct>(
          data['user_cart_item_list'],
          ParamType.DataStruct,
          true,
          structBuilder: UserCartItemsStruct.fromSerializableMap,
        ),
        userCartItemProductAttribute:
            deserializeStructParam<ProductAttributesNewStruct>(
          data['user_cart_item_product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesNewStruct.fromSerializableMap,
        ),
        userSelectedProductList: deserializeParam<DocumentReference>(
          data['user_selected_product_List'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['products'],
        ),
        userSelectedProductCount: deserializeParam(
          data['user_selected_product_count'],
          ParamType.int,
          false,
        ),
        userSelectedProductFoundStatus: deserializeParam(
          data['user_selected_product_found_status'],
          ParamType.String,
          false,
        ),
        userProductSwatchesList:
            deserializeStructParam<UserRecentViewedListStruct>(
          data['user_product_swatches_list'],
          ParamType.DataStruct,
          true,
          structBuilder: UserRecentViewedListStruct.fromSerializableMap,
        ),
        userSwatchesProductAttribute:
            deserializeStructParam<ProductAttributesNewStruct>(
          data['user_swatches_product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesNewStruct.fromSerializableMap,
        ),
        userCartItemPAFound: deserializeParam(
          data['user_cart_item_PA_found'],
          ParamType.String,
          false,
        ),
        userCartItemPAIndex: deserializeParam(
          data['user_cart_item_PA_Index'],
          ParamType.int,
          false,
        ),
        userWaitlistId: deserializeParam(
          data['user_waitlist_id'],
          ParamType.int,
          false,
        ),
        userWaitlistEmail: deserializeParam(
          data['user_waitlist_email'],
          ParamType.String,
          false,
        ),
        userWaitlistPhoneNumber: deserializeParam(
          data['user_waitlist_phone_number'],
          ParamType.String,
          false,
        ),
        userSelectedProductAttrbuites:
            deserializeStructParam<SelectedProductAttrbuitesStruct>(
          data['user_selected_product_attrbuites'],
          ParamType.DataStruct,
          true,
          structBuilder: SelectedProductAttrbuitesStruct.fromSerializableMap,
        ),
        userSelectedBody: deserializeStructParam(
          data['user_selected_body'],
          ParamType.DataStruct,
          false,
          structBuilder: UserBodyStruct.fromSerializableMap,
        ),
      );

  static UserFlowStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserFlowStruct(
        refresh: convertAlgoliaParam(
          data['refresh'],
          ParamType.int,
          false,
        ),
        count: convertAlgoliaParam(
          data['count'],
          ParamType.int,
          false,
        ),
        userWaiterStatus: convertAlgoliaParam(
          data['user_waiter_status'],
          ParamType.bool,
          false,
        ),
        userCategoryPreferenceList:
            convertAlgoliaParam<UserPreferencesCategoriesStruct>(
          data['user_category_preference_list'],
          ParamType.DataStruct,
          true,
          structBuilder: UserPreferencesCategoriesStruct.fromAlgoliaData,
        ),
        userCategoryPreferenceFindStatus: convertAlgoliaParam(
          data['user_category_preference_find_status'],
          ParamType.String,
          false,
        ),
        userRecentView: convertAlgoliaParam<UserRecentViewedListStruct>(
          data['user_recent_view'],
          ParamType.DataStruct,
          true,
          structBuilder: UserRecentViewedListStruct.fromAlgoliaData,
        ),
        userRef: convertAlgoliaParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
        ),
        userEmail: convertAlgoliaParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userEmailOtp: convertAlgoliaParam(
          data['user_email_otp'],
          ParamType.int,
          false,
        ),
        userEmailOtpAttempt: convertAlgoliaParam(
          data['user_email_otp_attempt'],
          ParamType.int,
          false,
        ),
        phoneNumberCountry: convertAlgoliaParam(
          data['phone_number_country'],
          ParamType.String,
          false,
        ),
        userPhoneNumber: convertAlgoliaParam(
          data['user_phone_number'],
          ParamType.String,
          false,
        ),
        phoneNumberWithoutDailcode: convertAlgoliaParam(
          data['phone_number_without_dailcode'],
          ParamType.String,
          false,
        ),
        userPhoneOtpOrderId: convertAlgoliaParam(
          data['user_phone_otp_order_id'],
          ParamType.String,
          false,
        ),
        userPhoneOtpAttempt: convertAlgoliaParam(
          data['user_phone_otp_attempt'],
          ParamType.int,
          false,
        ),
        phoneNumberDailcode: convertAlgoliaParam(
          data['phone_number_dailcode'],
          ParamType.String,
          false,
        ),
        phoneNumberDailcodeWithPlus: convertAlgoliaParam(
          data['phone_number_dailcode_with_plus'],
          ParamType.String,
          false,
        ),
        userCartCount: convertAlgoliaParam(
          data['user_cart_count'],
          ParamType.int,
          false,
        ),
        userCartItemList: convertAlgoliaParam<UserCartItemsStruct>(
          data['user_cart_item_list'],
          ParamType.DataStruct,
          true,
          structBuilder: UserCartItemsStruct.fromAlgoliaData,
        ),
        userCartItemProductAttribute:
            convertAlgoliaParam<ProductAttributesNewStruct>(
          data['user_cart_item_product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesNewStruct.fromAlgoliaData,
        ),
        userSelectedProductList: convertAlgoliaParam<DocumentReference>(
          data['user_selected_product_List'],
          ParamType.DocumentReference,
          true,
        ),
        userSelectedProductCount: convertAlgoliaParam(
          data['user_selected_product_count'],
          ParamType.int,
          false,
        ),
        userSelectedProductFoundStatus: convertAlgoliaParam(
          data['user_selected_product_found_status'],
          ParamType.String,
          false,
        ),
        userProductSwatchesList:
            convertAlgoliaParam<UserRecentViewedListStruct>(
          data['user_product_swatches_list'],
          ParamType.DataStruct,
          true,
          structBuilder: UserRecentViewedListStruct.fromAlgoliaData,
        ),
        userSwatchesProductAttribute:
            convertAlgoliaParam<ProductAttributesNewStruct>(
          data['user_swatches_product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesNewStruct.fromAlgoliaData,
        ),
        userCartItemPAFound: convertAlgoliaParam(
          data['user_cart_item_PA_found'],
          ParamType.String,
          false,
        ),
        userCartItemPAIndex: convertAlgoliaParam(
          data['user_cart_item_PA_Index'],
          ParamType.int,
          false,
        ),
        userWaitlistId: convertAlgoliaParam(
          data['user_waitlist_id'],
          ParamType.int,
          false,
        ),
        userWaitlistEmail: convertAlgoliaParam(
          data['user_waitlist_email'],
          ParamType.String,
          false,
        ),
        userWaitlistPhoneNumber: convertAlgoliaParam(
          data['user_waitlist_phone_number'],
          ParamType.String,
          false,
        ),
        userSelectedProductAttrbuites:
            convertAlgoliaParam<SelectedProductAttrbuitesStruct>(
          data['user_selected_product_attrbuites'],
          ParamType.DataStruct,
          true,
          structBuilder: SelectedProductAttrbuitesStruct.fromAlgoliaData,
        ),
        userSelectedBody: convertAlgoliaParam(
          data['user_selected_body'],
          ParamType.DataStruct,
          false,
          structBuilder: UserBodyStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserFlowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserFlowStruct &&
        refresh == other.refresh &&
        count == other.count &&
        userWaiterStatus == other.userWaiterStatus &&
        listEquality.equals(
            userCategoryPreferenceList, other.userCategoryPreferenceList) &&
        userCategoryPreferenceFindStatus ==
            other.userCategoryPreferenceFindStatus &&
        listEquality.equals(userRecentView, other.userRecentView) &&
        userRef == other.userRef &&
        userEmail == other.userEmail &&
        userEmailOtp == other.userEmailOtp &&
        userEmailOtpAttempt == other.userEmailOtpAttempt &&
        phoneNumberCountry == other.phoneNumberCountry &&
        userPhoneNumber == other.userPhoneNumber &&
        phoneNumberWithoutDailcode == other.phoneNumberWithoutDailcode &&
        userPhoneOtpOrderId == other.userPhoneOtpOrderId &&
        userPhoneOtpAttempt == other.userPhoneOtpAttempt &&
        phoneNumberDailcode == other.phoneNumberDailcode &&
        phoneNumberDailcodeWithPlus == other.phoneNumberDailcodeWithPlus &&
        userCartCount == other.userCartCount &&
        listEquality.equals(userCartItemList, other.userCartItemList) &&
        listEquality.equals(
            userCartItemProductAttribute, other.userCartItemProductAttribute) &&
        listEquality.equals(
            userSelectedProductList, other.userSelectedProductList) &&
        userSelectedProductCount == other.userSelectedProductCount &&
        userSelectedProductFoundStatus ==
            other.userSelectedProductFoundStatus &&
        listEquality.equals(
            userProductSwatchesList, other.userProductSwatchesList) &&
        listEquality.equals(
            userSwatchesProductAttribute, other.userSwatchesProductAttribute) &&
        userCartItemPAFound == other.userCartItemPAFound &&
        userCartItemPAIndex == other.userCartItemPAIndex &&
        userWaitlistId == other.userWaitlistId &&
        userWaitlistEmail == other.userWaitlistEmail &&
        userWaitlistPhoneNumber == other.userWaitlistPhoneNumber &&
        listEquality.equals(userSelectedProductAttrbuites,
            other.userSelectedProductAttrbuites) &&
        userSelectedBody == other.userSelectedBody;
  }

  @override
  int get hashCode => const ListEquality().hash([
        refresh,
        count,
        userWaiterStatus,
        userCategoryPreferenceList,
        userCategoryPreferenceFindStatus,
        userRecentView,
        userRef,
        userEmail,
        userEmailOtp,
        userEmailOtpAttempt,
        phoneNumberCountry,
        userPhoneNumber,
        phoneNumberWithoutDailcode,
        userPhoneOtpOrderId,
        userPhoneOtpAttempt,
        phoneNumberDailcode,
        phoneNumberDailcodeWithPlus,
        userCartCount,
        userCartItemList,
        userCartItemProductAttribute,
        userSelectedProductList,
        userSelectedProductCount,
        userSelectedProductFoundStatus,
        userProductSwatchesList,
        userSwatchesProductAttribute,
        userCartItemPAFound,
        userCartItemPAIndex,
        userWaitlistId,
        userWaitlistEmail,
        userWaitlistPhoneNumber,
        userSelectedProductAttrbuites,
        userSelectedBody
      ]);
}

UserFlowStruct createUserFlowStruct({
  int? refresh,
  int? count,
  bool? userWaiterStatus,
  String? userCategoryPreferenceFindStatus,
  DocumentReference? userRef,
  String? userEmail,
  int? userEmailOtp,
  int? userEmailOtpAttempt,
  String? phoneNumberCountry,
  String? userPhoneNumber,
  String? phoneNumberWithoutDailcode,
  String? userPhoneOtpOrderId,
  int? userPhoneOtpAttempt,
  String? phoneNumberDailcode,
  String? phoneNumberDailcodeWithPlus,
  int? userCartCount,
  int? userSelectedProductCount,
  String? userSelectedProductFoundStatus,
  String? userCartItemPAFound,
  int? userCartItemPAIndex,
  int? userWaitlistId,
  String? userWaitlistEmail,
  String? userWaitlistPhoneNumber,
  UserBodyStruct? userSelectedBody,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserFlowStruct(
      refresh: refresh,
      count: count,
      userWaiterStatus: userWaiterStatus,
      userCategoryPreferenceFindStatus: userCategoryPreferenceFindStatus,
      userRef: userRef,
      userEmail: userEmail,
      userEmailOtp: userEmailOtp,
      userEmailOtpAttempt: userEmailOtpAttempt,
      phoneNumberCountry: phoneNumberCountry,
      userPhoneNumber: userPhoneNumber,
      phoneNumberWithoutDailcode: phoneNumberWithoutDailcode,
      userPhoneOtpOrderId: userPhoneOtpOrderId,
      userPhoneOtpAttempt: userPhoneOtpAttempt,
      phoneNumberDailcode: phoneNumberDailcode,
      phoneNumberDailcodeWithPlus: phoneNumberDailcodeWithPlus,
      userCartCount: userCartCount,
      userSelectedProductCount: userSelectedProductCount,
      userSelectedProductFoundStatus: userSelectedProductFoundStatus,
      userCartItemPAFound: userCartItemPAFound,
      userCartItemPAIndex: userCartItemPAIndex,
      userWaitlistId: userWaitlistId,
      userWaitlistEmail: userWaitlistEmail,
      userWaitlistPhoneNumber: userWaitlistPhoneNumber,
      userSelectedBody:
          userSelectedBody ?? (clearUnsetFields ? UserBodyStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserFlowStruct? updateUserFlowStruct(
  UserFlowStruct? userFlow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userFlow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserFlowStructData(
  Map<String, dynamic> firestoreData,
  UserFlowStruct? userFlow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userFlow == null) {
    return;
  }
  if (userFlow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userFlow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userFlowData = getUserFlowFirestoreData(userFlow, forFieldValue);
  final nestedData = userFlowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userFlow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFlowFirestoreData(
  UserFlowStruct? userFlow, [
  bool forFieldValue = false,
]) {
  if (userFlow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userFlow.toMap());

  // Handle nested data for "user_selected_body" field.
  addUserBodyStructData(
    firestoreData,
    userFlow.hasUserSelectedBody() ? userFlow.userSelectedBody : null,
    'user_selected_body',
    forFieldValue,
  );

  // Add any Firestore field values
  userFlow.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserFlowListFirestoreData(
  List<UserFlowStruct>? userFlows,
) =>
    userFlows?.map((e) => getUserFlowFirestoreData(e, true)).toList() ?? [];
