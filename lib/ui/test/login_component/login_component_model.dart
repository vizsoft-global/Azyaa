import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_component_widget.dart' show LoginComponentWidget;
import 'package:flutter/material.dart';

class LoginComponentModel extends FlutterFlowModel<LoginComponentWidget> {
  ///  Local state fields for this component.

  int? count;

  List<UserBodyStruct> bodyList = [];
  void addToBodyList(UserBodyStruct item) => bodyList.add(item);
  void removeFromBodyList(UserBodyStruct item) => bodyList.remove(item);
  void removeAtIndexFromBodyList(int index) => bodyList.removeAt(index);
  void insertAtIndexInBodyList(int index, UserBodyStruct item) =>
      bodyList.insert(index, item);
  void updateBodyListAtIndex(int index, Function(UserBodyStruct) updateFn) =>
      bodyList[index] = updateFn(bodyList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hblts337' /* Please provide a valid email  */,
      );
    }

    return null;
  }

  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'turdj4hf' /* Please enter password */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
