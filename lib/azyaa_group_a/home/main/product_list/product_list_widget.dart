import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_filter_popup/product_filter_popup_widget.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/azyaa_group_a/home/components/product_listview/product_listview_widget.dart';
import '/azyaa_group_a/home/components/product_sort/product_sort_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'product_list_model.dart';
export 'product_list_model.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({super.key});

  static String routeName = 'ProductList';
  static String routePath = '/azyaa-product-list';

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late ProductListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.screenWidth = await actions.getScreenWidth(
        context,
      );
      _model.screenwidth = _model.screenWidth!;
      _model.gridWidth = functions.getGridWidth(_model.screenwidth);
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
        title: 'ProductList',
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
                          '8xuv9a5b' /* Shop */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: true,
                        wishlistIconStatus: false,
                        navigationFrom: 'productlist',
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
                        Stack(
                          children: [
                            StreamBuilder<List<ProductsRecord>>(
                              stream: queryProductsRecord(
                                queryBuilder: (productsRecord) => productsRecord
                                    .where(
                                      'status',
                                      isEqualTo: 'active',
                                    )
                                    .orderBy('created_at', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 150.0,
                                    child: LoadingAnimationWidget(),
                                  );
                                }
                                List<ProductsRecord>
                                    productList1ProductsRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible:
                                        productList1ProductsRecordList.length >
                                            0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (_model.defaultView == 'grid')
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (FFAppState()
                                                        .UserFilter
                                                        .sortStatus !=
                                                    'set')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final allProductList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState()
                                                                        .UserFilter
                                                                        .productId
                                                                        .contains(e
                                                                            .productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .createdAt!,
                                                                desc: true)
                                                            .toList();
                                                        if (allProductList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '7jsyr0pw' /* Nothing here just yet… */,
                                                              ),
                                                              image: '',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '62dsuzl5' /* Looks like we haven’t stocked ... */,
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'n0wbtc4t' /* Go to Shop */,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              allProductList
                                                                  .length,
                                                              (allProductListIndex) {
                                                            final allProductListItem =
                                                                allProductList[
                                                                    allProductListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              allProductListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Container(
                                                                width: _model
                                                                    .gridWidth,
                                                                height: 280.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    ProductGridWidget(
                                                                  key: Key(
                                                                      'Keydxq_${allProductListIndex}_of_${allProductList.length}'),
                                                                  product:
                                                                      allProductListItem,
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (((FFAppState()
                                                                .UserFilter
                                                                .isSortPopular ==
                                                            true) ||
                                                        (FFAppState()
                                                                .UserFilter
                                                                .isSortRecommended ==
                                                            true)) &&
                                                    (FFAppState()
                                                            .UserFilter
                                                            .sortStatus ==
                                                        'set'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final allProductList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState().UserFilter.productId.contains(e.productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => FFAppState()
                                                                            .UserFilter
                                                                            .isSortPopular ==
                                                                        true
                                                                    ? e.productMarketing
                                                                        .isPopularProduct
                                                                        .toString()
                                                                    : e.productMarketing
                                                                        .isRecommendedProduct
                                                                        .toString(),
                                                                desc: false)
                                                            .toList();
                                                        if (allProductList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'mjllv998' /* Nothing here just yet… */,
                                                              ),
                                                              image: '',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '8vybhunz' /* Looks like we haven’t stocked ... */,
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'mf59fwjk' /* Go to Shop */,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              allProductList
                                                                  .length,
                                                              (allProductListIndex) {
                                                            final allProductListItem =
                                                                allProductList[
                                                                    allProductListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              allProductListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Container(
                                                                width: _model
                                                                    .gridWidth,
                                                                height: 280.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    ProductGridWidget(
                                                                  key: Key(
                                                                      'Keyw0i_${allProductListIndex}_of_${allProductList.length}'),
                                                                  product:
                                                                      allProductListItem,
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .UserFilter
                                                            .isSortLtoH ==
                                                        true) &&
                                                    (FFAppState()
                                                            .UserFilter
                                                            .sortStatus ==
                                                        'set'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final allProductList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState()
                                                                        .UserFilter
                                                                        .productId
                                                                        .contains(e
                                                                            .productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .product
                                                                    .productPrice,
                                                                desc: false)
                                                            .toList();
                                                        if (allProductList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'y6cn22dp' /* Nothing here just yet…  */,
                                                              ),
                                                              image: '',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'opzbkv9r' /* Looks like we haven’t stocked ... */,
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'go9cb3mx' /* Go to Shop */,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              allProductList
                                                                  .length,
                                                              (allProductListIndex) {
                                                            final allProductListItem =
                                                                allProductList[
                                                                    allProductListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              allProductListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Container(
                                                                width: _model
                                                                    .gridWidth,
                                                                height: 280.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    ProductGridWidget(
                                                                  key: Key(
                                                                      'Keykr4_${allProductListIndex}_of_${allProductList.length}'),
                                                                  product:
                                                                      allProductListItem,
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .UserFilter
                                                            .isSortHtoL ==
                                                        true) &&
                                                    (FFAppState()
                                                            .UserFilter
                                                            .sortStatus ==
                                                        'set'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final allProductList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState()
                                                                        .UserFilter
                                                                        .productId
                                                                        .contains(e
                                                                            .productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .product
                                                                    .productPrice,
                                                                desc: true)
                                                            .toList();
                                                        if (allProductList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'el76x0pb' /* Nothing here just yet…  */,
                                                              ),
                                                              image: '',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'no8qkuw2' /* Looks like we haven’t stocked ... */,
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'amr0a0nw' /* Back to Shop */,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return Wrap(
                                                          spacing: 8.0,
                                                          runSpacing: 24.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              allProductList
                                                                  .length,
                                                              (allProductListIndex) {
                                                            final allProductListItem =
                                                                allProductList[
                                                                    allProductListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              allProductListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Container(
                                                                width: _model
                                                                    .gridWidth,
                                                                height: 280.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    ProductGridWidget(
                                                                  key: Key(
                                                                      'Keyrcg_${allProductListIndex}_of_${allProductList.length}'),
                                                                  product:
                                                                      allProductListItem,
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        if (_model.defaultView == 'list')
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (FFAppState()
                                                        .UserFilter
                                                        .sortStatus !=
                                                    'set')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final productList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState()
                                                                        .UserFilter
                                                                        .productId
                                                                        .contains(e
                                                                            .productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .createdAt!,
                                                                desc: true)
                                                            .toList();
                                                        if (productList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'xxkh5mj9' /* Nothing here just yet…  */,
                                                              ),
                                                              image:
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/9dcoihm1bunh/cart.png',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '4m18fxc3' /* Looks like we haven’t stocked ... */,
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '51830y3u' /* Go to Shop */,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: productList
                                                              .length,
                                                          itemBuilder: (context,
                                                              productListIndex) {
                                                            final productListItem =
                                                                productList[
                                                                    productListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              productListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child:
                                                                    Container(
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      ProductListviewWidget(
                                                                    key: Key(
                                                                        'Keyhvq_${productListIndex}_of_${productList.length}'),
                                                                    product:
                                                                        productListItem,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (((FFAppState()
                                                                .UserFilter
                                                                .isSortPopular ==
                                                            true) ||
                                                        (FFAppState()
                                                                .UserFilter
                                                                .isSortRecommended ==
                                                            true)) &&
                                                    (FFAppState()
                                                            .UserFilter
                                                            .sortStatus ==
                                                        'set'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final productList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState().UserFilter.productId.contains(e.productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => FFAppState()
                                                                            .UserFilter
                                                                            .isSortPopular ==
                                                                        true
                                                                    ? e.productMarketing
                                                                        .isPopularProduct
                                                                        .toString()
                                                                    : e.productMarketing
                                                                        .isRecommendedProduct
                                                                        .toString(),
                                                                desc: false)
                                                            .toList();
                                                        if (productList
                                                            .isEmpty) {
                                                          return EmptyWidget(
                                                            messageOne:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'u0qvqq8l' /* Nothing here just yet…  */,
                                                            ),
                                                            image: '',
                                                            messageTwo:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'lnzvudpl' /* Looks like we haven’t stocked ... */,
                                                            ),
                                                            buttonText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              '96x42ez3' /* Go to Shop */,
                                                            ),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: productList
                                                              .length,
                                                          itemBuilder: (context,
                                                              productListIndex) {
                                                            final productListItem =
                                                                productList[
                                                                    productListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              productListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child:
                                                                    Container(
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      ProductListviewWidget(
                                                                    key: Key(
                                                                        'Key4i0_${productListIndex}_of_${productList.length}'),
                                                                    product:
                                                                        productListItem,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .UserFilter
                                                            .isSortLtoH ==
                                                        true) &&
                                                    (FFAppState()
                                                            .UserFilter
                                                            .sortStatus ==
                                                        'set'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final productList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState()
                                                                        .UserFilter
                                                                        .productId
                                                                        .contains(e
                                                                            .productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .product
                                                                    .productPrice,
                                                                desc: false)
                                                            .toList();
                                                        if (productList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'e5fkoc3o' /* Nothing here just yet…  */,
                                                              ),
                                                              image: '',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'ibnlwmmi' /* Looks like we haven’t stocked ... */,
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '9tvh3354' /* Go to Shop */,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: productList
                                                              .length,
                                                          itemBuilder: (context,
                                                              productListIndex) {
                                                            final productListItem =
                                                                productList[
                                                                    productListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              productListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child:
                                                                    Container(
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      ProductListviewWidget(
                                                                    key: Key(
                                                                        'Key0xt_${productListIndex}_of_${productList.length}'),
                                                                    product:
                                                                        productListItem,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .UserFilter
                                                            .isSortHtoL ==
                                                        true) &&
                                                    (FFAppState()
                                                            .UserFilter
                                                            .sortStatus ==
                                                        'set'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 16.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final productList = productList1ProductsRecordList
                                                            .where((e) => (FFAppState()
                                                                            .UserFilter
                                                                            .filterStatus ==
                                                                        'set') &&
                                                                    (FFAppState()
                                                                            .UserFilter
                                                                            .productId
                                                                            .length >
                                                                        0)
                                                                ? (FFAppState()
                                                                        .UserFilter
                                                                        .productId
                                                                        .contains(e
                                                                            .productId) ==
                                                                    true)
                                                                : true)
                                                            .toList()
                                                            .sortedList(
                                                                keyOf: (e) => e
                                                                    .product
                                                                    .productPrice,
                                                                desc: true)
                                                            .toList();
                                                        if (productList
                                                            .isEmpty) {
                                                          return Center(
                                                            child: EmptyWidget(
                                                              messageOne:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'fhecz59f' /* Nothing here just yet…  */,
                                                              ),
                                                              image: '',
                                                              messageTwo:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '99r8wxux' /* Looks like we haven’t stocked ... */,
                                                              ),
                                                              buttonText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'orai85xs' /* Go to Shop */,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount: productList
                                                              .length,
                                                          itemBuilder: (context,
                                                              productListIndex) {
                                                            final productListItem =
                                                                productList[
                                                                    productListIndex];
                                                            return Visibility(
                                                              visible: FFAppState()
                                                                          .UserFilter
                                                                          .filterStatus ==
                                                                      'set'
                                                                  ? (FFAppState()
                                                                          .UserFilter
                                                                          .productId
                                                                          .contains(
                                                                              productListItem.productId) ==
                                                                      true)
                                                                  : true,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child:
                                                                    Container(
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      ProductListviewWidget(
                                                                    key: Key(
                                                                        'Keyjty_${productListIndex}_of_${productList.length}'),
                                                                    product:
                                                                        productListItem,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                      ].addToEnd(SizedBox(height: 24.0)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 75.0,
                          decoration: BoxDecoration(),
                        ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .addToStart(SizedBox(height: 16.0)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
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
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.defaultView == 'grid') {
                                      _model.defaultView = 'list';
                                      safeSetState(() {});
                                    } else {
                                      _model.defaultView = 'grid';
                                      safeSetState(() {});
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(6.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).border,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        if (_model.defaultView == 'grid')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            child: Icon(
                                              Icons.list,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        if (_model.defaultView == 'list')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 8.0, 4.0),
                                            child: Icon(
                                              Icons.grid_view_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: ProductSortWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FFIcons.ksort,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 18.0,
                                            ),
                                            Expanded(
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5667jh1y' /* Sort By */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 7.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.85,
                                                  child:
                                                      ProductFilterPopupWidget(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .border,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FFIcons.kfilter,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'k5l8vj4u' /* Filter */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  if (((FFAppState()
                                                                  .UserFilter
                                                                  .filterStatus ==
                                                              'set') &&
                                                          (FFAppState()
                                                                  .UserFilter
                                                                  .productId
                                                                  .length >
                                                              0)) &&
                                                      responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .purple,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      2.0,
                                                                      4.0,
                                                                      2.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              FFAppState()
                                                                  .UserFilter
                                                                  .productId
                                                                  .length
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Cairo',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 7.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().UserFilter.filterStatus ==
                                    'set')
                                  FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().UserFilter =
                                          UserFiltersStruct();

                                      context.goNamed(
                                        ProductListWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'xoyusk6s' /* Clear */,
                                    ),
                                    icon: Icon(
                                      Icons.restart_alt,
                                      size: 14.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 35.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ],
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
