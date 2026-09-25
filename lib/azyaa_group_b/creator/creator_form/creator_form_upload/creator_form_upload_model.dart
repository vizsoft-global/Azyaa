import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creator_form_upload_widget.dart' show CreatorFormUploadWidget;
import 'package:flutter/material.dart';

class CreatorFormUploadModel extends FlutterFlowModel<CreatorFormUploadWidget> {
  ///  Local state fields for this page.

  String? photoID = '';

  String? photoSelfie = '';

  String? fileType;

  String? gvrtImage;

  int? adminCount;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for User_Initial component.
  late UserInitialModel userInitialModel;
  bool isDataUploading_uploadDataYua1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataYua1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataYua1 = '';

  bool isDataUploading_uploadPhotoSelfie = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoSelfie =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadPhotoSelfie = '';

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
