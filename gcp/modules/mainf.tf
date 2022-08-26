# ---------------------------------------------------------------------------------------------------------------------
# CloudSQL - Postgres
# ---------------------------------------------------------------------------------------------------------------------

module "cloudsqlpostgres" {
  source = "./cloudsql/postgres"

  gcp_project_id    = "terraformproject-359719"
  region            = "southamerica-east1"
  availability_type = "ZONAL"
  zone              = "southamerica-east1-a"

}

# ---------------------------------------------------------------------------------------------------------------------
# Composer
# ---------------------------------------------------------------------------------------------------------------------

module "composer-environment" {
  source = "./composer/create_environment_v1"

  project_id        = var.project_id
  composer_env_name = var.composer_env_name
  region            = var.region
  zone              = var.zone

}

# ---------------------------------------------------------------------------------------------------------------------
# Compute Engine
# ---------------------------------------------------------------------------------------------------------------------

module "compute_engine" {
  source = "./compute_engine"

  project_id    = "terraformproject-359719"
  region        = "southamerica-east1"
  vmname        = "teste"
  zone          = "southamerica-east1-a"
  nginx_install = true

}


# ---------------------------------------------------------------------------------------------------------------------
# GKE
# ---------------------------------------------------------------------------------------------------------------------

module "gke" {
  source = "./gke"

  project_id                    = "terraformproject-359719"
  region                        = "southamerica-east1"
  http_load_balancing_disabled  = true
  master_ipv4_cidr_block        = "10.0.4.0/28"
  cluster_secondary_range_name  = "pods"
  cluster_secondary_range_cidr  = "10.0.0.0/24"
  services_secondary_range_name = "services"
  services_secondary_range_cidr = "10.0.1.0/24"
  environment                   = "dev"

}