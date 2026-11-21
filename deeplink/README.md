# Azyaa share links

The small site behind the links the app shares. It is live at
<https://azyaa-link.pages.dev> as the Cloudflare Pages project `azyaa-link`.

## How a link works

A link carries everything in its own path. Nothing is created or stored when a
link is shared, and there is no API key.

| Link | Opens |
|---|---|
| `/p/{productId}` | a product, by its `product_id` (for example `AZYPRD1141`) |
| `/creator/{uid}` | a creator's page |
| `/designer/{uid}` | a designer's page |
| `/promo/{creatorUid}/{promotionId}` | a creator's promotion; what the visitor then buys from it is credited to the creator |

- **App installed:** Android App Links and iOS Universal Links open the app on
  the matching screen. The same paths are routes in `lib/flutter_flow/nav/nav.dart`,
  and the links are built by `lib/backend/links/azy_links.dart`.
- **App not installed, a desktop browser, or an in-app browser:** this site
  shows a preview with a button that opens the app (`azyaa://open/...`) or the
  store.
- **Link previews** (WhatsApp, iMessage and so on) read the title and picture
  from Firestore. If the lookup fails the preview is plain text and the link
  still works.

## Files

- `public/.well-known/assetlinks.json`: tells Android which app may open these links.
- `public/.well-known/apple-app-site-association`: the same for iOS.
- `public/_routes.json`: the four path shapes that run the function; everything else is a static file.
- `functions/[[path]].js` and `src/links.js`: the preview page.
- `test/links.test.js`: run with `npm test` (Node 20 or later, no install needed).

## Deploy

```bash
npx wrangler@4.86.0 pages deploy public --project-name azyaa-link --branch main
```

Run it from this folder, so the `functions` folder is picked up.

## Still to do before release builds open links directly on Android

`assetlinks.json` lists only the debug certificate of the development Mac. A
build from the Play Store is signed with a different certificate, so until that
certificate is listed, Android opens these links in the browser and the user
taps "Open in the Azyaa app" there.

1. In the Play Console open **Test and release > App integrity > App signing**.
2. Copy the **SHA-256 certificate fingerprint** of the app signing key. If
   builds are also installed straight from Codemagic, copy the upload key's
   fingerprint as well.
3. Add each fingerprint to the `sha256_cert_fingerprints` list in
   `public/.well-known/assetlinks.json` and deploy. No app release is needed.

iOS needs nothing more: the file already names the team and bundle ID.

## Moving to Azyaa's own domain later

The app already accepts `link.azyaa.ai` as a second host. To switch:

1. Add `link.azyaa.ai` as a custom domain on the `azyaa-link` Pages project.
2. Change `host` in `lib/backend/links/azy_links.dart` and release the app.

Links already shared on `azyaa-link.pages.dev` keep working.
