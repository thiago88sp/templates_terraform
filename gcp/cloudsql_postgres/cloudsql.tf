# ---------------------------------------------------------------------------------------------------------------------
# CloudSQL - Postgres
# ---------------------------------------------------------------------------------------------------------------------

module "cloudsqlpostgres" {
  source = "./modules/postgres" 

  gcp_project_id = "terraformproject-359719"
  region     = "southamerica-east1"
  availability_type = "ZONAL"
  zone = "southamerica-east1-a"

}
