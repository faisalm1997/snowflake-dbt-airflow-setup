# Landing Database Schemas
resource "snowflake_schema" "landing_schema_a" {
  name       = "Schema_A"
  database   = snowflake_database.Landing.name
  comment    = "Schema A in Landing database"
  depends_on = [snowflake_database.Landing]
}

resource "snowflake_schema" "landing_schema_b" {
  name       = "Schema_B"
  database   = snowflake_database.Landing.name
  comment    = "Schema B in Landing database"
  depends_on = [snowflake_database.Landing]
}

# Transformation Database Schemas
resource "snowflake_schema" "transformation_schema_a" {
  name       = "Schema_A"
  database   = snowflake_database.Transformation.name
  comment    = "Schema A in Transformation database"
  depends_on = [snowflake_database.Transformation]
}

resource "snowflake_schema" "transformation_schema_b" {
  name       = "Schema_B"
  database   = snowflake_database.Transformation.name
  comment    = "Schema B in Transformation database"
  depends_on = [snowflake_database.Transformation]
}

# Analytics Database Schemas
resource "snowflake_schema" "analytics_schema_a" {
  name       = "Schema_A"
  database   = snowflake_database.Analytics.name
  comment    = "Schema A in Analytics database"
  depends_on = [snowflake_database.Analytics]
}

resource "snowflake_schema" "analytics_schema_b" {
  name       = "Schema_B"
  database   = snowflake_database.Analytics.name
  comment    = "Schema B in Analytics database"
  depends_on = [snowflake_database.Analytics]
}