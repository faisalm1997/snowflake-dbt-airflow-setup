terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.snowflake_user
  role              = var.snowflake_role
  password          = var.snowflake_password
}