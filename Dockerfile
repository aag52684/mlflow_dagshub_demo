FROM python:3.9-slim

RUN pip install --no-cache-dir mlflow==3.1.4 scikit-learn==1.6.1 cloudpickle pandas numpy

WORKDIR /app

COPY first_experiment_model /opt/ml/model

EXPOSE 8080

CMD ["python", "-m", "mlflow", "models", "serve", "-m", "/opt/ml/model", "-h", "0.0.0.0", "-p", "8080", "--no-conda"]