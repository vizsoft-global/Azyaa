import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/customer/zone/user_initial/user_initial_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_app_bar/universal_app_bar_widget.dart';
import '/azyaa_group_a/home/components/bar/universal_navigation_bar/universal_navigation_bar_widget.dart';
import '/azyaa_group_a/home/components/empty/empty_widget.dart';
import '/azyaa_group_a/home/components/loading_animation/loading_animation_widget.dart';
import '/azyaa_group_b/update_notifier/app_update_checker/app_update_checker_widget.dart';
import '/backend/backend.dart';
import '/backend/search/search.dart';
import '/custom_code/widgets/azy_recent_searches.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import '/azyaa_group_b/creator/creator_promotion/creator_promotion_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'creators_model.dart';
export 'creators_model.dart';

class CreatorsWidget extends StatefulWidget {
  const CreatorsWidget({super.key});

  static String routeName = 'Creators';
  static String routePath = '/azyaa-creators';

  @override
  State<CreatorsWidget> createState() => _CreatorsWidgetState();
}

class _CreatorsWidgetState extends State<CreatorsWidget>
    with TickerProviderStateMixin {
  late CreatorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatorsModel());

    _model.searchFiledsTextController ??= TextEditingController();
    _model.searchFiledsFocusNode ??= FocusNode();

    // Load persisted creator searches. Async and best-effort: the chips simply
    // do not appear if storage fails.
    AzySearchHistory.recent(AzySearchHistory.scopeCreators).then((terms) {
      if (!mounted) {
        return;
      }
      _model.recentCreatorSearches = terms;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )
      ..addListener(() => safeSetState(() {}))
      ..addListener(() async {
        if (_model.tabBarController!.indexIsChanging) {
          return;
        }

        if (!loggedIn) {
          context.pushNamed(
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
      });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  /// Narrows [creators] to those matching the live search box text.
  ///
  /// Runs the creators through the shared [AzySearchIndex] rather than a
  /// hand-rolled `contains`, so creator search gets the same literal matching,
  /// handle matching and deterministic ordering that product search does — one
  /// ranking implementation, not two.
  ///
  /// The creator list is already in memory from the stream above, so this adds
  /// no query and no latency; it only re-ranks what is already on screen.
  List<UsersRecord> _applyCreatorSearch(List<UsersRecord> creators) {
    final query = _model.creatorSearchQuery.trim();
    if (query.isEmpty || creators.isEmpty) {
      return creators;
    }
    // Under the minimum length the index refuses the query, so filtering here
    // would blank the page mid-word. Leave the list whole instead.
    if (!AzyMatch.meetsMinimumLength(query)) {
      return creators;
    }

    final index = AzySearchIndex();
    for (final creator in creators) {
      final info = creator.creatorMainInfo.creatorInfo;
      index.add(
        AzySearchDocument(
          kind: AzySearchKind.creator,
          id: creator.uid.isNotEmpty ? creator.uid : creator.reference.id,
          title: creator.displayName.isNotEmpty
              ? creator.displayName
              : (info.name.isNotEmpty ? info.name : creator.userName),
          subtitle: creator.userName.isNotEmpty ? '@${creator.userName}' : '',
          imageUrl:
              creator.photoUrl.isNotEmpty ? creator.photoUrl : info.brandPhoto,
          // Handles, bio and categories, so "beauty" or an @handle finds them.
          keywords: [
            creator.userName,
            info.name,
            info.bio,
            info.instagramProfile,
            info.tiktokHandle,
            info.youtubeChannel,
            info.location,
            ...info.contentCategory,
          ],
          payload: creator,
        ),
      );
    }

    final hits = index
        .search(
          query,
          kinds: {AzySearchKind.creator},
          perKind: creators.length,
        )
        .of(AzySearchKind.creator);

    final matched = <UsersRecord>[];
    for (final hit in hits) {
      final payload = hit.document.payload;
      if (payload is UsersRecord) {
        matched.add(payload);
      }
    }
    return matched;
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Creators',
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
                        backButtonStatus: false,
                        title: FFLocalizations.of(context).getText(
                          '445mldjb' /* Creators Hub  */,
                        ),
                        navigationIconStatus: true,
                        searchIconStatus: false,
                        wishlistIconStatus: true,
                        navigationFrom: '',
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
                  Column(
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
                              16.0, 0.0, 16.0, 12.0),
                          child: Stack(
                            alignment: const AlignmentDirectional(1.0, 1.0),
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent2,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '3nwbgzd9' /* Our  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'almarai',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'rdnyp0u0' /* Creators  */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'almarai',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
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
                                      Container(
                                        width: 180.0,
                                        decoration: const BoxDecoration(),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ifa42y0z' /* Browse through our featured Cr... */,
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
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/creator1.webp',
                                  width: 150.0,
                                  height: 90.0,
                                  fit: BoxFit.cover,
                                  alignment: const Alignment(1.0, -1.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (loggedIn)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (loggedIn)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: TextFormField(
                                        controller:
                                            _model.searchFiledsTextController,
                                        focusNode: _model.searchFiledsFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.searchFiledsTextController',
                                          const Duration(milliseconds: 180),
                                          () async {
                                            // Local, synchronous fuzzy filter over
                                            // the creator list already streaming
                                            // in below -- no Algolia call, no
                                            // network round-trip, so results
                                            // update as the user types.
                                            //
                                            // Was: `UsersRecord.search(...)`
                                            // against the 'users' Algolia index
                                            // on a 2000ms debounce.
                                            final term = _model
                                                .searchFiledsTextController.text;
                                            _model.creatorSearchQuery = term;
                                            safeSetState(() {});

                                            // Persist only real terms, and not
                                            // on every keystroke of a longer
                                            // word.
                                            if (term.trim().length >= 3) {
                                              final updated =
                                                  await AzySearchHistory.record(
                                                AzySearchHistory.scopeCreators,
                                                term,
                                              );
                                              _model.recentCreatorSearches =
                                                  updated;
                                              safeSetState(() {});
                                            }
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'bzkrlgow' /* Search */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'almarai',
                                                    color: const Color(0xFF575454),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent2,
                                          suffixIcon: Icon(
                                            FFIcons.ksearch,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'almarai',
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .searchFiledsTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                // Recent creator searches.
                                //
                                // This replaces a placeholder block that was
                                // guarded by
                                //   responsiveVisibility(phone: false,
                                //     tablet: false, tabletLandscape: false,
                                //     desktop: false)
                                // -- false at every width, so it never
                                // rendered -- and whose list items were literal
                                // `Container(color: Colors.green)` boxes. The
                                // live narrowing now happens in
                                // _applyCreatorSearch, where the signed-in and
                                // signed-out lists both converge.
                                if (_model.creatorSearchQuery.isEmpty &&
                                    _model.recentCreatorSearches.isNotEmpty)
                                  AzyRecentSearchesView(
                                    terms: _model.recentCreatorSearches,
                                    onSelected: (term) {
                                      _model.searchFiledsTextController.text =
                                          term;
                                      _model.creatorSearchQuery = term;
                                      safeSetState(() {});
                                    },
                                    onRemoved: (term) async {
                                      await AzySearchHistory.remove(
                                        AzySearchHistory.scopeCreators,
                                        term,
                                      );
                                      _model.recentCreatorSearches =
                                          await AzySearchHistory.recent(
                                        AzySearchHistory.scopeCreators,
                                      );
                                      safeSetState(() {});
                                    },
                                    onCleared: () async {
                                      await AzySearchHistory.clear(
                                        AzySearchHistory.scopeCreators,
                                      );
                                      _model.recentCreatorSearches = const [];
                                      safeSetState(() {});
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      Expanded(
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where(
                                  'status',
                                  isEqualTo: 'Published',
                                )
                                .where(
                                  'user_role',
                                  isEqualTo: 'Creator',
                                )
                                .where(
                                  'creator_main_info.creator_status',
                                  isEqualTo: 'active',
                                ),
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
                            List<UsersRecord> creatorUsersRecordList = snapshot
                                .data!
                                .where((u) => u.uid != currentUserUid)
                                .toList();

                            // Narrow by the search box HERE, before either the
                            // signed-in or the signed-out branch reads the list,
                            // so both get identical filtered results from one
                            // filter pass.
                            creatorUsersRecordList = _applyCreatorSearch(
                              creatorUsersRecordList,
                            );

                            return Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 300.0,
                              decoration: const BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        if (loggedIn)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7kut8vgw' /* All */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'nst7p0t9' /* Discover */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'uxdp9stf' /* Following */,
                                                ))
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .choiceChipsloginValue1 =
                                                      val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              chipSpacing: 8.0,
                                              rowSpacing: 8.0,
                                              multiselect: false,
                                              initialized: _model
                                                      .choiceChipsloginValue1 !=
                                                  null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipsloginValueController1 ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'sf23yl78' /* All */,
                                                  )
                                                ],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                        if (!loggedIn)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'fnkxbtam' /* All */,
                                                ))
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .choiceChipslogoutValue1 =
                                                      val?.firstOrNull),
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'almarai',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              chipSpacing: 8.0,
                                              rowSpacing: 8.0,
                                              multiselect: false,
                                              initialized: _model
                                                      .choiceChipslogoutValue1 !=
                                                  null,
                                              alignment: WrapAlignment.start,
                                              controller: _model
                                                      .choiceChipslogoutValueController1 ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'fi7ekjly' /* All */,
                                                  )
                                                ],
                                              ),
                                              wrapped: true,
                                            ),
                                          ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => Builder(
                                            builder: (context) {
                                              final allCreatorList = (_model.searchFiledsTextController
                                                                      .text !=
                                                                  ''
                                                          ? _model
                                                              .algoliaSearchResults
                                                              ?.where((e) => (_model
                                                                              .choiceChipsloginValue1 ==
                                                                          FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                            enText:
                                                                                'All',
                                                                            arText:
                                                                                'الجميع',
                                                                          )) &&
                                                                      (e.status ==
                                                                          'Published') &&
                                                                      (e.userRole ==
                                                                          'Creator')
                                                                  ? true
                                                                  : (((currentUserDocument?.userCreatorFollowing.toList() ?? [])
                                                                              .contains(e.reference) ==
                                                                          (_model.choiceChipsloginValue1 ==
                                                                                  FFLocalizations.of(context).getVariableText(
                                                                                    enText: 'Discover',
                                                                                    arText: 'يكتشف',
                                                                                  )
                                                                              ? false
                                                                              : true)) &&
                                                                      (e.status == 'Published') &&
                                                                      (e.userRole == 'Creator')))
                                                              .toList()
                                                              .sortedList(keyOf: (e) => e.createdTime!, desc: false)
                                                          : creatorUsersRecordList
                                                              .where((e) => () {
                                                                    if (!loggedIn &&
                                                                        (_model.choiceChipslogoutValue1 ==
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'All',
                                                                              arText: 'الجميع',
                                                                            ))) {
                                                                      return true;
                                                                    } else if (loggedIn &&
                                                                        (_model.choiceChipsloginValue1 ==
                                                                            FFLocalizations.of(context).getVariableText(
                                                                              enText: 'All',
                                                                              arText: 'الجميع',
                                                                            ))) {
                                                                      return true;
                                                                    } else {
                                                                      return ((currentUserDocument?.userCreatorFollowing.toList() ?? [])
                                                                              .contains(e.reference) ==
                                                                          ((_model.choiceChipsloginValue1 ==
                                                                                      FFLocalizations.of(context).getVariableText(
                                                                                        enText: 'Discover',
                                                                                        arText: 'يكتشف',
                                                                                      )) &&
                                                                                  loggedIn
                                                                              ? false
                                                                              : true));
                                                                    }
                                                                  }())
                                                              .toList()
                                                              .sortedList(keyOf: (e) => e.createdTime!, desc: false))
                                                      ?.toList() ??
                                                  [];
                                              if (allCreatorList.isEmpty) {
                                                return Center(
                                                  child: EmptyWidget(
                                                    messageOne:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'styqnzvy' /* No creator found! */,
                                                    ),
                                                    image: '',
                                                    messageTwo:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'xuy0818g' /* Looks like there’s no data to ... */,
                                                    ),
                                                    buttonText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'usfnod9k' /* Explore Creators */,
                                                    ),
                                                  ),
                                                );
                                              }

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    allCreatorList.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 12.0),
                                                itemBuilder: (context,
                                                    allCreatorListIndex) {
                                                  final allCreatorListItem =
                                                      allCreatorList[
                                                          allCreatorListIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          CreatorsIndividualWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'creatorUid':
                                                                serializeParam(
                                                              allCreatorListItem
                                                                  .uid,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            '__transition_info__':
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
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
                                                              .accent2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
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
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    allCreatorListItem
                                                                        .creatorMainInfo
                                                                        .creatorInfo
                                                                        .brandPhoto,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                                                  ),
                                                                  width: 110.0,
                                                                  height: 90.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      const Alignment(
                                                                          0.0,
                                                                          0.0),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                allCreatorListItem.displayName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'almarai',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                child: Text(
                                                                                  allCreatorListItem.creatorMainInfo.creatorInfo.bio.maybeHandleOverflow(
                                                                                    maxChars: 100,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'almarai',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                          tabletLandscape:
                                                                              false,
                                                                        ))
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: const Color(0xFF6729DA),
                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'wts05ndc' /* Best Rated */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'almarai',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    if (allCreatorListItem
                                                                            .creatorMainInfo
                                                                            .creatorPromotions
                                                                            .where((e) =>
                                                                                e.promotionStatus ==
                                                                                'active')
                                                                            .toList()
                                                                            .length >
                                                                        0)
                                                                      Container(
                                                                        width:
                                                                            190.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final portfolioImageList =
                                                                                allCreatorListItem.creatorMainInfo.creatorPromotions.where((e) => e.promotionStatus == 'active' && e.promotionInfo.galleryImage.isNotEmpty).toList().sortedList(keyOf: (e) => e.promotionCreatedAt!, desc: true).take(4).toList();

                                                                            return ListView.separated(
                                                                              padding: const EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                8.0,
                                                                                0,
                                                                              ),
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: portfolioImageList.length,
                                                                              separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                                                                              itemBuilder: (context, portfolioImageListIndex) {
                                                                                final portfolioImageListItem = portfolioImageList[portfolioImageListIndex];
                                                                                return GestureDetector(
                                                                                  onTap: () => CreatorPromotionWidget.open(
                                                                                    context,
                                                                                    promotionId: portfolioImageListItem.promotionId,
                                                                                    creatorUid: allCreatorListItem.uid,
                                                                                  ),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).border,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                      child: CachedNetworkImage(
                                                                                        imageUrl: portfolioImageListItem.promotionInfo.galleryImage.first,
                                                                                        width: 40.0,
                                                                                        height: 45.0,
                                                                                        fit: BoxFit.cover,
                                                                                        alignment: const Alignment(0.0, 0.0),
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
                                                            ].divide(const SizedBox(
                                                                width: 8.0)),
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
                                      ].divide(const SizedBox(height: 12.0)),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 12.0))
                                      .addToStart(const SizedBox(height: 12.0))
                                      .addToEnd(const SizedBox(height: 12.0)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Expanded(
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where(
                                    'status',
                                    isEqualTo: 'Published',
                                  )
                                  .where(
                                    'user_role',
                                    isEqualTo: 'Creator',
                                  )
                                  .where(
                                    'creator_main_info.creator_status',
                                    isEqualTo: 'active',
                                  ),
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
                              List<UsersRecord> tabBarUsersRecordList = snapshot
                                  .data!
                                  .where((u) => u.uid != currentUserUid)
                                  .toList();

                              return Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      labelPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'almarai',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      unselectedLabelStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'almarai',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'm43elsih' /* Creators */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'pllmesie' /* Posts */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  if (loggedIn)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: [
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '75z6xv4q' /* All */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'x5vul0f5' /* Discover */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'pbpj0bvc' /* Following */,
                                                          ))
                                                        ],
                                                        onChanged: (val) =>
                                                            safeSetState(() => _model
                                                                    .choiceChipsloginValue2 =
                                                                val?.firstOrNull),
                                                        selectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
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
                                                                        .info,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                        unselectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: false,
                                                        initialized: _model
                                                                .choiceChipsloginValue2 !=
                                                            null,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .choiceChipsloginValueController2 ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'nhlfa8f2' /* All */,
                                                            )
                                                          ],
                                                        ),
                                                        wrapped: true,
                                                      ),
                                                    ),
                                                  if (!loggedIn)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowChoiceChips(
                                                        options: [
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            's6jdef0m' /* All */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'nm949foq' /* Discover */,
                                                          )),
                                                          ChipData(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '32fvo7ax' /* Following */,
                                                          ))
                                                        ],
                                                        onChanged: (val) async {
                                                          safeSetState(() => _model
                                                                  .choiceChipslogoutValue2 =
                                                              val?.firstOrNull);
                                                          if (!loggedIn) {
                                                            context.pushNamed(
                                                              LoginWidget
                                                                  .routeName,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__':
                                                                    const TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );

                                                            return;
                                                          }
                                                        },
                                                        selectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
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
                                                                        .info,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                        unselectedChipStyle:
                                                            ChipStyle(
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'almarai',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          iconSize: 16.0,
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                        chipSpacing: 8.0,
                                                        rowSpacing: 8.0,
                                                        multiselect: false,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        controller: _model
                                                                .choiceChipslogoutValueController2 ??=
                                                            FormFieldController<
                                                                List<String>>(
                                                          [],
                                                        ),
                                                        wrapped: true,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        Builder(
                                                      builder: (context) {
                                                        final allCreatorList =
                                                            tabBarUsersRecordList
                                                                .where((e) => _model
                                                                            .choiceChipsloginValue2 ==
                                                                        FFLocalizations.of(context)
                                                                            .getVariableText(
                                                                          enText:
                                                                              'All',
                                                                          arText:
                                                                              'الجميع',
                                                                        )
                                                                    ? true
                                                                    : ((currentUserDocument?.userCreatorFollowing.toList() ??
                                                                                [])
                                                                            .contains(e
                                                                                .reference) ==
                                                                        (_model
                                                                                    .choiceChipsloginValue2 ==
                                                                                FFLocalizations.of(context)
                                                                                    .getVariableText(
                                                                                  enText: 'Discover',
                                                                                  arText: 'يكتشف',
                                                                                )
                                                                            ? false
                                                                            : true)))
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.createdTime!,
                                                                    desc: false)
                                                                .toList();

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              allCreatorList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 12.0),
                                                          itemBuilder: (context,
                                                              allCreatorListIndex) {
                                                            final allCreatorListItem =
                                                                allCreatorList[
                                                                    allCreatorListIndex];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
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
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    CreatorsIndividualWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'creatorUid':
                                                                          serializeParam(
                                                                        allCreatorListItem
                                                                            .uid,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      '__transition_info__':
                                                                          const TransitionInfo(
                                                                        hasTransition:
                                                                            true,
                                                                        transitionType:
                                                                            PageTransitionType.fade,
                                                                        duration:
                                                                            Duration(milliseconds: 0),
                                                                      ),
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .border,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl: valueOrDefault<String>(
                                                                              allCreatorListItem.creatorMainInfo.creatorInfo.brandPhoto,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-0uiv4k/assets/i9u1ra67p2p4/Azyaa-logo_(2).jpg',
                                                                            ),
                                                                            width:
                                                                                110.0,
                                                                            height:
                                                                                90.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            alignment:
                                                                                const Alignment(0.0, 0.0),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          allCreatorListItem.displayName,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'almarai',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                          child: Text(
                                                                                            allCreatorListItem.creatorMainInfo.creatorInfo.bio.maybeHandleOverflow(
                                                                                              maxChars: 100,
                                                                                              replacement: '…',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'almarai',
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                  ))
                                                                                    Align(
                                                                                      alignment: const AlignmentDirectional(1.0, -1.0),
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: const Color(0xFF6729DA),
                                                                                          borderRadius: BorderRadius.circular(100.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(6.0, 2.0, 6.0, 4.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'sjbxzl97' /* Best Rated */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'almarai',
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              if (currentUserDocument!.creatorMainInfo.creatorInfo.brandGallery.length > 0)
                                                                                Container(
                                                                                  width: 190.0,
                                                                                  height: 40.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final portfolioImageList = (currentUserDocument?.creatorMainInfo.creatorInfo.brandGallery.toList() ?? []).take(5).toList();

                                                                                      return ListView.separated(
                                                                                        padding: const EdgeInsets.fromLTRB(
                                                                                          0,
                                                                                          0,
                                                                                          8.0,
                                                                                          0,
                                                                                        ),
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        itemCount: portfolioImageList.length,
                                                                                        separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                                                                                        itemBuilder: (context, portfolioImageListIndex) {
                                                                                          final portfolioImageListItem = portfolioImageList[portfolioImageListIndex];
                                                                                          return Container(
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).border,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: ClipRRect(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              child: CachedNetworkImage(
                                                                                                imageUrl: portfolioImageListItem,
                                                                                                width: 40.0,
                                                                                                height: 45.0,
                                                                                                fit: BoxFit.contain,
                                                                                                alignment: const Alignment(0.0, 0.0),
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
                                                                      ].divide(const SizedBox(
                                                                              width: 8.0)),
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
                                                ].divide(
                                                    const SizedBox(height: 12.0)),
                                              ),
                                            ]
                                                .divide(const SizedBox(height: 12.0))
                                                .addToStart(
                                                    const SizedBox(height: 12.0))
                                                .addToEnd(
                                                    const SizedBox(height: 12.0)),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final imageList =
                                                        tabBarUsersRecordList
                                                            .map((e) => e
                                                                .creatorMainInfo
                                                                .creatorPromotions
                                                                .where((e) =>
                                                                    e.promotionStatus ==
                                                                    'active')
                                                                .toList()
                                                                .firstOrNull
                                                                ?.promotionInfo
                                                                .featureImage)
                                                            .withoutNulls
                                                            .toList();

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium
                                                            ? 2
                                                            : 4,
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 1.0,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          imageList.length,
                                                      itemBuilder: (context,
                                                          imageListIndex) {
                                                        final imageListItem =
                                                            imageList[
                                                                imageListIndex];
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .border,
                                                            ),
                                                          ),
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
                                                                      imageListItem,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      alignment:
                                                                          const Alignment(
                                                                              0.0,
                                                                              -1.0),
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag:
                                                                        imageListItem,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  imageListItem,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  imageListItem,
                                                                  width: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  alignment:
                                                                      const Alignment(
                                                                          0.0,
                                                                          -1.0),
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
                                          ]
                                              .addToStart(
                                                  const SizedBox(height: 12.0))
                                              .addToEnd(const SizedBox(height: 12.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.universalNavigationBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const UniversalNavigationBarWidget(
                            navigation: 'creator',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
