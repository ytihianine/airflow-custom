# Define ARGS (Defaults, overridden in Git CI)
ARG AIRFLOW_VERSION=2.11.0

# ------------------------------------------
# Install apps and packages
# ------------------------------------------
FROM apache/airflow:${AIRFLOW_VERSION}

WORKDIR /app

USER root

# Install apps
RUN apt-get update && apt-get install -y pgloader

# Switch back to airflow user
USER airflow

# Install packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

