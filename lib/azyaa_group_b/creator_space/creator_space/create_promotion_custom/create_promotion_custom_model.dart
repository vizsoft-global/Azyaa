import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_promotion_custom_widget.dart' show CreatePromotionCustomWidget;
import 'package:flutter/material.dart';

class CreatePromotionCustomModel
    extends FlutterFlowModel<CreatePromotionCustomWidget> {
  ///  Local state fields for this page.

  List<String> photoVideoList = [];
  void addToPhotoVideoList(String item) => photoVideoList.add(item);
  void removeFromPhotoVideoList(String item) => photoVideoList.remove(item);
  void removeAtIndexFromPhotoVideoList(int index) =>
      photoVideoList.removeAt(index);
  void insertAtIndexInPhotoVideoList(int index, String item) =>
      photoVideoList.insert(index, item);
  void updatePhotoVideoListAtIndex(int index, Function(String) updateFn) =>
      photoVideoList[index] = updateFn(photoVideoList[index]);

  bool videoAdded = false;

  List<OrdersRecord> ordersList = [];
  void addToOrdersList(OrdersRecord item) => ordersList.add(item);
  void removeFromOrdersList(OrdersRecord item) => ordersList.remove(item);
  void removeAtIndexFromOrdersList(int index) => ordersList.removeAt(index);
  void insertAtIndexInOrdersList(int index, OrdersRecord item) =>
      ordersList.insert(index, item);
  void updateOrdersListAtIndex(int index, Function(OrdersRecord) updateFn) =>
      ordersList[index] = updateFn(ordersList[index]);

  int? count;

  List<String> productIdList = [];
  void addToProductIdList(String item) => productIdList.add(item);
  void removeFromProductIdList(String item) => productIdList.remove(item);
  void removeAtIndexFromProductIdList(int index) =>
      productIdList.removeAt(index);
  void insertAtIndexInProductIdList(int index, String item) =>
      productIdList.insert(index, item);
  void updateProductIdListAtIndex(int index, Function(String) updateFn) =>
      productIdList[index] = updateFn(productIdList[index]);

  int? cartCount;

  int? adminCount;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameYourpromotion widget.
  FocusNode? nameYourpromotionFocusNode;
  TextEditingController? nameYourpromotionTextController;
  String? Function(BuildContext, String?)?
      nameYourpromotionTextControllerValidator;
  String? _nameYourpromotionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vwfuyszj' /* Promotion caption is required */,
      );
    }

    return null;
  }

  // State field(s) for aboutus-field widget.
  FocusNode? aboutusFieldFocusNode;
  TextEditingController? aboutusFieldTextController;
  String? Function(BuildContext, String?)? aboutusFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrdersRecord>? orderResult;
  bool isDataUploading_uploadData5by = false;
  FFUploadedFile uploadedLocalFile_uploadData5by =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData5by = '';

  bool isDataUploading_uploadData5by2 = false;
  FFUploadedFile uploadedLocalFile_uploadData5by2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData5by2 = '';

  bool isDataUploading_uploadData5by1 = false;
  FFUploadedFile uploadedLocalFile_uploadData5by1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData5by1 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in submit widget.
  IdMapRecord? idmapresult1;
  // Stores action output result for [Firestore Query - Query a collection] action in submit widget.
  IdMapRecord? idmapresult3;

  @override
  void initState(BuildContext context) {
    nameYourpromotionTextControllerValidator =
        _nameYourpromotionTextControllerValidator;
  }

  @override
  void dispose() {
    nameYourpromotionFocusNode?.dispose();
    nameYourpromotionTextController?.dispose();

    aboutusFieldFocusNode?.dispose();
    aboutusFieldTextController?.dispose();
  }
}
