import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_item_list_delete_confirm_model.dart';
export 'cart_item_list_delete_confirm_model.dart';

class CartItemListDeleteConfirmWidget extends StatefulWidget {
  const CartItemListDeleteConfirmWidget({
    super.key,
    required this.cartItem,
    required this.index,
  });

  final UserCartItemsStruct? cartItem;
  final int? index;

  @override
  State<CartItemListDeleteConfirmWidget> createState() =>
      _CartItemListDeleteConfirmWidgetState();
}

class _CartItemListDeleteConfirmWidgetState
    extends State<CartItemListDeleteConfirmWidget> {
  late CartItemListDeleteConfirmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartItemListDeleteConfirmModel());

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

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(
                0.0,
                -3.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 100.0,
                        buttonSize: 40.0,
                        fillColor: Color(0xFFE9E9E9),
                        icon: Icon(
                          FFIcons.kdelete2,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).border,
                    borderRadius: 100.0,
                    buttonSize: 36.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      unawaited(
                        () async {
                          Navigator.pop(context);
                        }(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'w9ph2wn4' /* Are you sure? */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Aileron',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'xpv8xtv1' /* Are you sure you want to remov... */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Aileron',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      lineHeight: 1.5,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (widget!.cartItem?.productType == 'product') {
                      if ((currentUserDocument?.userWishlistItem?.toList() ??
                                  [])
                              .where((e) =>
                                  (e.entityType == 'product') &&
                                  (e.wishlistItemId ==
                                      widget!.cartItem?.productId))
                              .toList()
                              .length >
                          0) {
                        _model.count =
                            (currentUserDocument?.userWishlistItem?.toList() ??
                                    [])
                                .length;
                        _model.wishlistItems =
                            (currentUserDocument?.userWishlistItem?.toList() ??
                                    [])
                                .toList()
                                .cast<UserWishlistItemStruct>();
                        while (_model.count! > 0) {
                          if ((_model.wishlistItems
                                      .elementAtOrNull((_model.count!) - 1)
                                      ?.wishlistItemId ==
                                  widget!.cartItem?.productId) &&
                              (_model.wishlistItems
                                      .elementAtOrNull((_model.count!) - 1)
                                      ?.entityType ==
                                  'product')) {
                            _model.removeAtIndexFromWishlistItems(
                                (_model.count!) - 1);

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'user_wishlist_item':
                                      getUserWishlistItemListFirestoreData(
                                    _model.wishlistItems,
                                  ),
                                },
                              ),
                            });
                            break;
                          }
                          _model.count = (_model.count!) - 1;
                        }
                      } else {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'user_wishlist_item': FieldValue.arrayUnion([
                                getUserWishlistItemFirestoreData(
                                  createUserWishlistItemStruct(
                                    wishlistItemId: widget!.cartItem?.productId,
                                    entityType: 'product',
                                    addedAt: getCurrentTimestamp,
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });
                      }
                    }
                    FFAppState().updateUserDataFlowStruct(
                      (e) => e
                        ..userCartItemList =
                            currentUserDocument!.userCart.cartItems.toList(),
                    );
                    FFAppState().updateUserDataFlowStruct(
                      (e) => e
                        ..updateUserCartItemList(
                          (e) => e.remove(widget!.cartItem),
                        ),
                    );

                    await currentUserReference!.update(createUsersRecordData(
                      userCart: createUserCartStruct(
                        fieldValues: {
                          'cart_items': getUserCartItemsListFirestoreData(
                            FFAppState().UserDataFlow.userCartItemList,
                          ),
                        },
                        clearUnsetFields: false,
                      ),
                    ));
                    unawaited(
                      () async {
                        Navigator.pop(context);
                      }(),
                    );
                    FFAppState().updateUserDataFlowStruct(
                      (e) => e..incrementRefresh(1),
                    );
                    FFAppState().update(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    't62t5vsq' /* Save for later */,
                  ),
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Aileron',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  FFAppState().updateUserDataFlowStruct(
                    (e) => e
                      ..userCartItemList =
                          currentUserDocument!.userCart.cartItems.toList(),
                  );
                  FFAppState().updateUserDataFlowStruct(
                    (e) => e
                      ..updateUserCartItemList(
                        (e) => e.remove(widget!.cartItem),
                      ),
                  );

                  await currentUserReference!.update(createUsersRecordData(
                    userCart: createUserCartStruct(
                      fieldValues: {
                        'cart_items': getUserCartItemsListFirestoreData(
                          FFAppState().UserDataFlow.userCartItemList,
                        ),
                      },
                      clearUnsetFields: false,
                    ),
                  ));
                  unawaited(
                    () async {
                      Navigator.pop(context);
                    }(),
                  );
                  FFAppState().updateUserDataFlowStruct(
                    (e) => e..incrementRefresh(1),
                  );
                  _model.updatePage(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'ta266fvf' /* Yes */,
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Aileron',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
            ))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Checkbox(
                        value: _model.checkboxValue ??= false,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.checkboxValue = newValue!);
                        },
                        side: (FlutterFlowTheme.of(context).alternate != null)
                            ? BorderSide(
                                width: 2,
                                color: FlutterFlowTheme.of(context).alternate!,
                              )
                            : null,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '3otvpv8q' /* Don't show again */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Aileron',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
          ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
