#!/bin/bash
set -e

echo "Deploying backend to EC2..."

cd Server/MuchToDo

docker build -t starttech-backend .

aws ecr get-login-password --region us-east-1 | \
  docker login --username AWS --password-stdin $ECR_REGISTRY

docker tag starttech-backend $ECR_REGISTRY/starttech-backend:latest
docker push $ECR_REGISTRY/starttech-backend:latest

aws ssm send-command \
  --targets "Key=tag:Name,Values=starttech-backend" \
  --document-name "AWS-RunShellScript" \
  --parameters commands=["docker pull $ECR_REGISTRY/starttech-backend:latest","docker stop starttech-backend || true","docker rm starttech-backend || true","docker run -d --name starttech-backend -p 80:8080 $ECR_REGISTRY/starttech-backend:latest"]

echo "Backend deployment complete!"
