import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/blank_loading/blank_loading_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'product_filter_popup_model.dart';
export 'product_filter_popup_model.dart';

class ProductFilterPopupWidget extends StatefulWidget {
  const ProductFilterPopupWidget({super.key});

  @override
  State<ProductFilterPopupWidget> createState() =>
      _ProductFilterPopupWidgetState();
}

class _ProductFilterPopupWidgetState extends State<ProductFilterPopupWidget> {
  late ProductFilterPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductFilterPopupModel());

    _model.categorySearchTextController ??= TextEditingController();
    _model.categorySearchFocusNode ??= FocusNode();

    _model.atrrbuiteSearchTextController ??= TextEditingController();
    _model.atrrbuiteSearchFocusNode ??= FocusNode();

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
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 1.0),
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'fqtpef4s' /* Filters */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'almarai',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'pag0jwtp' /* 4 Filter added */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).border,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<AttributesRecord>>(
                  stream: queryAttributesRecord(
                    queryBuilder: (attributesRecord) => attributesRecord.where(
                      'status',
                      isEqualTo: 'active',
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 150.0,
                        child: const LoadingAnimationWidget(),
                      );
                    }
                    List<AttributesRecord> containerAttributesRecordList =
                        snapshot.data!;

                    return Container(
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.navigationName = 'default';
                                              _model.brandLists = [];
                                              _model.attrSearch = false;
                                              safeSetState(() {});
                                              safeSetState(() {
                                                _model
                                                    .atrrbuiteSearchTextController
                                                    ?.clear();
                                                _model
                                                    .categorySearchTextController
                                                    ?.clear();
                                              });
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: _model.navigationName ==
                                                        'default'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: _model
                                                              .navigationName ==
                                                          'default'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '8efijf1a' /* Category */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    2.0,
                                                                    4.0,
                                                                    2.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                CategoryRecord>>(
                                                          stream:
                                                              queryCategoryRecord(
                                                            queryBuilder:
                                                                (categoryRecord) =>
                                                                    categoryRecord
                                                                        .where(
                                                                          'status',
                                                                          isEqualTo:
                                                                              'active',
                                                                        )
                                                                        .where(
                                                                          'category_marketing.is_featue_product',
                                                                          isEqualTo:
                                                                              true,
                                                                        ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 10.0,
                                                                  height: 10.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<CategoryRecord>
                                                                textCategoryRecordList =
                                                                snapshot.data!;

                                                            return Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                textCategoryRecordList
                                                                    .length
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.navigationName = 'style';
                                              _model.brandLists = [];
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: _model.navigationName ==
                                                        'style'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: _model
                                                              .navigationName ==
                                                          'style'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ij2bbqk6' /* Style */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    2.0,
                                                                    4.0,
                                                                    2.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '87hsyjzh' /* 2 */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.navigationName = 'price';
                                              _model.brandLists = [];
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: _model.navigationName ==
                                                        'price'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: _model
                                                              .navigationName ==
                                                          'price'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '3yko7g9m' /* Price */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    2.0,
                                                                    4.0,
                                                                    2.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'mwkfugua' /* 5 */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final attributeList =
                                                containerAttributesRecordList
                                                    .sortedList(
                                                        keyOf: (e) => e
                                                            .attributeInfo.name,
                                                        desc: false)
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  attributeList.length,
                                                  (attributeListIndex) {
                                                final attributeListItem =
                                                    attributeList[
                                                        attributeListIndex];
                                                return Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      safeSetState(() {
                                                        _model
                                                            .atrrbuiteSearchTextController
                                                            ?.clear();
                                                        _model
                                                            .categorySearchTextController
                                                            ?.clear();
                                                      });
                                                      _model.navigationName =
                                                          attributeListItem
                                                              .attributeInfo
                                                              .name;
                                                      _model.brandLists =
                                                          attributeListItem
                                                              .attributeBrandId
                                                              .toList()
                                                              .cast<String>();
                                                      _model.categorySerach =
                                                          false;
                                                      _model.attrSearch = false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: _model
                                                                    .navigationName ==
                                                                attributeListItem
                                                                    .attributeInfo
                                                                    .name
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: _model
                                                                      .navigationName ==
                                                                  attributeListItem
                                                                      .attributeInfo
                                                                      .name
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    12.0,
                                                                    16.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getVariableText(
                                                                  enText: () {
                                                                    if (attributeListItem
                                                                            .attributeInfoCustomTranslate
                                                                            .name
                                                                            .en !=
                                                                        '') {
                                                                      return attributeListItem
                                                                          .attributeInfoCustomTranslate
                                                                          .name
                                                                          .en;
                                                                    } else if (attributeListItem
                                                                            .attributeInfoTranslate
                                                                            .name
                                                                            .en !=
                                                                        '') {
                                                                      return attributeListItem
                                                                          .attributeInfoTranslate
                                                                          .name
                                                                          .en;
                                                                    } else {
                                                                      return attributeListItem
                                                                          .attributeInfo
                                                                          .name;
                                                                    }
                                                                  }(),
                                                                  arText: () {
                                                                    if (attributeListItem
                                                                            .attributeInfoCustomTranslate
                                                                            .name
                                                                            .ar !=
                                                                        '') {
                                                                      return attributeListItem
                                                                          .attributeInfoCustomTranslate
                                                                          .name
                                                                          .ar;
                                                                    } else if (attributeListItem
                                                                            .attributeInfoTranslate
                                                                            .name
                                                                            .ar !=
                                                                        '') {
                                                                      return attributeListItem
                                                                          .attributeInfoTranslate
                                                                          .name
                                                                          .ar;
                                                                    } else {
                                                                      return attributeListItem
                                                                          .attributeInfo
                                                                          .name;
                                                                    }
                                                                  }(),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            4.0,
                                                                            2.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    attributeListItem
                                                                        .attributeBrandId
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'almarai',
                                                                        fontSize:
                                                                            10.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ].addToEnd(const SizedBox(height: 64.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        if ((_model.navigationName ==
                                                'default') &&
                                            loggedIn)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .categorySearchTextController,
                                                focusNode: _model
                                                    .categorySearchFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.categorySearchTextController',
                                                  const Duration(milliseconds: 2000),
                                                  () async {
                                                    if (_model
                                                            .categorySearchTextController
                                                            .text !=
                                                        '') {
                                                      safeSetState(() => _model
                                                              .algoliaSearchResults1 =
                                                          null);
                                                      await CategoryRecord
                                                              .search(
                                                        term: _model
                                                            .categorySearchTextController
                                                            .text,
                                                      )
                                                          .then((r) => _model
                                                                  .algoliaSearchResults1 =
                                                              r)
                                                          .onError((_, __) =>
                                                              _model.algoliaSearchResults1 =
                                                                  [])
                                                          .whenComplete(() =>
                                                              safeSetState(
                                                                  () {}));

                                                      _model.categorySerach =
                                                          true;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.categorySerach =
                                                          false;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '5vlmrwrj' /* Search Categories */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  prefixIcon: const Icon(
                                                    FFIcons.ksearch,
                                                    size: 18.0,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .categorySearchTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        if ((_model.brandLists.length > 0) &&
                                            loggedIn)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .atrrbuiteSearchTextController,
                                                focusNode: _model
                                                    .atrrbuiteSearchFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.atrrbuiteSearchTextController',
                                                  const Duration(milliseconds: 2000),
                                                  () async {
                                                    if (_model
                                                            .atrrbuiteSearchTextController
                                                            .text !=
                                                        '') {
                                                      safeSetState(() => _model
                                                              .algoliaSearchResults2 =
                                                          null);
                                                      await BrandsRecord.search(
                                                        term: _model
                                                            .atrrbuiteSearchTextController
                                                            .text,
                                                      )
                                                          .then((r) => _model
                                                                  .algoliaSearchResults2 =
                                                              r)
                                                          .onError((_, __) =>
                                                              _model.algoliaSearchResults2 =
                                                                  [])
                                                          .whenComplete(() =>
                                                              safeSetState(
                                                                  () {}));

                                                      _model.attrSearch = true;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.attrSearch = false;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getVariableText(
                                                    enText:
                                                        'يبحث${containerAttributesRecordList.where((e) => e.attributeInfo.name == _model.navigationName).toList().firstOrNull?.attributeInfo.name}',
                                                    arText:
                                                        'يبحث${containerAttributesRecordList.where((e) => e.attributeInfo.name == _model.navigationName).toList().firstOrNull?.attributeInfoTranslate.name.ar}',
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  prefixIcon: Icon(
                                                    FFIcons.ksearch,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 18.0,
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .atrrbuiteSearchTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    StreamBuilder<List<CategoryRecord>>(
                                      stream: queryCategoryRecord(
                                        queryBuilder: (categoryRecord) =>
                                            categoryRecord
                                                .where(
                                                  'status',
                                                  isEqualTo: 'active',
                                                )
                                                .where(
                                                  'category_marketing.is_featue_product',
                                                  isEqualTo: true,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 10.0,
                                              height: 10.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CategoryRecord>
                                            categoryCategoryRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: Visibility(
                                            visible: _model.navigationName ==
                                                'default',
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 8.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final categoryVar = (_model
                                                                      .categorySerach ==
                                                                  true
                                                              ? _model
                                                                  .algoliaSearchResults1
                                                                  ?.where((e) =>
                                                                      e.status ==
                                                                      'active')
                                                                  .toList()
                                                              : categoryCategoryRecordList)
                                                          ?.toList() ??
                                                      [];

                                                  return GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width <
                                                              kBreakpointMedium
                                                          ? 2
                                                          : 4,
                                                      crossAxisSpacing: 8.0,
                                                      mainAxisSpacing: 16.0,
                                                      childAspectRatio: () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 1.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 1.5;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 1.5;
                                                        } else {
                                                          return 1.5;
                                                        }
                                                      }(),
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        categoryVar.length,
                                                    itemBuilder: (context,
                                                        categoryVarIndex) {
                                                      final categoryVarItem =
                                                          categoryVar[
                                                              categoryVarIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (FFAppState()
                                                                  .UserFilter
                                                                  .categoryId
                                                                  .contains(
                                                                      categoryVarItem
                                                                          .categoryId) ==
                                                              false) {
                                                            FFAppState()
                                                                .updateUserFilterStruct(
                                                              (e) => e
                                                                ..filterStatus =
                                                                    'set'
                                                                ..updateCategoryId(
                                                                  (e) => e.add(
                                                                      categoryVarItem
                                                                          .categoryId),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState()
                                                                .updateUserFilterStruct(
                                                              (e) => e
                                                                ..filterStatus =
                                                                    'set'
                                                                ..updateCategoryId(
                                                                  (e) => e.remove(
                                                                      categoryVarItem
                                                                          .categoryId),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FFAppState().UserFilter.categoryId.contains(categoryVarItem.categoryId) ==
                                                                                true
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : const Color(0x0A000000),
                                                                        width: FFAppState().UserFilter.categoryId.contains(categoryVarItem.categoryId) ==
                                                                                true
                                                                            ? 2.0
                                                                            : 1.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/Rectangle_6001.svg',
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                            alignment:
                                                                                const Alignment(0.0, 1.0),
                                                                          ),
                                                                        ),
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl: () {
                                                                              if (categoryVarItem.categoryInfo.featureImage != '') {
                                                                                return categoryVarItem.categoryInfo.featureImage;
                                                                              } else if (categoryVarItem.categoryInfo.iconImage != '') {
                                                                                return categoryVarItem.categoryInfo.iconImage;
                                                                              } else {
                                                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/na2nsnluxz7g/Vacation_Wear.png';
                                                                              }
                                                                            }(),
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                const Alignment(0.0, -1.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      enText:
                                                                          () {
                                                                        if (categoryVarItem.categoryInfoCustomTranslate.name.en !=
                                                                            '') {
                                                                          return categoryVarItem
                                                                              .categoryInfoCustomTranslate
                                                                              .name
                                                                              .en;
                                                                        } else if (categoryVarItem.categoryInfoTranslate.name.en !=
                                                                            '') {
                                                                          return categoryVarItem
                                                                              .categoryInfoTranslate
                                                                              .name
                                                                              .en;
                                                                        } else {
                                                                          return categoryVarItem
                                                                              .categoryInfo
                                                                              .name;
                                                                        }
                                                                      }(),
                                                                      arText:
                                                                          () {
                                                                        if (categoryVarItem.categoryInfoCustomTranslate.name.ar !=
                                                                            '') {
                                                                          return categoryVarItem
                                                                              .categoryInfoCustomTranslate
                                                                              .name
                                                                              .ar;
                                                                        } else if (categoryVarItem.categoryInfoTranslate.name.ar !=
                                                                            '') {
                                                                          return categoryVarItem
                                                                              .categoryInfoTranslate
                                                                              .name
                                                                              .ar;
                                                                        } else {
                                                                          return categoryVarItem
                                                                              .categoryInfo
                                                                              .name;
                                                                        }
                                                                      }(),
                                                                    ),
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'almarai',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    if (_model.navigationName == 'style')
                                      Wrap(
                                        spacing: 8.0,
                                        runSpacing: 8.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateUserFilterStruct(
                                                  (e) => e
                                                    ..filterStatus = 'set'
                                                    ..productType = 'custom',
                                                );
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FFAppState()
                                                              .UserFilter
                                                              .productType ==
                                                          'custom'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 10.0,
                                                          12.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pww06i9n' /* Custom Made */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                              .UserFilter
                                                              .productType ==
                                                          'custom')
                                                        Icon(
                                                          Icons.check_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateUserFilterStruct(
                                                  (e) => e
                                                    ..filterStatus = 'set'
                                                    ..productType = 'ready',
                                                );
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FFAppState()
                                                              .UserFilter
                                                              .productType ==
                                                          'ready'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 10.0,
                                                          12.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm23v3hap' /* Ready Made */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                              .UserFilter
                                                              .productType ==
                                                          'ready')
                                                        Icon(
                                                          Icons.check_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (_model.navigationName == 'price')
                                      Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Wrap(
                                                spacing: 8.0,
                                                runSpacing: 8.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.vertical,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                            .updateUserFilterStruct(
                                                          (e) => e
                                                            ..filterStatus =
                                                                'set'
                                                            ..priceRange =
                                                                'Below 100KD'
                                                            ..priceMinimum = 0.0
                                                            ..priceMaximum =
                                                                100.0,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'nt2bqqbv' /* Below 100KD */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          'Below 100KD'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          'Below 100KD'
                                                                      ? 16.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                            .updateUserFilterStruct(
                                                          (e) => e
                                                            ..filterStatus =
                                                                'set'
                                                            ..priceRange =
                                                                '100 KD to 250 KD'
                                                            ..priceMinimum =
                                                                100.0
                                                            ..priceMaximum =
                                                                250.0,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '6sj9tjzn' /* 100 KD to 250 KD */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          '100 KD to 250 KD'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          '100 KD to 250 KD'
                                                                      ? 16.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                            .updateUserFilterStruct(
                                                          (e) => e
                                                            ..filterStatus =
                                                                'set'
                                                            ..priceRange =
                                                                '250 KD to 1000 KD'
                                                            ..priceMinimum =
                                                                250.0
                                                            ..priceMaximum =
                                                                1000.0,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '4gqwtnop' /* 250 KD to 1000 KD */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          '250 KD to 1000 KD'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          '250 KD to 1000 KD'
                                                                      ? 16.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                            .updateUserFilterStruct(
                                                          (e) => e
                                                            ..filterStatus =
                                                                'set'
                                                            ..priceRange =
                                                                '1000 KD to 5000 KD'
                                                            ..priceMinimum =
                                                                1000.0
                                                            ..priceMaximum =
                                                                5000.0,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ukswgei9' /* 1000 KD to 5000 KD */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          '1000 KD to 5000 KD'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  fontSize: FFAppState()
                                                                              .UserFilter
                                                                              .priceRange ==
                                                                          '1000 KD to 5000 KD'
                                                                      ? 16.0
                                                                      : 14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState()
                                                          .updateUserFilterStruct(
                                                        (e) => e
                                                          ..filterStatus = 'set'
                                                          ..priceRange =
                                                              'Custom Range'
                                                          ..priceMinimum = 50.0
                                                          ..priceMaximum =
                                                              100.0,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fhujdmea' /* Custom Range */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            color: FFAppState()
                                                                        .UserFilter
                                                                        .priceRange ==
                                                                    'Custom Range'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            fontSize: FFAppState()
                                                                        .UserFilter
                                                                        .priceRange ==
                                                                    'Custom Range'
                                                                ? 16.0
                                                                : 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (FFAppState()
                                                  .UserFilter
                                                  .priceRange ==
                                              'Custom Range')
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Slider(
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                min: 100.0,
                                                max: 10000.0,
                                                value: _model
                                                        .priceRangeSliderValue ??=
                                                    100.0,
                                                label: _model
                                                    .priceRangeSliderValue
                                                    ?.toStringAsFixed(2),
                                                divisions: 40,
                                                onChanged: (newValue) async {
                                                  newValue = double.parse(
                                                      newValue
                                                          .toStringAsFixed(2));
                                                  safeSetState(() => _model
                                                          .priceRangeSliderValue =
                                                      newValue);
                                                  FFAppState()
                                                      .updateUserFilterStruct(
                                                    (e) => e
                                                      ..filterStatus = 'set'
                                                      ..priceMaximum = _model
                                                          .priceRangeSliderValue,
                                                  );
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    if ((_model.navigationName != 'default') &&
                                        (_model.navigationName != 'price') &&
                                        (_model.navigationName != 'style'))
                                      Builder(
                                        builder: (context) {
                                          final brandColorList = (_model
                                                              .attrSearch ==
                                                          true
                                                      ? _model
                                                          .algoliaSearchResults2
                                                          ?.where((e) =>
                                                              (e.status ==
                                                                  'active') &&
                                                              (_model.brandLists
                                                                      .contains(e
                                                                          .brandId) ==
                                                                  true))
                                                          .toList()
                                                          .map(
                                                              (e) => e.brandId)
                                                          .toList()
                                                      : _model.brandLists)
                                                  ?.toList() ??
                                              [];

                                          return Wrap(
                                            spacing: 4.0,
                                            runSpacing: 4.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                brandColorList.length,
                                                (brandColorListIndex) {
                                              final brandColorListItem =
                                                  brandColorList[
                                                      brandColorListIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: StreamBuilder<
                                                    List<BrandsRecord>>(
                                                  stream: queryBrandsRecord(
                                                    queryBuilder:
                                                        (brandsRecord) =>
                                                            brandsRecord
                                                                .where(
                                                                  'brand_id',
                                                                  isEqualTo:
                                                                      brandColorListItem,
                                                                )
                                                                .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'active',
                                                                ),
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Container(
                                                        width: 0.0,
                                                        height: 0.0,
                                                        child:
                                                            const BlankLoadingWidget(),
                                                      );
                                                    }
                                                    List<BrandsRecord>
                                                        colorValueBrandsRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final colorValueBrandsRecord =
                                                        colorValueBrandsRecordList
                                                                .isNotEmpty
                                                            ? colorValueBrandsRecordList
                                                                .first
                                                            : null;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (FFAppState()
                                                                .UserFilter
                                                                .brandId
                                                                .contains(
                                                                    brandColorListItem) ==
                                                            false) {
                                                          FFAppState()
                                                              .updateUserFilterStruct(
                                                            (e) => e
                                                              ..filterStatus =
                                                                  'set'
                                                              ..updateBrandId(
                                                                (e) => e.add(
                                                                    brandColorListItem),
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState()
                                                              .updateUserFilterStruct(
                                                            (e) => e
                                                              ..filterStatus =
                                                                  'set'
                                                              ..updateBrandId(
                                                                (e) => e.remove(
                                                                    brandColorListItem),
                                                              ),
                                                          );
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FFAppState()
                                                                      .UserFilter
                                                                      .brandId
                                                                      .contains(
                                                                          brandColorListItem) ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      10.0,
                                                                      12.0,
                                                                      10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (colorValueBrandsRecord
                                                                          ?.brandInfo
                                                                          .color !=
                                                                      null)
                                                                    Container(
                                                                      width:
                                                                          24.0,
                                                                      height:
                                                                          24.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: colorValueBrandsRecord
                                                                            ?.brandInfo
                                                                            .color,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).border,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (colorValueBrandsRecord
                                                                              ?.brandInfo
                                                                              .featureImage !=
                                                                          null &&
                                                                      colorValueBrandsRecord
                                                                              ?.brandInfo
                                                                              .featureImage !=
                                                                          '')
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        'https://picsum.photos/seed/144/600',
                                                                        width:
                                                                            36.0,
                                                                        height:
                                                                            36.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getVariableText(
                                                                    enText: () {
                                                                      if (colorValueBrandsRecord
                                                                              ?.brandInfoCustomTranslate
                                                                              .name
                                                                              .en !=
                                                                          '') {
                                                                        return colorValueBrandsRecord
                                                                            ?.brandInfoCustomTranslate
                                                                            .name
                                                                            .en;
                                                                      } else if (colorValueBrandsRecord
                                                                              ?.brandInfoTranslate
                                                                              .name
                                                                              .en !=
                                                                          '') {
                                                                        return colorValueBrandsRecord
                                                                            ?.brandInfoTranslate
                                                                            .name
                                                                            .en;
                                                                      } else {
                                                                        return colorValueBrandsRecord
                                                                            ?.brandInfo
                                                                            .name;
                                                                      }
                                                                    }(),
                                                                    arText: () {
                                                                      if (colorValueBrandsRecord
                                                                              ?.brandInfoCustomTranslate
                                                                              .name
                                                                              .ar !=
                                                                          '') {
                                                                        return colorValueBrandsRecord
                                                                            ?.brandInfoCustomTranslate
                                                                            .name
                                                                            .ar;
                                                                      } else if (colorValueBrandsRecord
                                                                              ?.brandInfoTranslate
                                                                              .name
                                                                              .ar !=
                                                                          '') {
                                                                        return colorValueBrandsRecord
                                                                            ?.brandInfoTranslate
                                                                            .name
                                                                            .ar;
                                                                      } else {
                                                                        return colorValueBrandsRecord
                                                                            ?.brandInfo
                                                                            .name;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'almarai',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (FFAppState()
                                                                      .UserFilter
                                                                      .brandId
                                                                      .contains(
                                                                          brandColorListItem) ==
                                                                  true)
                                                                Icon(
                                                                  Icons
                                                                      .check_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                  ]
                                      .divide(const SizedBox(height: 8.0))
                                      .addToStart(const SizedBox(height: 8.0))
                                      .addToEnd(const SizedBox(height: 64.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ]
                .addToStart(const SizedBox(height: 24.0))
                .addToEnd(const SizedBox(height: 69.0)),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).border,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().UserFilter = UserFiltersStruct();

                              context.goNamed(
                                ProductListWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '1pflz26o' /* Reset */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).buttonBorder,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().updateUserFilterStruct(
                                (e) => e
                                  ..filterStatus = 'set'
                                  ..categoryCount =
                                      FFAppState().UserFilter.categoryId.length
                                  ..brandCount =
                                      FFAppState().UserFilter.brandId.length
                                  ..productCount = null
                                  ..productId = [],
                              );
                              _model.allProductsDoc =
                                  await queryProductsRecordOnce(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'status',
                                  isEqualTo: 'active',
                                ),
                              );
                              while (
                                  FFAppState().UserFilter.categoryCount > 0) {
                                _model.filterCategoryResult =
                                    await queryCategoryRecordOnce(
                                  queryBuilder: (categoryRecord) =>
                                      categoryRecord.where(
                                    'category_id',
                                    isEqualTo: FFAppState()
                                        .UserFilter
                                        .categoryId
                                        .elementAtOrNull(FFAppState()
                                                .UserFilter
                                                .categoryCount -
                                            1),
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.filterCategoryResult!
                                        .categoryProductList.length >
                                    0) {
                                  _model.count = _model.filterCategoryResult
                                      ?.categoryProductList.length;
                                  while (_model.count! > 0) {
                                    if (FFAppState()
                                            .UserFilter
                                            .productId
                                            .contains(_model
                                                .filterCategoryResult
                                                ?.categoryProductList
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)) !=
                                        true) {
                                      FFAppState().updateUserFilterStruct(
                                        (e) => e
                                          ..updateProductId(
                                            (e) => e.add(_model
                                                .filterCategoryResult!
                                                .categoryProductList
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)!),
                                          ),
                                      );
                                    }
                                    _model.count = (_model.count!) - 1;
                                  }
                                }
                                FFAppState().updateUserFilterStruct(
                                  (e) => e
                                    ..categoryCount =
                                        FFAppState().UserFilter.categoryCount -
                                            1,
                                );
                              }
                              while (FFAppState().UserFilter.brandCount > 0) {
                                _model.filterBrandResult =
                                    await queryBrandsRecordOnce(
                                  queryBuilder: (brandsRecord) =>
                                      brandsRecord.where(
                                    'brand_id',
                                    isEqualTo: FFAppState()
                                        .UserFilter
                                        .brandId
                                        .elementAtOrNull(
                                            FFAppState().UserFilter.brandCount -
                                                1),
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                if (_model.filterBrandResult!.brandProductId
                                        .length >
                                    0) {
                                  _model.count = _model.filterBrandResult
                                      ?.brandProductId.length;
                                  while (_model.count! > 0) {
                                    if (FFAppState()
                                            .UserFilter
                                            .productId
                                            .contains(_model.filterBrandResult
                                                ?.brandProductId
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)) !=
                                        true) {
                                      FFAppState().updateUserFilterStruct(
                                        (e) => e
                                          ..updateProductId(
                                            (e) => e.add(_model
                                                .filterBrandResult!
                                                .brandProductId
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)!),
                                          ),
                                      );
                                    }
                                    _model.count = (_model.count!) - 1;
                                  }
                                }
                                FFAppState().updateUserFilterStruct(
                                  (e) => e
                                    ..brandCount =
                                        FFAppState().UserFilter.brandCount - 1,
                                );
                              }
                              if (FFAppState().UserFilter.productType ==
                                  'ready') {
                                _model.count =
                                    FFAppState().UserFilter.productId.length;
                                while (_model.count! > 0) {
                                  if (_model.allProductsDoc
                                          ?.where((e) =>
                                              e.productId ==
                                              FFAppState()
                                                  .UserFilter
                                                  .productId
                                                  .elementAtOrNull(
                                                      (_model.count!) - 1))
                                          .toList()
                                          .firstOrNull
                                          ?.product
                                          .productType ==
                                      'ready') {
                                    _model.addToProductIds(_model
                                        .allProductsDoc!
                                        .where((e) =>
                                            e.productId ==
                                            FFAppState()
                                                .UserFilter
                                                .productId
                                                .elementAtOrNull(
                                                    (_model.count!) - 1))
                                        .toList()
                                        .firstOrNull!
                                        .productId);
                                  }
                                  _model.count = _model.count! + -1;
                                }
                                FFAppState().updateUserFilterStruct(
                                  (e) =>
                                      e..productId = _model.productIds.toList(),
                                );
                              } else {
                                if (FFAppState().UserFilter.productType ==
                                    'custom') {
                                  _model.count =
                                      FFAppState().UserFilter.productId.length;
                                  while (_model.count! > 0) {
                                    if (_model.allProductsDoc
                                            ?.where((e) =>
                                                e.productId ==
                                                FFAppState()
                                                    .UserFilter
                                                    .productId
                                                    .elementAtOrNull(
                                                        (_model.count!) - 1))
                                            .toList()
                                            .firstOrNull
                                            ?.product
                                            .productType ==
                                        'custom') {
                                      _model.addToProductIds(_model
                                          .allProductsDoc!
                                          .where((e) =>
                                              e.productId ==
                                              FFAppState()
                                                  .UserFilter
                                                  .productId
                                                  .elementAtOrNull(
                                                      (_model.count!) - 1))
                                          .toList()
                                          .firstOrNull!
                                          .productId);
                                    }
                                    _model.count = _model.count! + -1;
                                  }
                                  FFAppState().updateUserFilterStruct(
                                    (e) => e
                                      ..productId = _model.productIds.toList(),
                                  );
                                }
                              }

                              unawaited(
                                () async {
                                  Navigator.pop(context);
                                }(),
                              );

                              context.goNamed(
                                ProductListWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );

                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'c11yuz6l' /* Apply Changes */,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
