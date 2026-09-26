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
  });

  final ProductsRecord product;

  /// Quantity, Add to Bag and the other buttons, revealed once complete.
  final Widget actions;

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
    final theme = FlutterFlowTheme.of(context);
    final remaining = remainingFor(product, FFAppState());
    final hasChoices = AzyProductOptions.requiredOptionIds(
      product.productAttribute,
    ).isNotEmpty;

    return Container(
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
          if (hasChoices)
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 16.0, 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getVariableText(
                        enText: 'Choose your options',
                        arText: 'اختر الخيارات',
                      ),
                      style: theme.titleSmall.override(
                        fontFamily: 'almarai',
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (remaining > 0)
                    Text(
                      FFLocalizations.of(context).getVariableText(
                        enText: '$remaining left',
                        arText: 'متبقي $remaining',
                      ),
                      style: theme.bodySmall.override(
                        fontFamily: 'almarai',
                        color: theme.velvet,
                        letterSpacing: 0.0,
                      ),
                    )
                  else
                    Icon(
                      Icons.check_circle_rounded,
                      color: theme.velvet,
                      size: 18.0,
                    ),
                ],
              ),
            ),
          if (product.productAttribute.isNotEmpty)
            ProductOptionsBarWidget(product: product),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            alignment: Alignment.topCenter,
            child: remaining == 0
                ? actions
                : const SizedBox(width: double.infinity, height: 8.0),
          ),
        ],
      ),
    );
  }
}
