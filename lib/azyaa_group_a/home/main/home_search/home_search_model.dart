import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'home_search_widget.dart' show HomeSearchWidget;
import 'package:flutter/material.dart';

class HomeSearchModel extends FlutterFlowModel<HomeSearchWidget> {
  ///  Local state fields for this page.

  String photoUploadStatus = 'notYet';

  bool serachStatus = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // Algolia Search Results from action on Search
  List<ProductsRecord>? algoliaSearchResults = [];
  Completer<List<ProductsRecord>>? firestoreRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
