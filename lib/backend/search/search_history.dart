// Recent search terms, persisted per scope.
//
// SCOPES
// ------
// History is per-surface rather than global: what you last looked for in the
// shop is not a useful suggestion while browsing creators, and a creator's page
// keeps its own list so it never suggests a term that cannot match there.
//
// HISTORY MUST NEVER BREAK SEARCH
// -------------------------------
// This is a nicety, not a source of truth, so every method swallows storage
// errors and degrades to an empty list. A corrupted preferences entry should
// cost the user their chips, not their search box.

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

abstract final class AzySearchHistory {
  /// Where the shop page's history lives.
  static const String scopeGlobal = 'global';

  /// Where the shop page's product/shop history lives.
  static const String scopeShop = 'shop';

  /// Where the creators listing's history lives.
  static const String scopeCreators = 'creators';

  /// Max terms kept per scope. Enough to be useful in a chip row.
  static const int maxEntries = 8;

  /// Longest term worth storing; anything longer is a paste, not a search.
  static const int maxTermLength = 60;

  static const String _prefix = 'azy_search_recent_';

  /// The storage key for a scope.
  static String keyFor(String scope) => '$_prefix$scope';

  /// A per-creator scope, for searching inside one creator's page.
  static String scopeForCreator(String creatorId) => 'creator_$creatorId';

  /// Stored terms for [scope], most recent first.
  static Future<List<String>> recent(String scope) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(keyFor(scope)) ?? const [];
    } catch (error) {
      log('AzySearchHistory: read failed for "$scope": $error');
      return const [];
    }
  }

  /// Records [term] as the newest entry for [scope] and returns the new list.
  ///
  /// Repeating an existing term moves it to the front rather than duplicating
  /// it, and the comparison is case-insensitive so "Silk" and "silk" are one
  /// entry — otherwise the chip row fills up with the same search.
  static Future<List<String>> record(String scope, String term) async {
    final cleaned = clean(term);
    if (cleaned.isEmpty) {
      return recent(scope);
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = keyFor(scope);
      final existing = prefs.getStringList(key) ?? const <String>[];
      final lowered = cleaned.toLowerCase();
      final updated = <String>[
        cleaned,
        ...existing.where((entry) => entry.toLowerCase() != lowered),
      ];
      if (updated.length > maxEntries) {
        updated.removeRange(maxEntries, updated.length);
      }
      await prefs.setStringList(key, updated);
      return updated;
    } catch (error) {
      log('AzySearchHistory: write failed for "$scope": $error');
      return recent(scope);
    }
  }

  /// Removes one term, e.g. from a chip's delete affordance.
  static Future<List<String>> remove(String scope, String term) async {
    final lowered = clean(term).toLowerCase();
    try {
      final prefs = await SharedPreferences.getInstance();
      final key = keyFor(scope);
      final existing = prefs.getStringList(key) ?? const <String>[];
      final updated = existing
          .where((entry) => entry.toLowerCase() != lowered)
          .toList(growable: false);
      await prefs.setStringList(key, updated);
      return updated;
    } catch (error) {
      log('AzySearchHistory: delete failed for "$scope": $error');
      return recent(scope);
    }
  }

  /// Drops the whole list for [scope].
  static Future<void> clear(String scope) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(keyFor(scope));
    } catch (error) {
      log('AzySearchHistory: clear failed for "$scope": $error');
    }
  }

  /// Trims, collapses internal whitespace and caps the length.
  static String clean(String term) {
    final collapsed = term.trim().replaceAll(RegExp('\\s+'), ' ');
    if (collapsed.length <= maxTermLength) {
      return collapsed;
    }
    return collapsed.substring(0, maxTermLength);
  }

  /// Stored terms that could still be what the user is typing.
  ///
  /// Used to keep a shortened suggestion row above the live results, so a
  /// previous search is one tap away without pushing the results off screen.
  static List<String> matching(Iterable<String> stored, String query) {
    final needle = clean(query).toLowerCase();
    if (needle.isEmpty) {
      return const [];
    }
    return stored
        .where((entry) => entry.toLowerCase().contains(needle))
        .toList(growable: false);
  }
}
