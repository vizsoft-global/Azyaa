import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'waitlist_success_widget.dart' show WaitlistSuccessWidget;
import 'package:flutter/material.dart';

class WaitlistSuccessModel extends FlutterFlowModel<WaitlistSuccessWidget> {
  ///  Local state fields for this page.

  int? count;

  List<SettingsAppAccessDataStruct> accessList = [];
  void addToAccessList(SettingsAppAccessDataStruct item) =>
      accessList.add(item);
  void removeFromAccessList(SettingsAppAccessDataStruct item) =>
      accessList.remove(item);
  void removeAtIndexFromAccessList(int index) => accessList.removeAt(index);
  void insertAtIndexInAccessList(int index, SettingsAppAccessDataStruct item) =>
      accessList.insert(index, item);
  void updateAccessListAtIndex(
          int index, Function(SettingsAppAccessDataStruct) updateFn) =>
      accessList[index] = updateFn(accessList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
