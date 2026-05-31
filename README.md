# StartTech Application

Full-stack application with React frontend and Golang backend, deployed on AWS with a complete CI/CD pipeline.

## Repository Structure

- frontend/ - React application (Vite + TypeScript)
- backend/ - Golang REST API
- scripts/ - Deployment and operations scripts
- .github/workflows/ - CI/CD pipelines

## CI/CD Pipelines

### Frontend Pipeline
Triggers on push to master when files in frontend/ change.
- Installs dependencies
- Runs security scan
- Builds production bundle
- Deploys to S3
- Invalidates CloudFront cache

### Backend Pipeline
Triggers on push to master when files in backend/ change.
- Runs Go tests
- Runs vulnerability scan
- Builds Docker image
- Pushes to ECR
- Deploys to EC2 via SSM

## GitHub Secrets Required

| Secret | Description |
|--------|-------------|
| AWS_ACCESS_KEY_ID | AWS access key |
| AWS_SECRET_ACCESS_KEY | AWS secret key |
| VITE_API_URL | Backend API URL |
| CLOUDFRONT_DISTRIBUTION_ID | CloudFront distribution ID |
| ECR_REGISTRY | ECR registry URL |
| TARGET_GROUP_ARN | ALB target group ARN |
| MONGODB_URI | MongoDB Atlas connection string |

## Local Development

### Frontend
Run: cd frontend && npm install && npm run dev

### Backend
Run: cd backend/MuchToDo && go mod download && go run cmd/main.go
