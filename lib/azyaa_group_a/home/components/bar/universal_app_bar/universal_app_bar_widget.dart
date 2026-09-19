import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/ui/search/search_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'universal_app_bar_model.dart';
export 'universal_app_bar_model.dart';

class UniversalAppBarWidget extends StatefulWidget {
  const UniversalAppBarWidget({
    super.key,
    bool? backButtonStatus,
    String? title,
    bool? navigationIconStatus,
    bool? searchIconStatus,
    bool? wishlistIconStatus,
    String? navigationFrom,
    this.tryonStatus,
    bool? shareIconStatus,
    this.productRef,
    this.designerRef,
    this.creatorRef,
  })  : this.backButtonStatus = backButtonStatus ?? true,
        this.title = title ?? ' ',
        this.navigationIconStatus = navigationIconStatus ?? true,
        this.searchIconStatus = searchIconStatus ?? false,
        this.wishlistIconStatus = wishlistIconStatus ?? false,
        this.navigationFrom = navigationFrom ?? 'default',
        this.shareIconStatus = shareIconStatus ?? false;

  final bool backButtonStatus;
  final String title;
  final bool navigationIconStatus;
  final bool searchIconStatus;
  final bool wishlistIconStatus;
  final String navigationFrom;
  final bool? tryonStatus;
  final bool shareIconStatus;
  final DocumentReference? productRef;
  final DocumentReference? designerRef;
  final DocumentReference? creatorRef;

  @override
  State<UniversalAppBarWidget> createState() => _UniversalAppBarWidgetState();
}

class _UniversalAppBarWidgetState extends State<UniversalAppBarWidget> {
  late UniversalAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UniversalAppBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            if ((widget!.backButtonStatus == true) &&
                responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).border,
                  borderRadius: 100.0,
                  buttonSize: 42.0,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            content: Text(widget!.navigationFrom),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    if ((widget!.designerRef != null) &&
                        (widget!.navigationFrom == 'designer')) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              content: Text('yes'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      context.goNamed(
                        DesignerWidget.routeName,
                        queryParameters: {
                          'designerUid': serializeParam(
                            widget!.designerRef?.id,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              content: Text('no'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            if (widget!.backButtonStatus == true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).border,
                  borderRadius: 100.0,
                  buttonSize: 42.0,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    if (widget!.navigationFrom == 'default') {
                      context.safePop();
                    } else {
                      if (widget!.navigationFrom == 'shop') {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          HomeWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      } else {
                        if (widget!.navigationFrom == 'productlist') {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            ShopWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        } else {
                          if (widget!.navigationFrom == 'membership') {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              MembershipWidget.routeName,
                              extra: <String, dynamic>{
                                '__transition_info__': TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else {
                            if (widget!.navigationFrom == 'profile') {
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                ProfileWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              if (widget!.navigationFrom == 'creator') {
                                context.goNamed(
                                  CreatorsWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                if ((widget!.navigationFrom == 'designer') &&
                                    (widget!.designerRef != null)) {
                                  context.goNamed(
                                    DesignersListWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                } else {
                                  if (widget!.navigationFrom == 'account') {
                                    context.pushNamed(
                                      AddressWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    if (widget!.navigationFrom ==
                                        'editprofile') {
                                      context.pushNamed(
                                        ProfileWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    } else {
                                      if (widget!.navigationFrom == 'orders') {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          OrdersWidget.routeName,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        if (widget!.navigationFrom == 'vto') {
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            VirtualTryOnWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        } else {
                                          if (widget!.navigationFrom ==
                                              'account') {
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              ProfileWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          } else {
                                            context.safePop();
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  },
                ),
              ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: Text(
                  widget!.title.maybeHandleOverflow(
                    maxChars: 40,
                    replacement: '…',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'almarai',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ),
        if (widget!.shareIconStatus == true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
            child: StreamBuilder<ProductsRecord>(
              stream: ProductsRecord.getDocument(widget!.productRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 1.0,
                      height: 1.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primaryBackground,
                        ),
                      ),
                    ),
                  );
                }

                final shareconProductsRecord = snapshot.data!;

                return FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).border,
                  borderRadius: 100.0,
                  buttonSize: 42.0,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    FFIcons.kshare,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 18.0,
                  ),
                  onPressed: () {
                    print('sharecon pressed ...');
                  },
                );
              },
            ),
          ),
        if (widget!.searchIconStatus == true)
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).border,
                borderRadius: 100.0,
                buttonSize: 42.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  FFIcons.ksearch,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 18.0,
                ),
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: WebViewAware(
                          child: Container(
                            width: 500.0,
                            child: SearchWidget(),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        if ((loggedIn == true) && (widget!.wishlistIconStatus == true))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).border,
              borderRadius: 100.0,
              buttonSize: 42.0,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
              icon: Icon(
                FFIcons.kvector2,
                color: FlutterFlowTheme.of(context).primary,
                size: 18.0,
              ),
              onPressed: () async {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed(
                  WishlistWidget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
            ),
          ),
        if (widget!.navigationIconStatus == true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
            child: Container(
              height: 42.0,
              child: Stack(
                children: [
                  if (!loggedIn)
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).border,
                      borderRadius: 100.0,
                      buttonSize: 42.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        FFIcons.kuser,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 18.0,
                      ),
                      onPressed: () async {
                        context.goNamed(
                          LoginWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                    ),
                  if (loggedIn == true
                      ? (currentUserDocument!.userCart.cartItems.length > 0)
                      : false)
                    AuthUserStreamWidget(
                      builder: (context) => FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).border,
                        borderRadius: 100.0,
                        buttonSize: 42.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          FFIcons.kvector1,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 18.0,
                        ),
                        onPressed: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            CartWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                  if (loggedIn == true)
                    Stack(
                      children: [
                        if (loggedIn == true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                valueOrDefault<double>(
                                  currentUserDocument!
                                              .userCart.cartItems.length >
                                          0
                                      ? 12.0
                                      : 0.0,
                                  0.0,
                                ),
                                0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (widget!.navigationFrom == 'designer') {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      CartWidget.routeName,
                                      queryParameters: {
                                        'designerRef': serializeParam(
                                          widget!.designerRef,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  } else {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      CartWidget.routeName,
                                      extra: <String, dynamic>{
                                        '__transition_info__': TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                                child: badges.Badge(
                                  badgeContent: Text(
                                    currentUserDocument!
                                        .userCart.cartItems.length
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'almarai',
                                          color: valueOrDefault<int>(
                                                    currentUserDocument
                                                        ?.userCart
                                                        ?.cartItems
                                                        ?.length,
                                                    0,
                                                  ) ==
                                                  0
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .velvet,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  showBadge: currentUserDocument!
                                          .userCart.cartItems.length >
                                      0,
                                  shape: badges.BadgeShape.circle,
                                  badgeColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  elevation: 4.0,
                                  padding: EdgeInsets.all(8.0),
                                  position: badges.BadgePosition.topEnd(),
                                  animationType:
                                      badges.BadgeAnimationType.scale,
                                  toAnimate: true,
                                  child: FlutterFlowIconButton(
                                    borderColor: valueOrDefault<int>(
                                              currentUserDocument
                                                  ?.userCart?.cartItems?.length,
                                              0,
                                            ) ==
                                            0
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context).velvet,
                                    borderRadius: 100.0,
                                    buttonSize: 42.0,
                                    fillColor: valueOrDefault<int>(
                                              currentUserDocument
                                                  ?.userCart?.cartItems?.length,
                                              0,
                                            ) ==
                                            0
                                        ? FlutterFlowTheme.of(context)
                                            .primaryBackground
                                        : FlutterFlowTheme.of(context).velvet,
                                    icon: Icon(
                                      FFIcons.kvector1,
                                      color: valueOrDefault<int>(
                                                currentUserDocument?.userCart
                                                    ?.cartItems?.length,
                                                0,
                                              ) ==
                                              0
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      if (widget!.navigationFrom ==
                                          'designer') {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          CartWidget.routeName,
                                          queryParameters: {
                                            'designerRef': serializeParam(
                                              widget!.designerRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          CartWidget.routeName,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        if (widget!.tryonStatus == true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed(
                  ShopWidget.routeName,
                  extra: <String, dynamic>{
                    '__transition_info__': TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
              text: FFLocalizations.of(context).getText(
                '0ohv0220' /* Try more */,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'almarai',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
      ],
    );
  }
}
