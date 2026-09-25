import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'user_wishlist_model.dart';
export 'user_wishlist_model.dart';

class UserWishlistWidget extends StatefulWidget {
  const UserWishlistWidget({
    super.key,
    required this.type,
    required this.itemID,
    double? iconSize,
    this.containersize,
    required this.iconsize,
  }) : iconSize = iconSize ?? 18.0;

  final String? type;
  final String? itemID;
  final double iconSize;
  final int? containersize;
  final int? iconsize;

  @override
  State<UserWishlistWidget> createState() => _UserWishlistWidgetState();
}

class _UserWishlistWidgetState extends State<UserWishlistWidget> {
  late UserWishlistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserWishlistModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loggedIn == true,
      child: Container(
        width: widget.containersize?.toDouble(),
        height: widget.containersize?.toDouble(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(100.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).buttonBorder,
          ),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Stack(
          alignment: const AlignmentDirectional(0.0, 0.0),
          children: [
            if ((currentUserDocument?.userWishlistItem.toList() ?? [])
                    .where((e) =>
                        (e.entityType == widget.type) &&
                        (e.wishlistItemId == widget.itemID))
                    .toList()
                    .length ==
                0)
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.type == 'product') {
                        if ((currentUserDocument?.userWishlistItem.toList() ??
                                    [])
                                .where((e) =>
                                    (e.entityType == widget.type) &&
                                    (e.wishlistItemId == widget.itemID))
                                .toList()
                                .length >
                            0) {
                          _model.count = (currentUserDocument?.userWishlistItem
                                      .toList() ??
                                  [])
                              .length;
                          _model.wishlistItems = (currentUserDocument
                                      ?.userWishlistItem
                                      .toList() ??
                                  [])
                              .toList()
                              .cast<UserWishlistItemStruct>();
                          while (_model.count! > 0) {
                            if ((_model.wishlistItems
                                        .elementAtOrNull((_model.count!) - 1)
                                        ?.wishlistItemId ==
                                    widget.itemID) &&
                                (_model.wishlistItems
                                        .elementAtOrNull((_model.count!) - 1)
                                        ?.entityType ==
                                    widget.type)) {
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
                                      wishlistItemId: widget.itemID,
                                      entityType: widget.type,
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
                      _model.refresh = (_model.refresh!) + 1;
                      _model.updatePage(() {});
                    },
                    child: Container(
                      width: widget.containersize?.toDouble(),
                      height: widget.containersize?.toDouble(),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                      child: Visibility(
                        visible:
                            (currentUserDocument?.userWishlistItem.toList() ??
                                        [])
                                    .where((e) =>
                                        (e.entityType == widget.type) &&
                                        (e.wishlistItemId == widget.itemID))
                                    .toList()
                                    .length ==
                                0,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (widget.type == 'product') {
                                if ((currentUserDocument?.userWishlistItem
                                                .toList() ??
                                            [])
                                        .where((e) =>
                                            (e.entityType == widget.type) &&
                                            (e.wishlistItemId ==
                                                widget.itemID))
                                        .toList()
                                        .length >
                                    0) {
                                  _model.count = (currentUserDocument
                                              ?.userWishlistItem
                                              .toList() ??
                                          [])
                                      .length;
                                  _model.wishlistItems = (currentUserDocument
                                              ?.userWishlistItem
                                              .toList() ??
                                          [])
                                      .toList()
                                      .cast<UserWishlistItemStruct>();
                                  while (_model.count! > 0) {
                                    if ((_model.wishlistItems
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)
                                                ?.wishlistItemId ==
                                            widget.itemID) &&
                                        (_model.wishlistItems
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)
                                                ?.entityType ==
                                            widget.type)) {
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
                                        'user_wishlist_item':
                                            FieldValue.arrayUnion([
                                          getUserWishlistItemFirestoreData(
                                            createUserWishlistItemStruct(
                                              wishlistItemId: widget.itemID,
                                              entityType: widget.type,
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
                              _model.refresh = (_model.refresh!) + 1;
                              _model.updatePage(() {});
                            },
                            child: Icon(
                              FFIcons.kvector2,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: widget.iconSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if ((currentUserDocument?.userWishlistItem.toList() ?? [])
                    .where((e) =>
                        (e.entityType == widget.type) &&
                        (e.wishlistItemId == widget.itemID))
                    .toList()
                    .length >
                0)
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (widget.type == 'product') {
                        if ((currentUserDocument?.userWishlistItem.toList() ??
                                    [])
                                .where((e) =>
                                    (e.entityType == widget.type) &&
                                    (e.wishlistItemId == widget.itemID))
                                .toList()
                                .length >
                            0) {
                          _model.count = (currentUserDocument?.userWishlistItem
                                      .toList() ??
                                  [])
                              .length;
                          _model.wishlistItems = (currentUserDocument
                                      ?.userWishlistItem
                                      .toList() ??
                                  [])
                              .toList()
                              .cast<UserWishlistItemStruct>();
                          while (_model.count! > 0) {
                            if ((_model.wishlistItems
                                        .elementAtOrNull((_model.count!) - 1)
                                        ?.wishlistItemId ==
                                    widget.itemID) &&
                                (_model.wishlistItems
                                        .elementAtOrNull((_model.count!) - 1)
                                        ?.entityType ==
                                    widget.type)) {
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
                                      wishlistItemId: widget.itemID,
                                      entityType: widget.type,
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
                      _model.refresh = (_model.refresh!) + 1;
                      _model.updatePage(() {});
                    },
                    child: Container(
                      width: widget.containersize?.toDouble(),
                      height: widget.containersize?.toDouble(),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                      child: Visibility(
                        visible:
                            (currentUserDocument?.userWishlistItem.toList() ??
                                        [])
                                    .where((e) =>
                                        (e.entityType == widget.type) &&
                                        (e.wishlistItemId == widget.itemID))
                                    .toList()
                                    .length >
                                0,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (widget.type == 'product') {
                                if ((currentUserDocument?.userWishlistItem
                                                .toList() ??
                                            [])
                                        .where((e) =>
                                            (e.entityType == widget.type) &&
                                            (e.wishlistItemId ==
                                                widget.itemID))
                                        .toList()
                                        .length >
                                    0) {
                                  _model.count = (currentUserDocument
                                              ?.userWishlistItem
                                              .toList() ??
                                          [])
                                      .length;
                                  _model.wishlistItems = (currentUserDocument
                                              ?.userWishlistItem
                                              .toList() ??
                                          [])
                                      .toList()
                                      .cast<UserWishlistItemStruct>();
                                  while (_model.count! > 0) {
                                    if ((_model.wishlistItems
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)
                                                ?.wishlistItemId ==
                                            widget.itemID) &&
                                        (_model.wishlistItems
                                                .elementAtOrNull(
                                                    (_model.count!) - 1)
                                                ?.entityType ==
                                            widget.type)) {
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
                                        'user_wishlist_item':
                                            FieldValue.arrayUnion([
                                          getUserWishlistItemFirestoreData(
                                            createUserWishlistItemStruct(
                                              wishlistItemId: widget.itemID,
                                              entityType: widget.type,
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
                              _model.refresh = (_model.refresh!) + 1;
                              _model.updatePage(() {});
                            },
                            child: Icon(
                              FFIcons.kvector3,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: widget.iconSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
