# Snowflake Infrastructure with Terraform

## Overview

This guide explains how to provision and manage Snowflake infrastructure using Terraform, following best practices from the [Snowflake Terraform Quickstart](https://quickstarts.snowflake.com/guide/terraforming_snowflake/index.html#0).

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or higher installed
- A Snowflake account and user with sufficient privileges to create resources
- [Snowflake CLI (`snowsql`)](https://docs.snowflake.com/en/user-guide/snowsql-install-config) (optional, for testing)
- [Snowflake Terraform Provider](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs)

---

## Setup

### 1. Clone the Repository

```sh
git clone https://github.com/<your-org>/snowflake-dbt-airflow-setup.git
cd snowflake-dbt-airflow-setup/snowflake_terraform