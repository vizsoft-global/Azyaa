import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/virtual_try_on/v_t_o_final/v_t_o_final_widget.dart';
import '/azyaa_group_a/customer/virtual_try_on/virtual_try_on_points/virtual_try_on_points_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'v_t_o_begin_model.dart';
export 'v_t_o_begin_model.dart';

class VTOBeginWidget extends StatefulWidget {
  const VTOBeginWidget({
    super.key,
    required this.product,
  });

  final ProductsRecord? product;

  @override
  State<VTOBeginWidget> createState() => _VTOBeginWidgetState();
}

class _VTOBeginWidgetState extends State<VTOBeginWidget> {
  late VTOBeginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VTOBeginModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                child: Container(
                  width: 35.0,
                  height: 3.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).navbaricon,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'r10ean85' /* Welcome to virtual try on */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'almarai',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl: 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/weozajvi39km/Frame_2087324836-min.jpg',
                        width: 200.0,
                        height:
                            MediaQuery.sizeOf(context).width < kBreakpointMedium
                                ? 250.0
                                : 450.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.east,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl: 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/45jecrjke7iu/Frame_2087324837-min.jpg',
                        width: 200.0,
                        height:
                            MediaQuery.sizeOf(context).width < kBreakpointMedium
                                ? 250.0
                                : 450.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 16.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'la8dovdl' /* Experience fashion like never ... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'almarai',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'kwlngprf' /* No more guessing how a dress w... */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'almarai',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (loggedIn) {
                    if (currentUserDocument!.userVto.userVtoCreditPoints > 0) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.9,
                                child: VTOFinalWidget(
                                  product: widget.product!,
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.76,
                                child: const VirtualTryOnPointsWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    }

                    Navigator.pop(context);
                  } else {
                    context.pushNamed(
                      LoginWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  }
                },
                text: FFLocalizations.of(context).getText(
                  '1wpgn0s9' /* Get Started */,
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'almarai',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ]
              .divide(const SizedBox(height: 8.0))
              .addToStart(const SizedBox(height: 24.0))
              .addToEnd(const SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
