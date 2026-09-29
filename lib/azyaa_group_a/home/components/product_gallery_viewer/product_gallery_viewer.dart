// Full-screen product photos: pinch or double-tap to zoom, swipe to the next
// or previous photo once zoomed back out, and a thumbnail strip to jump.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductGalleryViewer extends StatefulWidget {
  const ProductGalleryViewer({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  final List<String> images;
  final int initialIndex;

  /// Hero tag shared by a page thumbnail and its full-screen photo. The index
  /// keeps two copies of the same photo from claiming one tag.
  static String heroTag(String url, int index) => 'product-gallery-$index-$url';

  /// Opens the viewer and resolves to the index the shopper ended on.
  static Future<int?> open(
    BuildContext context, {
    required List<String> images,
    int initialIndex = 0,
  }) {
    return Navigator.of(context).push<int>(
      PageRouteBuilder<int>(
        opaque: false,
        barrierColor: Colors.black,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (_, __, ___) => ProductGalleryViewer(
          images: images,
          initialIndex: initialIndex,
        ),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  State<ProductGalleryViewer> createState() => _ProductGalleryViewerState();
}

class _ProductGalleryViewerState extends State<ProductGalleryViewer> {
  late final PageController _pageController;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.images.length - 1);
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _close() => Navigator.of(context).pop(_index);

  @override
  Widget build(BuildContext context) {
    final images = widget.images;
    final thumbWidth =
        (56 * MediaQuery.devicePixelRatioOf(context)).round();

    return PopScope<int>(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          _close();
        }
      },
      child: Material(
        color: Colors.black,
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              pageController: _pageController,
              itemCount: images.length,
              backgroundDecoration: const BoxDecoration(color: Colors.black),
              onPageChanged: (i) => setState(() => _index = i),
              loadingBuilder: (_, __) => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              builder: (context, i) => PhotoViewGalleryPageOptions(
                imageProvider: CachedNetworkImageProvider(images[i]),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 4.0,
                heroAttributes: PhotoViewHeroAttributes(
                  tag: ProductGalleryViewer.heroTag(images[i], i),
                ),
              ),
            ),
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: _close,
                    icon: const Icon(Icons.close, size: 30, color: Colors.white),
                  ),
                  const Spacer(),
                  if (images.length > 1)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: Text(
                        '${_index + 1} / ${images.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (images.length > 1)
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SizedBox(
                      height: 72.0,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        itemCount: images.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                        itemBuilder: (context, i) => GestureDetector(
                          onTap: () => _pageController.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOut,
                          ),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 150),
                            opacity: i == _index ? 1.0 : 0.5,
                            child: Container(
                              width: 56.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  color: i == _index
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                imageUrl: images[i],
                                fit: BoxFit.cover,
                                memCacheWidth: thumbWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
