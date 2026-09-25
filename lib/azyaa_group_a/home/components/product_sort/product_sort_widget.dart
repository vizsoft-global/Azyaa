import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_sort_model.dart';
export 'product_sort_model.dart';

class ProductSortWidget extends StatefulWidget {
  const ProductSortWidget({super.key});

  @override
  State<ProductSortWidget> createState() => _ProductSortWidgetState();
}

class _ProductSortWidgetState extends State<ProductSortWidget> {
  late ProductSortModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductSortModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '6c92zuam' /* Sort by */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'almarai',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  FlutterFlowChoiceChips(
                    options: [
                      ChipData(FFLocalizations.of(context).getText(
                        'ddhgxoqz' /* UK */,
                      )),
                      ChipData(FFLocalizations.of(context).getText(
                        '9dczathl' /* US */,
                      ))
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'almarai',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                      iconColor: FlutterFlowTheme.of(context).info,
                      iconSize: 16.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Colors.transparent,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily: 'almarai',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 16.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    chipSpacing: 0.0,
                    multiselect: false,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    wrapped: true,
                  ),
              ].divide(const SizedBox(width: 8.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: FlutterFlowRadioButton(
              options: [
                FFLocalizations.of(context).getText(
                  'k92i3yza' /* Newer */,
                ),
                FFLocalizations.of(context).getText(
                  '2hab1bwp' /* Popular */,
                ),
                FFLocalizations.of(context).getText(
                  '7cfybex4' /* Recommended */,
                ),
                FFLocalizations.of(context).getText(
                  'obv8tjsy' /* Price - Low to High */,
                ),
                FFLocalizations.of(context).getText(
                  '8jgcxq4h' /* Price - High to Low */,
                )
              ].toList(),
              onChanged: (val) async {
                safeSetState(() {});
                unawaited(
                  () async {
                    Navigator.pop(context);
                  }(),
                );
                FFAppState().updateUserFilterStruct(
                  (e) => e
                    ..sortStatus = null
                    ..isSortNewer = null
                    ..isSortPopular = null
                    ..isSortRecommended = null
                    ..isSortLtoH = null
                    ..isSortHtoL = null,
                );
                FFAppState().update(() {});
                if ((_model.radioButtonValue == 'Newer') &&
                    (_model.radioButtonValue == 'أحدث')) {
                  FFAppState().updateUserFilterStruct(
                    (e) => e
                      ..sortStatus = null
                      ..isSortNewer = true,
                  );
                  FFAppState().update(() {});
                } else {
                  if ((_model.radioButtonValue == 'Popular') &&
                      (_model.radioButtonValue == 'شائع')) {
                    FFAppState().updateUserFilterStruct(
                      (e) => e
                        ..sortStatus = 'set'
                        ..isSortPopular = true,
                    );
                    FFAppState().update(() {});
                  } else {
                    if ((_model.radioButtonValue == 'Recommended') &&
                        (_model.radioButtonValue == 'مُستَحسَن')) {
                      FFAppState().updateUserFilterStruct(
                        (e) => e
                          ..sortStatus = 'set'
                          ..isSortRecommended = true,
                      );
                      FFAppState().update(() {});
                    } else {
                      if ((_model.radioButtonValue == 'Price - Low to High') &&
                          (_model.radioButtonValue ==
                              'السعر - من الأقل إلى الأعلى')) {
                        FFAppState().updateUserFilterStruct(
                          (e) => e
                            ..sortStatus = 'set'
                            ..isSortLtoH = true,
                        );
                        FFAppState().update(() {});
                      } else {
                        if ((_model.radioButtonValue ==
                                'Price - High to Low') &&
                            (_model.radioButtonValue ==
                                'السعر - من الأعلى إلى الأدنى')) {
                          FFAppState().updateUserFilterStruct(
                            (e) => e
                              ..sortStatus = 'set'
                              ..isSortHtoL = true,
                          );
                          FFAppState().update(() {});
                        }
                      }
                    }
                  }
                }
              },
              controller: _model.radioButtonValueController ??=
                  FormFieldController<String>(
                      FFAppState().UserFilter.sortStatus == 'set'
                          ? () {
                              if (FFAppState().UserFilter.isSortPopular ==
                                  true) {
                                return 'Popular';
                              } else if (FFAppState()
                                      .UserFilter
                                      .isSortRecommended ==
                                  true) {
                                return 'Recommended';
                              } else if (FFAppState().UserFilter.isSortLtoH ==
                                  true) {
                                return 'Price - Low to High';
                              } else if (FFAppState().UserFilter.isSortHtoL ==
                                  true) {
                                return 'Price - High to Low';
                              } else {
                                return 'Newer';
                              }
                            }()
                          : FFLocalizations.of(context).getVariableText(
                              enText: 'Newer',
                              arText: 'الأحدث',
                            )),
              optionHeight: 32.0,
              textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'almarai',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
              buttonPosition: RadioButtonPosition.left,
              direction: Axis.vertical,
              radioButtonColor: FlutterFlowTheme.of(context).primary,
              inactiveRadioButtonColor:
                  FlutterFlowTheme.of(context).secondaryText,
              toggleable: false,
              horizontalAlignment: WrapAlignment.start,
              verticalAlignment: WrapCrossAlignment.start,
            ),
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.start,
              verticalDirection: VerticalDirection.down,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'chste36w' /* Newer */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.check_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'pywoyh77' /* Popular */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'w2tg16ij' /* Recommended */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '0690tiib' /* Price - Low to high */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'fwz52ncb' /* Price - High to low */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Icon(
                              Icons.check_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                        ].divide(const SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ]
            .divide(const SizedBox(height: 16.0))
            .addToStart(const SizedBox(height: 24.0))
            .addToEnd(const SizedBox(height: 24.0)),
      ),
    );
  }
}
