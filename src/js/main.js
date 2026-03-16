/* ========================================
   BUDS NAILS — JavaScript
======================================== */

// Sticky nav shadow on scroll
window.addEventListener('scroll', () => {
  const nav = document.getElementById('navbar');
  nav.classList.toggle('scrolled', window.scrollY > 50);
});

// Hamburger menu toggle
const hamburger = document.querySelector('.hamburger');
const navLinks = document.querySelector('.nav-links');
if (hamburger) {
  hamburger.addEventListener('click', () => navLinks.classList.toggle('open'));
}

// Fade-in sections on scroll
const observer = new IntersectionObserver((entries) => {
  entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); });
}, { threshold: 0.1 });
document.querySelectorAll('section').forEach(s => {
  s.classList.add('fade-in');
  observer.observe(s);
});

// TODO: VS Code — add form submission logic, lightbox for gallery, booking integration
