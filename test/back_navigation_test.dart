// Tests for the app-wide back policy.
//
// Two halves, deliberately:
//   * a pure half for the decision itself (no Flutter binding, no router), and
//   * a source half for the wiring, because the defect this fixes is structural
//     -- a guard in the wrong place (`MaterialApp.builder`) compiles, runs, and
//     silently intercepts nothing.
//
// Run with: flutter test test/back_navigation_test.dart

import 'dart:io';

import 'package:azyaa/backend/navigation/azy_back_policy.dart';
import 'package:flutter_test/flutter_test.dart';

const String _policyFile =
    'lib/backend/navigation/azy_back_policy.dart';
const String _navFile = 'lib/flutter_flow/nav/nav.dart';

String _read(String path) {
  final file = File(path);
  expect(file.existsSync(), isTrue, reason: '$path is missing');
  return file.readAsStringSync();
}

/// [read] with whole-line `//` comments removed.
///
/// The policy file documents the mistakes it exists to prevent by naming them --
/// e.g. "`PopScope(canPop: false)` with no callback" -- so asserting absence
/// against raw text would fail on the prose rather than on the code.
String _readCode(String path) => _read(path)
    .split('\n')
    .where((line) => !line.trimLeft().startsWith('//'))
    .join('\n');

void main() {
  group('AzyBackPolicy.decide', () {
    test('pops while there is something to pop', () {
      expect(
        AzyBackPolicy.decide(canPop: true, currentRouteIsNoReturn: false),
        AzyBackAction.pop,
      );
    });

    test('asks before closing the app', () {
      // canPop false is exactly the case where Android would kill the activity.
      expect(
        AzyBackPolicy.decide(canPop: false, currentRouteIsNoReturn: false),
        AzyBackAction.confirmExit,
      );
    });

    test('goes home instead of back into a finished payment', () {
      expect(
        AzyBackPolicy.decide(canPop: true, currentRouteIsNoReturn: true),
        AzyBackAction.goHome,
      );
    });

    test('a no-return route never confirms an exit, even at the stack root', () {
      // Leaving the app from the receipt page would be a surprise; going home is
      // both safe and what the shopper means by "back".
      expect(
        AzyBackPolicy.decide(canPop: false, currentRouteIsNoReturn: true),
        AzyBackAction.goHome,
      );
    });
  });

  group('the no-return set', () {
    test('covers the post-payment states', () {
      expect(kAzyNoReturnRoutes, containsAll(<String>['Verify', 'Success']));
    });

    test('does not trap shoppers mid-transaction', () {
      // Backing out before paying is legitimate; these pages must keep their
      // normal back behaviour, so they must NOT be in the set.
      for (final route in ['Payment', 'freePayment', 'Checkout', 'Cart']) {
        expect(
          kAzyNoReturnRoutes.contains(route),
          isFalse,
          reason: '$route is mid-transaction. Blocking back there abandons a '
              'shopper who has not paid yet.',
        );
      }
    });

    test('leaves a failed payment retryable', () {
      expect(kAzyNoReturnRoutes.contains('Failed'), isFalse);
    });
  });

  group('wiring', () {
    test('every route is guarded, from the one place routes are built', () {
      final nav = _read(_navFile);
      expect(
        nav.contains('final guardedChild = AzyBackGuard(child: child);'),
        isTrue,
        reason: 'The guard is missing from FFRoute.toRoute, so some or all '
            'pages have no back policy at all.',
      );
      expect(
        nav.contains('AzyBackGuard'),
        isTrue,
        reason: 'nav.dart no longer references the back guard.',
      );
      // Both page constructors must use the guarded child, or half the routes
      // (the animated ones, or the plain ones) silently miss out. Counted, not
      // merely searched: `child: child` also appears legitimately inside the
      // transitionsBuilder callback, where `child` is that callback's parameter.
      expect(
        'child: guardedChild'.allMatches(nav).length,
        greaterThanOrEqualTo(2),
        reason: 'Both CustomTransitionPage and MaterialPage must receive the '
            'guarded child.',
      );
    });

    test('ordinary back is left alone', () {
      final policy = _readCode(_policyFile);
      expect(
        policy.contains('canPop: router.routerDelegate.canPop()'),
        isTrue,
        reason: 'canPop must follow the router. A hard canPop: false would '
            'disable normal back navigation and the iOS swipe-back gesture.',
      );
      expect(
        RegExp(r'PopScope\(\s*canPop:\s*false').hasMatch(policy),
        isFalse,
        reason: 'A hard canPop: false reappeared in the guard.',
      );
      expect(
        policy.contains('if (didPop)'),
        isTrue,
        reason: 'The callback must ignore pops that already happened, or every '
            'ordinary back press would be handled twice.',
      );
    });

    test('the exit dialog makes "No" the easy answer', () {
      final policy = _readCode(_policyFile);
      expect(policy.contains('Are you sure you want to exit?'), isTrue);
      for (final label in ["enText: 'Yes'", "enText: 'No'"]) {
        expect(policy.contains(label), isTrue, reason: '$label is missing.');
      }
      expect(
        policy.contains('autofocus: true'),
        isTrue,
        reason: 'The safe button must take focus so a stray Enter cannot exit.',
      );
      expect(
        policy.contains('return choice ?? false;'),
        isTrue,
        reason: 'A dismissed dialog must mean "do not exit". Every ambiguous '
            'path has to keep the app open.',
      );
    });

    test('a failed navigation can never close the app', () {
      final policy = _readCode(_policyFile);
      expect(
        policy.contains('catch (error)'),
        isTrue,
        reason: 'Navigation is wrapped, so a pop that resolves nowhere falls '
            'back to home rather than propagating and taking the app down.',
      );
      expect(
        policy.contains("context.go('/')"),
        isTrue,
        reason: 'The home fallback is missing, so a broken stack has nowhere to '
            'land.',
      );
    });
  });
}
