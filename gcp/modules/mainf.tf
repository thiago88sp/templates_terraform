# ---------------------------------------------------------------------------------------------------------------------
# CloudSQL - Postgres
# ---------------------------------------------------------------------------------------------------------------------

module "cloudsqlpostgres" {
  source = "./cloudsql/postgres"

  cloudsql_projectid = "terraformproject-359719"
  region_cloudsql    = "southamerica-east1"
  availability_type  = "ZONAL"
  zone_cloudsql      = "southamerica-east1-a"
  #network_project_id = var.network_project_id

}

# ---------------------------------------------------------------------------------------------------------------------
# Composer
# ---------------------------------------------------------------------------------------------------------------------

module "composer-environment" {
  source = "./composer/create_environment_v1"

  project_id_composer = var.project_id_composer
  composer_env_name   = var.composer_env_name
  region_composer     = var.region_composer
  zone_composer       = var.zone_composer

}

# ---------------------------------------------------------------------------------------------------------------------
# Compute Engine
# ---------------------------------------------------------------------------------------------------------------------

module "compute_engine" {
  source = "./compute_engine"

  project_id_gce     = "terraformproject-359719"
  region_gce         = "southamerica-east1"
  vmname             = "teste"
  zone_gce           = "southamerica-east1-a"
  nginx_install      = true
  #network_project_id = var.network_project_id

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