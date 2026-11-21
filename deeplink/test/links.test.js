import assert from "node:assert/strict";
import { test } from "node:test";
import {
  APP,
  escapeHtml,
  firestoreQuery,
  intentUrl,
  lookupPreview,
  parseLink,
  platformOf,
  previewFor,
  previewFromDocument,
  renderPage,
  safeImage,
  schemeUrl,
} from "../src/links.js";
import { readFileSync } from "node:fs";

test("parses the four link shapes", () => {
  assert.deepEqual(parseLink("/p/PRD123"), { kind: "product", productId: "PRD123", path: "/p/PRD123" });
  assert.deepEqual(parseLink("/creator/abcDEF_1-2"), { kind: "creator", uid: "abcDEF_1-2", path: "/creator/abcDEF_1-2" });
  assert.deepEqual(parseLink("/designer/u1/"), { kind: "designer", uid: "u1", path: "/designer/u1" });
  assert.deepEqual(parseLink("/promo/u1/PR7"), { kind: "promo", uid: "u1", promoId: "PR7", path: "/promo/u1/PR7" });
});

test("rejects everything else", () => {
  for (const path of ["", "/", "/p", "/p/", "/p/a/b", "/promo/u1", "/x/1", "/p/a b", "/p/<script>", "/p/%3Cscript%3E", "/p/%E0%A4%A", "/creator/" + "a".repeat(129)]) {
    assert.equal(parseLink(path), null, path);
  }
});

test("app URLs carry the same path the app routes on", () => {
  const link = parseLink("/promo/u1/PR7");
  assert.equal(schemeUrl(link), "azyaa://open/promo/u1/PR7");
  const intent = intentUrl(link);
  assert.ok(intent.startsWith("intent://open/promo/u1/PR7#Intent;scheme=azyaa;package=com.azya.app;"));
  assert.ok(intent.includes("S.browser_fallback_url=" + encodeURIComponent(APP.playStore)));
  assert.ok(intent.endsWith(";end"));
});

test("detects the platform", () => {
  assert.equal(platformOf("Mozilla/5.0 (Linux; Android 14; Pixel 8)"), "android");
  assert.equal(platformOf("Mozilla/5.0 (iPhone; CPU iPhone OS 18_0 like Mac OS X)"), "ios");
  assert.equal(platformOf("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"), "other");
  assert.equal(platformOf(null), "other");
});

test("escapes text and drops unsafe images", () => {
  assert.equal(escapeHtml(`<a href="x">Tom & 'Jerry'</a>`), "&lt;a href=&quot;x&quot;&gt;Tom &amp; &#39;Jerry&#39;&lt;/a&gt;");
  assert.equal(safeImage("https://cdn.example.com/a.jpg"), "https://cdn.example.com/a.jpg");
  assert.equal(safeImage("http://cdn.example.com/a.jpg"), "");
  assert.equal(safeImage('https://x.com/a.jpg" onerror="x'), "");
  assert.equal(safeImage("javascript:alert(1)"), "");
  assert.equal(safeImage(undefined), "");
});

test("a preview falls back to plain text when nothing was found", () => {
  const preview = previewFor(parseLink("/p/PRD1"), null);
  assert.equal(preview.title, "A piece on Azyaa");
  assert.equal(preview.image, "");
});

test("reads a product document", () => {
  const fields = { product_info: { mapValue: { fields: { name: { stringValue: "Silk Abaya" }, feature_image: { stringValue: "https://img.example.com/1.jpg" } } } } };
  const preview = previewFor(parseLink("/p/PRD1"), previewFromDocument(parseLink("/p/PRD1"), fields));
  assert.equal(preview.title, "Silk Abaya");
  assert.equal(preview.image, "https://img.example.com/1.jpg");
});

test("reads the right promotion out of a creator document", () => {
  const promo = (id, caption) => ({ mapValue: { fields: { promotion_id: { stringValue: id }, promotion_caption: { stringValue: caption }, promotion_description: { stringValue: "desc " + id }, promotion_images: { arrayValue: { values: [{ stringValue: `https://img.example.com/${id}.jpg` }] } } } } });
  const fields = { display_name: { stringValue: "Noor" }, photo_url: { stringValue: "https://img.example.com/noor.jpg" }, creator_main_info: { mapValue: { fields: { creator_promotions: { arrayValue: { values: [promo("PR1", "First"), promo("PR7", "Seventh")] } } } } } };
  const link = parseLink("/promo/u1/PR7");
  const preview = previewFor(link, previewFromDocument(link, fields));
  assert.equal(preview.title, "Seventh");
  assert.equal(preview.description, "desc PR7");
  assert.equal(preview.image, "https://img.example.com/PR7.jpg");

  const missing = parseLink("/promo/u1/PR99");
  assert.equal(previewFor(missing, previewFromDocument(missing, fields)).title, "Noor");
});

test("the lookup asks Firestore for one document and survives failures", async () => {
  let asked;
  const ok = async (url, init) => { asked = { url, body: JSON.parse(init.body) }; return { ok: true, json: async () => [{ document: { fields: { display_name: { stringValue: "Noor" } } } }] }; };
  const found = await lookupPreview(parseLink("/designer/u1"), ok);
  assert.equal(found.title, "Noor");
  assert.ok(asked.url.includes("/projects/azyaa-0uiv4k/"));
  assert.deepEqual(asked.body, firestoreQuery("users", "uid", "u1"));
  assert.equal(asked.body.structuredQuery.limit, 1);

  assert.equal(await lookupPreview(parseLink("/p/X"), async () => ({ ok: false })), null);
  assert.equal(await lookupPreview(parseLink("/p/X"), async () => { throw new Error("offline"); }), null);
  assert.equal(await lookupPreview(parseLink("/p/X"), async () => ({ ok: true, json: async () => [{ readTime: "t" }] })), null);
});

test("the page offers the right way in for each platform and escapes its text", () => {
  const link = parseLink("/p/PRD1");
  const preview = previewFor(link, { title: `<b>Dress</b>`, image: "https://img.example.com/1.jpg" });
  const android = renderPage(link, preview, { origin: "https://l.example", userAgent: "Android" });
  assert.ok(android.includes("intent://open/p/PRD1#Intent;"));
  assert.ok(android.includes(APP.playStore));
  assert.ok(!android.includes("<b>Dress</b>"));
  assert.ok(android.includes("&lt;b&gt;Dress&lt;/b&gt;"));
  assert.ok(android.includes('<meta property="og:image" content="https://img.example.com/1.jpg">'));
  assert.ok(android.includes('<meta property="og:url" content="https://l.example/p/PRD1">'));

  const ios = renderPage(link, preview, { origin: "https://l.example", userAgent: "iPhone" });
  assert.ok(ios.includes('href="azyaa://open/p/PRD1"'));
  assert.ok(ios.includes(APP.appStore));

  const desktop = renderPage(link, preview, { origin: "https://l.example", userAgent: "Macintosh" });
  assert.ok(desktop.includes("Open this link on your phone"));
  assert.ok(!desktop.includes("azyaa://"));
});

test("the app-link files name this app and these paths", () => {
  const assetlinks = JSON.parse(readFileSync(new URL("../public/.well-known/assetlinks.json", import.meta.url)));
  assert.equal(assetlinks[0].target.package_name, APP.androidPackage);
  assert.ok(assetlinks[0].target.sha256_cert_fingerprints.every((f) => /^([0-9A-F]{2}:){31}[0-9A-F]{2}$/.test(f)));

  const aasa = JSON.parse(readFileSync(new URL("../public/.well-known/apple-app-site-association", import.meta.url)));
  assert.deepEqual(aasa.applinks.details[0].appIDs, ["85BP76L773.com.azya.app"]);
  assert.deepEqual(aasa.applinks.details[0].components.map((c) => c["/"]), ["/p/*", "/creator/*", "/designer/*", "/promo/*"]);

  const routes = JSON.parse(readFileSync(new URL("../public/_routes.json", import.meta.url)));
  assert.deepEqual(routes.include, ["/p/*", "/creator/*", "/designer/*", "/promo/*"]);
});
