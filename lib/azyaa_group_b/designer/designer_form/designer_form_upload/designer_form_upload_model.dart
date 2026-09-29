import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'designer_form_upload_widget.dart' show DesignerFormUploadWidget;
import 'package:flutter/material.dart';

class DesignerFormUploadModel
    extends FlutterFlowModel<DesignerFormUploadWidget> {
  ///  Local state fields for this page.

  String? fileType;

  String? govtid;

  String? indIDimage;

  String? storeIDimage;

  int? adminCount;

  ///  State fields for stateful widgets in this page.

  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  bool isDataUploading_uploadDataYua = false;
  FFUploadedFile uploadedLocalFile_uploadDataYua =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataYua = '';

  bool isDataUploading_uploadDataTm3 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTm3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTm3 = '';

  bool isDataUploading_uploadDataSelfie = false;
  FFUploadedFile uploadedLocalFile_uploadDataSelfie =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataSelfie = '';

  // Stores action output result for [Firestore Query - Query a collection] action in submit widget.
  IdMapRecord? idmapresult3;

  @override
  void initState(BuildContext context) {
    userInitialModel = createModel(context, () => UserInitialModel());
  }

  @override
  void dispose() {
    userInitialModel.dispose();
  }
}
