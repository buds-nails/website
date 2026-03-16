#!/bin/bash
# ============================================================
# BUDS NAILS - AWS Setup Commands
# Paste these into AWS CloudShell (us-east-1) one block at a time
# ============================================================

# -----------------------------------------------------------
# STEP 1: Create Origin Access Control (OAC) for CloudFront
# -----------------------------------------------------------
OAC_ID=$(aws cloudfront create-origin-access-control \
  --origin-access-control-config \
    Name="budsnail-oac",\
    Description="OAC for budsnail.co.uk S3 bucket",\
    SigningProtocol="sigv4",\
    SigningBehavior="always",\
    OriginAccessControlOriginType="s3" \
  --query 'OriginAccessControl.Id' \
  --output text)
echo "OAC ID: $OAC_ID"

# -----------------------------------------------------------
# STEP 2: Create CloudFront Distribution
# -----------------------------------------------------------
DIST=$(aws cloudfront create-distribution --distribution-config '{
  "CallerReference": "budsnail-'$(date +%s)'",
  "Comment": "Buds Nails website - budsnail.co.uk",
  "DefaultRootObject": "index.html",
  "Aliases": {
    "Quantity": 2,
    "Items": ["budsnail.co.uk", "www.budsnail.co.uk"]
  },
  "Origins": {
    "Quantity": 1,
    "Items": [{
      "Id": "s3-budsnail",
      "DomainName": "budsnail.co.uk.s3.eu-west-2.amazonaws.com",
      "S3OriginConfig": {"OriginAccessIdentity": ""},
      "OriginAccessControlId": "'$OAC_ID'"
    }]
  },
  "DefaultCacheBehavior": {
    "TargetOriginId": "s3-budsnail",
    "ViewerProtocolPolicy": "redirect-to-https",
    "CachePolicyId": "658327ea-f89d-4fab-a63d-7e88639e58f6",
    "Compress": true,
    "AllowedMethods": {
      "Quantity": 2,
      "Items": ["GET", "HEAD"],
      "CachedMethods": {"Quantity": 2, "Items": ["GET", "HEAD"]}
    }
  },
  "CustomErrorResponses": {
    "Quantity": 1,
    "Items": [{
      "ErrorCode": 403,
      "ResponsePagePath": "/index.html",
      "ResponseCode": "200",
      "ErrorCachingMinTTL": 10
    }]
  },
  "ViewerCertificate": {
    "ACMCertificateArn": "arn:aws:acm:us-east-1:669773239112:certificate/0ddad75e-4ef2-4fd7-b80b-2b8e69aa4276",
    "SSLSupportMethod": "sni-only",
    "MinimumProtocolVersion": "TLSv1.2_2021"
  },
  "Enabled": true,
  "HttpVersion": "http2and3",
  "PriceClass": "PriceClass_100"
}')

DIST_ID=$(echo $DIST | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['Distribution']['Id'])")
DIST_DOMAIN=$(echo $DIST | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['Distribution']['DomainName'])")
echo "Distribution ID: $DIST_ID"
echo "Distribution Domain: $DIST_DOMAIN"

# -----------------------------------------------------------
# STEP 3: Update S3 Bucket Policy to allow CloudFront OAC
# -----------------------------------------------------------
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
aws s3api put-bucket-policy --bucket budsnail.co.uk --policy '{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "AllowCloudFrontOAC",
    "Effect": "Allow",
    "Principal": {"Service": "cloudfront.amazonaws.com"},
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::budsnail.co.uk/*",
    "Condition": {
      "StringEquals": {
        "AWS:SourceArn": "arn:aws:cloudfront::'$ACCOUNT_ID':distribution/'$DIST_ID'"
      }
    }
  }]
}'
echo "Bucket policy updated"

# -----------------------------------------------------------
# STEP 4: Create IAM user for GitHub Actions deployments
# -----------------------------------------------------------
aws iam create-user --user-name budsnail-github-deploy --tags Key=Project,Value=BudsNails

aws iam put-user-policy \
  --user-name budsnail-github-deploy \
  --policy-name budsnail-deploy-policy \
  --policy-document '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "S3Deploy",
        "Effect": "Allow",
        "Action": ["s3:PutObject","s3:DeleteObject","s3:ListBucket","s3:GetObject"],
        "Resource": ["arn:aws:s3:::budsnail.co.uk","arn:aws:s3:::budsnail.co.uk/*"]
      },
      {
        "Sid": "CloudFrontInvalidate",
        "Effect": "Allow",
        "Action": ["cloudfront:CreateInvalidation"],
        "Resource": "arn:aws:cloudfront::'$ACCOUNT_ID':distribution/'$DIST_ID'"
      }
    ]
  }'

KEYS=$(aws iam create-access-key --user-name budsnail-github-deploy)
ACCESS_KEY=$(echo $KEYS | python3 -c "import sys,json; k=json.load(sys.stdin)['AccessKey']; print(k['AccessKeyId'])")
SECRET_KEY=$(echo $KEYS | python3 -c "import sys,json; k=json.load(sys.stdin)['AccessKey']; print(k['SecretAccessKey'])")

echo ""
echo "============================================"
echo "SAVE THESE - you will not see them again!"
echo "============================================"
echo "AWS_ACCESS_KEY_ID:          $ACCESS_KEY"
echo "AWS_SECRET_ACCESS_KEY:      $SECRET_KEY"
echo "CLOUDFRONT_DISTRIBUTION_ID: $DIST_ID"
echo "CloudFront Domain:          $DIST_DOMAIN"
echo "============================================"
echo "Add these as GitHub Actions secrets at:"
echo "https://github.com/buds-nails/website/settings/secrets/actions"
echo ""
echo "Then add this DNS record at your domain registrar:"
echo "CNAME  budsnail.co.uk  ->  $DIST_DOMAIN"
echo "CNAME  www.budsnail.co.uk  ->  $DIST_DOMAIN"
echo "============================================"
