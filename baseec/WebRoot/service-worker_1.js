//self.addEventListener('install', (event) => {
//  console.log('installazione in corso', 'install', event);
//  self.skipWaiting();
//});

self.addEventListener('install', (event) => {
	let timeStamp = Date.now();
	console.log('installazione in corso', 'install', timeStamp);
	event.waitUntil( caches.open('service-worker_1').then(
			cache => { return cache.addAll([
				'/vg/asporto.pdf',
				'/vg/hamburger.pdf',
				'/vg/menu_carta.pdf'
			]) .then(() => self.skipWaiting());
		})
	)
});

self.addEventListener('activate', (event) => {
  console.log('attivazione in corso', 'activate', event);
  return self.clients.claim();
});

self.addEventListener('fetch', function(event) {
  console.log('fetch in corso', 'fetch', event);
  event.respondWith(fetch(event.request));
});
