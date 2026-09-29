// The sticky card at the bottom of the product page: option chips on top, and
// the quantity stepper and Add to Bag underneath once every option is chosen.
//
// The chips stay visible after the shopper completes a choice, so another
// colour or size can be picked and added without leaving the page.

import '/azyaa_group_a/home/components/product_options_bar/product_options_bar_widget.dart';
import '/backend/backend.dart';
import '/backend/catalog/product_options.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class ProductPurchasePanelWidget extends StatelessWidget {
  const ProductPurchasePanelWidget({
    super.key,
    required this.product,
    required this.actions,
    required this.minimized,
    required this.onMinimizedChanged,
  });

  final ProductsRecord product;

  /// Quantity, Add to Bag and the other buttons. The page keeps the buy
  /// controls out until every option is chosen; "Notify me" and the creator
  /// buttons do not wait for options.
  final Widget actions;

  /// Collapsed to a bubble at the bottom end, so the page can be read unobstructed.
  final bool minimized;
  final ValueChanged<bool> onMinimizedChanged;

  /// Options the shopper still has to pick for [product].
  static int remainingFor(ProductsRecord product, FFAppState appState) {
    final required =
        AzyProductOptions.requiredOptionIds(product.productAttribute);
    final selection = appState.UserDataFlow.userProductSwatchesList
        .where((e) => e.viewedItemId == product.productId)
        .firstOrNull
        ?.productAttribute;
    final chosen = AzyProductOptions.chosenOptionIds(selection ?? const []);
    return required.where((id) => !chosen.contains(id)).length;
  }

  @override
  Widget build(BuildContext context) {
    final remaining = remainingFor(product, FFAppState());

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          alignment: AlignmentDirectional.bottomEnd
              .resolve(Directionality.of(context)),
          child: child,
        ),
      ),
      child: minimized
          ? _bubble(context, remaining)
          : _panel(context),
    );
  }

  Widget _bubble(BuildContext context, int remaining) {
    final theme = FlutterFlowTheme.of(context);
    return Align(
      key: const ValueKey('bubble'),
      alignment: AlignmentDirectional.bottomEnd,
      heightFactor: 1.0,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Material(
              color: theme.primary,
              shape: const CircleBorder(),
              elevation: 6.0,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => onMinimizedChanged(false),
                child: SizedBox(
                  width: 56.0,
                  height: 56.0,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: theme.info,
                    size: 26.0,
                  ),
                ),
              ),
            ),
            if (remaining > 0)
              PositionedDirectional(
                top: -2.0,
                end: -2.0,
                child: Container(
                  constraints:
                      const BoxConstraints(minWidth: 20.0, minHeight: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.velvet,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '$remaining',
                    style: theme.bodySmall.override(
                      fontFamily: 'almarai',
                      color: theme.info,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _panel(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      key: const ValueKey('panel'),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primaryBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16.0,
            color: Color(0x1F000000),
            offset: Offset(0.0, -4.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8.0),
          if (product.productAttribute.isNotEmpty)
            ProductOptionsBarWidget(product: product),
          Row(
            children: [
              Expanded(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  alignment: Alignment.topCenter,
                  child: actions,
                ),
              ),
              IconButton(
                tooltip: FFLocalizations.of(context).getVariableText(
                  enText: 'Minimize',
                  arText: 'تصغير',
                ),
                visualDensity: VisualDensity.compact,
                onPressed: () => onMinimizedChanged(true),
                icon: Icon(
                  Icons.close_fullscreen_rounded,
                  color: theme.secondaryText,
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 4.0),
            ],
          ),
        ],
      ),
    );
  }
}
