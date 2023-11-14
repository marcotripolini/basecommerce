self.addEventListener('install', (event) => {
  console.log('installazione in corso', 'install', event);
  self.skipWaiting();
});

self.addEventListener('install', (event) => {
	console.log('PWA Service Worker installing.');
	event.waitUntil(caches.open('app_interactive_service_worker').then(
			cache => { return cache.addAll([
				'assets/plugins/custom/fullcalendar/fullcalendar.bundle.css',
				'assets/plugins/global/plugins.bundle.css',
				'assets/css/themes/layout/header/base/dark.css',
				'assets/plugins/custom/prismjs/prismjs.bundle.css',
				'assets/css/style.bundle.css',
				'assets/css/themes/layout/header/menu/dark.css',
				'assets/css/themes/layout/brand/dark.css',
				'assets/css/themes/layout/aside/dark.css',
				'assets/icons/icon-192x192.png',
				'assets/plugins/global/plugins.bundle.js',
				'assets/plugins/custom/prismjs/prismjs.bundle.js',
				'assets/js/scripts.bundle.js',
				'assets/plugins/custom/fullcalendar/fullcalendar.bundle.js',
				'colors.html',
				'assets/media/company_assets/logo-sc-w.png',
				'assets/media/company_assets/icon.png',
				'assets/media/company_assets/logo-sc.png',
				'assets/media/company_assets/logo_interactive.png',
				'assets/media/company_assets/logo_interactive_light.png',
				'assets/media/company_assets/oro_rosso_wd_sfocato.png',
				'assets/media/svg/flags/013-italy.svg',
				'assets/media/svg/flags/226-united-states.svg',
				'assets/media/svg/flags/128-spain.svg',
				'assets/media/svg/flags/162-germany.svg',
				'assets/media/stock-600x400/img-1.jpg',
				'assets/media/stock-600x400/img-2.jpg',
				'assets/media/stock-600x400/img-3.jpg',
				'assets/media/stock-600x400/img-4.jpg',
				'assets/media/stock-600x400/img-5.jpg',
				'assets/media/stock-600x400/img-6.jpg',
				'assets/media/stock-600x400/img-7.jpg',
				'assets/media/stock-600x400/img-8.jpg',
				'assets/media/svg/misc/015-telegram.svg',
				'assets/media/svg/misc/003-puzzle.svg',
				'assets/media/svg/misc/005-bebo.svg',
				'assets/media/misc/bg-1.jpg',
				'assets/media/svg/misc/014-kickstarter.svg',
				'assets/media/users/300_21.jpg',
				'assets/js/pages/widgets.js'
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
