import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'waitlist_success_widget.dart' show WaitlistSuccessWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
