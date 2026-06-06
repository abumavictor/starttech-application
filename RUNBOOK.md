# StartTech Application Runbook

## Deployments
- Frontend: Push to master branch triggers automatic deployment to S3
- Backend: Push to master branch triggers Docker build and ECR push

## Rollback
Run scripts/rollback.sh to revert to previous deployment

## Health Checks
Run scripts/health-check.sh to verify all services are running

## Logs
Backend logs available in CloudWatch Log Group: /starttech/backend
