import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/order/orders_comp/orders_comp_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'orders_model.dart';
export 'orders_model.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  static String routeName = 'Orders';
  static String routePath = '/azyaa-orders';

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget>
    with TickerProviderStateMixin {
  late OrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
        title: 'Orders',
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
                      updateOnChange: true,
                      child: UniversalAppBarWidget(
                        backButtonStatus: true,
                        title: FFLocalizations.of(context).getText(
                          '1qicorvl' /* My Order */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: false,
                        navigationFrom: 'profile',
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<OrdersRecord>>(
                          stream: queryOrdersRecord(
                            queryBuilder: (ordersRecord) => ordersRecord
                                .where(
                                  'customer_ref',
                                  isEqualTo: currentUserReference,
                                )
                                .orderBy('created_at', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 10.0,
                                  height: 10.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<OrdersRecord> containerOrdersRecordList =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Aileron',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      unselectedLabelStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Aileron',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ns8yln7s' /* Active */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'wuxoqzmr' /* Completed */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '75gjfw2c' /* Cancelled */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
                                          () async {},
                                          () async {}
                                        ][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model
                                                                    .defaultView ==
                                                                'list') {
                                                              _model.defaultView =
                                                                  'grid';
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.defaultView =
                                                                  'list';
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                if (_model
                                                                        .defaultView ==
                                                                    'grid')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .list,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .defaultView ==
                                                                    'list')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .grid_view_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      FlutterFlowChoiceChips(
                                                                    options: [
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '7v6rqa01' /* All */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'd9x21h83' /* Custom made */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'o9hyj2kw' /* Ready made */,
                                                                      ))
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.choiceChipsActiveValue =
                                                                                val?.firstOrNull),
                                                                    selectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Aileron',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      iconSize:
                                                                          16.0,
                                                                      elevation:
                                                                          0.0,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    unselectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Aileron',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      iconSize:
                                                                          16.0,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .border,
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    chipSpacing:
                                                                        8.0,
                                                                    rowSpacing:
                                                                        8.0,
                                                                    multiselect:
                                                                        false,
                                                                    initialized:
                                                                        _model.choiceChipsActiveValue !=
                                                                            null,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    controller: _model
                                                                            .choiceChipsActiveValueController ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'fk49c5nn' /* All */,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    wrapped:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
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
                                                Divider(
                                                  height: 10.0,
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.8,
                                                decoration: BoxDecoration(
                                                  color: containerOrdersRecordList
                                                              .where((e) =>
                                                                  (e.orderStatus == 'CAPTURED') ||
                                                                  (e.orderStatus ==
                                                                      'Success') ||
                                                                  (e.orderStatus ==
                                                                      'Paid') ||
                                                                  (e.orderStatus ==
                                                                      'SUCCESS'))
                                                              .toList()
                                                              .length >
                                                          0
                                                      ? Color(0xFFF6F6F6)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final activeOrders =
                                                        containerOrdersRecordList
                                                            .where((e) =>
                                                                (e.paymentStatus ==
                                                                    'CAPTURED') &&
                                                                (e.orderStatus !=
                                                                    'completed'))
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .updatedAt!,
                                                                desc: true)
                                                            .toList();
                                                    if (activeOrders.isEmpty) {
                                                      return Center(
                                                        child: EmptyWidget(
                                                          messageOne:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '8vbsw1cx' /* No orders yet? */,
                                                          ),
                                                          image:
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/ky2eouxuz129/order222.png',
                                                          messageTwo:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '8aljt83k' /* Your next great find is just a... */,
                                                          ),
                                                          buttonText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'lt2u26xa' /* let’s go shopping */,
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          activeOrders.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          activeOrdersIndex) {
                                                        final activeOrdersItem =
                                                            activeOrders[
                                                                activeOrdersIndex];
                                                        return OrdersCompWidget(
                                                          key: Key(
                                                              'Key2qf_${activeOrdersIndex}_of_${activeOrders.length}'),
                                                          order:
                                                              activeOrdersItem,
                                                          orderID:
                                                              activeOrdersItem
                                                                  .orderId,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ]
                                                .addToStart(
                                                    SizedBox(height: 12.0))
                                                .addToEnd(
                                                    SizedBox(height: 12.0)),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model
                                                                    .defaultView ==
                                                                'list') {
                                                              _model.defaultView =
                                                                  'grid';
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.defaultView =
                                                                  'list';
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                if (_model
                                                                        .defaultView ==
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      enText:
                                                                          'grid',
                                                                      arText:
                                                                          'شبكة',
                                                                    ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .list,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .defaultView ==
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      enText:
                                                                          'list',
                                                                      arText:
                                                                          'قائمة',
                                                                    ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .grid_view_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      FlutterFlowChoiceChips(
                                                                    options: [
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'm02ugwea' /* All */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '21ai0hma' /* Custom made */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2yzpg8em' /* Ready made */,
                                                                      ))
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.choiceChipsValue1 =
                                                                                val?.firstOrNull),
                                                                    selectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Aileron',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      iconSize:
                                                                          16.0,
                                                                      elevation:
                                                                          0.0,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    unselectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Aileron',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      iconSize:
                                                                          16.0,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .border,
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    chipSpacing:
                                                                        8.0,
                                                                    rowSpacing:
                                                                        8.0,
                                                                    multiselect:
                                                                        false,
                                                                    initialized:
                                                                        _model.choiceChipsValue1 !=
                                                                            null,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    controller: _model
                                                                            .choiceChipsValueController1 ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'zde13dl9' /* All */,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    wrapped:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
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
                                                Divider(
                                                  height: 10.0,
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.8,
                                                decoration: BoxDecoration(
                                                  color: containerOrdersRecordList
                                                              .where((e) =>
                                                                  e.orderStatus ==
                                                                  'completed')
                                                              .toList()
                                                              .length >
                                                          0
                                                      ? Color(0xFFF6F6F6)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final completedOrders =
                                                        containerOrdersRecordList
                                                            .where((e) =>
                                                                (e.paymentStatus ==
                                                                    'CAPTURED') &&
                                                                (e.orderStatus ==
                                                                    'completed'))
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .updatedAt!,
                                                                desc: true)
                                                            .toList();
                                                    if (completedOrders
                                                        .isEmpty) {
                                                      return Center(
                                                        child: EmptyWidget(
                                                          messageOne:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'j0psxktr' /* No orders yet? */,
                                                          ),
                                                          image:
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/ky2eouxuz129/order222.png',
                                                          messageTwo:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'm1atg8tj' /* Your next great find is just a... */,
                                                          ),
                                                          buttonText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'ku3fkzcg' /* let’s go shopping */,
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: completedOrders
                                                          .length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          completedOrdersIndex) {
                                                        final completedOrdersItem =
                                                            completedOrders[
                                                                completedOrdersIndex];
                                                        return OrdersCompWidget(
                                                          key: Key(
                                                              'Keykk6_${completedOrdersIndex}_of_${completedOrders.length}'),
                                                          order:
                                                              completedOrdersItem,
                                                          orderID:
                                                              completedOrdersItem
                                                                  .orderId,
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ]
                                                .addToStart(
                                                    SizedBox(height: 12.0))
                                                .addToEnd(
                                                    SizedBox(height: 12.0)),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                                desktop: false,
                                              ))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 8.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model
                                                                    .defaultView ==
                                                                'list') {
                                                              _model.defaultView =
                                                                  'grid';
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.defaultView =
                                                                  'list';
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .border,
                                                              ),
                                                            ),
                                                            child: Stack(
                                                              children: [
                                                                if (_model
                                                                        .defaultView ==
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      enText:
                                                                          'grid',
                                                                      arText:
                                                                          'شبكة',
                                                                    ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .list,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .defaultView ==
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                      enText:
                                                                          'list',
                                                                      arText:
                                                                          'قائمة',
                                                                    ))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .grid_view_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: ListView(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      FlutterFlowChoiceChips(
                                                                    options: [
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'us6hw7m4' /* All */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'lq7x5u11' /* Custom made */,
                                                                      )),
                                                                      ChipData(FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '3riwbxuo' /* Ready made */,
                                                                      ))
                                                                    ],
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.choiceChipsValue2 =
                                                                                val?.firstOrNull),
                                                                    selectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Aileron',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      iconSize:
                                                                          16.0,
                                                                      elevation:
                                                                          0.0,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    unselectedChipStyle:
                                                                        ChipStyle(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Aileron',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      iconSize:
                                                                          16.0,
                                                                      elevation:
                                                                          0.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .border,
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    chipSpacing:
                                                                        8.0,
                                                                    rowSpacing:
                                                                        8.0,
                                                                    multiselect:
                                                                        false,
                                                                    initialized:
                                                                        _model.choiceChipsValue2 !=
                                                                            null,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    controller: _model
                                                                            .choiceChipsValueController2 ??=
                                                                        FormFieldController<
                                                                            List<String>>(
                                                                      [
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'azzy5cn9' /* All */,
                                                                        )
                                                                      ],
                                                                    ),
                                                                    wrapped:
                                                                        false,
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
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
                                                Divider(
                                                  height: 10.0,
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              StreamBuilder<List<OrdersRecord>>(
                                                stream: queryOrdersRecord(
                                                  queryBuilder:
                                                      (ordersRecord) =>
                                                          ordersRecord.where(
                                                    'customer_ref',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  ),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
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
                                                  List<OrdersRecord>
                                                      containerOrdersRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    decoration: BoxDecoration(
                                                      color: containerOrdersRecordList
                                                                  .where((e) =>
                                                                      e.orderStatus ==
                                                                      'completed')
                                                                  .toList()
                                                                  .length >
                                                              0
                                                          ? Color(0xFFF6F6F6)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final canList = containerOrdersRecordList
                                                            .where((e) =>
                                                                (e.orderStatus ==
                                                                    'FAILED') ||
                                                                (e.orderStatus ==
                                                                    'Initialzation'))
                                                            .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              canList.length,
                                                          itemBuilder: (context,
                                                              canListIndex) {
                                                            final canListItem =
                                                                canList[
                                                                    canListIndex];
                                                            return OrdersCompWidget(
                                                              key: Key(
                                                                  'Keyg3w_${canListIndex}_of_${canList.length}'),
                                                              orderID:
                                                                  canListItem
                                                                      .orderId,
                                                              order:
                                                                  canListItem,
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ]
                                                .addToStart(
                                                    SizedBox(height: 12.0))
                                                .addToEnd(
                                                    SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
