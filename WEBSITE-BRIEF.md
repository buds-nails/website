# Buds Nails - Website Build Brief

> Use this file as a prompt in VS Code (with Copilot, Cursor, or Claude) to generate the website.

---

## Business Overview

- **Business Name:** Buds Nails
- **Owner:** Katie Budding
- **Tagline suggestion:** "Natural nails, beautiful results" or "Your nails, naturally beautiful"
- **Location:** Newton Longville, Milton Keynes, Buckinghamshire, MK17
- **Instagram:** [@buds.nails](https://instagram.com/buds.nails)
- **Specialty:** Natural nails only — certified in Gel and BIAB (Builder in a Bottle)
- **Booking:** Currently via Instagram DM (website should add a proper booking option)

---

## Website Requirements

### Pages / Sections
Build as a single-page scrolling website with anchor navigation, OR a small multi-page site with these sections:

1. **Hero / Landing**
   - Full-width hero image (nail close-up or hands shot)
   - Business name "Buds Nails" with tagline
   - CTA button: "Book Now" (scrolls to booking section)
   - Subtle animation on load (fade-in)

2. **About**
   - Short bio about Katie
   - Emphasise: certified in Gel & BIAB, natural nails specialist
   - Friendly, personal tone — this is a one-woman business, not a corporate salon
   - Photo of Katie or her workspace (placeholder for now)

3. **Services & Pricing**
   - Clean card or table layout
   - Services to include (placeholder prices — Katie to confirm):

   | Service | Description | Price |
   |---------|-------------|-------|
   | Gel Manicure | Classic gel polish on natural nails | from GBP 25 |
   | BIAB Manicure | Builder in a Bottle for strength & shine | from GBP 35 |
   | BIAB Infills | Maintenance for existing BIAB | from GBP 30 |
   | Gel Pedicure | Gel polish pedicure treatment | from GBP 30 |
   | Nail Art | Custom designs, patterns & embellishments | from GBP 5 (add-on) |
   | Soak Off & Reapply | Removal of existing gel + fresh set | from GBP 35 |

   - Add a note: "All prices are a guide. DM me on Instagram for exact pricing."

4. **Gallery**
   - Grid layout showcasing nail work (3-4 columns on desktop, 2 on mobile)
   - Pull images from Instagram or use placeholder images
   - Lightbox effect on click
   - Consider an Instagram feed embed widget

5. **Booking**
   - Simple booking form OR embed a third-party booking widget
   - Options: Calendly embed, Fresha widget, or a simple contact form with fields:
     - Name
     - Phone number
     - Preferred date
     - Service required (dropdown)
     - Message (optional)
   - Alternative: Link/button that opens Instagram DM or WhatsApp

6. **Contact & Location**
   - Location: Newton Longville, Milton Keynes (no full address needed if home-based)
   - Embedded Google Map centred on Newton Longville
   - Instagram link (prominent)
   - Email address (placeholder: hello@budsnails.co.uk)
   - Phone number (placeholder)
   - Opening hours (placeholder — e.g. "By appointment only")

7. **Footer**
   - Copyright notice
   - Instagram icon/link
   - "Website made with love" credit
   - Back to top button

---

## Design Direction

### Colour Palette
Warm, feminine, and welcoming — reflecting Katie's friendly personality and natural nail focus:

| Colour | Hex | Usage |
|--------|-----|-------|
| Soft blush pink | #F5E6E0 | Primary background, hero overlay |
| Warm rose | #D4A0A0 | Accent colour, buttons, highlights |
| Deep mauve | #8B6F6F | Headings, strong text |
| Off-white / cream | #FFF9F7 | Card backgrounds, sections |
| Charcoal | #3D3535 | Body text |
| Gold accent | #C9A96E | Small details, icons, dividers |

### Typography
- **Headings:** Playfair Display (elegant serif) or Cormorant Garamond
- **Body text:** Lato, Open Sans, or Nunito (clean sans-serif)
- **Accent/script:** Pacifico or Dancing Script (for tagline or decorative text only — use sparingly)

### Layout & Style
- Clean, minimal design with plenty of white space
- Rounded corners on cards and buttons (soft, friendly feel)
- Subtle shadow on cards
- Smooth scroll between sections
- Fade-in animations on scroll (subtle, not overdone)
- Mobile-first responsive design
- Sticky/fixed navigation bar
- Hamburger menu on mobile

### Imagery Style
- Soft, natural lighting
- Close-up hand/nail shots
- Blush/neutral toned backgrounds
- Consistent filter/editing style across gallery

---

## Technical Specifications

### Recommended Stack
- **Option A (Simple):** HTML + CSS + vanilla JavaScript — single index.html with linked CSS/JS
- **Option B (Modern):** Next.js or React with Tailwind CSS
- **Option C (No-code friendly):** Build in a way that could easily be ported to Squarespace/Wix if Katie wants to manage it

### Key Technical Requirements
- Fully responsive (mobile, tablet, desktop)
- Fast loading (optimise images, lazy load gallery)
- SEO optimised with proper meta tags
- Open Graph tags for social sharing
- Accessible (WCAG AA compliant)
- Smooth scrolling navigation
- Contact form with basic validation
- Google Fonts loaded efficiently

### SEO Meta Tags
```html
<title>Buds Nails | Gel & BIAB Nail Specialist in Newton Longville, Milton Keynes</title>
<meta name="description" content="Buds Nails by Katie Budding. Certified Gel and BIAB nail technician specialising in natural nails. Based in Newton Longville, Milton Keynes. Book your appointment today!">
<meta name="keywords" content="nail salon Newton Longville, BIAB nails Milton Keynes, gel nails, natural nails, nail technician Buckinghamshire, nail art Milton Keynes">
```

### Structured Data (JSON-LD)
Include LocalBusiness schema markup:
```json
{
  "@context": "https://schema.org",
  "@type": "BeautySalon",
  "name": "Buds Nails",
  "description": "Certified Gel and BIAB nail technician specialising in natural nails",
  "url": "https://budsnails.co.uk",
  "image": "logo-or-hero-image-url",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Newton Longville",
    "addressRegion": "Buckinghamshire",
    "postalCode": "MK17",
    "addressCountry": "GB"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "51.9767",
    "longitude": "-0.7967"
  },
  "areaServed": ["Newton Longville", "Milton Keynes", "Bletchley", "Buckinghamshire"],
  "openingHours": "By appointment",
  "priceRange": "GBP GBP",
  "sameAs": ["https://instagram.com/buds.nails"]
}
```

---

## Content Tone & Voice

- **Warm and friendly** — like chatting to a mate, not a corporate salon
- **Confident but not boastful** — Katie is skilled and certified, let the work speak
- **Personal** — use "I" not "we" (it's Katie's personal brand)
- **Playful touches** — subtle emoji use is on-brand (hearts, sparkles)
- **Reassuring** — emphasise natural nail care, gentle approach, certified expertise

### Sample Copy

**Hero:** "Hey, I'm Katie! Welcome to Buds Nails — where beautiful nails start with healthy nails."

**About:** "I'm a certified Gel and BIAB nail technician based in Newton Longville, Milton Keynes. I specialise in natural nails because I believe the best manicures start with nail health. Whether you're after a classic gel mani, a strengthening BIAB treatment, or some gorgeous nail art — I've got you covered."

**Services intro:** "From a simple gel manicure to intricate nail art, every appointment is tailored to you."

**Booking CTA:** "Ready for your next set? Let's get you booked in!"

---

## Competitor Analysis Summary

Katie's main local competitor is **Elite Nails & Beauty** (also in Newton Longville), which uses Treatwell for booking but has a basic website. Most nail techs in the Milton Keynes area rely on Instagram and booking platforms rather than having their own website. This gives Buds Nails a competitive advantage — a dedicated website signals professionalism and makes it easier for new clients to find Katie through Google.

---

## Next Steps

1. Katie to confirm/adjust service list and pricing
2. Gather high-quality photos from Instagram for the gallery
3. Decide on booking method (form, Calendly, Fresha, or Instagram DM link)
4. Choose and register domain (suggestions: budsnails.co.uk, buds-nails.co.uk)
5. Build the site using this brief
6. Test on mobile devices
7. Set up Google Business Profile for local SEO
