# DNS Records for budsnails.co.uk

> ✅ **All DNS records are already configured in Cloudflare.**
> The only action needed is to wait for the domain transfer from Wix to Cloudflare to complete (typically 5–7 days for .co.uk). Once complete, Cloudflare will automatically set the nameservers and all DNS records below will go live.

---

## ACTION REQUIRED: Complete Domain Transfer

The domain `budsnails.co.uk` is currently transferring from Wix to Cloudflare Registrar. You should receive an email to confirm/approve the transfer. Once complete, Cloudflare automatically manages the nameservers — no manual nameserver update needed.

**Assigned Cloudflare Nameservers (for reference):**

| Nameserver |
|-----------|
| `julian.ns.cloudflare.com` |
| `ollie.ns.cloudflare.com` |

---

## ALSO REQUIRED: Update CloudFront After ACM Cert Validates

Once the domain transfer completes and DNS propagates, the ACM certificate will validate automatically (green tick in AWS). Then update the CloudFront distribution:

1. Go to [AWS CloudFront](https://console.aws.amazon.com/cloudfront/home) → Distribution `E3CNIYS8ATC7LZ`
2. Edit → **Alternate domain names (CNAMEs)**: add `budsnails.co.uk` and `www.budsnails.co.uk`
3. **Custom SSL certificate**: select cert `9b58e0e3-c2a8-41ad-9841-baeef0e14f1f` (budsnails.co.uk)
4. Save

---

## OPTIONAL: Delete Old Wrong Zone

There is an old `budsnail.co.uk` (without 's') zone sitting in Cloudflare in "Pending setup" state — it was created by mistake and is completely harmless. To delete it:

1. Go to [Cloudflare Domains](https://dash.cloudflare.com/2928f64a70e66358fcc43e359d261779/domains/overview)
2. Click ⋮ next to `budsnail.co.uk`
3. Scroll down in the dropdown and click **Remove from Cloudflare**

---

## DNS Records (already in Cloudflare — no action needed)

---

## 1. SSL Certificate Validation (ACM)

These two CNAME records prove you own the domain. AWS Certificate Manager will issue the SSL cert once DNS resolves through Cloudflare.

| Type | Name | Value |
|------|------|-------|
| CNAME | `_50c92fd7d1b71dcf335f6cd58987e778.budsnails.co.uk.` | `_39fe67c89bfb3103efad232b13143a56.jkddzztszm.acm-validations.aws.` |
| CNAME | `_9ef9c31e4c04c64a5c450ca1f2add7bd.www.budsnails.co.uk.` | `_bd1b1de3f7f6db4cbf99d93b24a958ec.jkddzztszm.acm-validations.aws.` |

> ⚠️ Both records are set to **DNS only** (not proxied) — required for ACM validation.

---

## 2. Point Domain to CloudFront

These two CNAME records direct traffic to the website once the ACM cert is issued.

| Type | Name | Value |
|------|------|-------|
| CNAME | `budsnails.co.uk` (root / @) | `djc9ge60mjhrt.cloudfront.net` |
| CNAME | `www.budsnails.co.uk` | `djc9ge60mjhrt.cloudfront.net` |

> ⚠️ Both records are set to **DNS only** (not proxied) — required for CloudFront to work correctly.

---

## Cloudflare Summary

| Resource | Value |
|----------|-------|
| Domain | `budsnails.co.uk` |
| Zone ID | `7fce8ddb1b6ff4eaf9132228aba81a46` |
| Nameserver 1 | `julian.ns.cloudflare.com` |
| Nameserver 2 | `ollie.ns.cloudflare.com` |
| Account | `Info@depthoflight.co.uk` (existing Cloudflare account) |

---

## AWS Resources Summary

| Resource | Value |
|----------|-------|
| S3 Bucket | `budsnail.co.uk` (eu-west-2 / London) |
| ACM Certificate ID | `9b58e0e3-c2a8-41ad-9841-baeef0e14f1f` |
| ACM Region | `us-east-1` (required for CloudFront) |
| ACM Status | Pending validation (validates once domain transfer completes) |
| CloudFront Distribution ID | `E3CNIYS8ATC7LZ` |
| CloudFront Domain | `djc9ge60mjhrt.cloudfront.net` |
| OAC ID | `E1QXKNKR6IVKZ` |
