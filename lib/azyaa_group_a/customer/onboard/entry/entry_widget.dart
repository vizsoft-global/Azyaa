import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:branchio_dynamic_linking_akp5u6/custom_code/actions/index.dart'
    as branchio_dynamic_linking_akp5u6_actions;
import 'package:branchio_dynamic_linking_akp5u6/flutter_flow/custom_functions.dart'
    as branchio_dynamic_linking_akp5u6_functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'entry_model.dart';
export 'entry_model.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({super.key});

  static String routeName = 'Entry';
  static String routePath = '/azyaa-entry';

  @override
  State<EntryWidget> createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget> {
  late EntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initBranch();
      await branchio_dynamic_linking_akp5u6_actions.handleBranchDeeplink(
        (linkData) async {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(getJsonField(
                    linkData,
                    r'''$''',
                  ).toString()),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          if (branchio_dynamic_linking_akp5u6_functions.isTargetingPage(
              getJsonField(
                linkData,
                r'''$.page''',
              ),
              'Product')) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text('page verified'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            );

            context.goNamed(
              ProductWidget.routeName,
              queryParameters: {
                'product': serializeParam(
                  functions.stringToProductDocRef(getJsonField(
                    linkData,
                    r'''$.page_parameter''',
                  ).toString()),
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          }
        },
      );
      if (FFAppState().Onboard == 'welcome') {
        _model.settingsSecretFeatureResult = await querySettingsRecordOnce(
          queryBuilder: (settingsRecord) => settingsRecord.where(
            'type',
            isEqualTo: 'Company',
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.settingsSecretFeatureResult?.settingsSecretFeature
                ?.settingsSecretFeature ==
            true) {
          context.goNamed(
            WaitlistSecretWidget.routeName,
            queryParameters: {
              'navigation': serializeParam(
                'secreat',
                ParamType.String,
              ),
            }.withoutNulls,
          );
        } else {
          if (_model.settingsSecretFeatureResult?.settingsSecretFeature
                  ?.settingsWaitlistFeature ==
              true) {
            context.goNamed(WaitlistMainWidget.routeName);
          } else {
            context.goNamed(WelcomeWidget.routeName);
          }
        }
      } else {
        await actions.handleBranchRouting(
          context,
        );
        await actions.notificationRedirect(
          context,
        );

        context.goNamed(HomeWidget.routeName);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Entry',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/azyaa-logo-text.svg',
                            fit: BoxFit.none,
                            alignment: Alignment(0.0, 0.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
