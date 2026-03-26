import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_style_home_model.dart';
export 'category_style_home_model.dart';

class CategoryStyleHomeWidget extends StatefulWidget {
  const CategoryStyleHomeWidget({
    super.key,
    this.category,
    String? componentType,
  }) : this.componentType = componentType ?? 'default';

  final CategoryRecord? category;
  final String componentType;

  @override
  State<CategoryStyleHomeWidget> createState() =>
      _CategoryStyleHomeWidgetState();
}

class _CategoryStyleHomeWidgetState extends State<CategoryStyleHomeWidget> {
  late CategoryStyleHomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryStyleHomeModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget!.componentType == 'profile') {
          if (currentUserDocument?.userPreferences?.categories?.length == 0) {
            _model.idMapResult1 = await queryIdMapRecordOnce(
              queryBuilder: (idMapRecord) => idMapRecord.where(
                'type',
                isEqualTo: 'Main',
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);

            await currentUserReference!.update(createUsersRecordData(
              userPreferences: createUserPreferencesStruct(
                preferencesId: _model.idMapResult1?.preferencesId,
                createdAt: getCurrentTimestamp,
                updatedAt: getCurrentTimestamp,
                fieldValues: {
                  'categories': FieldValue.arrayUnion([
                    getUserPreferencesCategoriesFirestoreData(
                      updateUserPreferencesCategoriesStruct(
                        UserPreferencesCategoriesStruct(
                          categoriesPriority: 1,
                          categoriesInfo: widget!.category?.categoryInfo,
                          categoriesId: widget!.category?.categoryId,
                        ),
                        clearUnsetFields: false,
                      ),
                      true,
                    )
                  ]),
                },
                clearUnsetFields: false,
              ),
            ));

            await _model.idMapResult1!.reference.update({
              ...mapToFirestore(
                {
                  'preferences_id': FieldValue.increment(1),
                },
              ),
            });
          } else {
            FFAppState().updateUserDataFlowStruct(
              (e) => e
                ..count =
                    currentUserDocument?.userPreferences?.categories?.length
                ..userCategoryPreferenceList =
                    currentUserDocument!.userPreferences.categories.toList()
                ..userCategoryPreferenceFindStatus = 'notfound',
            );
            while (FFAppState().UserDataFlow.count > 0) {
              if (FFAppState()
                      .UserDataFlow
                      .userCategoryPreferenceList
                      .elementAtOrNull(FFAppState().UserDataFlow.count - 1)
                      ?.categoriesId ==
                  widget!.category?.categoryId) {
                FFAppState().updateUserDataFlowStruct(
                  (e) => e
                    ..updateUserCategoryPreferenceList(
                      (e) => e.removeAt(FFAppState().UserDataFlow.count - 1),
                    )
                    ..userCategoryPreferenceFindStatus = 'found',
                );

                await currentUserReference!.update(createUsersRecordData(
                  userPreferences: createUserPreferencesStruct(
                    updatedAt: getCurrentTimestamp,
                    fieldValues: {
                      'categories':
                          getUserPreferencesCategoriesListFirestoreData(
                        FFAppState().UserDataFlow.userCategoryPreferenceList,
                      ),
                    },
                    clearUnsetFields: false,
                  ),
                ));
                break;
              }
              FFAppState().updateUserDataFlowStruct(
                (e) => e..count = FFAppState().UserDataFlow.count - 1,
              );
            }
            if (FFAppState().UserDataFlow.userCategoryPreferenceFindStatus ==
                'notfound') {
              await currentUserReference!.update(createUsersRecordData(
                userPreferences: createUserPreferencesStruct(
                  updatedAt: getCurrentTimestamp,
                  fieldValues: {
                    'categories': FieldValue.arrayUnion([
                      getUserPreferencesCategoriesFirestoreData(
                        updateUserPreferencesCategoriesStruct(
                          UserPreferencesCategoriesStruct(
                            categoriesPriority: 1,
                            categoriesInfo: widget!.category?.categoryInfo,
                            categoriesId: widget!.category?.categoryId,
                          ),
                          clearUnsetFields: false,
                        ),
                        true,
                      )
                    ]),
                  },
                  clearUnsetFields: false,
                ),
              ));
            }
          }

          FFAppState().updateUserDataFlowStruct(
            (e) => e..refresh = FFAppState().UserDataFlow.refresh + 1,
          );
          _model.updatePage(() {});
        } else {
          if (widget!.componentType == 'default') {
            FFAppState().updateUserFilterStruct(
              (e) => e..filterStatus = 'set',
            );
            if (FFAppState()
                    .UserFilter
                    .categoryId
                    .contains(widget!.category?.categoryId) !=
                true) {
              FFAppState().updateUserFilterStruct(
                (e) => e
                  ..updateCategoryId(
                    (e) => e.add(widget!.category!.categoryId),
                  ),
              );
            }
            if (FFAppState().UserFilter.productId.length == 0) {
              FFAppState().updateUserFilterStruct(
                (e) => e
                  ..productId = widget!.category!.categoryProductList.toList(),
              );
            } else {
              FFAppState().updateUserFilterStruct(
                (e) => e
                  ..productCount =
                      widget!.category?.categoryProductList?.length,
              );
              while (FFAppState().UserFilter.productCount > 0) {
                if (FFAppState().UserFilter.productId.contains(
                        widget!.category?.categoryProductList?.elementAtOrNull(
                            FFAppState().UserFilter.productCount - 1)) !=
                    true) {
                  FFAppState().updateUserFilterStruct(
                    (e) => e
                      ..updateProductId(
                        (e) => e.add(widget!.category!.categoryProductList
                            .elementAtOrNull(
                                FFAppState().UserFilter.productCount - 1)!),
                      ),
                  );
                }
                FFAppState().updateUserFilterStruct(
                  (e) => e
                    ..productCount = FFAppState().UserFilter.productCount - 1,
                );
              }
            }

            context.goNamed(ProductListWidget.routeName);
          }
        }

        safeSetState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AuthUserStreamWidget(
                  builder: (context) => Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent2,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: (widget!.componentType != 'default') &&
                                (currentUserDocument!.userPreferences.categories
                                        .where((e) =>
                                            e.categoriesId ==
                                            widget!.category?.categoryId)
                                        .toList()
                                        .length >
                                    0)
                            ? FlutterFlowTheme.of(context).primary
                            : Color(0x0A000000),
                      ),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/Rectangle_6001.svg',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                            alignment: Alignment(0.0, 1.0),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            () {
                              if (widget!.category?.categoryInfo
                                          ?.featureImage !=
                                      null &&
                                  widget!.category?.categoryInfo
                                          ?.featureImage !=
                                      '') {
                                return widget!
                                    .category!.categoryInfo.featureImage;
                              } else if (widget!
                                          .category?.categoryInfo?.iconImage !=
                                      null &&
                                  widget!.category?.categoryInfo?.iconImage !=
                                      '') {
                                return widget!.category!.categoryInfo.iconImage;
                              } else {
                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/na2nsnluxz7g/Vacation_Wear.png';
                              }
                            }(),
                            height: 100.0,
                            fit: BoxFit.cover,
                            alignment: Alignment(0.0, -1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getVariableText(
                    enText: () {
                      if (widget!.category?.categoryInfoTranslate?.name?.en !=
                          '') {
                        return widget!
                            .category?.categoryInfoTranslate?.name?.en;
                      } else if (widget!.category?.categoryInfoCustomTranslate
                              ?.name?.en !=
                          '') {
                        return widget!
                            .category?.categoryInfoCustomTranslate?.name?.en;
                      } else {
                        return widget!.category?.categoryInfo?.name;
                      }
                    }(),
                    arText: () {
                      if (widget!.category?.categoryInfoTranslate?.name?.ar !=
                          '') {
                        return widget!
                            .category?.categoryInfoTranslate?.name?.ar;
                      } else if (widget!.category?.categoryInfoCustomTranslate
                              ?.name?.ar !=
                          '') {
                        return widget!
                            .category?.categoryInfoCustomTranslate?.name?.ar;
                      } else {
                        return widget!.category?.categoryInfo?.name;
                      }
                    }(),
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Aileron',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
