/* Buds Nails — cookie consent + GA4 gating
   Stores choice in localStorage under 'budsnails_consent' = 'accepted' | 'rejected'
   GA4 only loads if consent === 'accepted'. Update GA_MEASUREMENT_ID once GA4 is set up.
*/
(function () {
  'use strict';

  var STORAGE_KEY = 'budsnails_consent';
  var GA_MEASUREMENT_ID = ''; // e.g. 'G-XXXXXXXXXX' — set once GA4 property is created

  function getConsent() {
    try { return localStorage.getItem(STORAGE_KEY); } catch (e) { return null; }
  }

  function setConsent(value) {
    try { localStorage.setItem(STORAGE_KEY, value); } catch (e) {}
  }

  function loadGA() {
    if (!GA_MEASUREMENT_ID) return; // no ID configured yet
    if (window.__ga_loaded) return;
    window.__ga_loaded = true;

    var s = document.createElement('script');
    s.async = true;
    s.src = 'https://www.googletagmanager.com/gtag/js?id=' + GA_MEASUREMENT_ID;
    document.head.appendChild(s);

    window.dataLayer = window.dataLayer || [];
    function gtag() { window.dataLayer.push(arguments); }
    window.gtag = gtag;
    gtag('js', new Date());
    gtag('config', GA_MEASUREMENT_ID, { anonymize_ip: true });
  }

  function buildBanner() {
    if (document.getElementById('cookieBanner')) return;

    var banner = document.createElement('div');
    banner.id = 'cookieBanner';
    banner.setAttribute('role', 'dialog');
    banner.setAttribute('aria-live', 'polite');
    banner.setAttribute('aria-label', 'Cookie consent');
    banner.style.cssText = [
      'position:fixed',
      'left:1rem',
      'right:1rem',
      'bottom:1rem',
      'max-width:560px',
      'margin:0 auto',
      'background:#FFF9F7',
      'color:#3D3535',
      'border:1px solid rgba(61,53,53,0.12)',
      'border-radius:12px',
      'box-shadow:0 8px 32px rgba(61,53,53,0.18)',
      'padding:1.25rem 1.25rem',
      'font-family:Lato, sans-serif',
      'font-size:0.95rem',
      'line-height:1.5',
      'z-index:9999'
    ].join(';');

    banner.innerHTML = [
      '<p style="margin:0 0 0.9rem 0;">',
      'I use a few cookies to keep the site running and, if you\u2019re happy with it, to understand how people use it via Google Analytics. ',
      'See my <a href="/cookies.html" style="color:#8B6F6F; text-decoration:underline;">Cookie Policy</a> for details.',
      '</p>',
      '<div style="display:flex; gap:0.6rem; flex-wrap:wrap;">',
      '  <button type="button" id="cookieAccept" style="background:#D4A0A0; color:#FFF9F7; border:none; border-radius:999px; padding:0.55rem 1.2rem; font:inherit; cursor:pointer;">Accept</button>',
      '  <button type="button" id="cookieReject" style="background:transparent; color:#3D3535; border:1px solid rgba(61,53,53,0.25); border-radius:999px; padding:0.55rem 1.2rem; font:inherit; cursor:pointer;">Reject</button>',
      '</div>'
    ].join('');

    document.body.appendChild(banner);

    document.getElementById('cookieAccept').addEventListener('click', function () {
      setConsent('accepted');
      banner.remove();
      loadGA();
    });
    document.getElementById('cookieReject').addEventListener('click', function () {
      setConsent('rejected');
      banner.remove();
    });
  }

  function showBanner() {
    buildBanner();
  }

  function init() {
    var consent = getConsent();

    if (consent === 'accepted') {
      loadGA();
    } else if (consent === 'rejected') {
      // do nothing — respect the refusal
    } else {
      showBanner();
    }

    // Wire the footer/policy "Cookie Settings" buttons to reopen the banner
    var ids = ['openCookieSettings', 'openCookieSettingsFooter'];
    ids.forEach(function (id) {
      var btn = document.getElementById(id);
      if (btn) {
        btn.addEventListener('click', function (e) {
          e.preventDefault();
          // remove any existing banner first so it rebuilds cleanly
          var existing = document.getElementById('cookieBanner');
          if (existing) existing.remove();
          showBanner();
        });
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
