locals {
  common_db_settings = {
    is_transient                    = false
    data_retention_time_in_days     = var.database_retention_days
    max_data_extension_time_in_days = var.database_retention_days
    default_ddl_collation           = var.database_collation
    replace_invalid_characters      = false
    quoted_identifiers_ignore_case  = false
  }
}

resource "snowflake_database" "Landing" {
  name    = "Landing"
  comment = "Landing database for raw uncurated data"

  is_transient                    = local.common_db_settings.is_transient
  data_retention_time_in_days     = local.common_db_settings.data_retention_time_in_days
  max_data_extension_time_in_days = local.common_db_settings.max_data_extension_time_in_days
  default_ddl_collation           = local.common_db_settings.default_ddl_collation
  replace_invalid_characters      = local.common_db_settings.replace_invalid_characters
  quoted_identifiers_ignore_case  = local.common_db_settings.quoted_identifiers_ignore_case
}

resource "snowflake_database" "Transformation" {
  name    = "Transformation"
  comment = "Transformation database for curated data"

  is_transient                    = local.common_db_settings.is_transient
  data_retention_time_in_days     = local.common_db_settings.data_retention_time_in_days
  max_data_extension_time_in_days = local.common_db_settings.max_data_extension_time_in_days
  default_ddl_collation           = local.common_db_settings.default_ddl_collation
  replace_invalid_characters      = local.common_db_settings.replace_invalid_characters
  quoted_identifiers_ignore_case  = local.common_db_settings.quoted_identifiers_ignore_case
}

resource "snowflake_database" "Analytics" {
  name    = "Analytics"
  comment = "Analytics database for business reporting"

  is_transient                    = local.common_db_settings.is_transient
  data_retention_time_in_days     = local.common_db_settings.data_retention_time_in_days
  max_data_extension_time_in_days = local.common_db_settings.max_data_extension_time_in_days
  default_ddl_collation           = local.common_db_settings.default_ddl_collation
  replace_invalid_characters      = local.common_db_settings.replace_invalid_characters
  quoted_identifiers_ignore_case  = local.common_db_settings.quoted_identifiers_ignore_case
}