import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'designer_portofolio_widget.dart' show DesignerPortofolioWidget;
import 'package:flutter/material.dart';

class DesignerPortofolioModel
    extends FlutterFlowModel<DesignerPortofolioWidget> {
  ///  Local state fields for this page.

  String? fileType;

  List<DesignerSampleDesignsStruct> allsamples = [];
  void addToAllsamples(DesignerSampleDesignsStruct item) =>
      allsamples.add(item);
  void removeFromAllsamples(DesignerSampleDesignsStruct item) =>
      allsamples.remove(item);
  void removeAtIndexFromAllsamples(int index) => allsamples.removeAt(index);
  void insertAtIndexInAllsamples(int index, DesignerSampleDesignsStruct item) =>
      allsamples.insert(index, item);
  void updateAllsamplesAtIndex(
          int index, Function(DesignerSampleDesignsStruct) updateFn) =>
      allsamples[index] = updateFn(allsamples[index]);

  ///  State fields for stateful widgets in this page.

  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  bool isDataUploading_uploadData11n = false;
  FFUploadedFile uploadedLocalFile_uploadData11n =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (upload file or image)] action in Button widget.
  ApiCallResponse? uploadapiResultvku;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
  }

  @override
  void dispose() {
    userInitialModel.dispose();
  }
}
