# mlflow_dagshub_demo

# MLflow Model Deployment Demo

This project demonstrates an end-to-end local MLOps workflow for model packaging, containerization, Kubernetes deployment, and inference validation.

## Tools Used
- Python
- MLflow
- Docker
- Kubernetes (Docker Desktop)
- PowerShell / CMD
- Postman

## What Was Implemented
- Trained model packaged in MLflow format
- Docker image created for model serving
- Kubernetes deployment and service manifests created
- Model deployed on local Kubernetes
- Inference endpoint validated using curl and Postman

## Project Structure
- `first_experiment_model/` - exported MLflow model files
- `Dockerfile` - container build definition
- `k8s/deployment.yaml` - Kubernetes deployment manifest
- `k8s/service.yaml` - Kubernetes service manifest

## How to Run
1. Build the Docker image
2. Apply Kubernetes deployment and service
3. Port-forward the service
4. Send prediction request to `/invocations`

## Test Endpoint
Example endpoint:
`http://127.0.0.1:5002/invocations`

## Sample Result
The deployed model was validated successfully and returned predictions through the inference API.
