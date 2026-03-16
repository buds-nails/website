# Buds Nails Website

Website for **Buds Nails** — Katie Budding's gel & BIAB nail studio in Newton Longville, Milton Keynes.

🌐 **Live site:** [budsnail.co.uk](https://budsnail.co.uk)
📸 **Instagram:** [@buds.nails](https://instagram.com/buds.nails)

---

## Project Structure

```
buds-nails-website/
├── public/
│   └── index.html          # Main HTML file
├── src/
│   ├── css/
│   │   └── styles.css      # All styles
│   ├── js/
│   │   └── main.js         # JavaScript
│   └── images/
│       ├── gallery/        # Nail work photos (from Instagram)
│       └── ui/             # Logos, icons, UI assets
├── .github/
│   └── workflows/
│       └── deploy.yml      # Auto-deploy to AWS S3 on push to main
└── WEBSITE-BRIEF.md        # Full design brief & prompts for AI coding
```

## Getting Started (VS Code)

1. Clone the repo: `git clone https://github.com/buds-nails/website.git`
2. Open in VS Code
3. Use **WEBSITE-BRIEF.md** and **vscode-prompt.md** as your AI prompt to build out the full site
4. Push to `main` to auto-deploy to [budsnail.co.uk](https://budsnail.co.uk)

## AWS Infrastructure

| Resource | Details |
|---|---|
| S3 Bucket | `budsnail.co.uk` (static website hosting) |
| CloudFront | CDN distribution → `budsnail.co.uk` |
| ACM Certificate | SSL for `budsnail.co.uk` + `www.budsnail.co.uk` |
| Region | `us-east-1` (required for CloudFront ACM) |

## GitHub Secrets Required

Add these in **Settings → Secrets → Actions**:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `CLOUDFRONT_DISTRIBUTION_ID`

## Design

See **WEBSITE-BRIEF.md** for the full design spec including colour palette, typography, copy, and SEO setup.
