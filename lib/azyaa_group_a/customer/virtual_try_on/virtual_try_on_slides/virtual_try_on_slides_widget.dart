import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/virtual_try_on/v_t_o_delete_confirm/v_t_o_delete_confirm_widget.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_a/home/components/product_listview/product_listview_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'virtual_try_on_slides_model.dart';
export 'virtual_try_on_slides_model.dart';

class VirtualTryOnSlidesWidget extends StatefulWidget {
  const VirtualTryOnSlidesWidget({
    super.key,
    required this.product,
  });

  final DocumentReference? product;

  static String routeName = 'VirtualTryOn_Slides';
  static String routePath = '/azyaa-tryon-slide';

  @override
  State<VirtualTryOnSlidesWidget> createState() =>
      _VirtualTryOnSlidesWidgetState();
}

class _VirtualTryOnSlidesWidgetState extends State<VirtualTryOnSlidesWidget> {
  late VirtualTryOnSlidesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VirtualTryOnSlidesModel());

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
        title: 'VirtualTryOn_Slides',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: wrapWithModel(
                  model: _model.universalAppBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: UniversalAppBarWidget(
                    backButtonStatus: false,
                    title: FFLocalizations.of(context).getVariableText(
                      enText: 'Virtual-try-on',
                      arText: 'تجربة افتراضية',
                    ),
                    navigationIconStatus: false,
                    searchIconStatus: false,
                    wishlistIconStatus: false,
                    navigationFrom: 'vto',
                    tryonStatus: true,
                    shareIconStatus: false,
                  ),
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
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: StreamBuilder<List<TryonRequestsRecord>>(
                      stream: queryTryonRequestsRecord(
                        queryBuilder: (tryonRequestsRecord) =>
                            tryonRequestsRecord
                                .where(
                                  'user_id',
                                  isEqualTo: currentUserUid,
                                )
                                .where(
                                  'product_ref',
                                  isEqualTo: widget.product,
                                )
                                .orderBy('created_at', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 150.0,
                            child: const LoadingAnimationWidget(),
                          );
                        }
                        List<TryonRequestsRecord>
                            containerTryonRequestsRecordList = snapshot.data!;

                        return Container(
                          width: MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium
                              ? MediaQuery.sizeOf(context).width
                              : 700.0,
                          decoration: const BoxDecoration(),
                          child: StreamBuilder<ProductsRecord>(
                            stream:
                                ProductsRecord.getDocument(widget.product!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 150.0,
                                  child: const LoadingAnimationWidget(),
                                );
                              }

                              final columnProductsRecord = snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final imageList =
                                            containerTryonRequestsRecordList
                                                .toList();

                                        return FlutterFlowSwipeableStack(
                                          onSwipeFn: (imageListIndex) {},
                                          onLeftSwipe: (imageListIndex) {},
                                          onRightSwipe: (imageListIndex) {},
                                          onUpSwipe: (imageListIndex) {},
                                          onDownSwipe: (imageListIndex) {},
                                          itemBuilder:
                                              (context, imageListIndex) {
                                            final imageListItem =
                                                imageList[imageListIndex];
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 450.0,
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      85.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      imageListItem
                                                                          .result,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: imageListItem
                                                                        .result,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag: imageListItem
                                                                  .result,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child: Image
                                                                    .network(
                                                                  imageListItem
                                                                      .result,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      1.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 110.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .border,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              ProductListviewWidget(
                                                            key: Key(
                                                                'Keyqwi_${imageListIndex}_of_${imageList.length}'),
                                                            product:
                                                                columnProductsRecord,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  125.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            FlutterFlowIconButton(
                                                              borderColor: const Color(
                                                                  0x7FFFFFFF),
                                                              borderRadius:
                                                                  100.0,
                                                              buttonSize: 42.0,
                                                              fillColor: const Color(
                                                                  0x795E5E5E),
                                                              icon: Icon(
                                                                FFIcons.kicon1,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 18.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            FlutterFlowIconButton(
                                                              borderColor: const Color(
                                                                  0x7FFFFFFF),
                                                              borderRadius:
                                                                  100.0,
                                                              buttonSize: 42.0,
                                                              fillColor: const Color(
                                                                  0x795E5E5E),
                                                              icon: Icon(
                                                                FFIcons.kicon,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {},
                                                            ),
                                                          Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderColor: const Color(
                                                                  0x7FFFFFFF),
                                                              borderRadius:
                                                                  100.0,
                                                              buttonSize: 42.0,
                                                              fillColor: const Color(
                                                                  0x795E5E5E),
                                                              icon: Icon(
                                                                FFIcons.kdelete,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                350.0,
                                                                            width:
                                                                                400.0,
                                                                            child:
                                                                                VTODeleteConfirmWidget(
                                                                              vtoRef: imageListItem.reference,
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
                                                        ].divide(const SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          itemCount: imageList.length,
                                          controller:
                                              _model.swipeableStackController,
                                          loop: true,
                                          cardDisplayCount: 1,
                                          scale: 0.0,
                                          cardPadding: const EdgeInsets.all(0.0),
                                        );
                                      },
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 8.0))
                                    .addToStart(const SizedBox(height: 16.0))
                                    .addToEnd(const SizedBox(height: 64.0)),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            VirtualTryOnWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.vertical,
                          runAlignment: WrapAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'vovoo1fb' /* Close */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'almarai',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
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
