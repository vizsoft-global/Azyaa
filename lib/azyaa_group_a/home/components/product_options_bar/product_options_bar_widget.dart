// The option chips inside the product page's purchase panel.
//
// WHY THIS EXISTS
// ---------------
// These rows used to live in the page body, between the price and the
// description, and the bottom bar sat there dead ("Select options") until the
// shopper scrolled back up and answered them. They now live in the sticky
// purchase panel, each option as a row of tappable chips, so the choice is
// always one tap away and Add to Bag appears the moment the last one is picked.
//
// The rows are rendered in the product's own stored order, deliberately not
// sorted by option id: the chosen term is written by position and the shopper's
// selection is seeded from that same stored order, so sorting here put the
// index and the seeded list out of step -- the term saved for one option could
// land on another (the "Green Gown" ticket).

import '/azyaa_group_a/home/components/size_chart_default/size_chart_default_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductOptionsBarWidget extends StatelessWidget {
  const ProductOptionsBarWidget({
    super.key,
    required this.product,
  });

  final ProductsRecord product;

  List<ProductAttributesNewStruct>? _selection() => FFAppState()
      .UserDataFlow
      .userProductSwatchesList
      .where((e) => e.viewedItemId == product.productId)
      .firstOrNull
      ?.productAttribute;

  String? _chosenTermAt(int index) =>
      _selection()?.elementAtOrNull(index)?.attributesDefaultTermId;

  void _choose(int attributeListIndex, String termListItem) {
    if (_selection() == null) {
      // A fresh copy with nothing chosen: seeding with the product's own
      // option structs would write the shopper's picks into the product record.
      FFAppState().updateUserDataFlowStruct(
        (e) => e
          ..updateUserProductSwatchesList(
            (e) => e.add(UserRecentViewedListStruct(
              createdAt: getCurrentTimestamp,
              viewedItemId: product.productId,
              productAttribute: [
                for (final option in product.productAttribute)
                  ProductAttributesNewStruct(
                    attributesId: option.attributesId,
                    attributesBrandTermIds:
                        option.attributesBrandTermIds.toList(),
                  ),
              ],
              viewedEntityType: 'product',
            )),
          ),
      );
    }
    FFAppState().updateUserDataFlowStruct(
      (e) => e
        ..updateUserProductSwatchesList(
          (e) => e
              .firstWhere((s) => s.viewedItemId == product.productId)
              .updateProductAttribute(
                (e) => e[attributeListIndex]
                  ..attributesDefaultTermId = termListItem,
              ),
        ),
    );
    FFAppState().update(() {});
  }

  @override
  Widget build(BuildContext context) {
    final attributeList = product.productAttribute.toList();

    if (attributeList.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: attributeList.length,
      itemBuilder: (context, attributeListIndex) {
        final attributeListItem = attributeList[attributeListIndex];
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
          child: StreamBuilder<List<AttributesRecord>>(
            stream: queryAttributesRecord(
              queryBuilder: (attributesRecord) => attributesRecord
                  .where(
                    'attribute_id',
                    isEqualTo: attributeListItem.attributesId,
                  )
                  .where(
                    'status',
                    isEqualTo: 'active',
                  ),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const SizedBox.shrink();
              }
              final variationAttributesRecord = snapshot.data!.first;
              final termList =
                  attributeListItem.attributesBrandTermIds.toList();

              return Row(
                children: [
                  SizedBox(
                    width: 64.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getVariableText(
                            enText: _attributeName(variationAttributesRecord,
                                arabic: false),
                            arText: _attributeName(variationAttributesRecord,
                                arabic: true),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Cairo',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        if (variationAttributesRecord.attributeId == '1000')
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => _openSizeChart(context),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vhv11107' /* Size Chart */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'almarai',
                                    color: FlutterFlowTheme.of(context).velvet,
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                    height: 34.0,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: termList.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 6.0),
                      itemBuilder: (context, termListIndex) {
                        final termListItem = termList[termListIndex];
                        return StreamBuilder<List<BrandsRecord>>(
                          stream: queryBrandsRecord(
                            queryBuilder: (brandsRecord) => brandsRecord
                                .where(
                                  'brand_id',
                                  isEqualTo: termListItem,
                                )
                                .where(
                                  'status',
                                  isEqualTo: 'active',
                                ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            final stackBrandsRecord = snapshot.data!.first;
                            final selected = _chosenTermAt(attributeListIndex) ==
                                stackBrandsRecord.brandId;

                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () =>
                                  _choose(attributeListIndex, termListItem),
                              child: Center(
                                child: (variationAttributesRecord.attributeId ==
                                            '1001') &&
                                        (stackBrandsRecord.brandInfo.color !=
                                            null)
                                    ? _colorChip(
                                        context, stackBrandsRecord, selected)
                                    : _textChip(
                                        context, stackBrandsRecord, selected),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  static String _attributeName(AttributesRecord record,
      {required bool arabic}) {
    String pick(String en, String ar) => arabic ? ar : en;
    final custom = pick(record.attributeInfoCustomTranslate.name.en,
        record.attributeInfoCustomTranslate.name.ar);
    if (custom != '') {
      return custom;
    }
    final translated = pick(record.attributeInfoTranslate.name.en,
        record.attributeInfoTranslate.name.ar);
    if (translated != '') {
      return translated;
    }
    return record.attributeInfo.name;
  }

  static String _termName(BrandsRecord record, {required bool arabic}) {
    String pick(String en, String ar) => arabic ? ar : en;
    final custom = pick(record.brandInfoCustomTranslate.name.en,
        record.brandInfoCustomTranslate.name.ar);
    if (custom != '') {
      return custom;
    }
    final translated = pick(
        record.brandInfoTranslate.name.en, record.brandInfoTranslate.name.ar);
    if (translated != '') {
      return translated;
    }
    return record.brandInfo.name;
  }

  Widget _colorChip(
      BuildContext context, BrandsRecord term, bool selected) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).primaryBackground,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 26.0,
          height: 26.0,
          decoration: BoxDecoration(
            color: term.brandInfo.color,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0x27000000)),
          ),
        ),
      ),
    );
  }

  Widget _textChip(BuildContext context, BrandsRecord term, bool selected) {
    final color = selected
        ? FlutterFlowTheme.of(context).primaryText
        : FlutterFlowTheme.of(context).secondaryText;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: color, width: selected ? 1.5 : 1.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 10.0, 4.0),
        child: Text(
          FFLocalizations.of(context).getVariableText(
            enText: _termName(term, arabic: false),
            arText: _termName(term, arabic: true),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'almarai',
                color: color,
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }

  Future<void> _openSizeChart(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: const AlignmentDirectional(0.0, 0.0)
              .resolve(Directionality.of(context)),
          child: WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SizedBox(
                width: 600.0,
                child: SizeChartDefaultWidget(
                  product: product,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
