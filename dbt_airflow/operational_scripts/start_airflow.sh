#!/bin/bash

# Build your virtual environment if needed 
# python3 -m venv venv

# Activate your virtual environment if needed
# source venv/bin/activate

# Set the AIRFLOW_HOME environment variable to the current directory
export AIRFLOW_HOME="$(pwd)"

# echo "Initialising Airflow DB..."
# airflow db migrate

echo "Starting Airflow webserver and scheduler..."
airflow api-server --port 8080 && airflow scheduler

echo "Airflow services started. Access the UI at http://localhost:8080"