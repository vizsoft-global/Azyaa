// Automatic FlutterFlow imports
import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/shortlist/shortlist_content.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/azyaa_group_a/home/components/product_grid/product_grid_widget.dart';
import '/index.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';

/// The body of the Shortlist screen: the customer's saved products and the
/// designers and creators they follow, for the chip that is picked.
///
/// Products that are no longer on sale and accounts that no longer exist are
/// left out, so the grid never shows an empty slot.
class AzyShortlistBody extends StatefulWidget {
  const AzyShortlistBody({
    super.key,
    required this.chosen,
    this.refreshTick = 0,
  });

  /// Text of the picked chip (already translated), or null.
  final String? chosen;

  /// Changes when the person pulls to refresh, to load everything again.
  final int refreshTick;

  @override
  State<AzyShortlistBody> createState() => _AzyShortlistBodyState();
}

class _Loaded {
  const _Loaded(this.products, this.designers, this.creators);
  final List<ProductsRecord> products;
  final List<UsersRecord> designers;
  final List<UsersRecord> creators;
  bool get isEmpty => products.isEmpty && designers.isEmpty && creators.isEmpty;
}

class _AzyShortlistBodyState extends State<AzyShortlistBody> {
  String _loadedFor = '';
  Future<_Loaded>? _future;

  List<UserWishlistItemStruct> get _saved =>
      currentUserDocument?.userWishlistItem.toList() ?? const [];

  AzyShortlistContent _content(BuildContext context) {
    final l = FFLocalizations.of(context);
    return azyShortlistContent(
      kind: azyShortlistKindFor(
        widget.chosen,
        designerLabel: l.getText('zrntmki9' /* Designer */),
        creatorLabel: l.getText('atr7b38u' /* Creator */),
        productLabel: l.getText('n51rftkg' /* Product */),
      ),
      saved: _saved
          .map((item) => (id: item.wishlistItemId, type: item.entityType)),
      followedDesigners:
          (currentUserDocument?.userDesignerFollowing ?? const []).map((r) => r.id),
      followedCreators:
          (currentUserDocument?.userCreatorFollowing ?? const []).map((r) => r.id),
    );
  }

  Future<List<ProductsRecord>> _products(List<String> ids) async {
    final found = <String, ProductsRecord>{};
    for (final chunk in azyChunks(ids)) {
      final rows = await queryProductsRecordOnce(
        queryBuilder: (q) => q.where('product_id', whereIn: chunk),
      );
      for (final row in rows) {
        if (row.status == 'active' && row.productId.isNotEmpty) {
          found[row.productId] = row;
        }
      }
    }
    return azyInSavedOrder(ids, found);
  }

  Future<List<UsersRecord>> _people(List<String> ids) async {
    final found = <String, UsersRecord>{};
    await Future.wait(ids.map((id) async {
      try {
        final snap =
            await FirebaseFirestore.instance.collection('users').doc(id).get();
        if (snap.exists) found[id] = UsersRecord.fromSnapshot(snap);
      } catch (_) {
        // One account that cannot be read must not empty the whole list.
      }
    }));
    return azyInSavedOrder(ids, found);
  }

  Future<_Loaded> _load(AzyShortlistContent content) async {
    final results = await Future.wait([
      _products(content.productIds),
      _people(content.designerIds),
      _people(content.creatorIds),
    ]);
    return _Loaded(
      results[0] as List<ProductsRecord>,
      results[1] as List<UsersRecord>,
      results[2] as List<UsersRecord>,
    );
  }

  UserWishlistItemStruct? _savedItemFor(String productId) {
    for (final item in _saved) {
      if (item.wishlistItemId == productId) return item;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final content = _content(context);
    final signature = [
      widget.refreshTick,
      content.productIds.join(','),
      content.designerIds.join(','),
      content.creatorIds.join(','),
    ].join('|');
    if (signature != _loadedFor || _future == null) {
      _loadedFor = signature;
      _future = _load(content);
    }

    final kind = azyShortlistKindFor(
      widget.chosen,
      designerLabel:
          FFLocalizations.of(context).getText('zrntmki9' /* Designer */),
      creatorLabel:
          FFLocalizations.of(context).getText('atr7b38u' /* Creator */),
      productLabel:
          FFLocalizations.of(context).getText('n51rftkg' /* Product */),
    );

    if (content.isEmpty) return _AzyShortlistEmpty(kind: kind);

    return FutureBuilder<_Loaded>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _AzyShortlistMessage(
            icon: Icons.wifi_off_rounded,
            title: FFLocalizations.of(context).getVariableText(
              enText: 'Your shortlist could not be loaded.',
              arText: 'تعذّر تحميل قائمتك المختصرة.',
            ),
            subtitle: FFLocalizations.of(context).getVariableText(
              enText: 'Check your connection and pull down to try again.',
              arText: 'تحقّق من اتصالك ثم اسحب للأسفل للمحاولة مرة أخرى.',
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 64.0),
            child: Center(
              child: SizedBox(
                width: 28.0,
                height: 28.0,
                child: CircularProgressIndicator(strokeWidth: 2.4),
              ),
            ),
          );
        }
        final loaded = snapshot.data!;
        if (loaded.isEmpty) return _AzyShortlistEmpty(kind: kind);

        final showHeadings = kind == AzyShortlistKind.all;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (loaded.products.isNotEmpty) ...[
              if (showHeadings)
                _AzyShortlistHeading(
                  FFLocalizations.of(context).getVariableText(
                      enText: 'Products', arText: 'المنتجات'),
                  loaded.products.length,
                ),
              Wrap(
                children: [
                  for (final product in loaded.products)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 8.0, 24.0),
                      child: SizedBox(
                        width: (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium
                                ? 160
                                : 180)
                            .toDouble(),
                        height: 280.0,
                        child: ProductGridWidget(
                          key: ValueKey('shortlist_product_${product.productId}'),
                          product: product,
                          checkboxStatus: 'show',
                          checkboxComponentType: 'wishlist',
                          wishlistDatatype: _savedItemFor(product.productId),
                        ),
                      ),
                    ),
                ],
              ),
            ],
            if (loaded.designers.isNotEmpty) ...[
              if (showHeadings)
                _AzyShortlistHeading(
                  FFLocalizations.of(context).getVariableText(
                      enText: 'Designers', arText: 'المصممون'),
                  loaded.designers.length,
                ),
              for (final person in loaded.designers)
                _AzyShortlistPerson(person: person, isDesigner: true),
              const SizedBox(height: 12.0),
            ],
            if (loaded.creators.isNotEmpty) ...[
              if (showHeadings)
                _AzyShortlistHeading(
                  FFLocalizations.of(context).getVariableText(
                      enText: 'Creators', arText: 'المبدعون'),
                  loaded.creators.length,
                ),
              for (final person in loaded.creators)
                _AzyShortlistPerson(person: person, isDesigner: false),
              const SizedBox(height: 12.0),
            ],
          ],
        );
      },
    );
  }
}

class _AzyShortlistHeading extends StatelessWidget {
  const _AzyShortlistHeading(this.title, this.count);

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 12.0),
      child: Row(
        children: [
          Text(
            title,
            style: theme.titleMedium.override(
              fontFamily: 'almarai',
              color: theme.primaryText,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            '$count',
            style: theme.bodyMedium.override(
              fontFamily: 'almarai',
              color: theme.secondaryText,
              fontSize: 14.0,
              letterSpacing: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}

/// One followed designer or creator: picture, name, and a tap through to
/// their page.
class _AzyShortlistPerson extends StatelessWidget {
  const _AzyShortlistPerson({required this.person, required this.isDesigner});

  final UsersRecord person;
  final bool isDesigner;

  String get _name {
    final brand = isDesigner
        ? person.designerMainInfo.designerInfo.name
        : '';
    if (brand.trim().isNotEmpty) return brand.trim();
    return person.displayName.trim();
  }

  String get _photo {
    final brand = isDesigner
        ? person.designerMainInfo.designerInfo.brandPhoto
        : person.creatorMainInfo.creatorInfo.brandPhoto;
    if (brand.trim().isNotEmpty) return brand.trim();
    // Some accounts have only gallery pictures, which is what their own page shows.
    final gallery = isDesigner
        ? person.designerMainInfo.designerInfo.brandGallery
        : person.creatorMainInfo.creatorInfo.brandGallery;
    for (final picture in gallery) {
      if (picture.trim().isNotEmpty) return picture.trim();
    }
    return person.photoUrl.trim();
  }

  void _open(BuildContext context) {
    final uid = person.uid.isNotEmpty ? person.uid : person.reference.id;
    context.pushNamed(
      isDesigner ? DesignerWidget.routeName : CreatorsIndividualWidget.routeName,
      queryParameters: {
        (isDesigner ? 'designerUid' : 'creatorUid'):
            serializeParam(uid, ParamType.String),
      }.withoutNulls,
      extra: <String, dynamic>{
        '__transition_info__': const TransitionInfo(
          hasTransition: true,
          transitionType: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final name = _name;
    final photo = _photo;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () => _open(context),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: theme.secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: theme.border),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child: photo.isEmpty
                    ? _placeholder(theme)
                    : CachedNetworkImage(
                        imageUrl: photo,
                        width: 56.0,
                        height: 56.0,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 150),
                        placeholder: (_, __) => _placeholder(theme),
                        errorWidget: (_, __, ___) => _placeholder(theme),
                      ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.isEmpty
                          ? FFLocalizations.of(context).getText(isDesigner
                              ? 'zrntmki9' /* Designer */
                              : 'atr7b38u' /* Creator */)
                          : name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.bodyLarge.override(
                        fontFamily: 'almarai',
                        color: theme.primaryText,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      FFLocalizations.of(context).getText(isDesigner
                          ? 'zrntmki9' /* Designer */
                          : 'atr7b38u' /* Creator */),
                      style: theme.bodySmall.override(
                        fontFamily: 'almarai',
                        color: theme.secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: theme.primary, size: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _placeholder(FlutterFlowTheme theme) => Container(
        width: 56.0,
        height: 56.0,
        color: theme.alternate,
        alignment: Alignment.center,
        child: Icon(
          isDesigner ? Icons.storefront_outlined : Icons.person_outline,
          color: theme.secondaryText,
          size: 26.0,
        ),
      );
}

/// Shown when there is nothing saved for the picked chip, with a way to go
/// and find something.
class _AzyShortlistEmpty extends StatelessWidget {
  const _AzyShortlistEmpty({required this.kind});

  final AzyShortlistKind kind;

  @override
  Widget build(BuildContext context) {
    final l = FFLocalizations.of(context);
    switch (kind) {
      case AzyShortlistKind.designer:
        return _AzyShortlistMessage(
          icon: Icons.storefront_outlined,
          title: l.getVariableText(
            enText: 'You are not following any designers yet.',
            arText: 'أنت لا تتابع أي مصمّم بعد.',
          ),
          subtitle: l.getVariableText(
            enText: 'Follow a designer and they will appear here.',
            arText: 'تابِع مصمّماً وسيظهر هنا.',
          ),
          buttonText: l.getVariableText(
            enText: 'Explore designers',
            arText: 'استكشف المصممين',
          ),
          onPressed: () => context.pushNamed(DesignersListWidget.routeName),
        );
      case AzyShortlistKind.creator:
        return _AzyShortlistMessage(
          icon: Icons.person_outline,
          title: l.getVariableText(
            enText: 'You are not following any creators yet.',
            arText: 'أنت لا تتابع أي مبدع بعد.',
          ),
          subtitle: l.getVariableText(
            enText: 'Follow a creator and they will appear here.',
            arText: 'تابِع مبدعاً وسيظهر هنا.',
          ),
          buttonText: l.getVariableText(
            enText: 'Explore Creators',
            arText: 'استكشف المبدعين',
          ),
          onPressed: () => context.pushNamed(CreatorsWidget.routeName),
        );
      case AzyShortlistKind.product:
      case AzyShortlistKind.all:
        return _AzyShortlistMessage(
          icon: Icons.favorite_border,
          title: l.getText(
              'fmcvv2hz' /* Nothing here yet! Start adding... */),
          subtitle: l.getText('q666blv1' /* Go ahead—add your dream picks! */),
          buttonText: l.getText('f7gafm4z' /* Start adding */),
          onPressed: () => context.pushNamed(ShopWidget.routeName),
        );
    }
  }
}

class _AzyShortlistMessage extends StatelessWidget {
  const _AzyShortlistMessage({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onPressed,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 48.0, 8.0, 24.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 44.0, color: theme.secondaryText),
            const SizedBox(height: 16.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.titleMedium.override(
                fontFamily: 'almarai',
                color: theme.primaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.bodyMedium.override(
                fontFamily: 'almarai',
                color: theme.secondaryText,
                fontSize: 14.0,
                letterSpacing: 0.0,
              ),
            ),
            if (buttonText != null && onPressed != null) ...[
              const SizedBox(height: 20.0),
              OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200.0, 44.0),
                  foregroundColor: theme.primaryText,
                  side: BorderSide(color: theme.border),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  buttonText!,
                  style: theme.titleSmall.override(
                    fontFamily: 'almarai',
                    color: theme.primaryText,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
