import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'order_return_model.dart';
export 'order_return_model.dart';

class OrderReturnWidget extends StatefulWidget {
  const OrderReturnWidget({
    super.key,
    required this.order,
  });

  final DocumentReference? order;

  static String routeName = 'OrderReturn';
  static String routePath = '/order_return';

  @override
  State<OrderReturnWidget> createState() => _OrderReturnWidgetState();
}

class _OrderReturnWidgetState extends State<OrderReturnWidget> {
  late OrderReturnModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderReturnModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        title: 'OrderReturn',
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).border,
                          borderRadius: 100.0,
                          buttonSize: 42.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.goNamed(
                              OrdersDetailsWidget.routeName,
                              queryParameters: {
                                'order': serializeParam(
                                  widget.order,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                '__transition_info__': const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'd415dioi' /* Return Request */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'almarai',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 8.0)),
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
              child: StreamBuilder<OrdersRecord>(
                stream: OrdersRecord.getDocument(widget.order!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return const Center(
                      child: SizedBox(
                        width: 2.0,
                        height: 2.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.transparent,
                          ),
                        ),
                      ),
                    );
                  }

                  final columnOrdersRecord = snapshot.data!;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          height: 10.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.payment_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22.0,
                              ),
                              Expanded(
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'tdqnlvcv' /* Ordered on  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          dateTimeFormat(
                                            "yMMMd",
                                            columnOrdersRecord.createdAt,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(32.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).border,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 4.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '0wol03zg' /* Order ID  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'lr7vps4i' /* -  */,
                                          ),
                                          style: const TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            columnOrdersRecord.orderId,
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '7623k0oi' /* Product Details */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'almarai',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 10.0,
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Builder(
                              builder: (context) {
                                final items = columnOrdersRecord
                                    .orderItems.cartItems
                                    .toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(items.length, (itemsIndex) {
                                    final itemsItem = items[itemsIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                                child: Checkbox(
                                                  value:
                                                      _model.checkboxValueMap[
                                                          itemsItem] ??= _model
                                                              .returnProduct
                                                              .contains(
                                                                  itemsItem) ==
                                                          true,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() => _model
                                                            .checkboxValueMap[
                                                        itemsItem] = newValue!);
                                                    if (newValue!) {
                                                      _model.addToReturnProduct(
                                                          itemsItem);
                                                      safeSetState(() {});
                                                    } else {
                                                      _model
                                                          .removeFromReturnProduct(
                                                              itemsItem);
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  side: (FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate !=
                                                          null)
                                                      ? BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        )
                                                      : null,
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: itemsItem
                                                                    .productInfo
                                                                    .featureImage !=
                                                                ''
                                                        ? itemsItem.productInfo
                                                            .featureImage
                                                        : itemsItem
                                                            .productInfo
                                                            .galleryImage
                                                            .firstOrNull!,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        const Alignment(0.0, -1.0),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getVariableText(
                                                          enText: () {
                                                            if (itemsItem
                                                                    .productInfo
                                                                    .infoCustomTranslate
                                                                    .name
                                                                    .en !=
                                                                '') {
                                                              return itemsItem
                                                                  .productInfo
                                                                  .infoCustomTranslate
                                                                  .name
                                                                  .en;
                                                            } else if (itemsItem
                                                                    .productInfo
                                                                    .infoTranslate
                                                                    .name
                                                                    .en !=
                                                                '') {
                                                              return itemsItem
                                                                  .productInfo
                                                                  .infoTranslate
                                                                  .name
                                                                  .en;
                                                            } else {
                                                              return itemsItem
                                                                  .productInfo
                                                                  .name;
                                                            }
                                                          }(),
                                                          arText: () {
                                                            if (itemsItem
                                                                    .productInfo
                                                                    .infoCustomTranslate
                                                                    .name
                                                                    .ar !=
                                                                '') {
                                                              return itemsItem
                                                                  .productInfo
                                                                  .infoCustomTranslate
                                                                  .name
                                                                  .ar;
                                                            } else if (itemsItem
                                                                    .productInfo
                                                                    .infoTranslate
                                                                    .name
                                                                    .ar !=
                                                                '') {
                                                              return itemsItem
                                                                  .productInfo
                                                                  .infoTranslate
                                                                  .name
                                                                  .ar;
                                                            } else {
                                                              return itemsItem
                                                                  .productInfo
                                                                  .name;
                                                            }
                                                          }(),
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
                                                      Text(
                                                        '${FFLocalizations.of(context).getVariableText(
                                                          enText: 'Quantity : ',
                                                          arText: 'كمية :',
                                                        )}${valueOrDefault<String>(
                                                          itemsItem.quantity
                                                              .toString(),
                                                          '-',
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final attrList = itemsItem
                                                              .cartItemAttribute
                                                              .toList();

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                attrList.length,
                                                            itemBuilder: (context,
                                                                attrListIndex) {
                                                              final attrListItem =
                                                                  attrList[
                                                                      attrListIndex];
                                                              return StreamBuilder<
                                                                  List<
                                                                      AttributesRecord>>(
                                                                stream:
                                                                    queryAttributesRecord(
                                                                  queryBuilder:
                                                                      (attributesRecord) =>
                                                                          attributesRecord
                                                                              .where(
                                                                    'attribute_id',
                                                                    isEqualTo:
                                                                        attrListItem
                                                                            .attributesId,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return const Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            2.0,
                                                                        height:
                                                                            2.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            Colors.transparent,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<AttributesRecord>
                                                                      rowAttributesRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final rowAttributesRecord = rowAttributesRecordList
                                                                          .isNotEmpty
                                                                      ? rowAttributesRecordList
                                                                          .first
                                                                      : null;

                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          rowAttributesRecord
                                                                              ?.attributeInfo
                                                                              .name,
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'koxcw5p8' /*  -  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              BrandsRecord>>(
                                                                        stream:
                                                                            queryBrandsRecord(
                                                                          queryBuilder: (brandsRecord) =>
                                                                              brandsRecord.where(
                                                                            'brand_id',
                                                                            isEqualTo:
                                                                                attrListItem.attributesDefaultTermId,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<BrandsRecord>
                                                                              containerBrandsRecordList =
                                                                              snapshot.data!;
                                                                          final containerBrandsRecord = containerBrandsRecordList.isNotEmpty
                                                                              ? containerBrandsRecordList.first
                                                                              : null;

                                                                          return Container(
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                containerBrandsRecord?.brandInfo.name,
                                                                                '-',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'almarai',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  '${valueOrDefault<String>(
                                                    itemsItem.totalPrice
                                                        .toString(),
                                                    '-',
                                                  )}${FFLocalizations.of(context).getVariableText(
                                                    enText: ' KD',
                                                    arText: ' KD',
                                                  )}',
                                                  '-',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                            if (_model.returnProduct.length > 0)
                              Divider(
                                height: 10.0,
                                thickness: 1.0,
                                indent: 16.0,
                                endIndent: 16.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            if (_model.returnProduct.length > 0)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: _model.returnProduct.length
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'sxehytko' /*  Items   */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '6slmd41k' /* |   */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: functions
                                                  .newCartTotal(_model
                                                      .returnProduct
                                                      .map((e) => e.totalPrice)
                                                      .toList())
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'u65mr1gr' /*  KD */,
                                              ),
                                              style: const TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ]
                              .divide(const SizedBox(height: 12.0))
                              .addToStart(const SizedBox(height: 16.0))
                              .addToEnd(const SizedBox(height: 16.0)),
                        ),
                        Divider(
                          height: 10.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'w7t3id0q' /* Reason for Return */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'almarai',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).border,
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model
                                        .reasonforReturnFieldValueController ??=
                                    FormFieldController<String>(
                                  _model.reasonforReturnFieldValue ??=
                                      FFLocalizations.of(context).getText(
                                    'blqjr5ju' /* Size Issue */,
                                  ),
                                ),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'nxn6xl6u' /* Size Issue */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '2l9jqp4t' /* Wrong Item Delivered */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '9cl7n7cl' /* Defective Item */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'w9vonwty' /* Not Satisfied with Quality */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '8oihjlj4' /* Others */,
                                  )
                                ],
                                onChanged: (val) => safeSetState(() =>
                                    _model.reasonforReturnFieldValue = val),
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'fqjkitpr' /* Select Reason for Return */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 0.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '2w7b4uwa' /* Additional Comments */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'almarai',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'f0y8p8lu' /* Anything to mention... */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'almarai',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).border,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                              maxLines: 5,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Divider(
                          height: 10.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        if (_model.returnProduct.length > 0)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 24.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.reasonforReturnFieldValue ==
                                    'Others') {
                                  if (!(_model.textController.text != '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: const Text(
                                                'Please specifive the reason in the additional comment box.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    return;
                                  }
                                }
                                _model.idmapResult = await queryIdMapRecordOnce(
                                  queryBuilder: (idMapRecord) =>
                                      idMapRecord.where(
                                    'type',
                                    isEqualTo: 'Main',
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);

                                var returnRequestsRecordReference =
                                    ReturnRequestsRecord.collection.doc();
                                await returnRequestsRecordReference.set({
                                  ...createReturnRequestsRecordData(
                                    returnRequestId:
                                        'RTORD${_model.idmapResult?.returnRequestId.toString()}',
                                    createdAt: getCurrentTimestamp,
                                    updatedAt: getCurrentTimestamp,
                                    status: 'Pending',
                                    userRef: currentUserReference,
                                    orderRef: columnOrdersRecord.reference,
                                    orderId: columnOrdersRecord.orderId,
                                    totalReturnQuantity:
                                        _model.returnProduct.length,
                                    totalReturnAmount: functions.newCartTotal(
                                        _model.returnProduct
                                            .map((e) => e.totalPrice)
                                            .toList()),
                                    returnReason:
                                        _model.reasonforReturnFieldValue,
                                    returnAdditionalInfo:
                                        _model.textController.text,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'return_product_list':
                                          getUserCartItemsListFirestoreData(
                                        _model.returnProduct,
                                      ),
                                    },
                                  ),
                                });
                                _model.newDoc =
                                    ReturnRequestsRecord.getDocumentFromData({
                                  ...createReturnRequestsRecordData(
                                    returnRequestId:
                                        'RTORD${_model.idmapResult?.returnRequestId.toString()}',
                                    createdAt: getCurrentTimestamp,
                                    updatedAt: getCurrentTimestamp,
                                    status: 'Pending',
                                    userRef: currentUserReference,
                                    orderRef: columnOrdersRecord.reference,
                                    orderId: columnOrdersRecord.orderId,
                                    totalReturnQuantity:
                                        _model.returnProduct.length,
                                    totalReturnAmount: functions.newCartTotal(
                                        _model.returnProduct
                                            .map((e) => e.totalPrice)
                                            .toList()),
                                    returnReason:
                                        _model.reasonforReturnFieldValue,
                                    returnAdditionalInfo:
                                        _model.textController.text,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'return_product_list':
                                          getUserCartItemsListFirestoreData(
                                        _model.returnProduct,
                                      ),
                                    },
                                  ),
                                }, returnRequestsRecordReference);

                                await widget.order!
                                    .update(createOrdersRecordData(
                                  returnRequestId:
                                      _model.newDoc?.returnRequestId,
                                ));

                                await _model.idmapResult!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'return_request_id':
                                          FieldValue.increment(1),
                                    },
                                  ),
                                });

                                context.goNamed(
                                  OrderReturnSubmitWidget.routeName,
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
                                'f5kksy09' /* Raise Return Request */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 48.0,
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
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ].addToEnd(const SizedBox(height: 16.0)),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
