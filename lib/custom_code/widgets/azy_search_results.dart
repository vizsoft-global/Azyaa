// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/backend/backend.dart';
import '/backend/catalog/product_frame.dart';
import '/backend/search/search.dart';
import '/azyaa_group_b/creator/creators_individual/creators_individual_widget.dart';
import '/custom_code/widgets/azy_recent_searches.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';

/// Grouped, instantly-updating search results.
///
/// Sections are Products / Shops / Creators, in that fixed order, and only
/// sections with hits are shown. Products reuse [ProductGridWidget] so a search
/// result looks and behaves exactly like a browsed one — including the
/// out-of-stock grey-out, which that card resolves from its own inventory
/// stream.
///
/// Tapping a shop narrows the search to that shop rather than navigating,
/// because there is no brand-detail route in this app. Because products carry
/// their shop's name as a hidden keyword, re-querying with the shop's name is
/// what actually surfaces that shop's catalogue.
class AzySearchResultsView extends StatelessWidget {
  const AzySearchResultsView({
    super.key,
    required this.results,
    this.query = '',
    this.recent = const [],
    this.onRecentSelected,
    this.onRecentRemoved,
    this.onRecentCleared,
    this.onShopSelected,
    this.width,
    this.height,
  });

  final AzySearchResults results;

  /// The live query. Empty means "show recent searches instead".
  final String query;

  /// Stored terms for this surface, most recent first.
  final List<String> recent;

  final void Function(String term)? onRecentSelected;
  final void Function(String term)? onRecentRemoved;
  final VoidCallback? onRecentCleared;

  /// Called with a shop's name when its row is tapped.
  final void Function(String shopName)? onShopSelected;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (query.trim().isEmpty) {
      return _buildRecent(context);
    }
    if (results.isEmpty) {
      return _buildNoResults(context);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final group in results.groups)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader(context, group),
                const SizedBox(height: 10.0),
                _buildSectionBody(context, group),
              ],
            ),
          ),
      ],
    );
  }

  /// "Products · 12" style heading with the group's hit count.
  ///
  /// The count matters: it tells the user a section is worth scrolling before
  /// they commit the gesture.
  Widget _buildSectionHeader(BuildContext context, AzySearchGroup group) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(_iconFor(group.kind), size: 16.0, color: theme.primaryText),
          const SizedBox(width: 6.0),
          Text(
            _labelFor(context, group.kind),
            style: theme.titleSmall.override(
              fontFamily: 'almarai',
              color: theme.primaryText,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            group.count.toString(),
            style: theme.bodySmall.override(
              fontFamily: 'almarai',
              color: theme.secondaryText,
              letterSpacing: 0.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionBody(BuildContext context, AzySearchGroup group) {
    switch (group.kind) {
      case AzySearchKind.product:
        return _buildProductGrid(context, group.hits);
      case AzySearchKind.shop:
        return _buildShopList(context, group.hits);
      case AzySearchKind.creator:
        return _buildCreatorList(context, group.hits);
    }
  }

  static IconData _iconFor(AzySearchKind kind) {
    switch (kind) {
      case AzySearchKind.product:
        return Icons.checkroom_outlined;
      case AzySearchKind.shop:
        return Icons.storefront_outlined;
      case AzySearchKind.creator:
        return Icons.person_outline;
    }
  }

  /// Localized section heading for one kind.
  static String _labelFor(BuildContext context, AzySearchKind kind) {
    switch (kind) {
      case AzySearchKind.product:
        return FFLocalizations.of(context).getVariableText(
          enText: 'Products',
          arText: 'منتجات',
        );
      case AzySearchKind.shop:
        return FFLocalizations.of(context).getVariableText(
          enText: 'Shops',
          arText: 'المتاجر',
        );
      case AzySearchKind.creator:
        return FFLocalizations.of(context).getVariableText(
          enText: 'Creators',
          arText: 'المبدعين',
        );
    }
  }

  /// Product hits as a grid.
  ///
  /// Geometry copied from the shop page's browse grid so moving between
  /// browsing and searching does not reflow the cards. The out-of-stock
  /// treatment comes for free: [ProductGridWidget] resolves its own inventory
  /// stream and dims itself.
  Widget _buildProductGrid(BuildContext context, List<AzySearchHit> hits) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.sizeOf(context).width < kBreakpointMedium ? 2 : 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 24.0,
          childAspectRatio: AzyProductFrame.cardAspectRatio,
        ),
        itemCount: hits.length,
        itemBuilder: (context, index) {
          final hit = hits[index];
          final payload = hit.document.payload;
          if (payload is! ProductsRecord) {
            // Only reachable if a document were indexed without its record,
            // which would be a bug in the service rather than in user data.
            return const SizedBox.shrink();
          }
          return ProductGridWidget(
            key: ValueKey('azy_search_${hit.document.key}'),
            product: payload,
          );
        },
      ),
    );
  }

  Widget _buildShopList(BuildContext context, List<AzySearchHit> hits) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final hit in hits)
          _buildRow(
            context,
            hit: hit,
            fallbackIcon: Icons.storefront_outlined,
            trailing: onShopSelected == null
                ? null
                : FFLocalizations.of(context).getVariableText(
                    enText: 'See items',
                    arText: 'شاهد المنتجات',
                  ),
            onTap: onShopSelected == null
                ? null
                : () => onShopSelected!(hit.title),
          ),
      ],
    );
  }

  Widget _buildCreatorList(BuildContext context, List<AzySearchHit> hits) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final hit in hits)
          _buildRow(
            context,
            hit: hit,
            fallbackIcon: Icons.person_outline,
            trailing: null,
            onTap: () => context.pushNamed(
              CreatorsIndividualWidget.routeName,
              queryParameters: {
                // The creator page looks this up with
                // `where('uid', isEqualTo: creatorUid)`, and the service set the
                // hit id from that same `uid` field, so the two line up.
                'creatorUid': hit.document.id,
              },
            ),
          ),
      ],
    );
  }

  /// One shop or creator row: avatar, title, subtitle, optional trailing hint.
  Widget _buildRow(
    BuildContext context, {
    required AzySearchHit hit,
    required IconData fallbackIcon,
    required String? trailing,
    required VoidCallback? onTap,
  }) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
      child: Material(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: hit.imageUrl.isEmpty
                        ? _iconAvatar(context, fallbackIcon)
                        : CachedNetworkImage(
                            imageUrl: hit.imageUrl,
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) =>
                                _iconAvatar(context, fallbackIcon),
                            placeholder: (_, __) =>
                                _iconAvatar(context, fallbackIcon),
                          ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hit.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.bodyMedium.override(
                          fontFamily: 'almarai',
                          color: theme.primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (hit.subtitle.isNotEmpty)
                        Text(
                          hit.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.bodySmall.override(
                            fontFamily: 'almarai',
                            color: theme.secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                    ],
                  ),
                ),
                if (trailing != null)
                  Text(
                    trailing,
                    style: theme.bodySmall.override(
                      fontFamily: 'almarai',
                      color: theme.primary,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Placeholder used when a shop or creator has no usable image.
  static Widget _iconAvatar(BuildContext context, IconData icon) {
    final theme = FlutterFlowTheme.of(context);
    return ColoredBox(
      color: theme.primaryBackground,
      child: Center(
        child: Icon(icon, size: 20.0, color: theme.secondaryText),
      ),
    );
  }

  /// Recent searches, shown in place of results while the box is empty.
  ///
  /// Delegates to [AzyRecentSearchesView] so the shop page and the creators page
  /// present history identically.
  Widget _buildRecent(BuildContext context) => AzyRecentSearchesView(
        terms: recent,
        onSelected: onRecentSelected,
        onRemoved: onRecentRemoved,
        onCleared: onRecentCleared,
      );

  Widget _buildNoResults(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, size: 36.0, color: theme.secondaryText),
          const SizedBox(height: 10.0),
          Text(
            FFLocalizations.of(context).getVariableText(
              enText: 'No results for "$query"',
              arText: 'لا توجد نتائج عن "$query"',
            ),
            textAlign: TextAlign.center,
            style: theme.bodyMedium.override(
              fontFamily: 'almarai',
              color: theme.primaryText,
              letterSpacing: 0.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            FFLocalizations.of(context).getVariableText(
              enText: 'Try a shorter word, or check the spelling.',
              arText: 'جرّب كلمة أقصر، أو تحقّق من الإملاء.',
            ),
            textAlign: TextAlign.center,
            style: theme.bodySmall.override(
              fontFamily: 'almarai',
              color: theme.secondaryText,
              letterSpacing: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
