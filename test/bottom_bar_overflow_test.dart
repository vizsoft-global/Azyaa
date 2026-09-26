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
// the real layout engine rather than by reading the code.
//
// The bar has since been made compact (2026-09-26): 36px stepper and button,
// 2px outer and 4px inner vertical padding, no row gap -- 36 + 12 = 48, so a
// 50px bar fits with 2px to spare. The later tests pin that layout and stop
// the two product pages drifting from it.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The height the generated pages used to declare (overflows by 7.0).
const double _shippedBrokenHeight = 75.0;

/// The compact bar's height.
const double _compactHeight = 50.0;

/// The affiliate-creator bar, which adds a 36px promotion row.
const double _compactCreatorHeight = 96.0;

class _Chain {
  const _Chain({
    required this.outerV,
    required this.innerTop,
    required this.innerBottom,
    required this.rowBottom,
    required this.stepper,
    required this.button,
  });
  final double outerV, innerTop, innerBottom, rowBottom, stepper, button;
}

/// The generated layout, as shipped when the overflow was reported.
const _original = _Chain(
    outerV: 4, innerTop: 8, innerBottom: 8, rowBottom: 8, stepper: 50, button: 48);

/// The compact layout the pages use now.
const _compact = _Chain(
    outerV: 2, innerTop: 4, innerBottom: 4, rowBottom: 0, stepper: 36, button: 36);

/// Product pages that carry the bottom bar (both are live routes).
const List<String> _barOwners = <String>[
  'lib/azyaa_group_a/home/main/product/product_widget.dart',
  'lib/product_copy/product_copy_widget.dart',
];

/// The bottom bar's widget chain, copied verbatim from the generated page
/// (indentation aside) with the two leaf heights parameterised.
Widget _bottomBar(double containerHeight, _Chain c) {
  return Align(
    alignment: Alignment.topCenter,
    child: SizedBox(
      width: 390.0,
      height: containerHeight,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, c.outerV, 0.0, c.outerV),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, c.innerTop, 0.0, c.innerBottom),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, c.rowBottom),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 88.0,
                            height: c.stepper,
                            color: const Color(0xFFF5F5F5),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(height: c.button),
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
Future<String?> _overflowReportAt(
    WidgetTester tester, double height, _Chain chain) async {
  await tester.pumpWidget(
    Directionality(
      textDirection: TextDirection.ltr,
      child: _bottomBar(height, chain),
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
    final report =
        await _overflowReportAt(tester, _shippedBrokenHeight, _original);

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

  testWidgets('the compact 50.0 bar fits the stepper and the CTA',
      (tester) async {
    expect(await _overflowReportAt(tester, _compactHeight, _compact), isNull);
  });

  testWidgets('the compact bar has no slack to lose', (tester) async {
    // 2px of headroom: shaving the bar to 47 must overflow, so a later padding
    // tweak cannot silently eat the margin.
    final report = await _overflowReportAt(tester, 47.0, _compact);
    expect(report, isNotNull);
    expect(_reportedPixels(report!), closeTo(1.0, 0.001));
  });

  test('both product pages keep the compact bar heights', () {
    for (final path in _barOwners) {
      final file = File(path);
      expect(file.existsSync(), isTrue, reason: '$path is missing');
      final body = file.readAsStringSync();

      expect(
        body.contains(': $_shippedBrokenHeight,'),
        isFalse,
        reason: '$path declares the $_shippedBrokenHeight bottom-bar height '
            'again, which overflows by 7.0px.',
      );
      expect(
        RegExp(r':\s*50\.0,\s*50\.0,').allMatches(body).length,
        2,
        reason: '$path should hold exactly two fixed bars (ready + custom) at '
            '$_compactHeight.',
      );
      expect(
        RegExp(RegExp.escape('? $_compactCreatorHeight')).allMatches(body).length,
        2,
        reason: '$path should keep the two affiliate-creator bars at '
            '$_compactCreatorHeight, room for the extra promotion row.',
      );
    }
  });
}
