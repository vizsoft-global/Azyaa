import 'dart:async';

import 'package:flutter/material.dart';

/// Spinner colour for pull to refresh, the same purple on every page.
const Color kAzyRefreshColor = Color(0xFF7F56D9);

/// How many items a list shows at first, and how many each "load more" adds.
const int kAzyPageSize = 20;

/// Load more starts when less than this much content is left below the screen.
const double kAzyLoadMoreDistance = 600.0;

/// Shows a long list a page at a time.
///
/// The app's product lists are built eagerly inside the page's scroll view, so
/// every product in the query used to be laid out before the first frame. A
/// pager hands the list builder only the first [shown] items; the page grows it
/// as the user scrolls towards the end.
///
/// It windows a list that is already in memory. It does not change the query,
/// so sorting and filtering done on the phone (in-stock first, the filter
/// sheet) still see every product.
class AzyPager {
  AzyPager({this.pageSize = kAzyPageSize})
      : assert(pageSize > 0),
        _shown = pageSize;

  final int pageSize;
  int _shown;
  int _total = 0;

  /// How many items the list may show right now.
  int get shown => _shown;

  /// Length of the last list passed to [window].
  int get total => _total;

  /// True when the last list had more items than are shown.
  bool get hasMore => _shown < _total;

  /// The first [shown] items of [all], in the order given.
  ///
  /// Call it on the final list, after filtering and sorting.
  List<T> window<T>(List<T> all) {
    _total = all.length;
    return all.length <= _shown ? all : all.sublist(0, _shown);
  }

  /// Shows one more page. Returns false, and changes nothing, when everything
  /// is already shown, so callers can skip the rebuild.
  bool loadMore() {
    if (!hasMore) {
      return false;
    }
    _shown += pageSize;
    return true;
  }

  /// Back to the first page, for example after pull to refresh.
  void reset() {
    _shown = pageSize;
  }
}

/// Keeps the refresh spinner up for a moment, and until [work] is done.
///
/// Most pages refresh by rebuilding, which re-runs their queries without giving
/// anything to await. A spinner that vanished at once would look like nothing
/// happened, so it stays for [minimum]. [work] is never waited on for longer
/// than [maximum], and its errors are ignored: a failed refresh leaves the page
/// as it was.
Future<void> azyRefreshHold([
  Future<void>? work,
  Duration minimum = const Duration(milliseconds: 500),
  Duration maximum = const Duration(seconds: 4),
]) async {
  final floor = Future<void>.delayed(minimum);
  if (work != null) {
    try {
      await work.timeout(maximum);
    } catch (_) {
      // Refresh is best effort.
    }
  }
  await floor;
}

/// Pull to refresh, and optionally load more on scroll, for a page's scroll
/// view.
///
/// Wrap the page's own vertical scroll view, not a list nested inside it: a
/// shrink-wrapped list never overscrolls, so a [RefreshIndicator] around one
/// never fires. The scroll view needs [AlwaysScrollableScrollPhysics] so a page
/// shorter than the screen can still be pulled.
///
/// [onNearEnd] is called while fewer than [kAzyLoadMoreDistance] pixels remain
/// below the screen. It is called repeatedly, so it must be cheap when there is
/// nothing more to load.
class AzyScrollRefresh extends StatelessWidget {
  const AzyScrollRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
    this.onNearEnd,
  });

  final Future<void> Function() onRefresh;
  final VoidCallback? onNearEnd;
  final Widget child;

  /// Only the wrapped scroll view counts. Lists nested inside it report a
  /// depth above zero, and carousels report a horizontal axis.
  static bool _isPageScroll(int depth, ScrollMetrics metrics) =>
      depth == 0 && metrics.axis == Axis.vertical;

  void _check(int depth, ScrollMetrics metrics) {
    if (_isPageScroll(depth, metrics) &&
        metrics.extentAfter < kAzyLoadMoreDistance) {
      onNearEnd?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    var content = child;
    if (onNearEnd != null) {
      content = NotificationListener<ScrollMetricsNotification>(
        // Fires when the content changes size without a scroll: the first
        // layout, and each time a page is added. Without it a first page that
        // does not fill the screen could never ask for the second.
        onNotification: (notification) {
          _check(notification.depth, notification.metrics);
          return false;
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification ||
                notification is ScrollEndNotification) {
              _check(notification.depth, notification.metrics);
            }
            return false;
          },
          child: content,
        ),
      );
    }
    return RefreshIndicator(
      color: kAzyRefreshColor,
      notificationPredicate: (notification) =>
          _isPageScroll(notification.depth, notification.metrics),
      onRefresh: onRefresh,
      child: content,
    );
  }
}

/// Small spinner under a list that still has items to show.
class AzyLoadMoreFooter extends StatelessWidget {
  const AzyLoadMoreFooter({super.key, required this.visible});

  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox.shrink();
    }
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: SizedBox(
          width: 22.0,
          height: 22.0,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(kAzyRefreshColor),
          ),
        ),
      ),
    );
  }
}
