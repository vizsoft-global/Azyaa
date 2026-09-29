import '/azyaa_group_a/home/components/product_listview/product_listview_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'v_t_o_final_widget.dart' show VTOFinalWidget;
import 'package:flutter/material.dart';

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
