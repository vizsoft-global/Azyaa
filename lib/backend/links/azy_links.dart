/// Share links for products, creators, designers and creator promotions.
///
/// A link carries everything in its own path, so nothing is created or stored
/// before sharing and there is no API key in the app:
///
///   https://azyaa-link.pages.dev/p/{productId}
///   https://azyaa-link.pages.dev/creator/{uid}
///   https://azyaa-link.pages.dev/designer/{uid}
///   https://azyaa-link.pages.dev/promo/{creatorUid}/{promoId}
///
/// The same paths are routes in this app (see `nav.dart`), and the host is
/// declared in AndroidManifest.xml and Runner.entitlements, so on a phone with
/// the app installed the link opens the matching screen directly. Everyone
/// else lands on the small site in `deeplink/`, which shows a preview and
/// offers the app or the store.
///
/// This replaced short links made through a third-party service at share
/// time. Those needed a network call and a secret key inside the app, pointed
/// at a host Android never opened in the app, and the creator promotion link
/// was built without a separator, so it led nowhere.
class AzyLinks {
  AzyLinks._();

  /// Host new links are made with.
  static const String host = 'azyaa-link.pages.dev';

  /// Every host the app opens links for. The second is reserved so the links
  /// can move to Azyaa's own domain later without an app release in between.
  static const List<String> hosts = [host, 'link.azyaa.ai'];

  static const String productPath = '/p/:productID';
  static const String creatorPath = '/creator/:creatorUid';
  static const String designerPath = '/designer/:designerUid';
  static const String promoPath = '/promo/:creatorUid/:promo';

  static final RegExp _id = RegExp(r'^[A-Za-z0-9_-]{1,128}$');

  /// Ids are Firestore ids and uids: letters, digits, dash and underscore.
  static bool isValidId(String? id) => id != null && _id.hasMatch(id);

  static String product(String productId) => _link(['p', productId]);

  static String creator(String creatorUid) => _link(['creator', creatorUid]);

  static String designer(String designerUid) =>
      _link(['designer', designerUid]);

  /// Opening this credits the creator for what the visitor then buys from
  /// the promotion.
  static String promo(String creatorUid, String promoId) =>
      _link(['promo', creatorUid, promoId]);

  /// Null when an id is missing or malformed, so a caller never shares a
  /// link that cannot open.
  static String? productOrNull(String? productId) =>
      isValidId(productId) ? product(productId!) : null;

  static String? creatorOrNull(String? creatorUid) =>
      isValidId(creatorUid) ? creator(creatorUid!) : null;

  static String? designerOrNull(String? designerUid) =>
      isValidId(designerUid) ? designer(designerUid!) : null;

  static String? promoOrNull(String? creatorUid, String? promoId) =>
      isValidId(creatorUid) && isValidId(promoId)
          ? promo(creatorUid!, promoId!)
          : null;

  static String _link(List<String> segments) =>
      Uri(scheme: 'https', host: host, pathSegments: segments).toString();
}
