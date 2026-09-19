import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/designer_grid/designer_grid_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
              preferredSize: Size.fromHeight(60.0),
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
                actions: [],
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
                    child: UserInitialWidget(),
                  ),
                  wrapWithModel(
                    model: _model.appUpdateCheckerModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppUpdateCheckerWidget(),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 12.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 30.0,
                            decoration: BoxDecoration(),
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
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final allWishlist1 = (currentUserDocument
                                                ?.userWishlistItem
                                                ?.toList() ??
                                            [])
                                        .where((e) => valueOrDefault<bool>(
                                              () {
                                                if (_model.choiceChipsValue ==
                                                    'Product') {
                                                  return (e.entityType ==
                                                      'product');
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Designer') {
                                                  return (e.entityType ==
                                                      'designer');
                                                } else if (_model
                                                        .choiceChipsValue ==
                                                    'Creator') {
                                                  return (e.entityType ==
                                                      'creator');
                                                } else {
                                                  return true;
                                                }
                                              }(),
                                              true,
                                            ))
                                        .toList();
                                    if (allWishlist1.isEmpty) {
                                      return Center(
                                        child: EmptyWidget(
                                          messageOne:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            'fmcvv2hz' /* Nothing here yet! Start adding... */,
                                          ),
                                          image:
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/lt4x4jbz3kkp/Group_(2).svg',
                                          messageTwo:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            'q666blv1' /* Go ahead—add your dream picks! */,
                                          ),
                                          buttonText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            'f7gafm4z' /* Start adding */,
                                          ),
                                        ),
                                      );
                                    }

                                    return Wrap(
                                      spacing: 8.0,
                                      runSpacing: 24.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children:
                                          List.generate(allWishlist1.length,
                                              (allWishlist1Index) {
                                        final allWishlist1Item =
                                            allWishlist1[allWishlist1Index];
                                        return Stack(
                                          children: [
                                            if (allWishlist1Item.entityType ==
                                                'product')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 24.0),
                                                child: Container(
                                                  width: (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointMedium
                                                          ? 160
                                                          : 180)
                                                      .toDouble(),
                                                  height: 280.0,
                                                  decoration: BoxDecoration(),
                                                  child: StreamBuilder<
                                                      List<ProductsRecord>>(
                                                    stream: queryProductsRecord(
                                                      queryBuilder:
                                                          (productsRecord) =>
                                                              productsRecord
                                                                  .where(
                                                                    'status',
                                                                    isEqualTo:
                                                                        'active',
                                                                  )
                                                                  .where(
                                                                    'product_id',
                                                                    isEqualTo:
                                                                        allWishlist1Item
                                                                            .wishlistItemId,
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 150.0,
                                                          child:
                                                              LoadingAnimationWidget(),
                                                        );
                                                      }
                                                      List<ProductsRecord>
                                                          productGridProductsRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final productGridProductsRecord =
                                                          productGridProductsRecordList
                                                                  .isNotEmpty
                                                              ? productGridProductsRecordList
                                                                  .first
                                                              : null;

                                                      return ProductGridWidget(
                                                        key: Key(
                                                            'Key2ey_${allWishlist1Index}_of_${allWishlist1.length}'),
                                                        product:
                                                            productGridProductsRecord,
                                                        checkboxStatus: 'show',
                                                        checkboxComponentType:
                                                            'wishlist',
                                                        wishlistDatatype:
                                                            allWishlist1Item,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            if ((allWishlist1Item.entityType ==
                                                    'designer') ||
                                                (allWishlist1Item.entityType ==
                                                    'creator'))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 16.0),
                                                child: Container(
                                                  width: (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              kBreakpointMedium
                                                          ? 160
                                                          : 180)
                                                      .toDouble(),
                                                  height: 280.0,
                                                  decoration: BoxDecoration(),
                                                  child: DesignerGridWidget(
                                                    key: Key(
                                                        'Keypza_${allWishlist1Index}_of_${allWishlist1.length}'),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 12.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
