variable "snowflake_organization_name" {
  description = "Snowflake organization name"
  type        = string
}

variable "snowflake_account_name" {
  description = "Snowflake account name"
  type        = string
}

variable "snowflake_private_key_path" {
  description = "Path to the Snowflake private key"
  type        = string
  default     = "~/.ssh/snowflake_tf_snow_key.p8"
}

variable "snowflake_user" {
  description = "Snowflake user"
  type        = string
  default     = "FAISALMOMONIAT"
}

variable "snowflake_password" {
  description = "Snowflake user password"
  type        = string
  sensitive   = true
}

variable "snowflake_role" {
  description = "Snowflake role"
  type        = string
  default     = "SYSADMIN"
}

variable "database_retention_days" {
  description = "Data retention time in days for all databases"
  type        = number
  default     = 90
}

variable "database_collation" {
  description = "Default DDL collation for all databases"
  type        = string
  default     = "en_US"
}