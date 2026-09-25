import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Onboard = prefs.getString('ff_Onboard') ?? _Onboard;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_PaymentFlow')) {
        try {
          final serializedData = prefs.getString('ff_PaymentFlow') ?? '{}';
          _PaymentFlow = PaymentProcessingTimeStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_UserDataFlow')) {
        try {
          final serializedData = prefs.getString('ff_UserDataFlow') ?? '{}';
          _UserDataFlow =
              UserFlowStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_UserFilter')) {
        try {
          final serializedData = prefs.getString('ff_UserFilter') ?? '{}';
          _UserFilter =
              UserFiltersStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_desginerRequestFlow')) {
        try {
          final serializedData =
              prefs.getString('ff_desginerRequestFlow') ?? '{}';
          _desginerRequestFlow = DesignerRequestsStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _Onboard = 'welcome';
  String get Onboard => _Onboard;
  set Onboard(String value) {
    _Onboard = value;
    prefs.setString('ff_Onboard', value);
  }

  PaymentProcessingTimeStruct _PaymentFlow = PaymentProcessingTimeStruct();
  PaymentProcessingTimeStruct get PaymentFlow => _PaymentFlow;
  set PaymentFlow(PaymentProcessingTimeStruct value) {
    _PaymentFlow = value;
    prefs.setString('ff_PaymentFlow', value.serialize());
  }

  void updatePaymentFlowStruct(Function(PaymentProcessingTimeStruct) updateFn) {
    updateFn(_PaymentFlow);
    prefs.setString('ff_PaymentFlow', _PaymentFlow.serialize());
  }

  UserFlowStruct _UserDataFlow = UserFlowStruct();
  UserFlowStruct get UserDataFlow => _UserDataFlow;
  set UserDataFlow(UserFlowStruct value) {
    _UserDataFlow = value;
    prefs.setString('ff_UserDataFlow', value.serialize());
  }

  void updateUserDataFlowStruct(Function(UserFlowStruct) updateFn) {
    updateFn(_UserDataFlow);
    prefs.setString('ff_UserDataFlow', _UserDataFlow.serialize());
  }

  UserFiltersStruct _UserFilter = UserFiltersStruct();
  UserFiltersStruct get UserFilter => _UserFilter;
  set UserFilter(UserFiltersStruct value) {
    _UserFilter = value;
    prefs.setString('ff_UserFilter', value.serialize());
  }

  void updateUserFilterStruct(Function(UserFiltersStruct) updateFn) {
    updateFn(_UserFilter);
    prefs.setString('ff_UserFilter', _UserFilter.serialize());
  }

  bool _dummy = false;
  bool get dummy => _dummy;
  set dummy(bool value) {
    _dummy = value;
  }

  DesignerRequestsStruct _desginerRequestFlow = DesignerRequestsStruct();
  DesignerRequestsStruct get desginerRequestFlow => _desginerRequestFlow;
  set desginerRequestFlow(DesignerRequestsStruct value) {
    _desginerRequestFlow = value;
    prefs.setString('ff_desginerRequestFlow', value.serialize());
  }

  void updateDesginerRequestFlowStruct(
      Function(DesignerRequestsStruct) updateFn) {
    updateFn(_desginerRequestFlow);
    prefs.setString('ff_desginerRequestFlow', _desginerRequestFlow.serialize());
  }

  DateTime? _userSessionDate;
  DateTime? get userSessionDate => _userSessionDate;
  set userSessionDate(DateTime? value) {
    _userSessionDate = value;
  }

  /// Creator affililate products
  UserFlowStruct _usercartFlow = UserFlowStruct();
  UserFlowStruct get usercartFlow => _usercartFlow;
  set usercartFlow(UserFlowStruct value) {
    _usercartFlow = value;
  }

  void updateUsercartFlowStruct(Function(UserFlowStruct) updateFn) {
    updateFn(_usercartFlow);
  }

  PromotionFlowStruct _promotionflow = PromotionFlowStruct();
  PromotionFlowStruct get promotionflow => _promotionflow;
  set promotionflow(PromotionFlowStruct value) {
    _promotionflow = value;
  }

  void updatePromotionflowStruct(Function(PromotionFlowStruct) updateFn) {
    updateFn(_promotionflow);
  }

  String _fromNav = '';
  String get fromNav => _fromNav;
  set fromNav(String value) {
    _fromNav = value;
  }

  List<DocumentReference> _adminUsersRefs = [
    FirebaseFirestore.instance.doc('/users/UWjg81lbSCc0jVKRdG233MZ3Js93')
  ];
  List<DocumentReference> get adminUsersRefs => _adminUsersRefs;
  set adminUsersRefs(List<DocumentReference> value) {
    _adminUsersRefs = value;
  }

  void addToAdminUsersRefs(DocumentReference value) {
    adminUsersRefs.add(value);
  }

  void removeFromAdminUsersRefs(DocumentReference value) {
    adminUsersRefs.remove(value);
  }

  void removeAtIndexFromAdminUsersRefs(int index) {
    adminUsersRefs.removeAt(index);
  }

  void updateAdminUsersRefsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    adminUsersRefs[index] = updateFn(_adminUsersRefs[index]);
  }

  void insertAtIndexInAdminUsersRefs(int index, DocumentReference value) {
    adminUsersRefs.insert(index, value);
  }

  List<String> _branchDebugLogs = ['--- Log Started ---'];
  List<String> get branchDebugLogs => _branchDebugLogs;
  set branchDebugLogs(List<String> value) {
    _branchDebugLogs = value;
  }

  void addToBranchDebugLogs(String value) {
    branchDebugLogs.add(value);
  }

  void removeFromBranchDebugLogs(String value) {
    branchDebugLogs.remove(value);
  }

  void removeAtIndexFromBranchDebugLogs(int index) {
    branchDebugLogs.removeAt(index);
  }

  void updateBranchDebugLogsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    branchDebugLogs[index] = updateFn(_branchDebugLogs[index]);
  }

  void insertAtIndexInBranchDebugLogs(int index, String value) {
    branchDebugLogs.insert(index, value);
  }

  DocumentReference? _deeplinkproductRef;
  DocumentReference? get deeplinkproductRef => _deeplinkproductRef;
  set deeplinkproductRef(DocumentReference? value) {
    _deeplinkproductRef = value;
  }

  LatLng? _defaultLocation = const LatLng(29.373751, 47.975931);
  LatLng? get defaultLocation => _defaultLocation;
  set defaultLocation(LatLng? value) {
    _defaultLocation = value;
  }

  double _pickedLat = 0.0;
  double get pickedLat => _pickedLat;
  set pickedLat(double value) {
    _pickedLat = value;
  }

  double _pickedLng = 0.0;
  double get pickedLng => _pickedLng;
  set pickedLng(double value) {
    _pickedLng = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
