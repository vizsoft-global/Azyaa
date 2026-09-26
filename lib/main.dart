import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/revenue_cat_util.dart' as revenue_cat;





// ===========================================================================
// TEMPORARY OVERFLOW MITIGATION
// Remove this block (and the `builder:` in MyApp.build below) once the
// individual layouts have been fixed.
// ===========================================================================
//
// Why this exists:
// The generated screens in this project use ~570 `Row`s against ~4,100 `Text`s,
// but only two of those `Text`s set an explicit `overflow:` and only 65 set
// `maxLines:`. Long content therefore has very little room to give -- a long
// translated string (the Arabic bundle is mostly longer than the English one),
// a long product title, a long user name, or a large system font can make a
// layout report "A RenderFlex overflowed by N pixels".
//
// Neither switch below changes any layout maths. A widget that genuinely does
// not fit is still clipped exactly as it was before; the app just stops
// shouting about it. Set all three to `false` to get the full reports back.
//
// About the yellow/black stripes:
// Those are painted by Flutter's `DebugOverflowIndicatorMixin`, and its only
// call site in `RenderFlex` sits inside an `assert`. There is no public API to
// disable them (unlike, say, `debugDisableShadows`). Two consequences:
//   1. They are stripped out of profile and release builds entirely, so
//      `flutter run --profile` or a release build is already stripe-free.
//   2. In a debug build they cannot be suppressed from app code -- the only
//      real cure is to fix the layout that overflows.

/// Silence "overflowed by N pixels" reports so they cannot bury real errors in
/// the console or trip the debug error overlay.
const bool kQuietOverflowReports = true;

/// Let any `Text` that does not set its own value ellipsise instead of
/// hard-clipping once it is squeezed. `Text` falls back to the ambient
/// `DefaultTextStyle.overflow`, so this covers the generated widgets globally.
const bool kDefaultTextEllipsis = true;

/// Cap the system font scale so an extreme accessibility setting cannot blow up
/// the fixed-height generated layouts. 1.3 matches Android's own "Largest"
/// step, which is the largest value the UI is expected to survive.
const bool kClampTextScale = true;
const double kMaxTextScaleFactor = 1.3;

void _installOverflowReportFilter() {
  if (!kQuietOverflowReports) {
    return;
  }
  final previousOnError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.exceptionAsString().contains('overflowed by')) {
      return; // Layout overflow -- suppressed on purpose, see above.
    }
    previousOnError?.call(details);
  };
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _installOverflowReportFilter();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();

  await initFirebase();

  // Start initial custom actions code
  await actions.changeStatusBarColor();
  await actions.initBranch();
  // End initial custom actions code

  await FFLocalizations.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  await revenue_cat.initialize(
    "appl_WlYAGTNqAJjaHMRPDFOgaxLlXxS",
    "",
    loadDataAfterLaunch: true,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();

  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.path;
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((user) {
    revenue_cat.login(user?.uid);
  });
  final fcmTokenSub = fcmTokenUserStream.listen(
    (_) {},
    // Registering a token can fail for reasons outside the app's control (a
    // browser without the Notification API, a revoked permission, a blocked
    // cloud call). Swallow it here so it can't surface as an unhandled zone
    // error and take down the app on login.
    onError: (e) => debugPrint('Error registering FCM token: $e'),
  );

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = azyaaFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Azyaa',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      // TEMPORARY overflow mitigation -- see the note above `main()`.
      //
      // This `builder` is inserted below `AnimatedTheme`/`ScaffoldMessenger` and
      // above the `Navigator` (MaterialApp's own `_materialBuilder` calls it
      // with the Navigator as `child`), so it wraps every route without
      // interfering with theming.
      builder: (context, child) {
        if (child == null) {
          return const SizedBox.shrink();
        }
        Widget content = child;
        if (kClampTextScale) {
          content = MediaQuery.withClampedTextScaling(
            maxScaleFactor: kMaxTextScaleFactor,
            child: content,
          );
        }
        if (kDefaultTextEllipsis) {
          content = DefaultTextStyle.merge(
            overflow: TextOverflow.ellipsis,
            child: content,
          );
        }
        return content;
      },
      routerConfig: _router,
    );
  }
}
