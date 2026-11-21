import { lookupPreview, parseLink, previewFor, renderPage } from "../src/links.js";

// Runs only for /p/*, /creator/*, /designer/* and /promo/* (see
// public/_routes.json). Everything else, including /.well-known, is served as a
// static file.
export async function onRequestGet(context) {
  const url = new URL(context.request.url);
  const link = parseLink(url.pathname);
  if (!link) {
    return context.next();
  }

  const found = await lookupPreview(link);
  const html = renderPage(link, previewFor(link, found), {
    origin: url.origin,
    userAgent: context.request.headers.get("user-agent"),
  });
  return new Response(html, {
    headers: {
      "Content-Type": "text/html; charset=utf-8",
      // Short, so an edited product name or image reaches previews quickly.
      "Cache-Control": "public, max-age=300",
      "X-Content-Type-Options": "nosniff",
      "Referrer-Policy": "strict-origin-when-cross-origin",
    },
  });
}
