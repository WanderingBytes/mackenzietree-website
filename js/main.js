// ============================================================
// MacKenzie Tree — main.js
// ============================================================

// ── Nav: scroll class + mobile menu ────────────────────────
const nav = document.querySelector('.nav');
const hamburger = document.querySelector('.hamburger');
const mobileNav = document.querySelector('.mobile-nav');

window.addEventListener('scroll', () => {
  if (window.scrollY > 20) {
    nav?.classList.add('scrolled');
  } else {
    nav?.classList.remove('scrolled');
  }
});

// Force scrolled state on inner pages
if (document.body.dataset.page !== 'home') {
  nav?.classList.add('scrolled');
}

hamburger?.addEventListener('click', () => {
  hamburger.classList.toggle('open');
  if (mobileNav) {
    mobileNav.classList.toggle('open');
  }
});

// Close mobile nav on link click
document.querySelectorAll('.mobile-nav a').forEach(link => {
  link.addEventListener('click', () => {
    hamburger?.classList.remove('open');
    mobileNav?.classList.remove('open');
  });
});

// Close mobile nav when clicking outside
document.addEventListener('click', (e) => {
  if (!e.target.closest('.nav') && !e.target.closest('.mobile-nav')) {
    hamburger?.classList.remove('open');
    mobileNav?.classList.remove('open');
  }
});

// ── Active nav link ─────────────────────────────────────────
const currentPath = window.location.pathname.replace(/\/$/, '') || '/';
document.querySelectorAll('.nav-links a, .mobile-nav a[data-nav]').forEach(link => {
  const linkPath = new URL(link.href, window.location.origin).pathname.replace(/\/$/, '');
  if (linkPath === currentPath || (currentPath === '' && linkPath === '/index.html')) {
    link.classList.add('active');
  }
});

// ── Hero parallax ───────────────────────────────────────────
const heroBg = document.querySelector('.hero-bg');
if (heroBg) {
  heroBg.addEventListener('load', () => heroBg.classList.add('loaded'));
  // Trigger if already loaded
  setTimeout(() => heroBg.classList.add('loaded'), 100);

  window.addEventListener('scroll', () => {
    const scrolled = window.scrollY;
    heroBg.style.transform = `scale(1) translateY(${scrolled * 0.3}px)`;
  }, { passive: true });
}

// ── Scroll reveal ───────────────────────────────────────────
const revealObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('revealed');
    }
  });
}, { threshold: 0.1, rootMargin: '0px 0px -60px 0px' });

document.querySelectorAll('.reveal').forEach(el => revealObserver.observe(el));

// ── Gallery filter + lightbox ───────────────────────────────
const filterBtns = document.querySelectorAll('.filter-btn');
const galleryItems = document.querySelectorAll('.gallery-item');

filterBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    filterBtns.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    const filter = btn.dataset.filter;
    galleryItems.forEach(item => {
      if (filter === 'all' || item.dataset.cat === filter) {
        item.classList.remove('hidden');
      } else {
        item.classList.add('hidden');
      }
    });
  });
});

// Lightbox — with navigation, caption, counter
const lightbox      = document.getElementById('lightbox');
const lightboxImg   = document.getElementById('lightbox-img');
const lightboxClose = document.getElementById('lightbox-close');
const lightboxPrev  = document.getElementById('lightbox-prev');
const lightboxNext  = document.getElementById('lightbox-next');
const lightboxCap   = document.getElementById('lightbox-caption');
const lightboxCount = document.getElementById('lightbox-counter');

let currentIndex = 0;

function getVisible() {
  return [...galleryItems].filter(item => !item.classList.contains('hidden'));
}

function openLightbox(index) {
  const visible = getVisible();
  if (!visible.length) return;
  currentIndex = (index + visible.length) % visible.length;
  const item = visible[currentIndex];
  const img  = item.querySelector('img');
  if (lightboxImg && img) {
    lightboxImg.src = img.src;
    lightboxImg.alt = img.alt;
  }
  if (lightboxCap)   lightboxCap.textContent   = img?.alt || '';
  if (lightboxCount) lightboxCount.textContent  = `${currentIndex + 1} / ${visible.length}`;
  lightbox?.classList.add('open');
  document.body.style.overflow = 'hidden';
}

function closeLightbox() {
  lightbox?.classList.remove('open');
  document.body.style.overflow = '';
}

// Open on thumbnail click
galleryItems.forEach(item => {
  item.addEventListener('click', () => {
    const visible = getVisible();
    const idx = visible.indexOf(item);
    if (idx !== -1) openLightbox(idx);
  });
});

lightboxClose?.addEventListener('click', closeLightbox);
lightboxPrev?.addEventListener('click', () => openLightbox(currentIndex - 1));
lightboxNext?.addEventListener('click', () => openLightbox(currentIndex + 1));

// Click outside image to close
lightbox?.addEventListener('click', e => {
  if (e.target === lightbox) closeLightbox();
});

document.addEventListener('keydown', e => {
  if (!lightbox?.classList.contains('open')) return;
  if (e.key === 'Escape')      closeLightbox();
  if (e.key === 'ArrowRight')  openLightbox(currentIndex + 1);
  if (e.key === 'ArrowLeft')   openLightbox(currentIndex - 1);
});

// ── Contact form validation ─────────────────────────────────
const contactForm = document.querySelector('#contact-form');
contactForm?.addEventListener('submit', e => {
  e.preventDefault();
  let valid = true;
  const required = contactForm.querySelectorAll('[required]');
  required.forEach(field => {
    field.style.borderColor = '';
    if (!field.value.trim()) {
      field.style.borderColor = '#e05252';
      valid = false;
    }
  });
  if (valid) {
    // Show success message
    const btn = contactForm.querySelector('button[type="submit"]');
    if (btn) {
      const original = btn.innerHTML;
      btn.innerHTML = '<i class="fa-solid fa-check"></i> Message Sent!';
      btn.style.background = 'var(--green-light)';
      btn.disabled = true;
      setTimeout(() => {
        btn.innerHTML = original;
        btn.style.background = '';
        btn.disabled = false;
        contactForm.reset();
      }, 3500);
    }
  }
});

// ── Smooth scroll for anchor links ─────────────────────────
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', e => {
    const target = document.querySelector(anchor.getAttribute('href'));
    if (target) {
      e.preventDefault();
      target.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  });
});
