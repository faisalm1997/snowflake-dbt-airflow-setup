# Snowflake Infrastructure with Terraform

## Directory Structure 
```
snowflake_terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── databases.tf
├── schemas.tf
├── warehouses.tf
├── Makefile
└── [README.md]
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or higher installed
- A Snowflake account and user with sufficient privileges to create resources
- [Snowflake CLI (`snowsql`)](https://docs.snowflake.com/en/user-guide/snowsql-install-config) (optional, for testing)
- [Snowflake Terraform Provider](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs)

---

## Setup

1. Clone the Repository

    ```sh
    git clone https://github.com/<your-org>/snowflake-dbt-airflow-setup.git
    cd snowflake-dbt-airflow-setup/snowflake_terraform
    ```

(The above step should already have been completed via the dbt/airflow setup steps)

2. Install terraform (if not already done so)

    ```sh
    brew tap hashicorp/tap
    brew install hashicorp/tap
    ```

3. Review and Edit Terraform Files:

    a. Edit variables.tf to set or override variables for your environment.
    
    b. Review main.tf, databases.tf, schemas.tf, and warehouses.tf to ensure the resources match your requirements.
    
    c. You can add or modify resources as needed for your Snowflake setup.

4. Setup terraform.tfvars file or export credentials locally 

    ```sh
    $ export SNOWFLAKE_USER="your_username"
    $ export SNOWFLAKE_PRIVATE_KEY_PATH="your_private_key_path"
    $ export SNOWFLAKE_ACCOUNT="your_account_locator"
    $ export SNOWFLAKE_REGION="your_region"
    ```

## Makefile 

A Makefile is provided to simplify common Terraform commands.
From the snowflake_terraform directory, you can run:

```sh
make init           # Initialize Terraform and download providers
make plan           # Show the execution plan
make apply          # Apply the changes (will prompt for approval)
make destroy       # Destroy all managed resources
make fmt            # Format Terraform files
make validate     # Validate Terraform configuration
make output         # Show Terraform outputs
```

## Troubleshooting

1. **Authentication errors:** Double-check your environment variables or terraform.tfvars for correct credentials.
2. **Provider version issues:** Ensure your Terraform provider version matches the requirements in main.tf.
3. **Permission errors:**
Make sure your Snowflake user has the necessary privileges to create/modify resources.
4. **State management:**
For team use, consider using a remote backend for storing Terraform state securely.