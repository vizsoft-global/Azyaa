import '/custom_code/widgets/azy_scroll_refresh.dart';
import '/custom_code/widgets/azy_shortlist_body.dart';
import '/backend/inventory/stock_service.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'shortlist_model.dart';
export 'shortlist_model.dart';

class ShortlistWidget extends StatefulWidget {
  const ShortlistWidget({super.key});

  static String routeName = 'Shortlist';
  static String routePath = '/azyaa-shortlist';

  @override
  State<ShortlistWidget> createState() => _ShortlistWidgetState();
}

class _ShortlistWidgetState extends State<ShortlistWidget> {
  late ShortlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortlistModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.screenWidth = await actions.getScreenWidth(
        context,
      );
      _model.screenwidth = _model.screenWidth!;
      _model.gridWidth = functions.getGridWidth(_model.screenwidth);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  /// Bumped on pull to refresh so the list loads again.
  int _azyRefreshTick = 0;

  /// Pull to refresh. Rebuilding re-runs every query on the page, and the
  /// stock numbers are looked up again alongside.
  Future<void> _azyRefresh() async {
    final stock = AzyInventoryStock.instance.refresh();
    safeSetState(() => _azyRefreshTick++);
    await azyRefreshHold(stock);
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Shortlist',
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
                      child: UniversalAppBarWidget(
                        backButtonStatus: true,
                        title: FFLocalizations.of(context).getText(
                          'o87neh7l' /* Shortlist */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: true,
                        wishlistIconStatus: false,
                        navigationFrom: 'default',
                        tryonStatus: false,
                        shareIconStatus: false,
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
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.userInitialModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: const UserInitialWidget(),
                  ),
                  wrapWithModel(
                    model: _model.appUpdateCheckerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const AppUpdateCheckerWidget(),
                  ),
                  AzyScrollRefresh(
                    onRefresh: _azyRefresh,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 12.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 30.0,
                            decoration: const BoxDecoration(),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData(FFLocalizations.of(context).getText(
                                  'qdtafj4j' /* All */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'zrntmki9' /* Designer */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'atr7b38u' /* Creator */,
                                )),
                                ChipData(FFLocalizations.of(context).getText(
                                  'n51rftkg' /* Product */,
                                ))
                              ],
                              onChanged: (val) => safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).info,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderWidth: 0.0,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).border,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [
                                  FFLocalizations.of(context).getText(
                                    'x4cnnj9w' /* All */,
                                  )
                                ],
                              ),
                              wrapped: false,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: const BoxDecoration(),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => AzyShortlistBody(
                                  chosen: _model.choiceChipsValue,
                                  refreshTick: _azyRefreshTick,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 12.0))
                          .addToStart(const SizedBox(height: 12.0))
                          .addToEnd(const SizedBox(height: 12.0)),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
