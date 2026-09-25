import '/flutter_flow/flutter_flow_util.dart';
import 'c1_share_promotion_widget.dart' show C1SharePromotionWidget;
import 'package:flutter/material.dart';

class C1SharePromotionModel extends FlutterFlowModel<C1SharePromotionWidget> {
  ///  Local state fields for this component.

  String copyText = 'copy';

  List<String> storeImages = [];
  void addToStoreImages(String item) => storeImages.add(item);
  void removeFromStoreImages(String item) => storeImages.remove(item);
  void removeAtIndexFromStoreImages(int index) => storeImages.removeAt(index);
  void insertAtIndexInStoreImages(int index, String item) =>
      storeImages.insert(index, item);
  void updateStoreImagesAtIndex(int index, Function(String) updateFn) =>
      storeImages[index] = updateFn(storeImages[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
