import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'membership_plan_model.dart';
export 'membership_plan_model.dart';

class MembershipPlanWidget extends StatefulWidget {
  const MembershipPlanWidget({super.key});

  static String routeName = 'Membership-Plan';
  static String routePath = '/azyaa-membership-plan';

  @override
  State<MembershipPlanWidget> createState() => _MembershipPlanWidgetState();
}

class _MembershipPlanWidgetState extends State<MembershipPlanWidget> {
  late MembershipPlanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MembershipPlanModel());

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
        title: 'Membership-Plan',
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
                          'm67q4z56' /* VIP Membership */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: true,
                        wishlistIconStatus: true,
                        navigationFrom: 'membership',
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 8.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '1gn3p6t6' /* Become a  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '01rjnix1' /* VIP Member Today! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        fontSize: 18.0,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 8.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '153sdazi' /* Unlock */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'aps1nvzw' /* Exclusive Perks: */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        fontSize: 16.0,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 16.0),
                          child: Wrap(
                            spacing: 16.0,
                            runSpacing: 16.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kmembership,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'j7zjseni' /* Exclusive Fashion Access */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'nyn3zgyv' /* Shop from collections crafted ... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/images/machine.png',
                                    width: 23.0,
                                    height: 23.0,
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(0.0, 0.0),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'atf3af1r' /* Personalized Custom Designs */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            't3mac5kb' /* Let us create bespoke outfits ... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
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
                                      Icons.ten_k_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kclock,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8cde9pcq' /* Early Access to Collections */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '5r71dlru' /* Get first access to new trends... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/images/percentage.png',
                                    width: 23.0,
                                    height: 23.0,
                                    fit: BoxFit.contain,
                                    alignment: const Alignment(0.0, 0.0),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8syrf7vm' /* Exclusive Discounts */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'ji529a4w' /* Enjoy special member-only disc... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
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
                                      Icons.ten_k_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/images/Group_2085662541.png',
                                    width: 23.0,
                                    height: 23.0,
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(0.0, 0.0),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'gyen4k25' /* VIP Support */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'z275i1bp' /* Enjoy priority customer servic... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
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
                                      FFIcons.kdesigner1,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                ].divide(const SizedBox(width: 8.0)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'hd2xaop0' /* Choose  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'h94gm0q8' /* Your Plan */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        fontSize: 18.0,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 8.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 280.0,
                            decoration: const BoxDecoration(),
                            child:
                                StreamBuilder<List<UserMembershipPlansRecord>>(
                              stream: queryUserMembershipPlansRecord(
                                queryBuilder: (userMembershipPlansRecord) =>
                                    userMembershipPlansRecord
                                        .where(
                                          'status',
                                          isEqualTo: 'active',
                                        )
                                        .orderBy('created_at',
                                            descending: true),
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserMembershipPlansRecord>
                                    listPlanUserMembershipPlansRecordList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    16.0,
                                    0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      listPlanUserMembershipPlansRecordList
                                          .length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: 16.0),
                                  itemBuilder: (context, listPlanIndex) {
                                    final listPlanUserMembershipPlansRecord =
                                        listPlanUserMembershipPlansRecordList[
                                            listPlanIndex];
                                    return AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var _shouldSetState = false;
                                          if (loggedIn != true) {
                                            context.goNamed(
                                              LoginWidget.routeName,
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

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          FFAppState().updateUserDataFlowStruct(
                                            (e) => e
                                              ..userCartCount =
                                                  currentUserDocument
                                                      ?.userCart.cartItems
                                                      .where((e) =>
                                                          e.productType ==
                                                          'membership')
                                                      .toList()
                                                      .length,
                                          );
                                          if (FFAppState()
                                                  .UserDataFlow
                                                  .userCartCount ==
                                              0) {
                                            _model.idMapResult =
                                                await queryIdMapRecordOnce(
                                              queryBuilder: (idMapRecord) =>
                                                  idMapRecord.where(
                                                'type',
                                                isEqualTo: 'Main',
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;

                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              userCart: createUserCartStruct(
                                                cartId:
                                                    _model.idMapResult?.cartId,
                                                createdAt: getCurrentTimestamp,
                                                updatedAt: getCurrentTimestamp,
                                                subtotal:
                                                    functions.newCartTotal(
                                                        currentUserDocument!
                                                            .userCart.cartItems
                                                            .map((e) =>
                                                                e.totalPrice)
                                                            .toList()),
                                                total: functions.newCartTotal(
                                                    currentUserDocument!
                                                        .userCart.cartItems
                                                        .map(
                                                            (e) => e.totalPrice)
                                                        .toList()),
                                                fieldValues: {
                                                  'cart_items':
                                                      FieldValue.arrayUnion([
                                                    getUserCartItemsFirestoreData(
                                                      createUserCartItemsStruct(
                                                        cartItemId: _model
                                                            .idMapResult
                                                            ?.cartItemId,
                                                        productId:
                                                            listPlanUserMembershipPlansRecord
                                                                .membershipPlanId
                                                                .toString(),
                                                        productInfo:
                                                            updateInfoStruct(
                                                          listPlanUserMembershipPlansRecord
                                                              .planInfo,
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        quantity: 1,
                                                        price:
                                                            listPlanUserMembershipPlansRecord
                                                                .price,
                                                        totalPrice:
                                                            listPlanUserMembershipPlansRecord
                                                                .price,
                                                        productType:
                                                            'membership',
                                                        clearUnsetFields: false,
                                                      ),
                                                      true,
                                                    )
                                                  ]),
                                                },
                                                clearUnsetFields: false,
                                              ),
                                            ));

                                            await _model.idMapResult!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'cart_id':
                                                      FieldValue.increment(1),
                                                  'cart_item_id':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                          } else {
                                            FFAppState()
                                                .updateUserDataFlowStruct(
                                              (e) => e
                                                ..userCartCount =
                                                    currentUserDocument
                                                        ?.userCart
                                                        .cartItems
                                                        .length
                                                ..userCartItemList =
                                                    currentUserDocument!
                                                        .userCart.cartItems
                                                        .toList(),
                                            );
                                            while (FFAppState()
                                                    .UserDataFlow
                                                    .userCartCount >
                                                0) {
                                              if (FFAppState()
                                                      .UserDataFlow
                                                      .userCartItemList
                                                      .elementAtOrNull(
                                                          FFAppState()
                                                                  .UserDataFlow
                                                                  .userCartCount -
                                                              1)
                                                      ?.productType ==
                                                  'membership') {
                                                FFAppState()
                                                    .updateUserDataFlowStruct(
                                                  (e) => e
                                                    ..updateUserCartItemList(
                                                      (e) => e[FFAppState()
                                                              .UserDataFlow
                                                              .userCartCount -
                                                          1]
                                                        ..productId =
                                                            listPlanUserMembershipPlansRecord
                                                                .membershipPlanId
                                                                .toString()
                                                        ..productType =
                                                            'membership'
                                                        ..productInfo =
                                                            listPlanUserMembershipPlansRecord
                                                                .planInfo
                                                        ..quantity = 1
                                                        ..price =
                                                            listPlanUserMembershipPlansRecord
                                                                .price
                                                        ..totalPrice =
                                                            listPlanUserMembershipPlansRecord
                                                                .price,
                                                    ),
                                                );
                                                break;
                                              }
                                              FFAppState()
                                                  .updateUserDataFlowStruct(
                                                (e) => e
                                                  ..userCartCount = FFAppState()
                                                          .UserDataFlow
                                                          .userCartCount -
                                                      1,
                                              );
                                            }
                                          }

                                          _model.refresh =
                                              (_model.refresh!) - 1;
                                          safeSetState(() {});
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 150.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            color: currentUserDocument
                                                        ?.userCart.cartItems
                                                        .where((e) =>
                                                            e.productType ==
                                                            'membership')
                                                        .toList()
                                                        .firstOrNull
                                                        ?.productId ==
                                                    (listPlanUserMembershipPlansRecord
                                                        .membershipPlanId
                                                        .toString())
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .border,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (currentUserDocument
                                                              ?.userMemberships
                                                              .planId ==
                                                          listPlanUserMembershipPlansRecord
                                                              .membershipPlanId)
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    3.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.star,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 14.0,
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'cpja9pjq' /* subscribed */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'almarai',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontSize:
                                                                            8.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 2.0)),
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 24.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    listPlanUserMembershipPlansRecord
                                                        .planInfo.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          fontSize: 40.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Text(
                                                    listPlanUserMembershipPlansRecord
                                                        .duration,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Wrap(
                                                    spacing: 8.0,
                                                    runSpacing: 8.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    children: [
                                                      if (listPlanUserMembershipPlansRecord
                                                          .planFeature
                                                          .accessToProducts)
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'mppo2bn0' /* - Access to products. */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      if (listPlanUserMembershipPlansRecord
                                                          .planFeature
                                                          .discounts)
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '1z9osfez' /* - Discounts. */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      if (listPlanUserMembershipPlansRecord
                                                          .planFeature
                                                          .freeShipping)
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'x6z0k3ef' /* - Free shipping. */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      if (listPlanUserMembershipPlansRecord
                                                          .planFeature
                                                          .premiumSupport)
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gv8n7bk3' /* - Premium support. */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 12.0,
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      '${listPlanUserMembershipPlansRecord.price.toString()}  KWD',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'almarai',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (loggedIn == true) {
                                context.pushNamed(
                                  CartWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                context.goNamed(
                                  LoginWidget.routeName,
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
                            },
                            text: FFLocalizations.of(context).getText(
                              '5iu2v9ll' /* Join VIP Membership */,
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'l3qfuzxk' /* 100% secure payments. Cancel a... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'almarai',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 8.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'wud10e4k' /* By subscribing to a membership... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'dg91ieam' /* Terms and Conditions  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'almarai',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'oaissac6' /* and  */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Aileron',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                  ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '0nyunuew' /* Privacy Policy. */,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Aileron',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 12.0))
                          .addToStart(const SizedBox(height: 12.0))
                          .addToEnd(const SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
