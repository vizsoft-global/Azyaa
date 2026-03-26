import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'designer_form_upload_widget.dart' show DesignerFormUploadWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
