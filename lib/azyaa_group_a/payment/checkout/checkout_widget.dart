import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/profile_address_add/profile_address_add_widget.dart';
import '/azyaa_group_a/customer/zone/profile_address_edit/profile_address_edit_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/payment/apply_coupon/apply_coupon_widget.dart';
import '/azyaa_group_a/payment/cart_item_list/cart_item_list_widget.dart';
import '/azyaa_group_a/payment/checkout_payment_method/checkout_payment_method_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key});

  static String routeName = 'Checkout';
  static String routePath = '/azyaa-checkout';

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  late CheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserDocument?.userShippingaddress.toList() ?? [])
              .where((e) => e.isDefault == true)
              .toList()
              .length >
          0) {
        _model.settingsDocResult1 = await querySettingsRecordOnce(
          queryBuilder: (settingsRecord) => settingsRecord.where(
            'type',
            isEqualTo: 'Company',
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (((currentUserDocument?.userShippingaddress.toList() ?? [])
                    .where((e) => e.isDefault == true)
                    .toList()
                    .firstOrNull
                    ?.shippingAddressInfo
                    .country ==
                'Kuwait') ||
            ((currentUserDocument?.userShippingaddress.toList() ?? [])
                    .where((e) => e.isDefault == true)
                    .toList()
                    .firstOrNull
                    ?.shippingAddressInfo
                    .country ==
                'الكويت')) {
          _model.shippingCharge = _model
              .settingsDocResult1!.settingsLogisticsInfo.shippingChargeKuwait;
        } else {
          _model.orderCount = currentUserDocument?.userCart.cartItems.length;
          while (_model.orderCount! > 0) {
            _model.weight = _model.weight +
                currentUserDocument!.userCart.cartItems
                    .elementAtOrNull((_model.orderCount!) - 1)!
                    .productStockInfo
                    .weightGm;
            _model.orderCount = _model.orderCount! + -1;
          }
          _model.shippingCharge = functions.shippingPriceforGCC(
              _model.weight,
              _model
                  .settingsDocResult1!.settingsLogisticsInfo.shippingChargeGcc,
              _model.settingsDocResult1!.settingsLogisticsInfo
                  .shippingChargeGccExtra);
        }

        safeSetState(() {});
      }
    });

    _model.addressExpandableController =
        ExpandableController(initialExpanded: true)
          ..addListener(() => safeSetState(() {}));
    _model.deliveryMethodExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.paymentMethodExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.couponTextController ??= TextEditingController();
    _model.couponFocusNode ??= FocusNode();

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
        title: 'Checkout',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).border,
                          borderRadius: 100.0,
                          buttonSize: 42.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              userCart: createUserCartStruct(
                                couponInfo:
                                    createCouponCartInfoStruct(delete: true),
                                total: currentUserDocument?.userCart.subtotal,
                                clearUnsetFields: false,
                              ),
                            ));

                            context.goNamed(
                              CartWidget.routeName,
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
                              'hbdvewi0' /* Review & Pay */,
                            ),
                            textAlign: TextAlign.center,
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
                        Container(
                          width: 42.0,
                          height: 42.0,
                          decoration: const BoxDecoration(),
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
              child: Stack(
                children: [
                  wrapWithModel(
                    model: _model.userInitialModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: const UserInitialWidget(),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                    ))
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'w0kp1et9' /* You’re just */,
                                              ),
                                              style: const TextStyle(),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'vxnsc3py' /*  2 KD  */,
                                              ),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '5rxdgsyh' /* away from */,
                                              ),
                                              style: const TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7jp8rejq' /* Free Delivery! */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'almarai',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 4.0)),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          child: AuthUserStreamWidget(
                            builder: (context) => Builder(
                              builder: (context) {
                                final cartItemList = currentUserDocument
                                        ?.userCart.cartItems
                                        .toList() ??
                                    [];

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: cartItemList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 16.0),
                                  itemBuilder: (context, cartItemListIndex) {
                                    final cartItemListItem =
                                        cartItemList[cartItemListIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: CartItemListWidget(
                                        key: Key(
                                            'Key4gf_${cartItemListIndex}_of_${cartItemList.length}'),
                                        cartItems: cartItemListItem,
                                        navigationAt: 'checkout',
                                        cartIndex: cartItemListIndex,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        if ((currentUserDocument!.userCart.cartItems
                                    .where((e) => e.productType != 'membership')
                                    .toList()
                                    .length >
                                0) &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    ShopWidget.routeName,
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
                                  'v93kird2' /* add more product */,
                                ),
                                icon: const Icon(
                                  Icons.add_rounded,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.transparent,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'almarai',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        if (currentUserDocument!.userCart.cartItems
                                .where((e) => e.productType != 'membership')
                                .toList()
                                .length >
                            0)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                        height: 4.0,
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          color: const Color(0x00000000),
                                          child: ExpandableNotifier(
                                            controller: _model
                                                .addressExpandableController,
                                            child: ExpandablePanel(
                                              header: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ms8eb647' /* Ship to */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              collapsed: Container(),
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final addressList1 =
                                                          (currentUserDocument
                                                                      ?.userShippingaddress
                                                                      .toList() ??
                                                                  [])
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            addressList1.length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            addressList1Index) {
                                                          final addressList1Item =
                                                              addressList1[
                                                                  addressList1Index];
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${addressList1Item.userName}${addressList1Item.relationName != '' ? FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                '(',
                                                                            arText:
                                                                                '(',
                                                                          ) : ''}${addressList1Item.relationName}${addressList1Item.relationName != '' ? FFLocalizations.of(context).getVariableText(
                                                                            enText:
                                                                                '),',
                                                                            arText:
                                                                                '),',
                                                                          ) : ' '},${addressList1Item.shippingAddressInfo.country}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '${addressList1Item.shippingAddressInfo.addressLine1}${FFLocalizations.of(context).getVariableText(
                                                                          enText:
                                                                              ',',
                                                                          arText:
                                                                              ',',
                                                                        )}${addressList1Item.shippingAddressInfo.city}${FFLocalizations.of(context).getVariableText(
                                                                          enText:
                                                                              ',',
                                                                          arText:
                                                                              ',',
                                                                        )}${addressList1Item.shippingAddressInfo.postalCode}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'almarai',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                                if (addressList1Item
                                                                        .isDefault ==
                                                                    true)
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              4.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            size:
                                                                                10.0,
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '1585wblc' /* Default */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'almarai',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 2.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .iconStatus ==
                                                                    'show')
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: const AlignmentDirectional(0.0, 1.0).resolve(Directionality.of(context)),
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.8,
                                                                                    child: ProfileAddressEditWidget(
                                                                                      shippingAddress: addressList1Item,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        if ((currentUserDocument?.userShippingaddress.toList() ?? []).where((e) => e.isDefault == true).toList().length >
                                                                            0) {
                                                                          _model.settingsDocResult2 =
                                                                              await querySettingsRecordOnce(
                                                                            queryBuilder: (settingsRecord) =>
                                                                                settingsRecord.where(
                                                                              'type',
                                                                              isEqualTo: 'Company',
                                                                            ),
                                                                            singleRecord:
                                                                                true,
                                                                          ).then((s) => s.firstOrNull);
                                                                          if (((currentUserDocument?.userShippingaddress.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.shippingAddressInfo.country == 'Kuwait') ||
                                                                              ((currentUserDocument?.userShippingaddress.toList() ?? []).where((e) => e.isDefault == true).toList().firstOrNull?.shippingAddressInfo.country == 'الكويت')) {
                                                                            _model.shippingCharge =
                                                                                _model.settingsDocResult2!.settingsLogisticsInfo.shippingChargeKuwait;
                                                                          } else {
                                                                            _model.orderCount =
                                                                                currentUserDocument?.userCart.cartItems.length;
                                                                            while (_model.orderCount! >
                                                                                0) {
                                                                              _model.weight = _model.weight + currentUserDocument!.userCart.cartItems.elementAtOrNull((_model.orderCount!) - 1)!.productStockInfo.weightGm;
                                                                              _model.orderCount = _model.orderCount! + -1;
                                                                            }
                                                                            _model.shippingCharge = functions.shippingPriceforGCC(
                                                                                _model.weight,
                                                                                _model.settingsDocResult2!.settingsLogisticsInfo.shippingChargeGcc,
                                                                                _model.settingsDocResult2!.settingsLogisticsInfo.shippingChargeGccExtra);
                                                                          }

                                                                          safeSetState(
                                                                              () {});
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .more_vert_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    FlutterFlowCheckboxGroup(
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'r4odwaxm' /* Billing info same as shipping ... */,
                                                        )
                                                      ],
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.checkboxGroupValues1 =
                                                                  val),
                                                      controller: _model
                                                              .checkboxGroupValueController1 ??=
                                                          FormFieldController<
                                                              List<String>>(
                                                        List.from([
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'uc0201nn' /* Billing info same as shipping ... */,
                                                              )
                                                            ] ??
                                                            []),
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      checkboxBorderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      unselectedTextStyle:
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
                                                      checkboxBorderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      initialized: _model
                                                              .checkboxGroupValues1 !=
                                                          null,
                                                    ),
                                                  if ((currentUserDocument
                                                                  ?.userShippingaddress
                                                                  .toList() ??
                                                              [])
                                                          .length ==
                                                      0)
                                                    Builder(
                                                      builder: (context) =>
                                                          FFButtonWidget(
                                                        onPressed: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: const AlignmentDirectional(
                                                                        0.0,
                                                                        1.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.8,
                                                                      child:
                                                                          const ProfileAddressAddWidget(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'k2geadvd' /* add new address */,
                                                        ),
                                                        icon: const Icon(
                                                          Icons.add_rounded,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: Colors
                                                              .transparent,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(const SizedBox(height: 8.0)),
                                              ),
                                              theme: const ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: true,
                                                tapBodyToCollapse: true,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
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
                                          height: 4.0,
                                          thickness: 1.0,
                                          indent: 16.0,
                                          endIndent: 16.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            color: const Color(0x00000000),
                                            child: ExpandableNotifier(
                                              controller: _model
                                                  .deliveryMethodExpandableController,
                                              child: ExpandablePanel(
                                                header: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xwbwuxle' /* Delivery Method */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                collapsed: Container(),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '2wum6bq5' /* Standard Delivery  */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wt9qklyr' /* Arrives by Thursday, Nov 28 */,
                                                                ),
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
                                                            ].divide(const SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vylvinyu' /* 120 KD */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ]
                                                      .divide(
                                                          const SizedBox(height: 8.0))
                                                      .addToStart(const SizedBox(
                                                          height: 8.0)),
                                                ),
                                                theme: const ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
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
                                          height: 4.0,
                                          thickness: 1.0,
                                          indent: 16.0,
                                          endIndent: 16.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            color: const Color(0x00000000),
                                            child: ExpandableNotifier(
                                              controller: _model
                                                  .paymentMethodExpandableController,
                                              child: ExpandablePanel(
                                                header: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ujbyasgn' /* Payment Method */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'dcljyjxi' /* All transactions are secured a... */,
                                                      ),
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
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ]
                                                      .divide(
                                                          const SizedBox(height: 2.0))
                                                      .addToStart(
                                                          const SizedBox(height: 8.0))
                                                      .addToEnd(const SizedBox(
                                                          height: 8.0)),
                                                ),
                                                collapsed: Container(),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '6mk211e7' /* MyFatoorah */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ef891ajw' /*  Credit/Debit Card, Gpay, Appl... */,
                                                                      ),
                                                                      style:
                                                                          const TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'almarai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    FlutterFlowCheckboxGroup(
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ydfryfv3' /* Wallet Balance: 12 KD */,
                                                        )
                                                      ],
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.checkboxGroupValues2 =
                                                                  val),
                                                      controller: _model
                                                              .checkboxGroupValueController2 ??=
                                                          FormFieldController<
                                                              List<String>>(
                                                        [],
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      checkboxBorderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      unselectedTextStyle:
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
                                                      checkboxBorderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      initialized: _model
                                                              .checkboxGroupValues2 !=
                                                          null,
                                                    ),
                                                  ],
                                                ),
                                                theme: const ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Divider(
                                        height: 4.0,
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      if (((_model.shippingCharge > 0.0) &&
                                              (_model.couponInfo?.couponId ==
                                                      null ||
                                                  _model.couponInfo?.couponId ==
                                                      '')) &&
                                          responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 16.0),
                                          child: Stack(
                                            alignment:
                                                const AlignmentDirectional(1.0, 0.0),
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                child: TextFormField(
                                                  controller: _model
                                                      .couponTextController,
                                                  focusNode:
                                                      _model.couponFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'phdbwm7r' /* Discount code or Gift card */,
                                                    ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .border,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .border,
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
                                                            .primaryBackground,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  validator: _model
                                                      .couponTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.couponResult =
                                                          await queryCouponRecordOnce(
                                                        queryBuilder:
                                                            (couponRecord) =>
                                                                couponRecord
                                                                    .where(
                                                          'coupon_value',
                                                          isEqualTo: _model
                                                              .couponTextController
                                                              .text,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      _shouldSetState = true;
                                                      if ((_model.couponResult != null) ==
                                                          false) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Invalid coupon code',
                                                                  arText:
                                                                      'رمز قسيمة غير صالح',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (_model
                                                              .couponResult
                                                              ?.couponStatus !=
                                                          'active') {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Coupon is expired',
                                                                  arText:
                                                                      'انتهت صلاحية القسيمة',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (_model
                                                              .couponResult!
                                                              .couponStartDate! >
                                                          functions
                                                              .presentDateFromZerotime()) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Coupon is not yet active',
                                                                  arText:
                                                                      'القسيمة غير نشطة بعد',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (_model
                                                              .couponResult!
                                                              .couponEndDate! <
                                                          functions
                                                              .presentDateFromZerotime()) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Coupon is expired',
                                                                  arText:
                                                                      'انتهت صلاحية القسيمة',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (_model.couponResult!.couponUsedUserList.where((e) => e.userId == currentUserUid).toList().length >
                                                          0) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Coupon has been used already',
                                                                  arText:
                                                                      'لقد تم استخدام القسيمة بالفعل',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (_model.couponResult!.couponLimit <=
                                                          0) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Coupon limit has been reached',
                                                                  arText:
                                                                      'تم الوصول إلى حد القسيمة',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (_model.couponResult?.couponFor !=
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userRole,
                                                              '')) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Your are not eligiable to use this coupon ',
                                                                  arText:
                                                                      'أنت غير مؤهل لاستخدام هذه القسيمة',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (currentUserDocument
                                                              ?.userCart
                                                              .cartItems
                                                              .length !=
                                                          currentUserDocument?.userCart.cartItems
                                                              .where((e) => e.productType == 'product')
                                                              .toList()
                                                              .length) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getVariableText(
                                                                  enText:
                                                                      'Coupon is applicable on products only',
                                                                  arText:
                                                                      'القسيمة سارية على المنتجات فقط',
                                                                )),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                      enText:
                                                                          'Ok',
                                                                      arText:
                                                                          'نعم',
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .couponTextController
                                                              ?.clear();
                                                        });
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else if (_model.couponResult?.couponFor == 'Creator') {
                                                        if (_model.couponResult
                                                                ?.couponDiscountType ==
                                                            'Amount') {
                                                          _model
                                                              .discountedTotal = (functions.newCartTotal(currentUserDocument!
                                                                      .userCart
                                                                      .cartItems
                                                                      .map((e) => e
                                                                          .totalPrice)
                                                                      .toList()) +
                                                                  _model
                                                                      .shippingCharge) -
                                                              _model
                                                                  .couponResult!
                                                                  .couponMaximumDiscount;
                                                          _model
                                                              .updateCouponInfoStruct(
                                                            (e) => e
                                                              ..couponRef = _model
                                                                  .couponResult
                                                                  ?.reference
                                                              ..couponId = _model
                                                                  .couponResult
                                                                  ?.couponId
                                                              ..couponValue = _model
                                                                  .couponResult
                                                                  ?.couponValue
                                                              ..couponDiscountedPrice =
                                                                  _model
                                                                      .discountedTotal
                                                              ..couponDiscountType = _model
                                                                  .couponResult
                                                                  ?.couponDiscountType
                                                              ..couponPrice = _model
                                                                  .couponResult
                                                                  ?.couponPrice
                                                              ..couponMaximumDiscount = _model
                                                                  .couponResult
                                                                  ?.couponMaximumDiscount
                                                              ..updateCouponUserInfo(
                                                                (e) => e
                                                                  ..userEmail =
                                                                      currentUserEmail
                                                                  ..userName =
                                                                      currentUserDisplayName
                                                                  ..userPhone =
                                                                      currentPhoneNumber
                                                                  ..userId =
                                                                      currentUserUid
                                                                  ..userRole =
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.userRole,
                                                                          '')
                                                                  ..userImage =
                                                                      currentUserPhoto,
                                                              ),
                                                          );

                                                          await currentUserReference!
                                                              .update(
                                                                  createUsersRecordData(
                                                            userCart:
                                                                createUserCartStruct(
                                                              couponInfo:
                                                                  updateCouponCartInfoStruct(
                                                                _model
                                                                    .couponInfo,
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          ));
                                                        } else {
                                                          _model
                                                              .discountedTotal = (_model
                                                                      .couponResult!
                                                                      .couponPrice /
                                                                  100) *
                                                              (currentUserDocument!
                                                                      .userCart
                                                                      .subtotal +
                                                                  _model
                                                                      .shippingCharge);
                                                          _model
                                                              .discountedTotal = (functions.newCartTotal(currentUserDocument!
                                                                      .userCart
                                                                      .cartItems
                                                                      .map((e) => e
                                                                          .totalPrice)
                                                                      .toList()) +
                                                                  _model
                                                                      .shippingCharge) -
                                                              (_model
                                                                  .discountedTotal!);
                                                          _model
                                                              .updateCouponInfoStruct(
                                                            (e) => e
                                                              ..couponRef = _model
                                                                  .couponResult
                                                                  ?.reference
                                                              ..couponId = _model
                                                                  .couponResult
                                                                  ?.couponId
                                                              ..couponValue = _model
                                                                  .couponResult
                                                                  ?.couponValue
                                                              ..couponDiscountedPrice =
                                                                  _model
                                                                      .discountedTotal
                                                              ..couponDiscountType = _model
                                                                  .couponResult
                                                                  ?.couponDiscountType
                                                              ..couponPrice = _model
                                                                  .couponResult
                                                                  ?.couponPrice
                                                              ..couponMaximumDiscount = _model
                                                                  .couponResult
                                                                  ?.couponMaximumDiscount
                                                              ..updateCouponUserInfo(
                                                                (e) => e
                                                                  ..userEmail =
                                                                      currentUserEmail
                                                                  ..userName =
                                                                      currentUserDisplayName
                                                                  ..userPhone =
                                                                      currentPhoneNumber
                                                                  ..userId =
                                                                      currentUserUid
                                                                  ..userRole =
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.userRole,
                                                                          '')
                                                                  ..userImage =
                                                                      currentUserPhoto,
                                                              ),
                                                          );

                                                          await currentUserReference!
                                                              .update(
                                                                  createUsersRecordData(
                                                            userCart:
                                                                createUserCartStruct(
                                                              couponInfo:
                                                                  updateCouponCartInfoStruct(
                                                                _model
                                                                    .couponInfo,
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                          ));
                                                        }
                                                      } else {
                                                        if (_model.couponResult!
                                                                .couponMinimumOrderAmount <
                                                            currentUserDocument!
                                                                .userCart
                                                                .subtotal) {
                                                          if (_model
                                                                  .couponResult
                                                                  ?.couponDiscountType ==
                                                              'Amount') {
                                                            _model
                                                                .discountedTotal = functions.newCartTotal(currentUserDocument!
                                                                    .userCart
                                                                    .cartItems
                                                                    .map((e) => e
                                                                        .totalPrice)
                                                                    .toList()) -
                                                                _model
                                                                    .couponResult!
                                                                    .couponMaximumDiscount;
                                                            _model
                                                                .updateCouponInfoStruct(
                                                              (e) => e
                                                                ..couponRef = _model
                                                                    .couponResult
                                                                    ?.reference
                                                                ..couponId = _model
                                                                    .couponResult
                                                                    ?.couponId
                                                                ..couponValue = _model
                                                                    .couponResult
                                                                    ?.couponValue
                                                                ..couponDiscountedPrice =
                                                                    _model
                                                                        .discountedTotal
                                                                ..couponDiscountType = _model
                                                                    .couponResult
                                                                    ?.couponDiscountType
                                                                ..couponPrice = _model
                                                                    .couponResult
                                                                    ?.couponPrice
                                                                ..couponMaximumDiscount = _model
                                                                    .couponResult
                                                                    ?.couponMaximumDiscount
                                                                ..updateCouponUserInfo(
                                                                  (e) => e
                                                                    ..userEmail =
                                                                        currentUserEmail
                                                                    ..userName =
                                                                        currentUserDisplayName
                                                                    ..userPhone =
                                                                        currentPhoneNumber
                                                                    ..userId =
                                                                        currentUserUid
                                                                    ..userRole =
                                                                        valueOrDefault(
                                                                            currentUserDocument?.userRole,
                                                                            '')
                                                                    ..userImage =
                                                                        currentUserPhoto,
                                                                ),
                                                            );

                                                            await currentUserReference!
                                                                .update(
                                                                    createUsersRecordData(
                                                              userCart:
                                                                  createUserCartStruct(
                                                                couponInfo:
                                                                    updateCouponCartInfoStruct(
                                                                  _model
                                                                      .couponInfo,
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                          } else {
                                                            _model
                                                                .discountedTotal = (_model
                                                                        .couponResult!
                                                                        .couponPrice /
                                                                    100) *
                                                                currentUserDocument!
                                                                    .userCart
                                                                    .subtotal;
                                                            if (_model
                                                                    .discountedTotal! <
                                                                _model
                                                                    .couponResult!
                                                                    .couponMaximumDiscount) {
                                                              _model
                                                                  .discountedTotal = functions.newCartTotal(currentUserDocument!
                                                                      .userCart
                                                                      .cartItems
                                                                      .map((e) => e
                                                                          .totalPrice)
                                                                      .toList()) -
                                                                  (_model
                                                                      .discountedTotal!);
                                                              _model
                                                                  .updateCouponInfoStruct(
                                                                (e) => e
                                                                  ..couponRef = _model
                                                                      .couponResult
                                                                      ?.reference
                                                                  ..couponId = _model
                                                                      .couponResult
                                                                      ?.couponId
                                                                  ..couponValue = _model
                                                                      .couponResult
                                                                      ?.couponValue
                                                                  ..couponDiscountedPrice =
                                                                      _model
                                                                          .discountedTotal
                                                                  ..couponDiscountType = _model
                                                                      .couponResult
                                                                      ?.couponDiscountType
                                                                  ..couponPrice = _model
                                                                      .couponResult
                                                                      ?.couponPrice
                                                                  ..couponMaximumDiscount = _model
                                                                      .couponResult
                                                                      ?.couponMaximumDiscount
                                                                  ..updateCouponUserInfo(
                                                                    (e) => e
                                                                      ..userEmail =
                                                                          currentUserEmail
                                                                      ..userName =
                                                                          currentUserDisplayName
                                                                      ..userPhone =
                                                                          currentPhoneNumber
                                                                      ..userId =
                                                                          currentUserUid
                                                                      ..userRole =
                                                                          valueOrDefault(
                                                                              currentUserDocument?.userRole,
                                                                              '')
                                                                      ..userImage =
                                                                          currentUserPhoto,
                                                                  ),
                                                              );

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                userCart:
                                                                    createUserCartStruct(
                                                                  couponInfo:
                                                                      updateCouponCartInfoStruct(
                                                                    _model
                                                                        .couponInfo,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            } else {
                                                              _model
                                                                  .discountedTotal = functions.newCartTotal(currentUserDocument!
                                                                      .userCart
                                                                      .cartItems
                                                                      .map((e) => e
                                                                          .totalPrice)
                                                                      .toList()) -
                                                                  _model
                                                                      .couponResult!
                                                                      .couponMaximumDiscount;
                                                              _model
                                                                  .updateCouponInfoStruct(
                                                                (e) => e
                                                                  ..couponRef = _model
                                                                      .couponResult
                                                                      ?.reference
                                                                  ..couponId = _model
                                                                      .couponResult
                                                                      ?.couponId
                                                                  ..couponValue = _model
                                                                      .couponResult
                                                                      ?.couponValue
                                                                  ..couponDiscountedPrice =
                                                                      _model
                                                                          .discountedTotal
                                                                  ..couponDiscountType = _model
                                                                      .couponResult
                                                                      ?.couponDiscountType
                                                                  ..couponPrice = _model
                                                                      .couponResult
                                                                      ?.couponPrice
                                                                  ..couponMaximumDiscount = _model
                                                                      .couponResult
                                                                      ?.couponMaximumDiscount
                                                                  ..updateCouponUserInfo(
                                                                    (e) => e
                                                                      ..userEmail =
                                                                          currentUserEmail
                                                                      ..userName =
                                                                          currentUserDisplayName
                                                                      ..userPhone =
                                                                          currentPhoneNumber
                                                                      ..userId =
                                                                          currentUserUid
                                                                      ..userRole =
                                                                          valueOrDefault(
                                                                              currentUserDocument?.userRole,
                                                                              '')
                                                                      ..userImage =
                                                                          currentUserPhoto,
                                                                  ),
                                                              );

                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                userCart:
                                                                    createUserCartStruct(
                                                                  couponInfo:
                                                                      updateCouponCartInfoStruct(
                                                                    _model
                                                                        .couponInfo,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                            }
                                                          }
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      '${FFLocalizations.of(context).getVariableText(
                                                                    enText:
                                                                        'Total amount should be greater than ',
                                                                    arText:
                                                                        'يجب أن يكون المبلغ الإجمالي أكبر من',
                                                                  )}${_model.couponResult?.couponMinimumOrderAmount.toString()}${FFLocalizations.of(context).getVariableText(
                                                                    enText:
                                                                        'KD',
                                                                    arText:
                                                                        'KD',
                                                                  )}'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                        enText:
                                                                            'Ok',
                                                                        arText:
                                                                            'نعم',
                                                                      )),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          safeSetState(() {
                                                            _model
                                                                .couponTextController
                                                                ?.clear();
                                                          });
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'i19n5w9w' /* Apply */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: 30.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'almarai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 8.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Stack(
                                        children: [
                                          if ((_model.shippingCharge > 0.0) &&
                                              (currentUserDocument?.userCart
                                                      .couponInfo.couponRef ==
                                                  null))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        const Color(0x7B000000),
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.6,
                                                              child:
                                                                  ApplyCouponWidget(
                                                                shippingCharges:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  _model
                                                                      .shippingCharge,
                                                                  0.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 6.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          const Color(0x25A2609C),
                                                      icon: const Icon(
                                                        FFIcons.kcoupon,
                                                        color:
                                                            Color(0xFFA2609C),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'zpnhfiwv' /* Apply Coupon */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                          if (currentUserDocument?.userCart
                                                  .couponInfo.couponRef !=
                                              null)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 6.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        const Color(0x25A2609C),
                                                    icon: const Icon(
                                                      FFIcons.kcoupon,
                                                      color: Color(0xFFA2609C),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'kggm1pnd' /* Congrats, You saved  */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Aileron',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: (double.parse((currentUserDocument!.userCart.subtotal -
                                                                            currentUserDocument!
                                                                                .userCart.couponInfo.couponDiscountedPrice)
                                                                        .toStringAsFixed(
                                                                            2)))
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'fcioe5wd' /*  KD! */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'i0x8ncax' /* Coupon :  */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Aileron',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: currentUserDocument!
                                                                    .userCart
                                                                    .couponInfo
                                                                    .couponValue,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'oxhcy8u9' /*  applied */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'almarai',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Aileron',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
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
                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        userCart:
                                                            createUserCartStruct(
                                                          couponInfo:
                                                              createCouponCartInfoStruct(
                                                                  delete: true),
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.close_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Divider(
                                          height: 24.0,
                                          thickness: 1.0,
                                          indent: 16.0,
                                          endIndent: 16.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      if ((_model.couponInfo?.couponId !=
                                                  null &&
                                              _model.couponInfo?.couponId !=
                                                  '') &&
                                          responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (_model.couponInfo?.couponId !=
                                                      null &&
                                                  _model.couponInfo?.couponId !=
                                                      '')
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${FFLocalizations.of(context).getVariableText(
                                                        enText:
                                                            'Congrats, You have saved ',
                                                        arText:
                                                            'مبروك لقد قمت بالحفظ',
                                                      )}${(double.parse((currentUserDocument!.userCart.subtotal - _model.couponInfo!.couponDiscountedPrice).toStringAsFixed(2))).toString()}${FFLocalizations.of(context).getVariableText(
                                                        enText: 'KD,',
                                                        arText: 'KD,',
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                '${FFLocalizations.of(context).getVariableText(
                                                              enText: 'Coupon ',
                                                              arText: 'قسيمة',
                                                            )}${_model.couponInfo?.couponValue}${FFLocalizations.of(context).getVariableText(
                                                              enText:
                                                                  ' applied',
                                                              arText: 'مُطبَّق',
                                                            )}',
                                                            style: const TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'almarai',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 4.0)),
                                                ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.updateCouponInfoStruct(
                                                    (e) => e..couponId = null,
                                                  );
                                                  safeSetState(() {});
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1avj7z6h' /* Remove */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        letterSpacing: 0.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Divider(
                          height: 4.0,
                          thickness: 1.0,
                          indent: 16.0,
                          endIndent: 16.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'e4u1z2bx' /* Subtotal */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      '${functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()).toString()}${FFLocalizations.of(context).getVariableText(
                                        enText: 'KD',
                                        arText: 'KD',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '4t0pvodj' /* Shipping */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '${valueOrDefault<String>(
                                      _model.shippingCharge.toString(),
                                      '0',
                                    )}${FFLocalizations.of(context).getVariableText(
                                      enText: ' KD',
                                      arText: ' KD',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'almarai',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ),
                            if (currentUserDocument
                                    ?.userCart.couponInfo.couponRef !=
                                null)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 12.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${FFLocalizations.of(context).getVariableText(
                                          enText: 'Coupon :',
                                          arText: 'القسيمة :',
                                        )}${currentUserDocument?.userCart.couponInfo.couponValue}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Stack(
                                        children: [
                                          if (currentUserDocument?.userCart
                                                  .couponInfo.couponFor !=
                                              'Creator')
                                            Text(
                                              '${FFLocalizations.of(context).getVariableText(
                                                enText: '-',
                                                arText: '-',
                                              )}${(double.parse((functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) - currentUserDocument!.userCart.couponInfo.couponDiscountedPrice).toStringAsFixed(2))).toString()}${FFLocalizations.of(context).getVariableText(
                                                enText: 'KD',
                                                arText: 'KD',
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          if (_model.couponResult?.couponFor ==
                                              'Creator')
                                            Text(
                                              '${FFLocalizations.of(context).getVariableText(
                                                enText: '-',
                                                arText: '-',
                                              )}${(double.parse(((functions.newCartTotal(currentUserDocument!.userCart.cartItems.map((e) => e.totalPrice).toList()) + _model.shippingCharge) - _model.couponInfo!.couponDiscountedPrice).toStringAsFixed(2))).toString()}${FFLocalizations.of(context).getVariableText(
                                                enText: 'KD',
                                                arText: 'KD',
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                        ],
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            Divider(
                              height: 4.0,
                              thickness: 1.0,
                              indent: 16.0,
                              endIndent: 16.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'aj52gbwl' /* Total */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'almarai',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        '${() {
                                          if ((currentUserDocument
                                                          ?.userCart
                                                          .couponInfo
                                                          .couponId !=
                                                      null &&
                                                  currentUserDocument
                                                          ?.userCart
                                                          .couponInfo
                                                          .couponId !=
                                                      '') &&
                                              (currentUserDocument
                                                      ?.userCart
                                                      .couponInfo
                                                      .couponDiscountedPrice ==
                                                  0.0)) {
                                            return currentUserDocument
                                                ?.userCart
                                                .couponInfo
                                                .couponDiscountedPrice
                                                .toString();
                                          } else if (currentUserDocument
                                                      ?.userCart
                                                      .couponInfo
                                                      .couponId !=
                                                  null &&
                                              currentUserDocument?.userCart
                                                      .couponInfo.couponId !=
                                                  '') {
                                            return (currentUserDocument!
                                                        .userCart
                                                        .couponInfo
                                                        .couponDiscountedPrice +
                                                    _model.shippingCharge)
                                                .toString();
                                          } else {
                                            return (functions.newCartTotal(
                                                        currentUserDocument!
                                                            .userCart.cartItems
                                                            .map((e) =>
                                                                e.totalPrice)
                                                            .toList()) +
                                                    _model.shippingCharge)
                                                .toString();
                                          }
                                        }()}${FFLocalizations.of(context).getVariableText(
                                          enText: 'KD',
                                          arText: 'KD',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
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
                          ].divide(const SizedBox(height: 4.0)),
                        ),
                        Builder(
                          builder: (context) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (currentUserDocument!.userCart.cartItems
                                        .where(
                                            (e) => e.productType == 'product')
                                        .toList()
                                        .length >
                                    0) {
                                  if ((currentUserDocument?.userShippingaddress
                                                  .toList() ??
                                              [])
                                          .where((e) => e.isDefault == true)
                                          .toList()
                                          .length >
                                      0) {
                                    _model.iconStatus = 'hide';
                                    safeSetState(() {});
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'Please select shipping address.',
                                            arText: 'الرجاء تحديد عنوان الشحن.',
                                          ),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 1500),
                                      ),
                                    );
                                    return;
                                  }
                                }
                                if ((_model.couponInfo?.couponId != null &&
                                        _model.couponInfo?.couponId != '') &&
                                    (_model.couponInfo?.couponDiscountedPrice ==
                                        0.0)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        FFLocalizations.of(context)
                                            .getVariableText(
                                          enText: 'Order Processing..',
                                          arText: 'معالجة الطلب..',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 1500),
                                    ),
                                  );

                                  context.goNamed(
                                    FreePaymentWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

                                  return;
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      FFLocalizations.of(context)
                                          .getVariableText(
                                        enText: 'Payment Processing..',
                                        arText: 'معالجة الدفع..',
                                      ),
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 1500),
                                  ),
                                );
                                if (_model.payClickStatus == 'clickable') {
                                  _model.payClickStatus = 'hide';
                                  _model.orderInfo = null;
                                  _model.orderCount = currentUserDocument
                                      ?.userCart.cartItems.length;
                                  while (_model.orderCount! > 0) {
                                    if ((currentUserDocument
                                                ?.userCart.cartItems
                                                .elementAtOrNull(
                                                    (_model.orderCount!) - 1))
                                            ?.productType ==
                                        'membership') {
                                      _model.membershipPlanResult =
                                          await queryUserMembershipPlansRecordOnce(
                                        queryBuilder:
                                            (userMembershipPlansRecord) =>
                                                userMembershipPlansRecord.where(
                                          'membership_plan_id',
                                          isEqualTo: (currentUserDocument
                                                  ?.userCart.cartItems
                                                  .elementAtOrNull(
                                                      (_model.orderCount!) - 1))
                                              ?.cartItemId,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;
                                      _model.orderInfo =
                                          '${_model.orderInfo}${_model.orderInfo != '' ? ', ' : ' '}${_model.membershipPlanResult?.planInfo.name} (${_model.membershipPlanResult?.duration}) : ${_model.membershipPlanResult?.price.toString()} KWD';
                                    } else {
                                      if ((currentUserDocument
                                                  ?.userCart.cartItems
                                                  .elementAtOrNull(
                                                      (_model.orderCount!) - 1))
                                              ?.productType ==
                                          'product') {
                                        _model.productResult =
                                            await queryProductsRecordOnce(
                                          queryBuilder: (productsRecord) =>
                                              productsRecord.where(
                                            'product_id',
                                            isEqualTo: (currentUserDocument
                                                    ?.userCart.cartItems
                                                    .elementAtOrNull(
                                                        (_model.orderCount!) -
                                                            1))
                                                ?.cartItemId
                                                .toString(),
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        _model.orderInfo =
                                            '${_model.orderInfo}${_model.orderInfo != '' ? ', ' : ' '}${_model.productResult?.productInfo.name} (${_model.productResult?.productId}) : ${_model.productResult?.product.productPrice.toString()} KWD ${_model.productResult?.productAuthorizer.productDesignerId}';
                                      }
                                    }

                                    _model.orderCount =
                                        (_model.orderCount!) - 1;
                                  }
                                  _model.forPaymentResult1 =
                                      await querySettingsRecordOnce(
                                    queryBuilder: (settingsRecord) =>
                                        settingsRecord.where(
                                      'type',
                                      isEqualTo: 'Company',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  if (_model.forPaymentResult1!
                                          .settingsPaymentInfo
                                          .where(
                                              (e) => e.isPrimaryStatus == true)
                                          .toList()
                                          .length >
                                      0) {
                                    _model.idMapResultOrder1 =
                                        await queryIdMapRecordOnce(
                                      queryBuilder: (idMapRecord) =>
                                          idMapRecord.where(
                                        'type',
                                        isEqualTo: 'Main',
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    _shouldSetState = true;
                                    if (_model.forPaymentResult1
                                            ?.settingsPaymentInfo
                                            .where((e) =>
                                                e.isPrimaryStatus == true)
                                            .toList()
                                            .firstOrNull
                                            ?.paymentName ==
                                        'upayment') {
                                      _model.paymentUpaymentResult1 =
                                          await UpaymentGroup.chargeCall.call(
                                        url: _model.forPaymentResult1
                                                    ?.settingsPaymentInfo
                                                    .where((e) =>
                                                        e.isPrimaryStatus ==
                                                        true)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.isProductionStatus ==
                                                true
                                            ? 'uapi'
                                            : 'sandboxapi',
                                        orderId:
                                            'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}',
                                        programPrice: (currentUserDocument
                                                            ?.userCart
                                                            .couponInfo
                                                            .couponId !=
                                                        null &&
                                                    currentUserDocument
                                                            ?.userCart
                                                            .couponInfo
                                                            .couponId !=
                                                        ''
                                                ? (currentUserDocument!
                                                        .userCart
                                                        .couponInfo
                                                        .couponDiscountedPrice +
                                                    _model.shippingCharge)
                                                : (functions.newCartTotal(
                                                        currentUserDocument!
                                                            .userCart.cartItems
                                                            .map((e) =>
                                                                e.totalPrice)
                                                            .toList()) +
                                                    _model.shippingCharge))
                                            .toString(),
                                        programTitle: _model.orderInfo,
                                        customerId: currentUserUid,
                                        customerName: currentUserDisplayName,
                                        customerEmail: currentUserEmail,
                                        customerPhone: currentPhoneNumber,
                                        programRef:
                                            'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}',
                                        returnURL:
                                            'https://azyaa.flutterflow.app/azyaa-verify?orderid=${'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}'}',
                                        cancelURL:
                                            'https://azyaa.flutterflow.app/azyaa-verify?orderid=${'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}'}',
                                        notificationURL:
                                            'https://hook.us1.make.com/p7og7qm3g9v7amn2rdx6odh24brwvypj?project=azyaa&&paymenttype=upayment',
                                        aPIkey: _model.forPaymentResult1
                                                    ?.settingsPaymentInfo
                                                    .where((e) =>
                                                        e.isPrimaryStatus ==
                                                        true)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.isProductionStatus ==
                                                true
                                            ? _model.forPaymentResult1
                                                ?.settingsPaymentInfo
                                                .where((e) =>
                                                    e.isPrimaryStatus == true)
                                                .toList()
                                                .firstOrNull
                                                ?.productionSecretKey
                                            : _model.forPaymentResult1
                                                ?.settingsPaymentInfo
                                                .where((e) =>
                                                    e.isPrimaryStatus == true)
                                                .toList()
                                                .firstOrNull
                                                ?.testSecretKey,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.paymentUpaymentResult1
                                              ?.succeeded ??
                                          true)) {
                                        FFAppState().updatePaymentFlowStruct(
                                          (e) => e
                                            ..paymentProcessesStatus =
                                                'initialize'
                                            ..paymentId =
                                                'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}'
                                            ..orderId =
                                                'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}'
                                            ..mainPaymentUrl = UpaymentGroup
                                                .chargeCall
                                                .chargeLink(
                                              (_model.paymentUpaymentResult1
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                            ..paymentUrl = UpaymentGroup
                                                .chargeCall
                                                .chargeLink(
                                              (_model.paymentUpaymentResult1
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                            ..secretKey = _model
                                                        .forPaymentResult1
                                                        ?.settingsPaymentInfo
                                                        .where((e) =>
                                                            e.isPrimaryStatus ==
                                                            true)
                                                        .toList()
                                                        .firstOrNull
                                                        ?.isProductionStatus ==
                                                    true
                                                ? _model.forPaymentResult1
                                                    ?.settingsPaymentInfo
                                                    .where((e) =>
                                                        e.isPrimaryStatus ==
                                                        true)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.productionSecretKey
                                                : _model.forPaymentResult1
                                                    ?.settingsPaymentInfo
                                                    .where((e) =>
                                                        e.isPrimaryStatus ==
                                                        true)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.testSecretKey
                                            ..paymentCart = _model
                                                .orderUpaymentNew?.orderItems
                                            ..paymentCartBackup = _model
                                                .orderUpaymentNew?.orderItems
                                            ..paymentCartCount = _model
                                                .orderUpaymentNew
                                                ?.orderItems
                                                .cartItems
                                                .length
                                            ..paymentType = 'upayment'
                                            ..paymentBaseUrl = _model
                                                        .forPaymentResult1
                                                        ?.settingsPaymentInfo
                                                        .where((e) =>
                                                            e.isPrimaryStatus ==
                                                            true)
                                                        .toList()
                                                        .firstOrNull
                                                        ?.isProductionStatus ==
                                                    true
                                                ? 'uapi'
                                                : 'sandboxapi'
                                            ..presentUserRef =
                                                currentUserReference,
                                        );

                                        var ordersRecordReference1 =
                                            OrdersRecord.collection.doc();
                                        await ordersRecordReference1
                                            .set(createOrdersRecordData(
                                          orderStatus: 'Initialization',
                                          createdAt: getCurrentTimestamp,
                                          orderId:
                                              'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}',
                                          customerRef: currentUserReference,
                                          totalPrice: currentUserDocument
                                                          ?.userCart
                                                          .couponInfo
                                                          .couponId !=
                                                      null &&
                                                  currentUserDocument
                                                          ?.userCart
                                                          .couponInfo
                                                          .couponId !=
                                                      ''
                                              ? (currentUserDocument!
                                                      .userCart
                                                      .couponInfo
                                                      .couponDiscountedPrice +
                                                  _model.shippingCharge)
                                              : (functions.newCartTotal(
                                                      currentUserDocument!
                                                          .userCart.cartItems
                                                          .map((e) =>
                                                              e.totalPrice)
                                                          .toList()) +
                                                  _model.shippingCharge),
                                          orderItems: updateUserCartStruct(
                                            currentUserDocument?.userCart,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          customerId: currentUserUid,
                                          shippingPrice: _model.shippingCharge,
                                        ));
                                        _model.orderUpaymentNew =
                                            OrdersRecord.getDocumentFromData(
                                                createOrdersRecordData(
                                                  orderStatus: 'Initialization',
                                                  createdAt:
                                                      getCurrentTimestamp,
                                                  orderId:
                                                      'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}',
                                                  customerRef:
                                                      currentUserReference,
                                                  totalPrice: currentUserDocument
                                                                  ?.userCart
                                                                  .couponInfo
                                                                  .couponId !=
                                                              null &&
                                                          currentUserDocument
                                                                  ?.userCart
                                                                  .couponInfo
                                                                  .couponId !=
                                                              ''
                                                      ? (currentUserDocument!
                                                              .userCart
                                                              .couponInfo
                                                              .couponDiscountedPrice +
                                                          _model.shippingCharge)
                                                      : (functions.newCartTotal(
                                                              currentUserDocument!
                                                                  .userCart
                                                                  .cartItems
                                                                  .map((e) => e
                                                                      .totalPrice)
                                                                  .toList()) +
                                                          _model.shippingCharge),
                                                  orderItems:
                                                      updateUserCartStruct(
                                                    currentUserDocument
                                                        ?.userCart,
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  customerId: currentUserUid,
                                                  shippingPrice:
                                                      _model.shippingCharge,
                                                ),
                                                ordersRecordReference1);
                                        _shouldSetState = true;
                                        if (currentUserDocument!
                                                .userCart.cartItems
                                                .where((e) =>
                                                    e.productType == 'product')
                                                .toList()
                                                .length >
                                            0) {
                                          await _model
                                              .orderUpaymentNew!.reference
                                              .update(createOrdersRecordData(
                                            shippingAddress:
                                                updateUserShippingaddressInfoStruct(
                                              (currentUserDocument
                                                          ?.userShippingaddress
                                                          .toList() ??
                                                      [])
                                                  .where((e) =>
                                                      e.isDefault == true)
                                                  .toList()
                                                  .firstOrNull
                                                  ?.shippingAddressInfo,
                                              clearUnsetFields: false,
                                            ),
                                            shippingInfo:
                                                updateUserShippingaddressStruct(
                                              (currentUserDocument
                                                          ?.userShippingaddress
                                                          .toList() ??
                                                      [])
                                                  .where((e) =>
                                                      e.isDefault == true)
                                                  .toList()
                                                  .firstOrNull,
                                              clearUnsetFields: false,
                                            ),
                                          ));
                                        }

                                        await _model
                                            .idMapResultOrder1!.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'order_id':
                                                  FieldValue.increment(1),
                                            },
                                          ),
                                        });
                                        unawaited(
                                          () async {
                                            Navigator.pop(context);
                                          }(),
                                        );

                                        context.goNamed(
                                          PaymentWidget.routeName,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              FFLocalizations.of(context)
                                                  .getVariableText(
                                                enText:
                                                    'Upayment server is busy. Please try again.',
                                                arText:
                                                    'خادم Upayment مشغول. يُرجى المحاولة مرة أخرى.',
                                              ),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                          ),
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      if (_model.forPaymentResult1
                                              ?.settingsPaymentInfo
                                              .where((e) =>
                                                  e.isPrimaryStatus == true)
                                              .toList()
                                              .firstOrNull
                                              ?.paymentName ==
                                          'tap') {
                                        _model.tapPaymentResult1 =
                                            await TapGroup.chargeAPICall.call(
                                          amount: currentUserDocument
                                                          ?.userCart
                                                          .couponInfo
                                                          .couponId !=
                                                      null &&
                                                  currentUserDocument
                                                          ?.userCart
                                                          .couponInfo
                                                          .couponId !=
                                                      ''
                                              ? (currentUserDocument!
                                                      .userCart
                                                      .couponInfo
                                                      .couponDiscountedPrice +
                                                  _model.shippingCharge)
                                              : (functions.newCartTotal(
                                                      currentUserDocument!
                                                          .userCart.cartItems
                                                          .map((e) =>
                                                              e.totalPrice)
                                                          .toList()) +
                                                  _model.shippingCharge),
                                          productList: _model.orderInfo,
                                          clientname: currentUserDisplayName,
                                          orderID:
                                              'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}',
                                          clientemail: currentUserEmail,
                                          clientphone: currentPhoneNumber,
                                          merchantid: _model.forPaymentResult1
                                              ?.settingsPaymentInfo
                                              .where((e) =>
                                                  e.isPrimaryStatus == true)
                                              .toList()
                                              .firstOrNull
                                              ?.merchentId,
                                          postURL:
                                              'https://hook.us1.make.com/p7og7qm3g9v7amn2rdx6odh24brwvypj?project=azyaa&&paymenttype=tap',
                                          redirectURL:
                                              'https://azyaa.flutterflow.app/azyaa-verify?orderid=${'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}'}',
                                          url: isWeb
                                              ? 'https://proxy.vizsoft.in/https://api.tap.company/'
                                              : 'https://api.tap.company/',
                                          secreatKey: _model.forPaymentResult1
                                                      ?.settingsPaymentInfo
                                                      .where((e) =>
                                                          e.isPrimaryStatus ==
                                                          true)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.isProductionStatus ==
                                                  true
                                              ? _model.forPaymentResult1
                                                  ?.settingsPaymentInfo
                                                  .where((e) =>
                                                      e.isPrimaryStatus == true)
                                                  .toList()
                                                  .firstOrNull
                                                  ?.productionSecretKey
                                              : _model.forPaymentResult1
                                                  ?.settingsPaymentInfo
                                                  .where((e) =>
                                                      e.isPrimaryStatus == true)
                                                  .toList()
                                                  .firstOrNull
                                                  ?.testSecretKey,
                                        );

                                        _shouldSetState = true;
                                        if ((_model
                                                .tapPaymentResult1?.succeeded ??
                                            true)) {
                                          FFAppState().updatePaymentFlowStruct(
                                            (e) => e
                                              ..paymentProcessesStatus =
                                                  'initialize'
                                              ..paymentId = TapGroup
                                                  .chargeAPICall
                                                  .chargeId(
                                                (_model.tapPaymentResult1
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ..orderId =
                                                  'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}'
                                              ..mainPaymentUrl = TapGroup
                                                  .chargeAPICall
                                                  .chargeUrl(
                                                (_model.tapPaymentResult1
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ..paymentUrl = TapGroup
                                                  .chargeAPICall
                                                  .chargeUrl(
                                                (_model.tapPaymentResult1
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ..secretKey = _model
                                                          .forPaymentResult1
                                                          ?.settingsPaymentInfo
                                                          .where((e) =>
                                                              e.isPrimaryStatus ==
                                                              true)
                                                          .toList()
                                                          .firstOrNull
                                                          ?.isProductionStatus ==
                                                      true
                                                  ? _model.forPaymentResult1
                                                      ?.settingsPaymentInfo
                                                      .where((e) =>
                                                          e.isPrimaryStatus ==
                                                          true)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.productionSecretKey
                                                  : _model.forPaymentResult1
                                                      ?.settingsPaymentInfo
                                                      .where((e) =>
                                                          e.isPrimaryStatus ==
                                                          true)
                                                      .toList()
                                                      .firstOrNull
                                                      ?.testSecretKey
                                              ..paymentCart = _model
                                                  .orderTappaymentNew
                                                  ?.orderItems
                                              ..paymentCartBackup = _model
                                                  .orderTappaymentNew
                                                  ?.orderItems
                                              ..paymentCartCount = _model
                                                  .orderTappaymentNew
                                                  ?.orderItems
                                                  .cartItems
                                                  .length
                                              ..paymentType = 'tap'
                                              ..presentUserRef =
                                                  currentUserReference,
                                          );

                                          var ordersRecordReference2 =
                                              OrdersRecord.collection.doc();
                                          await ordersRecordReference2
                                              .set(createOrdersRecordData(
                                            orderStatus: 'Initialization',
                                            createdAt: getCurrentTimestamp,
                                            orderId:
                                                'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}',
                                            customerRef: currentUserReference,
                                            totalPrice: currentUserDocument
                                                            ?.userCart
                                                            .couponInfo
                                                            .couponId !=
                                                        null &&
                                                    currentUserDocument
                                                            ?.userCart
                                                            .couponInfo
                                                            .couponId !=
                                                        ''
                                                ? (currentUserDocument!
                                                        .userCart
                                                        .couponInfo
                                                        .couponDiscountedPrice +
                                                    _model.shippingCharge)
                                                : (functions.newCartTotal(
                                                        currentUserDocument!
                                                            .userCart.cartItems
                                                            .map((e) =>
                                                                e.totalPrice)
                                                            .toList()) +
                                                    _model.shippingCharge),
                                            orderItems: updateUserCartStruct(
                                              currentUserDocument?.userCart,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            customerId: currentUserUid,
                                            shippingPrice:
                                                _model.shippingCharge,
                                          ));
                                          _model.orderTappaymentNew =
                                              OrdersRecord.getDocumentFromData(
                                                  createOrdersRecordData(
                                                    orderStatus:
                                                        'Initialization',
                                                    createdAt:
                                                        getCurrentTimestamp,
                                                    orderId:
                                                        'ORDAZYA${_model.idMapResultOrder1?.orderId.toString()}',
                                                    customerRef:
                                                        currentUserReference,
                                                    totalPrice: currentUserDocument
                                                                    ?.userCart
                                                                    .couponInfo
                                                                    .couponId !=
                                                                null &&
                                                            currentUserDocument
                                                                    ?.userCart
                                                                    .couponInfo
                                                                    .couponId !=
                                                                ''
                                                        ? (currentUserDocument!
                                                                .userCart
                                                                .couponInfo
                                                                .couponDiscountedPrice +
                                                            _model
                                                                .shippingCharge)
                                                        : (functions.newCartTotal(
                                                                currentUserDocument!
                                                                    .userCart
                                                                    .cartItems
                                                                    .map((e) =>
                                                                        e.totalPrice)
                                                                    .toList()) +
                                                            _model.shippingCharge),
                                                    orderItems:
                                                        updateUserCartStruct(
                                                      currentUserDocument
                                                          ?.userCart,
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    customerId: currentUserUid,
                                                    shippingPrice:
                                                        _model.shippingCharge,
                                                  ),
                                                  ordersRecordReference2);
                                          _shouldSetState = true;
                                          if (currentUserDocument!
                                                  .userCart.cartItems
                                                  .where((e) =>
                                                      e.productType ==
                                                      'product')
                                                  .toList()
                                                  .length >
                                              0) {
                                            await _model
                                                .orderTappaymentNew!.reference
                                                .update(createOrdersRecordData(
                                              shippingAddress:
                                                  updateUserShippingaddressInfoStruct(
                                                (currentUserDocument
                                                            ?.userShippingaddress
                                                            .toList() ??
                                                        [])
                                                    .where((e) =>
                                                        e.isDefault == true)
                                                    .toList()
                                                    .firstOrNull
                                                    ?.shippingAddressInfo,
                                                clearUnsetFields: false,
                                              ),
                                              shippingInfo:
                                                  updateUserShippingaddressStruct(
                                                (currentUserDocument
                                                            ?.userShippingaddress
                                                            .toList() ??
                                                        [])
                                                    .where((e) =>
                                                        e.isDefault == true)
                                                    .toList()
                                                    .firstOrNull,
                                                clearUnsetFields: false,
                                              ),
                                            ));
                                          }

                                          await _model
                                              .idMapResultOrder1!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'order_id':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });

                                          context.goNamed(
                                            PaymentWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                FFLocalizations.of(context)
                                                    .getVariableText(
                                                  enText:
                                                      'TAP payment server is busy. Please try again.',
                                                  arText:
                                                      'خادم دفع TAP مشغول. يُرجى المحاولة مرة أخرى.',
                                                ),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child:
                                                      CheckoutPaymentMethodWidget(
                                                    id: _model
                                                        .idMapResultOrder1!,
                                                    setting: _model
                                                        .forPaymentResult1!,
                                                    orderInfo:
                                                        valueOrDefault<String>(
                                                      _model.orderInfo,
                                                      'null',
                                                    ),
                                                    shippingCharge:
                                                        _model.shippingCharge,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText:
                                                'There are no payment methods detected.',
                                            arText: 'لم يتم اكتشاف أي طرق دفع.',
                                          ),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                      ),
                                    );
                                    return;
                                  }
                                } else {
                                  return;
                                }

                              },
                              text: FFLocalizations.of(context).getText(
                                'vfygyvwx' /* Proceed to Pay */,
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
                        ),
                      ]
                          .divide(const SizedBox(height: 12.0))
                          .addToEnd(const SizedBox(height: 52.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
