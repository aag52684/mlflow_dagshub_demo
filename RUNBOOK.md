# Runbook

## Start Docker Container
`docker start first-experiment-container`

## Stop Docker Container
`docker stop first-experiment-container`

## Scale Kubernetes Deployment Up
`kubectl scale deployment first-experiment-model --replicas=1`

## Scale Kubernetes Deployment Down
`kubectl scale deployment first-experiment-model --replicas=0`

## Check Pods
`kubectl get pods`

## Check Services
`kubectl get svc`

## Port Forward Service
`kubectl port-forward service/first-experiment-service 5002:80`

## Test Endpoint
`curl -X POST http://127.0.0.1:5002/invocations -H "Content-Type: application/json" -d "{\"inputs\": [[0.1276369210104354,0.5388543360516529,-0.677549384520644,-0.5306479123499234,0.2697207514136527,0.286215260265736,0.24551629442856485,-0.17119612639661974,-1.0487003944182158,0.19594920307479496]]}"`