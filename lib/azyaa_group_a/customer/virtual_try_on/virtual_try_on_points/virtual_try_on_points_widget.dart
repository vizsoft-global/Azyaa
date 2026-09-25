import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'virtual_try_on_points_model.dart';
export 'virtual_try_on_points_model.dart';

class VirtualTryOnPointsWidget extends StatefulWidget {
  const VirtualTryOnPointsWidget({super.key});

  @override
  State<VirtualTryOnPointsWidget> createState() =>
      _VirtualTryOnPointsWidgetState();
}

class _VirtualTryOnPointsWidgetState extends State<VirtualTryOnPointsWidget> {
  late VirtualTryOnPointsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VirtualTryOnPointsModel());

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
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: Container(
              width: 35.0,
              height: 3.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).navbaricon,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Objects.png',
                        width: 100.0,
                        fit: BoxFit.contain,
                        alignment: const Alignment(0.0, 0.0),
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '4r8wthcf' /* You’re out of Try-On credits! */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'almarai',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'cffq73sf' /* You need credits to use the Vi... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'almarai',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'b9nk7x7y' /* Select a Credit Pack */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'almarai',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 135.0,
                      decoration: const BoxDecoration(),
                      child: StreamBuilder<List<UserVtoPlansRecord>>(
                        stream: queryUserVtoPlansRecord(
                          queryBuilder: (userVtoPlansRecord) =>
                              userVtoPlansRecord
                                  .where(
                                    'status',
                                    isEqualTo: 'active',
                                  )
                                  .orderBy('vto_plan_id', descending: true),
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
                          List<UserVtoPlansRecord>
                              listViewUserVtoPlansRecordList = snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewUserVtoPlansRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewUserVtoPlansRecord =
                                  listViewUserVtoPlansRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.idMapResult =
                                      await queryIdMapRecordOnce(
                                    queryBuilder: (idMapRecord) =>
                                        idMapRecord.where(
                                      'type',
                                      isEqualTo: 'Main',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e
                                      ..userCartItemList = currentUserDocument!
                                          .userCart.cartItems
                                          .toList()
                                      ..count = currentUserDocument
                                          ?.userCart.cartItems.length
                                      ..userCartItemPAFound = 'notfound',
                                  );
                                  while (FFAppState().UserDataFlow.count > 0) {
                                    if (FFAppState()
                                            .UserDataFlow
                                            .userCartItemList
                                            .elementAtOrNull(FFAppState()
                                                    .UserDataFlow
                                                    .count -
                                                1)
                                            ?.productType ==
                                        'virtualtryon') {
                                      FFAppState().updateUserDataFlowStruct(
                                        (e) => e
                                          ..updateUserCartItemList(
                                            (e) => e[FFAppState()
                                                    .UserDataFlow
                                                    .count -
                                                1]
                                              ..price =
                                                  listViewUserVtoPlansRecord
                                                      .price
                                              ..totalPrice =
                                                  listViewUserVtoPlansRecord
                                                      .price
                                              ..vtoPoint =
                                                  UserCartVtoPlanStruct(
                                                vtoPlanId:
                                                    listViewUserVtoPlansRecord
                                                        .vtoPlanId,
                                                vtoPlanRef:
                                                    listViewUserVtoPlansRecord
                                                        .reference,
                                                vtoPoint:
                                                    listViewUserVtoPlansRecord
                                                        .vtoPoint,
                                              )
                                              ..productType = 'virtualtryon'
                                              ..productInfo =
                                                  listViewUserVtoPlansRecord
                                                      .vtoInfo
                                              ..quantity = 1,
                                          )
                                          ..userCartItemPAFound = 'found',
                                      );
                                      break;
                                    }
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..count =
                                            FFAppState().UserDataFlow.count - 1,
                                    );
                                  }
                                  if (FFAppState()
                                          .UserDataFlow
                                          .userCartItemPAFound !=
                                      'found') {
                                    FFAppState().updateUserDataFlowStruct(
                                      (e) => e
                                        ..updateUserCartItemList(
                                          (e) => e.add(UserCartItemsStruct(
                                            productType: 'virtualtryon',
                                            productId:
                                                listViewUserVtoPlansRecord
                                                    .vtoPlanId
                                                    .toString(),
                                            productInfo:
                                                listViewUserVtoPlansRecord
                                                    .vtoInfo,
                                            quantity: 1,
                                            price: listViewUserVtoPlansRecord
                                                .price,
                                            totalPrice:
                                                listViewUserVtoPlansRecord
                                                    .price,
                                            vtoPoint: UserCartVtoPlanStruct(
                                              vtoPlanId:
                                                  listViewUserVtoPlansRecord
                                                      .vtoPlanId,
                                              vtoPlanRef:
                                                  listViewUserVtoPlansRecord
                                                      .reference,
                                              vtoPoint:
                                                  listViewUserVtoPlansRecord
                                                      .vtoPoint,
                                            ),
                                            cartItemId:
                                                _model.idMapResult?.cartItemId,
                                          )),
                                        ),
                                    );

                                    await _model.idMapResult!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'cart_item_id':
                                              FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                  }

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    userCart: createUserCartStruct(
                                      cartId: _model.idMapResult?.cartId,
                                      createdAt: getCurrentTimestamp,
                                      updatedAt: getCurrentTimestamp,
                                      subtotal: functions.newCartTotal(
                                          currentUserDocument!
                                              .userCart.cartItems
                                              .map((e) => e.totalPrice)
                                              .toList()),
                                      total: functions.newCartTotal(
                                          currentUserDocument!
                                              .userCart.cartItems
                                              .map((e) => e.totalPrice)
                                              .toList()),
                                      fieldValues: {
                                        'cart_items':
                                            getUserCartItemsListFirestoreData(
                                          FFAppState()
                                              .UserDataFlow
                                              .userCartItemList,
                                        ),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  ));

                                  await _model.idMapResult!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'cart_id': FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  FFAppState().updateUserDataFlowStruct(
                                    (e) => e..userCartItemPAFound = 'notfound',
                                  );
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FFAppState()
                                                .UserDataFlow
                                                .userCartItemList
                                                .where((e) =>
                                                    e.vtoPoint.vtoPlanId ==
                                                    listViewUserVtoPlansRecord
                                                        .vtoPlanId)
                                                .toList()
                                                .length >
                                            0
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FFAppState()
                                                  .UserDataFlow
                                                  .userCartItemList
                                                  .where((e) =>
                                                      e.vtoPoint.vtoPlanId ==
                                                      listViewUserVtoPlansRecord
                                                          .vtoPlanId)
                                                  .toList()
                                                  .length >
                                              0
                                          ? FlutterFlowTheme.of(context)
                                              .tertiary
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          listViewUserVtoPlansRecord.vtoPoint
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '58bxei6z' /* Credits */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'almarai',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          '${listViewUserVtoPlansRecord.price.toString()}${FFLocalizations.of(context).getVariableText(
                                            enText: 'KD',
                                            arText: 'KD',
                                          )}',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'almarai',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 4.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'w6myt15o' /* Not Now */,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 48.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'almarai',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).border,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                if (FFAppState()
                        .UserDataFlow
                        .userCartItemList
                        .where((e) => e.productType == 'virtualtryon')
                        .toList()
                        .length >
                    0)
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);

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
                      },
                      text: FFLocalizations.of(context).getText(
                        'koh2r3am' /* Recharge Now */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'almarai',
                                  color: FlutterFlowTheme.of(context).info,
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
        ]
            .divide(const SizedBox(height: 16.0))
            .addToStart(const SizedBox(height: 16.0))
            .addToEnd(const SizedBox(height: 16.0)),
      ),
    );
  }
}
