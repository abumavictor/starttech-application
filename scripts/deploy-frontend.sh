#!/bin/bash
set -e

echo "Deploying frontend to S3..."

cd frontend
npm ci
npm run build

aws s3 sync dist/ s3://starttech-frontend-prod --delete

aws cloudfront create-invalidation \
  --distribution-id $CLOUDFRONT_DISTRIBUTION_ID \
  --paths "/*"

echo "Frontend deployment complete!"
