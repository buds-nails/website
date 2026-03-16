# Buds Nails Website

Website for **Buds Nails** — Katie Budding's gel & BIAB nail studio in Newton Longville, Milton Keynes.

🌐 **Live site:** [budsnails.co.uk](https://budsnails.co.uk)
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
├── DNS-RECORDS.md          # Cloudflare DNS setup & ACM validation records
├── AWS-SETUP-COMMANDS.sh   # AWS infrastructure reference commands
└── WEBSITE-BRIEF.md        # Full design brief & prompts for AI coding
```

## Getting Started (VS Code)

1. Clone the repo: `git clone https://github.com/buds-nails/website.git`
2. Open in VS Code
3. Use **WEBSITE-BRIEF.md** as your reference for design spec and copy
4. Push to `main` to auto-deploy

## AWS Infrastructure

| Resource | Details |
|---|---|
| S3 Bucket | `budsnails.co.uk` (static website hosting) |
| CloudFront | `E3CNIYS8ATC7LZ` → `djc9ge60mjhrt.cloudfront.net` |
| ACM Certificate | `9b58e0e3-c2a8-41ad-9841-baeef0e14f1f` (us-east-1) |
| Domain | `budsnails.co.uk` (Cloudflare DNS, zone `7fce8ddb1b6ff4eaf9132228aba81a46`) |

## GitHub Secrets Required

Add these in **Settings → Secrets → Actions**:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `CLOUDFRONT_DISTRIBUTION_ID`

## Design

See **WEBSITE-BRIEF.md** for the full design spec including colour palette, typography, copy, and SEO setup.
See **DNS-RECORDS.md** for all DNS and infrastructure details.
