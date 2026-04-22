# Buds Nails — Infra notes

Minimal reference for the AWS pieces that serve budsnails.co.uk.

## Hosting
- **S3 Bucket:** `budsnail.co.uk` (singular — original typo, kept)
- **Region:** `eu-west-2` (London)
- **CloudFront Distribution ID:** `E3CNIYS8ATC7LZ`
- **Aliases:** `budsnails.co.uk`, `www.budsnails.co.uk`

## CloudFront Function — folder URL rewrite
File: `cloudfront-folder-index.js`
- **Name:** `budsnails-folder-index`
- **Runtime:** `cloudfront-js-1.0`
- **Event:** viewer-request
- **Why:** CloudFront origin is the S3 **REST** endpoint (not the website endpoint), which doesn't auto-resolve folder URLs to `index.html`. Without this function, `/blog/` returns a 404/fallback instead of `/blog/index.html`.

### Updating the function
```bash
# Get current ETag
aws cloudfront describe-function --name budsnails-folder-index --query 'ETag' --output text

# Update code (replace <ETAG> with the value above)
aws cloudfront update-function \
  --name budsnails-folder-index \
  --function-config "Comment=Rewrite folder URLs to index.html,Runtime=cloudfront-js-1.0" \
  --function-code fileb://infra/cloudfront-folder-index.js \
  --if-match <ETAG>

# Publish
aws cloudfront publish-function --name budsnails-folder-index --if-match <NEW_ETAG>
```

Function is already attached to the distribution's DefaultCacheBehavior — no need to re-associate unless the distribution is recreated.
