// One app-wide policy for the Android back button.
//
// THE TWO FAILURES THIS FIXES
// ---------------------------
// 1. Back closes the app with no warning. Android dispatches back to the root
//    Navigator; when the stack holds a single entry nothing can pop, so the
//    engine tears the activity down. That is the "sometimes it closes
//    accidentally" report, and it is *sometimes* because GoRouter's `go`
//    REPLACES the stack while `push` adds to it: a page reached by `go` is the
//    stack's only entry and back exits from it, whereas the same page reached by
//    `push` pops normally.
//
// 2. Back can dead-end. Several pages ship `PopScope(canPop: false)` with no
//    callback (payment, verify, free_payment, success), so back is ignored
//    there: no exit, no navigation, no feedback at all.
//
// WHERE THIS IS WIRED
// -------------------
// Every route in the app is built by `FFRoute.toRoute` in
// `flutter_flow/nav/nav.dart`, so [AzyBackGuard] is inserted there ONCE and every
// page inherits the behaviour.
//
// That placement is not a preference. `PopScope` registers itself by calling
// `ModalRoute.of(context)` (see flutter's `pop_scope.dart`), so a guard put in
// `MaterialApp.builder` -- above the Navigator, where there is no route -- would
// silently do nothing.
//
// WHAT IT DELIBERATELY DOES NOT DO
// --------------------------------
// It does not touch the ordinary case. `canPop` stays true whenever the stack can
// pop, so normal back navigation is unchanged -- including the iOS swipe-back
// gesture, which `canPop: false` would disable. Only the pop that would kill the
// app is intercepted.

import 'dart:async';

import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// What the back button should do next.
enum AzyBackAction {
  /// Let the route underneath take over.
  pop,

  /// Back is not allowed to reach anything useful, so go to the home page.
  goHome,

  /// This pop would close the app. Ask first.
  confirmExit,
}

/// Routes back must never return *into* once they have been passed.
///
/// `Verify` is a payment being confirmed: returning into it mid-flight invites a
/// second confirmation for an order the shopper may already own. `Success` is
/// the receipt for a finished order, so back from it means "home", not "back
/// into the payment flow".
///
/// `Payment` is deliberately NOT in this set. Backing out of the method picker
/// before paying is a legitimate thing to do, and that page already guards
/// itself; sending those shoppers home would abandon a transaction in progress.
const Set<String> kAzyNoReturnRoutes = {'Verify', 'Success'};

/// The app-wide back policy. Pure decision in [decide], the effects below it.
abstract final class AzyBackPolicy {
  /// The decision, separated from the doing so it can be tested without a
  /// device, a router or a widget tree.
  static AzyBackAction decide({
    required bool canPop,
    required bool currentRouteIsNoReturn,
  }) {
    if (currentRouteIsNoReturn) {
      return AzyBackAction.goHome;
    }
    return canPop ? AzyBackAction.pop : AzyBackAction.confirmExit;
  }

  /// Handles a back press that did not pop on its own.
  ///
  /// NEVER lets the app die by accident and never lets a failed navigation take
  /// it down: every path either navigates somewhere real or leaves the user
  /// exactly where they were.
  static Future<void> handleBack(BuildContext context) async {
    final router = GoRouter.of(context);
    final routeName = ModalRoute.of(context)?.settings.name;
    final action = decide(
      canPop: router.routerDelegate.canPop(),
      currentRouteIsNoReturn:
          routeName != null && kAzyNoReturnRoutes.contains(routeName),
    );

    switch (action) {
      case AzyBackAction.pop:
        _popOrHome(router, context);

      case AzyBackAction.goHome:
        _goHome(context);

      case AzyBackAction.confirmExit:
        final confirmed = await showAzyExitConfirmDialog(context);
        if (confirmed) {
          await SystemNavigator.pop();
        }
    }
  }

  static void _popOrHome(GoRouter router, BuildContext context) {
    try {
      router.pop();
    } catch (error) {
      // The stack changed between deciding and doing. Home is always reachable.
      debugPrint('AzyBackPolicy: pop failed, going home instead: $error');
      _goHome(context);
    }
  }

  static void _goHome(BuildContext context) {
    try {
      context.go('/');
    } catch (error) {
      // Nothing left to try: staying put is still better than closing the app.
      debugPrint('AzyBackPolicy: could not reach home: $error');
    }
  }
}

/// Asks before closing the app, and makes "No" the easy answer.
///
/// "No" is the filled button and takes focus, so the keyboard, a gamepad or a
/// stray Enter chooses it. Dismissing the dialog by tapping outside counts as
/// "No" as well -- every ambiguous path keeps the app open, because an unwanted
/// exit costs far more than one extra tap.
Future<bool> showAzyExitConfirmDialog(BuildContext context) async {
  final choice = await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) {
      final theme = FlutterFlowTheme.of(dialogContext);
      return AlertDialog(
        backgroundColor: theme.primaryBackground,
        title: Text(
          FFLocalizations.of(dialogContext).getVariableText(
            enText: 'Are you sure you want to exit?',
            arText: 'هل أنت متأكد من الخروج؟',
          ),
          style: theme.titleMedium.override(
            fontFamily: 'almarai',
            color: theme.primaryText,
            letterSpacing: 0.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(
              FFLocalizations.of(dialogContext).getVariableText(
                enText: 'Yes',
                arText: 'نعم',
              ),
              style: theme.bodyMedium.override(
                fontFamily: 'almarai',
                color: theme.secondaryText,
                letterSpacing: 0.0,
              ),
            ),
          ),
          FilledButton(
            autofocus: true,
            style: FilledButton.styleFrom(
              backgroundColor: theme.primary,
              foregroundColor: theme.primaryBackground,
            ),
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(
              FFLocalizations.of(dialogContext).getVariableText(
                enText: 'No',
                arText: 'لا',
              ),
              style: theme.bodyMedium.override(
                fontFamily: 'almarai',
                color: theme.primaryBackground,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ],
      );
    },
  );
  // Dismissed without choosing, or dismissed by tapping outside: keep the app.
  return choice ?? false;
}

/// Wraps a route's content with the back policy above.
///
/// Lives inside the route, so `ModalRoute.of` resolves and `PopScope` actually
/// registers. `canPop` follows the live router, rebuilt through
/// [ListenableBuilder] on the router delegate, so a page that was the stack's
/// only entry stops asking to exit as soon as anything is pushed on top of it.
class AzyBackGuard extends StatelessWidget {
  const AzyBackGuard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return ListenableBuilder(
      listenable: router.routerDelegate,
      builder: (context, _) => PopScope(
        canPop: router.routerDelegate.canPop(),
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) {
            return; // An ordinary pop; nothing to add.
          }
          unawaited(AzyBackPolicy.handleBack(context));
        },
        child: child,
      ),
    );
  }
}
