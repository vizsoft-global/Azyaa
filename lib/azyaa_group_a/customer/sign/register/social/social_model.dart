import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'social_widget.dart' show SocialWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SocialModel extends FlutterFlowModel<SocialWidget> {
  ///  Local state fields for this component.

  String? googlestatus = 'hide';

  String applestatus = 'hide';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
