import 'dart:math' as math;

/// One frame for catalogue photos so cards and the product gallery crop the
/// same way.
///
/// Cards used to pick their own grid ratio (0.55, 0.58 or 0.6) and the
/// product page used a fixed 450px or 650px gallery. A shorter cell overflowed
/// the title, and the gallery crop did not match the card.
abstract final class AzyProductFrame {
  /// Width/height of a catalogue card: room for a 3:4 photo plus name and price.
  static const double cardAspectRatio = 0.52;

  /// Width/height of the photograph itself (portrait 3:4).
  static const double imageAspectRatio = 0.75;

  static const double galleryHeightCap = 560;

  static double galleryHeight(double screenWidth) =>
      math.min(screenWidth / imageAspectRatio, galleryHeightCap);
}
