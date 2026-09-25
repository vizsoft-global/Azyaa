import '/azyaa_group_a/home/coming_soon/coming_soon_comp/coming_soon_comp_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'coming_soon_model.dart';
export 'coming_soon_model.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({
    super.key,
    required this.type,
  });

  final String? type;

  static String routeName = 'ComingSoon';
  static String routePath = '/azyaa-comingsoon';

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  late ComingSoonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'ComingSoon',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.universalAppBarModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: UniversalAppBarWidget(
                        backButtonStatus: true,
                        title: FFLocalizations.of(context).getText(
                          'l3325mjy' /* Coming Soon... */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: false,
                        navigationFrom: 'home',
                      ),
                    ),
                  ],
                ),
                actions: const [],
                centerTitle: true,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.comingSoonCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ComingSoonCompWidget(
                        image: valueOrDefault<String>(
                          widget.type == 'gift'
                              ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/rsk0xxciuqyd/Group_(6)-min.png'
                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/wf3qyseg28mg/Group_(7)-min.png',
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/wf3qyseg28mg/Group_(7)-min.png',
                        ),
                        text: 'Coming Soon...',
                      ),
                    ),
                  ]
                      .divide(const SizedBox(height: 16.0))
                      .addToEnd(const SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
        ));
  }
}
