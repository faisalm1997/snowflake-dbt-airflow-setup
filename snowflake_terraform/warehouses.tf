# Landing Warehouse: Small, cost-effective, for raw data ingestion
resource "snowflake_warehouse" "Landing" {
  name                         = "Landing_WH"
  warehouse_type               = "STANDARD"
  warehouse_size               = "XSMALL"
  initially_suspended          = true
  auto_suspend                 = 60
  auto_resume                  = true
  min_cluster_count            = 1
  max_cluster_count            = 1
  scaling_policy               = "STANDARD"
  statement_timeout_in_seconds = 1800
  comment                      = "Landing warehouse for raw data ingestion"
  generation                   = 2
}

# Transformation Warehouse: Medium, for ETL/ELT processing
resource "snowflake_warehouse" "Transformation" {
  name                         = "Transformation_WH"
  warehouse_type               = "STANDARD"
  warehouse_size               = "SMALL"
  initially_suspended          = true
  auto_suspend                 = 300
  auto_resume                  = true
  min_cluster_count            = 1
  max_cluster_count            = 2
  scaling_policy               = "ECONOMY"
  statement_timeout_in_seconds = 3600
  comment                      = "Transformation warehouse for ETL/ELT processing"
  generation                   = 2
}

# Analytics Warehouse: Large, for BI/reporting workloads
resource "snowflake_warehouse" "Analytics" {
  name                         = "Analytics_WH"
  warehouse_type               = "STANDARD"
  warehouse_size               = "SMALL"
  initially_suspended          = false
  auto_suspend                 = 600
  auto_resume                  = true
  min_cluster_count            = 2
  max_cluster_count            = 5
  scaling_policy               = "STANDARD"
  statement_timeout_in_seconds = 7200
  comment                      = "Analytics warehouse for BI/reporting workloads"
  generation                   = 2
}