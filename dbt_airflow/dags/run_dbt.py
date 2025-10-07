from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
}

with DAG('dbt_snowflake_pipeline',
         default_args=default_args,
         schedule='@daily',
         catchup=False) as dag:

    dbt_debug = BashOperator(
        task_id='dbt_debug',
        bash_command='dbt debug --profiles-dir /Users/faisalmomoniat/Documents/databricks-dbt-airflow/dbt_databricks'
    )

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='dbt run --profiles-dir /Users/faisalmomoniat/Documents/databricks-dbt-airflow/dbt_databricks'
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='dbt test --profiles-dir /Users/faisalmomoniat/Documents/databricks-dbt-airflow/dbt_databricks'
    )

    dbt_debug >> dbt_run >> dbt_test