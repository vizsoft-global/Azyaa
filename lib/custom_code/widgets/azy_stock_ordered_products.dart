// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/backend.dart';
import '/backend/inventory/stock_order.dart';
import '/backend/inventory/stock_service.dart';

/// Wraps a product listing so available stock is listed first.
///
/// WHY A WRAPPER
/// -------------
/// A card streams its own inventory document, but the page that assembles the
/// list knows nothing about stock. Rather than teach every listing page to
/// fetch inventory — they are large generated files with several grid and list
/// variants each — a page wraps its existing layout in this and swaps the list
/// variable for the one [builder] is handed. That keeps each call site a
/// two-line change.
///
/// It rebuilds once when the stock lookup lands. Until then it renders the
/// products in the order it was given, so nothing is held back behind a
/// spinner; the sold-out rows simply settle into place a frame or two later.
class AzyStockOrderedProducts extends StatefulWidget {
  const AzyStockOrderedProducts({
    super.key,
    required this.products,
    required this.builder,
  });

  /// The listing to order. Preserved exactly; only the order changes.
  final List<ProductsRecord> products;

  /// Builds the listing from the ordered list.
  final Widget Function(BuildContext context, List<ProductsRecord> products)
      builder;

  @override
  State<AzyStockOrderedProducts> createState() =>
      _AzyStockOrderedProductsState();
}

class _AzyStockOrderedProductsState extends State<AzyStockOrderedProducts> {
  static String _inventoryIdOf(ProductsRecord product) =>
      product.product.inventoryId;

  @override
  void initState() {
    super.initState();
    _loadStock();
  }

  @override
  void didUpdateWidget(AzyStockOrderedProducts oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.products, widget.products)) {
      _loadStock();
    }
  }

  /// Fetches whatever stock is not cached yet, then repaints.
  void _loadStock() {
    final ids = AzyStockOrder.inventoryIdsOf(widget.products, _inventoryIdOf);
    if (ids.isEmpty) {
      return;
    }
    AzyInventoryStock.instance.ensureLoaded(ids).then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context,
        AzyStockOrder.inStockFirst(
          widget.products,
          _inventoryIdOf,
          AzyInventoryStock.instance.snapshot,
        ),
      );
}
