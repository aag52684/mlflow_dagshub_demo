# mlflow_dagshub_demo

# MLflow MLOps and CI/CD Demo

This project demonstrates an end-to-end MLOps workflow built step by step, starting from local MLflow experimentation and moving toward structured CI/CD automation.

## Current Scope

The project currently covers:
- MLflow experiment tracking and model packaging
- Docker-based image build for model serving
- Kubernetes deployment and inference validation
- Databricks notebook-based MLflow validation
- GitHub branching and pull-request based workflow
- Environment structure for `dev`, `qa`, and `prod`
- Helm chart based deployment packaging
- GitHub Actions based CI/CD workflow foundation
- Version-driven development pipeline flow with Docker Hub integration

## Tools Used

- Python
- MLflow
- Docker
- Kubernetes (Docker Desktop / local cluster)
- Helm
- GitHub Actions
- Databricks
- GitHub
- PowerShell / Git Bash / CMD
- Postman / curl

## What Has Been Implemented

### 1. MLflow and Packaging
- Local MLflow tracking was validated
- Experiments, parameters, and metrics were logged
- The trained model was packaged in MLflow format

### 2. Containerization and Kubernetes
- Docker image was built for model serving
- Kubernetes deployment and service manifests were created
- The application was deployed and tested on local Kubernetes
- Inference validation was completed successfully

### 3. Databricks Validation
- Databricks workspace and notebook flow were validated
- MLflow experiment tracking was tested in Databricks
- GitHub repository visibility was aligned inside Databricks

### 4. Environment and Helm Setup
- Initial `dev`, `qa`, and `prod` environment structure was created
- Helm chart structure was built for reusable deployment packaging
- Environment-specific Helm values were added and validated
- Helm-based deployment testing was completed on Kubernetes

### 5. GitHub Actions CI/CD Foundation
- Initial dev workflow was created for Helm validation
- Multi-environment validation was added for `dev`, `qa`, and `prod`
- Version-driven trigger flow was introduced for development releases
- Docker Hub token and GitHub Actions secrets were integrated
- Build and push stages were aligned in the dev CI/CD workflow
- Dev deployment flow has been structured in the workflow and validated at pipeline level

## Project Structure

- `first_experiment_model/` - exported MLflow model files
- `Dockerfile` - container build definition
- `k8s/` - Kubernetes deployment and service manifests
- `helm/first-experiment/` - Helm chart, templates, and values files
- `deployment/triggers/` - deployment trigger files
- `deployment/versions/` - environment version files
- `.github/workflows/` - GitHub Actions workflows
- `README.md` - project overview and usage notes
- `RUNBOOK.md` - operational command reference

## GitHub Actions Workflows

### `deploy-dev.yaml`
Used for Helm validation flow, including environment-based chart checks.

### `dev-cicd.yaml`
Used for the dev CI/CD flow, including:
- version-driven execution
- Helm validation
- Docker Hub authentication
- image build and push structure
- dev deployment flow structure

## How to Run Locally

### Docker
1. Build the image  
   `docker build -t first-experiment-model .`

2. Run the container  
   `docker run -p 5001:8080 --name first-experiment-container first-experiment-model`

3. Test the endpoint  
   `curl -X POST http://127.0.0.1:5001/invocations -H "Content-Type: application/json" -d "{\"inputs\": [[0.1276369210104354,0.5388543360516529,-0.677549384520644,-0.5306479123499234,0.2697207514136527,0.286215260265736,0.24551629442856485,-0.17119612639661974,-1.0487003944182158,0.19594920307479496]]}"`

### Kubernetes
1. Apply deployment  
   `kubectl apply -f k8s/deployment.yaml`

2. Apply service  
   `kubectl apply -f k8s/service.yaml`

3. Port-forward the service  
   `kubectl port-forward service/first-experiment-service 5002:80`

4. Test the endpoint  
   `curl -X POST http://127.0.0.1:5002/invocations -H "Content-Type: application/json" -d "{\"inputs\": [[0.1276369210104354,0.5388543360516529,-0.677549384520644,-0.5306479123499234,0.2697207514136527,0.286215260265736,0.24551629442856485,-0.17119612639661974,-1.0487003944182158,0.19594920307479496]]}"`

### Helm
1. Validate the chart  
   `helm template first-experiment ./helm/first-experiment`

2. Validate with environment-specific values  
   `helm template first-experiment ./helm/first-experiment -f ./helm/first-experiment/values-dev.yaml`

3. Deploy with Helm  
   `helm upgrade --install first-experiment ./helm/first-experiment -f ./helm/first-experiment/values-dev.yaml`

## Databricks MLflow Validation

The Databricks side was used to validate:
- notebook execution
- MLflow experiment creation
- parameter and metric logging
- run comparison flow

## Current Status

The project has moved beyond basic experimentation and now includes a working MLOps base plus a structured CI/CD foundation. The local deployment path is working, Helm packaging is in place, and GitHub Actions workflows are set up for validation and development-oriented pipeline flow.

## Pending / Next Enhancements

The following items are still planned for deeper implementation:
- real application dependency installation and build commands in CI
- real test execution in pipeline
- real Kubernetes cluster authentication in GitHub Actions
- actual Helm deployment from pipeline into a target cluster
- rollback strategy
- Jenkins pipeline exploration
- Argo CD / GitOps flow
- Terraform-based infrastructure work
- logging, monitoring, and observability improvements
- secrets, RBAC, ingress, and advanced Helm usage

## Sample Inference Endpoint

`http://127.0.0.1:5002/invocations`

## Sample Result

The deployment flow has been validated successfully and the inference endpoint returned predictions through the API.
