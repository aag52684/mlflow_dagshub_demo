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




## Run Steps

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

## Databricks MLflow Validation
- Created a Databricks notebook for MLflow validation
- Attached serverless compute and verified notebook execution
- Created an MLflow experiment and logged multiple runs
- Validated run tracking and comparison flow in Databricks