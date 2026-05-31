#!/bin/bash
set -e

echo "Running health checks..."

echo "Checking ALB target health..."
aws elbv2 describe-target-health \
  --target-group-arn $TARGET_GROUP_ARN \
  --query 'TargetHealthDescriptions[*].TargetHealth.State' \
  --output text

echo "Checking ASG status..."
aws autoscaling describe-auto-scaling-groups \
  --auto-scaling-group-names starttech-backend-asg \
  --query 'AutoScalingGroups[*].Instances[*].HealthStatus' \
  --output text

echo "Checking Redis status..."
aws elasticache describe-cache-clusters \
  --cache-cluster-id starttech-redis \
  --query 'CacheClusters[*].CacheClusterStatus' \
  --output text

echo "Health checks complete!"
