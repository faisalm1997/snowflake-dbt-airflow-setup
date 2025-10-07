# Airflow, DBT, and Snowflake Integration

## Overview

This project demonstrates how to orchestrate DBT workflows on Snowflake using Apache Airflow.  
It provides a modern, scalable data engineering pipeline leveraging Airflow for scheduling, DBT for transformations, and Snowflake as the data warehouse.

---

## Architecture

- **Airflow**: Orchestrates and schedules DBT runs.
- **DBT**: Handles SQL-based data transformations in Snowflake.
- **Snowflake**: Cloud data warehouse for storage and analytics.

---

## Prerequisites

- Python 3.8 or higher
- [Snowflake account](https://signup.snowflake.com/)
- [DBT CLI](https://docs.getdbt.com/docs/core/cli-installation)
- [Apache Airflow](https://airflow.apache.org/)
- [Snowflake Python Connector](https://docs.snowflake.com/en/developer-guide/python-connector/python-connector)
- [DBT Snowflake Adapter](https://docs.getdbt.com/reference/adapter/snowflake)

---

## Setup Instructions

1. Clone the Repository

    ```sh
    git clone https://github.com/<your-username>/snowflake-dbt-airflow-setup.git
    cd snowflake-dbt-airflow-setup
    ```

2. Create and Activate a Virtual Environment

    ```sh
    python3 -m venv venv
    source venv/bin/activate
    ```

3. Install Dependencies

    ```sh
    pip install -r requirements.txt
    pip install dbt-snowflake
    ```

### Configure and setup Airflow

Airflow has already been installed and comes part of the ```requirements.txt``` file. Simply, type ```airflow version``` to confirm that airflow is up and running. 

1. Set AIRFLOW_HOME as current directory 

    ```sh 
    export AIRFLOW_HOME="$(pwd)"
    ```

2. Initialise Airflow 

    ```sh 
    airflow db migrate
    ```

3. Kickstart Airflow using the pre build bash script 

    ```sh 
    cd dbt_airflow 
    ./operational_scripts/start_airflow.sh 
    ```

4. Access the airflow UI

Open your browser and navigate to `http://localhost:8080`. You should see the Airflow web interface.

5. Stop Airflow services

To stop the Airflow services, you can use the provided stop script:

    ```sh
    cd dbt_airflow 
    ./operational_scripts/stop_airflow.sh
    ```

---

### Debugging and troubleshooting Airflow issues 

- **DAG not showing up:**  
  - Ensure your DAG file is in the `$AIRFLOW_HOME/dags` directory.
  - The file must end with `.py` and contain a valid `DAG` object.
  - Restart the scheduler and webserver after adding new DAGs.
  - Check logs in `$AIRFLOW_HOME/logs` for errors.

- **Port conflicts:**  
  - If port 8080 is in use, start the webserver on a different port:  

  ```sh
  airflow webserver --port 8081
  ```

- **Database backend:**  
  - For production, use PostgreSQL or MySQL instead of the default SQLite.  
    Update the `sql_alchemy_conn` setting in `airflow.cfg`.