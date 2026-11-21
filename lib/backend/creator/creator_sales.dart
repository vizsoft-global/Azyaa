/// Money figures written on a sale record (`sales_history.sale_history[]`).
///
/// Before these existed a sale record held the product, quantity and order
/// but no amount, so neither a designer's sales nor a creator's commission
/// could be totalled from it.

/// What the customer paid for one cart line.
///
/// The cart stores a line total, but older carts and lines whose quantity was
/// changed can carry a stale or missing one, so price times quantity is the
/// fallback. Never negative.
double azySaleAmount({double? totalPrice, double? price, int? quantity}) {
  final total = totalPrice ?? 0.0;
  if (total > 0) {
    return _round3(total);
  }
  final each = price ?? 0.0;
  final count = quantity ?? 0;
  if (each <= 0 || count <= 0) {
    return 0.0;
  }
  return _round3(each * count);
}

/// A creator's commission on [amount], where [ratePercent] is the product's
/// affiliate commission rate as a percentage (10 means 10%).
///
/// A missing, negative or above-100 rate earns nothing rather than a guess: a
/// wrong figure here becomes a wrong payout.
double azyCreatorCommission(double amount, double? ratePercent) {
  final rate = ratePercent ?? 0.0;
  if (amount <= 0 || rate <= 0 || rate > 100) {
    return 0.0;
  }
  return _round3(amount * rate / 100);
}

/// Kuwaiti dinar has three decimal places.
double _round3(double value) => (value * 1000).roundToDouble() / 1000;

/// One promoted cart line, as much of it as the totals need.
typedef AzyCreatorLine = ({
  double? totalPrice,
  double? price,
  int? quantity,
  double? ratePercent,
});

/// A creator's figures for the Quick Stats tiles.
class AzyCreatorTotals {
  const AzyCreatorTotals({
    this.units = 0,
    this.sales = 0.0,
    this.earnings = 0.0,
    this.withdrawals = 0.0,
  });

  /// Items sold through the creator's promotions.
  final int units;

  /// What customers paid for those items.
  final double sales;

  /// Commission earned on them.
  final double earnings;

  /// Commission already paid out.
  final double withdrawals;

  /// Earned and not yet paid out. Never below zero.
  double get balance {
    final left = earnings - withdrawals;
    return left > 0 ? _round3(left) : 0.0;
  }
}

/// Adds up a creator's promoted cart lines.
///
/// Pass only lines from orders that count (the Quick Stats page uses completed
/// orders), and only the creator's own lines. [withdrawals] is whatever has
/// been paid out so far; negative values are treated as nothing paid.
AzyCreatorTotals azyCreatorTotals(
  Iterable<AzyCreatorLine> lines, {
  double withdrawals = 0.0,
}) {
  var units = 0;
  var sales = 0.0;
  var earnings = 0.0;
  for (final line in lines) {
    final amount = azySaleAmount(
      totalPrice: line.totalPrice,
      price: line.price,
      quantity: line.quantity,
    );
    final count = line.quantity ?? 0;
    units += count > 0 ? count : 0;
    sales += amount;
    earnings += azyCreatorCommission(amount, line.ratePercent);
  }
  return AzyCreatorTotals(
    units: units,
    sales: _round3(sales),
    earnings: _round3(earnings),
    withdrawals: withdrawals > 0 ? _round3(withdrawals) : 0.0,
  );
}

/// "12.500" for 12.5: money as shown on the creator screens, three decimals.
String azyKd(double value) => value.toStringAsFixed(3);
