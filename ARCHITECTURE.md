# StartTech Application Architecture

## Overview
Full-stack application with React frontend and Golang backend.

## Components
- **Frontend**: React (Vite) served from AWS S3 via CloudFront CDN
- **Backend**: Golang API running on EC2 instances behind ALB
- **Cache**: ElastiCache Redis for sessions and caching
- **Database**: MongoDB Atlas for data persistence
- **Container Registry**: AWS ECR for Docker images

## CI/CD Flow
1. Code pushed to master branch triggers GitHub Actions
2. Frontend pipeline builds React and syncs to S3, invalidates CloudFront
3. Backend pipeline builds Docker image, pushes to ECR, deploys to EC2 via SSM

## Infrastructure
All infrastructure managed via Terraform in the starttech-infra repository.
