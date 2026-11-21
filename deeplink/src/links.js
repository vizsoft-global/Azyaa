// Azyaa share links.
//
// A link carries everything it needs in its own path, so nothing has to be
// created or stored before a link can be shared:
//
//   /p/{productId}                 a product
//   /creator/{uid}                 a creator's page
//   /designer/{uid}                a designer's page
//   /promo/{creatorUid}/{promoId}  a creator's promotion (purchases made after
//                                  opening it are credited to the creator)
//
// On a phone with the app installed, Android App Links and iOS Universal Links
// open the app directly and this site is never loaded. This code only runs for
// everyone else: phones without the app, desktop browsers, in-app browsers that
// refuse to hand links to other apps, and the crawlers that build link previews.

export const APP = {
  name: "Azyaa",
  androidPackage: "com.azya.app",
  scheme: "azyaa",
  schemeHost: "open",
  playStore: "https://play.google.com/store/apps/details?id=com.azya.app",
  appStore: "https://apps.apple.com/us/app/azyaa/id6743427685",
  website: "https://azyaa.ai",
  firebaseProject: "azyaa-0uiv4k",
};

/** Ids come from Firestore: letters, digits, dash and underscore only. */
const ID = /^[A-Za-z0-9_-]{1,128}$/;

/**
 * Reads a path such as "/p/PRD123". Returns null for anything that is not one
 * of the four link shapes, so the caller can fall through to a 404.
 */
export function parseLink(pathname) {
  const parts = String(pathname || "")
    .split("/")
    .filter(Boolean)
    .map((part) => {
      try {
        return decodeURIComponent(part);
      } catch {
        return "";
      }
    });
  const [kind, a, b] = parts;
  const ok = (...ids) => ids.every((id) => ID.test(id || ""));

  if (kind === "p" && parts.length === 2 && ok(a)) {
    return { kind: "product", productId: a, path: `/p/${a}` };
  }
  if (kind === "creator" && parts.length === 2 && ok(a)) {
    return { kind: "creator", uid: a, path: `/creator/${a}` };
  }
  if (kind === "designer" && parts.length === 2 && ok(a)) {
    return { kind: "designer", uid: a, path: `/designer/${a}` };
  }
  if (kind === "promo" && parts.length === 3 && ok(a, b)) {
    return { kind: "promo", uid: a, promoId: b, path: `/promo/${a}/${b}` };
  }
  return null;
}

/** azyaa://open/p/PRD123 : opens the app through its own scheme. */
export function schemeUrl(link) {
  return `${APP.scheme}://${APP.schemeHost}${link.path}`;
}

/**
 * Android intent URL. Chrome opens the app if it is installed and otherwise
 * goes to the Play Store, with no error page in between.
 */
export function intentUrl(link) {
  return (
    `intent://${APP.schemeHost}${link.path}` +
    `#Intent;scheme=${APP.scheme};package=${APP.androidPackage};` +
    `S.browser_fallback_url=${encodeURIComponent(APP.playStore)};end`
  );
}

export function platformOf(userAgent) {
  const ua = String(userAgent || "");
  if (/android/i.test(ua)) return "android";
  if (/iphone|ipad|ipod/i.test(ua)) return "ios";
  return "other";
}

export function escapeHtml(value) {
  return String(value ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

/** Only https images are put in a preview; anything else is dropped. */
export function safeImage(url) {
  return typeof url === "string" && /^https:\/\/[^\s"'<>]+$/.test(url) ? url : "";
}

const FALLBACK = {
  product: { title: "A piece on Azyaa", description: "Open it in the Azyaa app." },
  creator: { title: "A creator on Azyaa", description: "See their picks in the Azyaa app." },
  designer: { title: "A designer on Azyaa", description: "See their collection in the Azyaa app." },
  promo: { title: "A creator's pick on Azyaa", description: "Open it in the Azyaa app." },
};

/** Preview text for a link, using whatever the lookup found. */
export function previewFor(link, found) {
  const base = FALLBACK[link.kind];
  const title = (found && found.title ? String(found.title).trim() : "") || base.title;
  const description =
    (found && found.description ? String(found.description).trim() : "") || base.description;
  return {
    title: title.slice(0, 120),
    description: description.slice(0, 200),
    image: safeImage(found && found.image),
  };
}

// ---------- Firestore lookups for the preview ----------
// Best effort. A preview that cannot be looked up falls back to plain text; the
// link itself still works.

const plain = (field) =>
  field == null
    ? undefined
    : field.stringValue ?? field.integerValue ?? field.doubleValue ?? undefined;
const mapOf = (field) => (field && field.mapValue && field.mapValue.fields) || {};
const listOf = (field) => (field && field.arrayValue && field.arrayValue.values) || [];

export function firestoreQuery(collection, fieldPath, value) {
  return {
    structuredQuery: {
      from: [{ collectionId: collection }],
      where: {
        fieldFilter: {
          field: { fieldPath },
          op: "EQUAL",
          value: { stringValue: value },
        },
      },
      limit: 1,
    },
  };
}

/** Turns a Firestore document into preview fields for the given link. */
export function previewFromDocument(link, fields) {
  if (!fields) return null;
  if (link.kind === "product") {
    const info = mapOf(fields.product_info);
    return {
      title: plain(info.name),
      description: "Shop it on Azyaa.",
      image: plain(info.feature_image),
    };
  }
  if (link.kind === "promo") {
    const promos = listOf(mapOf(fields.creator_main_info).creator_promotions);
    const promo = promos
      .map((value) => mapOf(value))
      .find((p) => String(plain(p.promotion_id)) === link.promoId);
    const name = plain(fields.display_name);
    if (!promo) return { title: name, image: plain(fields.photo_url) };
    const images = listOf(promo.promotion_images);
    return {
      title: plain(promo.promotion_caption) || name,
      description: plain(promo.promotion_description),
      image: plain(images[0]) || plain(fields.photo_url),
    };
  }
  return {
    title: plain(fields.display_name),
    description:
      link.kind === "designer" ? "Designer on Azyaa." : "Creator on Azyaa.",
    image: plain(fields.photo_url),
  };
}

export async function lookupPreview(link, fetchImpl = fetch) {
  const [collection, field, value] =
    link.kind === "product"
      ? ["products", "product_id", link.productId]
      : ["users", "uid", link.uid];
  const url =
    `https://firestore.googleapis.com/v1/projects/${APP.firebaseProject}` +
    `/databases/(default)/documents:runQuery`;
  try {
    const response = await fetchImpl(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(firestoreQuery(collection, field, value)),
      signal: AbortSignal.timeout(2500),
    });
    if (!response.ok) return null;
    const rows = await response.json();
    const doc = Array.isArray(rows) ? rows.find((row) => row.document) : null;
    return doc ? previewFromDocument(link, doc.document.fields) : null;
  } catch {
    return null;
  }
}

// ---------- The page ----------

export function renderPage(link, preview, { origin, userAgent }) {
  const platform = platformOf(userAgent);
  const canonical = `${origin}${link.path}`;
  const open = platform === "android" ? intentUrl(link) : schemeUrl(link);
  const store =
    platform === "android" ? APP.playStore : platform === "ios" ? APP.appStore : "";
  const e = escapeHtml;
  const image = preview.image
    ? `<img class="shot" src="${e(preview.image)}" alt="">`
    : "";
  const ogImage = preview.image
    ? `<meta property="og:image" content="${e(preview.image)}">\n<meta name="twitter:image" content="${e(preview.image)}">`
    : "";
  const actions =
    platform === "other"
      ? `<p class="hint">Open this link on your phone to see it in the Azyaa app.</p>
         <div class="row">
           <a class="btn" href="${e(APP.appStore)}">App Store</a>
           <a class="btn" href="${e(APP.playStore)}">Google Play</a>
         </div>`
      : `<a class="btn primary" id="open" href="${e(open)}">Open in the Azyaa app</a>
         <a class="btn" href="${e(store)}">Get the app</a>`;

  return `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${e(preview.title)} | Azyaa</title>
<meta name="description" content="${e(preview.description)}">
<meta name="robots" content="noindex">
<link rel="canonical" href="${e(canonical)}">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Azyaa">
<meta property="og:url" content="${e(canonical)}">
<meta property="og:title" content="${e(preview.title)}">
<meta property="og:description" content="${e(preview.description)}">
<meta name="twitter:card" content="${preview.image ? "summary_large_image" : "summary"}">
<meta name="twitter:title" content="${e(preview.title)}">
<meta name="twitter:description" content="${e(preview.description)}">
${ogImage}
<meta name="apple-itunes-app" content="app-id=6743427685, app-argument=${e(canonical)}">
<style>
  :root { color-scheme: light dark; --bg: #faf9f7; --fg: #1c1a17; --muted: #6b665e; --line: #e4e0d8; --accent: #7f56d9; --on: #ffffff; }
  @media (prefers-color-scheme: dark) { :root { --bg: #141312; --fg: #f2efe9; --muted: #a39d93; --line: #2e2b27; --accent: #a688ee; --on: #141312; } }
  * { box-sizing: border-box; }
  body { margin: 0; min-height: 100vh; display: grid; place-items: center; background: var(--bg); color: var(--fg); font: 16px/1.5 system-ui, -apple-system, "Segoe UI", sans-serif; padding: 24px 16px; }
  main { width: 100%; max-width: 380px; text-align: center; }
  .brand { letter-spacing: .28em; font-size: 13px; text-transform: uppercase; color: var(--muted); margin: 0 0 20px; }
  .shot { width: 100%; max-height: 420px; object-fit: cover; border-radius: 16px; border: 1px solid var(--line); display: block; margin: 0 0 20px; }
  h1 { font-size: 22px; line-height: 1.25; margin: 0 0 8px; text-wrap: balance; }
  p { margin: 0 0 20px; color: var(--muted); }
  .row { display: flex; gap: 12px; }
  .btn { display: block; flex: 1; padding: 14px 16px; margin: 0 0 12px; border-radius: 12px; border: 1px solid var(--line); color: var(--fg); text-decoration: none; font-weight: 600; }
  .btn.primary { background: var(--accent); border-color: var(--accent); color: var(--on); }
  .hint { font-size: 14px; }
</style>
</head>
<body>
<main>
  <p class="brand">Azyaa</p>
  ${image}
  <h1>${e(preview.title)}</h1>
  <p>${e(preview.description)}</p>
  ${actions}
</main>
</body>
</html>`;
}
