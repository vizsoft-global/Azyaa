import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/product_listview/product_listview_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'v_t_o_final_widget.dart' show VTOFinalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VTOFinalModel extends FlutterFlowModel<VTOFinalWidget> {
  ///  Local state fields for this component.

  String? personImage;

  String processesStatus = 'Hide';

  String? vtoID = '';

  String? outfitImage;

  int? count = 0;

  ///  State fields for stateful widgets in this component.

  // Model for Product-Listview component.
  late ProductListviewModel productListviewModel1;
  bool isDataUploading_uploadImageUser11 = false;
  FFUploadedFile uploadedLocalFile_uploadImageUser11 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadImageUser11 = '';

  // Stores action output result for [Backend Call - API (Main)] action in save widget.
  ApiCallResponse? userVtoMainapiResult;
  // Stores action output result for [Backend Call - Create Document] action in save widget.
  TryonRequestsRecord? createdVtoDocument;
  // Model for Product-Listview component.
  late ProductListviewModel productListviewModel2;

  @override
  void initState(BuildContext context) {
    productListviewModel1 = createModel(context, () => ProductListviewModel());
    productListviewModel2 = createModel(context, () => ProductListviewModel());
  }

  @override
  void dispose() {
    productListviewModel1.dispose();
    productListviewModel2.dispose();
  }
}
