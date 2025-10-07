#!/bin/bash

echo "Stopping Airflow webserver..."
pkill -f "airflow webserver"
pkill -f "gunicorn"  # Airflow webserver uses gunicorn by default

echo "Stopping Airflow scheduler..."
pkill -f "airflow scheduler"

# Optionally, kill any remaining airflow processes
pkill -f "airflow"

echo "Airflow services stopped."