# Runbook

## 1. Docker Image Operations

### Build Docker image
`docker build -t first-experiment-model .`

### Run Docker container
`docker run -p 5001:8080 --name first-experiment-container first-experiment-model`

### Start Docker container
`docker start first-experiment-container`

### Stop Docker container
`docker stop first-experiment-container`

### Tag Docker image for environment use
`docker tag first-experiment-model:latest first-experiment-model:dev`
`docker tag first-experiment-model:latest first-experiment-model:qa`
`docker tag first-experiment-model:latest first-experiment-model:prod`

### Check local Docker images
`docker images`

## 2. Kubernetes Operations

### Scale Kubernetes deployment up
`kubectl scale deployment first-experiment-model --replicas=1`

### Scale Kubernetes deployment down
`kubectl scale deployment first-experiment-model --replicas=0`

### Check deployments
`kubectl get deploy`

### Check pods
`kubectl get pods`

### Watch pod status
`kubectl get pods -w`

### Check services
`kubectl get svc`

### Describe a pod
`kubectl describe pod <pod-name>`

### Delete a failed pod
`kubectl delete pod <pod-name>`

### Port-forward service
`kubectl port-forward service/first-experiment-service 5002:80`

## 3. Inference Validation

### Test endpoint through curl
`curl -X POST http://127.0.0.1:5002/invocations -H "Content-Type: application/json" -d "{\"inputs\": [[0.1276369210104354,0.5388543360516529,-0.677549384520644,-0.5306479123499234,0.2697207514136527,0.286215260265736,0.24551629442856485,-0.17119612639661974,-1.0487003944182158,0.19594920307479496]]}"`

## 4. Helm Commands

### Validate Helm chart
`helm template first-experiment ./helm/first-experiment`

### Validate dev values
`helm template first-experiment ./helm/first-experiment -f ./helm/first-experiment/values-dev.yaml`

### Validate qa values
`helm template first-experiment ./helm/first-experiment -f ./helm/first-experiment/values-qa.yaml`

### Validate prod values
`helm template first-experiment ./helm/first-experiment -f ./helm/first-experiment/values-prod.yaml`

### Deploy with Helm for dev
`helm upgrade --install first-experiment ./helm/first-experiment -f ./helm/first-experiment/values-dev.yaml`

### Deploy with Helm for prod
`helm upgrade --install first-experiment ./helm/first-experiment -f ./helm/first-experiment/values-prod.yaml`

## 5. Git and Branch Workflow

### Check current branch
`git branch`

### Check repository status
`git status`

### Create a new feature branch
`git checkout -b <feature-branch-name>`

### Push feature branch
`git push -u origin <feature-branch-name>`

### Pull latest main branch
`git checkout main`
`git pull origin main`

## 6. GitHub Actions / CI-CD Related Files

### Workflow paths
- `.github/workflows/deploy-dev.yaml`
- `.github/workflows/dev-cicd.yaml`

### Version control files
- `deployment/versions/dev-version.txt`
- `deployment/triggers/dev-trigger.txt`

## 7. Registry and Secrets Reference

### Expected GitHub Secrets
- `REGISTRY_USERNAME`
- `REGISTRY_TOKEN`

### Docker image naming pattern
`<registry-username>/first-experiment-model:<version>`

## 8. Current Operational Notes

- Dev, QA, and Prod Helm values are maintained separately
- CI/CD workflow currently includes version-driven execution flow
- Docker Hub integration is aligned in the workflow
- Full cluster authentication and real deployment execution from pipeline are the next steps
