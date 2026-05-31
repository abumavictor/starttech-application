#!/bin/bash
set -e

echo "Rolling back backend deployment..."

PREVIOUS_TAG=${1:-"previous"}

aws ssm send-command \
  --targets "Key=tag:Name,Values=starttech-backend" \
  --document-name "AWS-RunShellScript" \
  --parameters commands=["docker pull $ECR_REGISTRY/starttech-backend:$PREVIOUS_TAG","docker stop starttech-backend || true","docker rm starttech-backend || true","docker run -d --name starttech-backend -p 80:8080 $ECR_REGISTRY/starttech-backend:$PREVIOUS_TAG"]

echo "Rollback to $PREVIOUS_TAG complete!"
