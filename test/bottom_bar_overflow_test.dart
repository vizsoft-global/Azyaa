// Regression guard for the product page's "Add to Bag" bottom bar.
//
// Reported bug (2026-09-25): the bar showed
//   "BOTTOM OVERFLOWED BY 7.0 PIXELS"
// while a ready-made product with stock was open, i.e. when the quantity
// stepper is rendered next to the Add to Bag button.
//
// Cause: the generated code hard-coded the bar's height and the numbers did
// not add up:
//
//   Container(height: 75.0)
//     Padding(top 4, bottom 4)              ->  75 - 8  = 67
//     Stack
//       Padding(top 8, bottom 8)            ->  67 - 16 = 51  <- Column budget
//       Column(mainAxisSize: max)
//         Padding(bottom 8)
//           Row( stepper 50 high, button 48 high )
//         ^ yields 50 + 8 = 58
//
//   58 needed - 51 available = 7.0 pixels, exactly the reported number.
//
// The first test rebuilds that exact chain so the arithmetic is verified by
// the real layout engine rather than by reading the code, and pins BOTH the
// broken and the fixed height. The second test stops the four hard-coded
// heights in the two generated product pages from drifting back to 75.0.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The height the generated pages used to declare (overflows by 7.0).
const double _shippedBrokenHeight = 75.0;

/// The height that actually fits the content (see the arithmetic above).
const double _minimumFittingHeight = 82.0;

/// Height of the quantity stepper's bordered box in the generated code.
const double _stepperHeight = 50.0;

/// Height of the `DefaultCartButtonWidget(type: 'button')` CTA.
const double _addToBagButtonHeight = 48.0;

/// Product pages that carry the bottom bar (both are live routes).
const List<String> _barOwners = <String>[
  'lib/azyaa_group_a/home/main/product/product_widget.dart',
  'lib/product_copy/product_copy_widget.dart',
];

/// The bottom bar's widget chain, copied verbatim from the generated page
/// (indentation aside) with the two leaf heights parameterised.
Widget _bottomBar(double containerHeight) {
  return Align(
    alignment: Alignment.topCenter,
    child: SizedBox(
      width: 390.0,
      height: containerHeight,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 120.0,
                            height: _stepperHeight,
                            color: const Color(0xFFF5F5F5),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(height: _addToBagButtonHeight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Lays the bar out at [height] and returns the overflow report Flutter
/// produced, or null when the layout fits.
Future<String?> _overflowReportAt(WidgetTester tester, double height) async {
  await tester.pumpWidget(
    Directionality(
      textDirection: TextDirection.ltr,
      child: _bottomBar(height),
    ),
  );
  final Object? exception = tester.takeException();
  // Reset so a failure cannot leak into the next measurement.
  await tester.pumpWidget(const SizedBox.shrink());
  tester.takeException();
  return exception?.toString();
}

/// Pulls the "N pixels" figure out of a RenderFlex overflow report.
double _reportedPixels(String report) {
  final match = RegExp(r'overflowed by ([0-9.]+) pixels').firstMatch(report);
  expect(match, isNotNull, reason: 'unexpected layout report: $report');
  return double.parse(match!.group(1)!);
}

void main() {
  testWidgets('the shipped 75.0 bar overflows by exactly 7.0 pixels',
      (tester) async {
    final report = await _overflowReportAt(tester, _shippedBrokenHeight);

    expect(
      report,
      isNotNull,
      reason: 'A $_shippedBrokenHeight px bar is the reported bug, so it must '
          'still overflow; if this fails the chain above no longer matches '
          'the generated page.',
    );
    expect(report, contains('bottom'), reason: 'the miss is vertical: $report');
    expect(
      _reportedPixels(report!),
      closeTo(7.0, 0.001),
      reason: 'the user saw "BOTTOM OVERFLOWED BY 7.0 PIXELS": $report',
    );
  });

  testWidgets('the fixed 82.0 bar fits the stepper and the CTA',
      (tester) async {
    final report = await _overflowReportAt(tester, _minimumFittingHeight);
    expect(
      report,
      isNull,
      reason: '$_minimumFittingHeight px is the smallest height that fits the '
          '58px of content plus the 24px of padding.',
    );
  });

  test('both product pages keep a bottom bar tall enough for the stepper', () {
    for (final path in _barOwners) {
      final file = File(path);
      expect(file.existsSync(), isTrue, reason: '$path is missing');
      final body = file.readAsStringSync();

      expect(
        body.contains(': $_shippedBrokenHeight,'),
        isFalse,
        reason: '$path declares the $_shippedBrokenHeight bottom-bar height '
            'again, which overflows by 7.0px. Use $_minimumFittingHeight.',
      );
      expect(
        RegExp(RegExp.escape(': $_minimumFittingHeight,'))
            .allMatches(body)
            .length,
        2,
        reason: '$path should hold exactly two fixed bars (ready + custom) at '
            '$_minimumFittingHeight.',
      );
      expect(
        RegExp(RegExp.escape('? 135.0')).allMatches(body).length,
        2,
        reason: '$path should keep the two affiliate-creator bars at 135.0; '
            'they already have room for the extra promotion row.',
      );
    }
  });
}

