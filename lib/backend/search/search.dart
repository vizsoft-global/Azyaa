// On-device search for Azyaa.
//
//   import '/backend/search/search.dart';
//
// WHY THIS REPLACES THE ALGOLIA PATH
// ----------------------------------
// `ProductsRecord.search` / `UsersRecord.search` query Algolia indices whose
// contents have to be kept in sync with Firestore. When that sync is stale or
// missing, search returns an empty list and the UI looks broken — with no error
// to show for it. This package reads Firestore once, holds the catalogue in
// memory and scores it on the device, so:
//
//   * there is no index to fall out of sync,
//   * there is no network round-trip per keystroke (measured ~4ms for 5,000
//     documents, comfortably inside a 16.7ms frame),
//   * matching is literal and ours to tune -- see `search_matcher.dart` for why
//     typo tolerance was taken out, and
//   * results are grouped into Products / Shops / Creators in one pass.
//
// LAYERS
// ------
//   search_matcher.dart literal pattern matcher + text normalization (pure Dart)
//   search_models.dart  AzySearchDocument / Hit / Group / Results (pure Dart)
//   search_index.dart   scored, groupable index (pure Dart)
//   search_service.dart Firestore loading + caching (the only Firebase-aware file)
//   search_history.dart recent terms via shared_preferences
//
// The three pure-Dart layers have no Flutter or Firebase dependency on purpose,
// so the ranking rules are unit-testable on the Dart VM:
//   flutter test test/search_matcher_test.dart test/search_index_test.dart

export 'search_history.dart';
export 'search_index.dart';
export 'search_matcher.dart';
export 'search_models.dart';
export 'search_service.dart';
