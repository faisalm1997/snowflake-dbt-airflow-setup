# dbt + Snowflake Integration Project

This project demonstrates how to connect [dbt](https://www.getdbt.com/) and [Snowflake](https://www.snowflake.com/) for analytics engineering and data transformation.

---

## Prerequisites

- [Python 3.7+](https://www.python.org/downloads/)
- [dbt-snowflake](https://docs.getdbt.com/reference/adapter/snowflake) (`pip install dbt-snowflake`)
- A Snowflake account with appropriate privileges
- Snowflake user credentials (username, password, account, warehouse, database, schema)

---

## Setup Instructions

### 1. Clone the Repository

```sh
git clone https://github.com/<your-username>/snowflake-dbt-airflow
cd snowflake_dbt
```

### 2. Install dbt-snowflake

```sh
pip install dbt-core
pip install dbt-snowflake
```

### 3. Configure Your dbt Profile

You can configure your Snowflake connection in one of two ways:

#### **A. Using Environment Variables (Recommended for Security)**

Set the following environment variables in your terminal or `.env` file:

```sh
export SNOWFLAKE_ACCOUNT=<your_account>
export SNOWFLAKE_USER=<your_user>
export SNOWFLAKE_PASSWORD=<your_password>
export SNOWFLAKE_ROLE=ACCOUNTADMIN
export SNOWFLAKE_DATABASE=<your_database>
export SNOWFLAKE_WAREHOUSE=COMPUTE_WH
export SNOWFLAKE_SCHEMA=DEFAULT
```

Your `profiles.yml` should look like:

```yaml
snowflake_dbt:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: "{{ env_var('SNOWFLAKE_ACCOUNT') }}"
      user: "{{ env_var('SNOWFLAKE_USER') }}"
      password: "{{ env_var('SNOWFLAKE_PASSWORD') }}"
      role: "{{ env_var('SNOWFLAKE_ROLE', 'ACCOUNTADMIN') }}"
      database: "{{ env_var('SNOWFLAKE_DATABASE') }}"
      warehouse: "{{ env_var('SNOWFLAKE_WAREHOUSE', 'COMPUTE_WH') }}"
      schema: "{{ env_var('SNOWFLAKE_SCHEMA', 'DEFAULT') }}"
      threads: 1
```

#### **B. Using Hardcoded Values in `profiles.yml`**

Edit your `~/.dbt/profiles.yml` (or use `--profiles-dir` to point to a custom location):

```yaml
snowflake_dbt:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <your_account>
      user: <your_user>
      password: <your_password>
      role: ACCOUNTADMIN
      database: <your_database>
      warehouse: COMPUTE_WH
      schema: DEFAULT
      threads: 1
```

---

## Running dbt Commands

After configuring your profile, you can run dbt commands as usual:

```sh
dbt debug # To test the connection
dbt run # To run dbt models
dbt test # To run dbt tests configured for the models
dbt docs generate # To generate data lineage docs
dbt docs serve # To produce the data lineage docs for viewing
```

If your `profiles.yml` is not in the default location (`~/.dbt`), use:

```sh
dbt run --profiles-dir /path/to/your/profiles/dir
```

---
## Troubleshooting

- Ensure your Snowflake account and warehouse are active.
- Double-check your account, user, password, and other connection values.
- Use `dbt debug` to verify your connection.

---

This quick setup guide should enable you to start developing models and transforming data in Snowflake using dbt.git r