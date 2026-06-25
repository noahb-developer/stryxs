// Stryxs Service Worker
// Handles incoming Web Push messages and notification interactions.
// Lives at /sw.js (must be served from the root for full-scope control).

const CACHE_NAME = 'stryxs-sw-v7';

// Install + activate quickly — we don't precache anything since the
// SPA reloads on each visit and we don't need offline support yet.
self.addEventListener('install', (event) => {
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    // Nuke ALL old caches so users stuck on a stale index.html get the
    // fresh one on their very next request.
    const names = await caches.keys();
    await Promise.all(names.map(n => caches.delete(n)));
    await self.clients.claim();
  })());
});

// Force-bypass the HTTP cache for index.html so we never serve stale code
// after a deploy. Other assets (icons, etc.) can be cached normally by
// the browser. The PWA install flow uses index.html for shell rendering
// so making sure THAT is always fresh is what matters.
self.addEventListener('fetch', (event) => {
  const url = new URL(event.request.url);
  // Only intercept top-level navigations + explicit index.html requests
  if (event.request.mode === 'navigate' ||
      url.pathname === '/' ||
      url.pathname === '/index.html') {
    event.respondWith(fetch(event.request, { cache: 'reload' }).catch(() => fetch(event.request)));
  }
});

// Push event — fired when our backend sends a Web Push to this device.
// Payload (JSON): { title, body, url, icon, badge, image, tag, actions,
// actionUrls, vibrate, renotify, requireInteraction, timestamp }.
//   - actions: [{ action, title, icon? }] rich buttons (Android/desktop; iOS
//     ignores them and shows only the body — so the body tap must always work).
//   - actionUrls: { <action>: "/deep/link" } where each button routes on click.
//   - image: a large banner shown under the body (Android/desktop).
// Anything the payload omits falls back to a sensible default, so old-style
// payloads keep working unchanged.
self.addEventListener('push', (event) => {
  let data = {};
  try {
    if (event.data) data = event.data.json();
  } catch (_) {
    // Fall back to text if JSON parse fails
    data = { title: 'Stryxs', body: event.data?.text() || '' };
  }

  const title = data.title || 'Stryxs';
  const options = {
    body: data.body || '',
    icon: data.icon || '/web-app-manifest-192x192.png',
    badge: data.badge || '/web-app-manifest-192x192.png',
    tag: data.tag || 'stryxs-notification',
    // Same tag => a fresh reminder REPLACES the old one instead of stacking.
    // renotify lets an important update buzz again on replace (payload opt-in).
    renotify: !!data.renotify,
    requireInteraction: !!data.requireInteraction,
    timestamp: typeof data.timestamp === 'number' ? data.timestamp : Date.now(),
    // Gentle double-tap buzz by default (ignored on iOS, which has no vibrate).
    vibrate: Array.isArray(data.vibrate) ? data.vibrate : [80, 40, 80],
    silent: false,
    data: { url: data.url || '/', actions: data.actionUrls || {} },
  };
  // Large banner image (Android/desktop only) — only set if provided.
  if (data.image) options.image = data.image;
  // Up to 2 action buttons (Android/desktop). iOS drops them gracefully.
  if (Array.isArray(data.actions) && data.actions.length) {
    options.actions = data.actions.slice(0, 2);
  }

  event.waitUntil(self.registration.showNotification(title, options));
});

// Derive the in-app page from a deep-link path so an ALREADY-OPEN app can route
// instantly via postMessage (client.navigate alone won't re-run the SPA router).
function _stryxsRouteFor(targetUrl) {
  let page = null, goToday = false;
  try {
    const u = new URL(targetUrl, self.location.origin);
    const seg = u.pathname.split('/').filter(Boolean)[0];
    const allowed = ['plan', 'coach', 'history', 'trends', 'race', 'settings', 'upgrade', 'dashboard'];
    if (allowed.includes(seg)) page = seg;
    goToday = u.searchParams.get('go') === 'today';
  } catch (_) {
    if (/[?&]go=today/.test(targetUrl)) goToday = true;
    if (/\/plan\b/.test(targetUrl)) page = 'plan';
  }
  return { page, goToday };
}

// Click — route the tapped notification (or its action button) into the app.
// If a button was pressed, follow that button's deep link; otherwise the body's.
self.addEventListener('notificationclick', (event) => {
  event.notification.close();
  const d = event.notification.data || {};
  if (event.action === 'dismiss') return; // explicit dismiss button: just close
  const actionUrl = (event.action && d.actions && d.actions[event.action]) || null;
  const targetUrl = actionUrl || d.url || '/';
  const { page, goToday } = _stryxsRouteFor(targetUrl);
  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((clientList) => {
      // Focus an existing Stryxs tab and tell it where to go
      for (const client of clientList) {
        if (client.url.includes(self.location.host) && 'focus' in client) {
          try { client.postMessage({ type: 'stryxs-open', page, goToday }); } catch (_) {}
          return client.focus();
        }
      }
      // No existing tab — open a new one at the deep-linked URL
      if (self.clients.openWindow) {
        return self.clients.openWindow(targetUrl);
      }
    }),
  );
});

// pushsubscriptionchange — fired by the browser when our subscription
// expires or is replaced. We try to re-subscribe silently. If the page
// isn't active, the new subscription gets reconciled next time the user
// opens Stryxs.
self.addEventListener('pushsubscriptionchange', (event) => {
  // We can't access localStorage here (different context) so we just
  // log; the main app will reconcile on next open.
  console.log('[Stryxs SW] subscription changed — main app will reconcile');
});
