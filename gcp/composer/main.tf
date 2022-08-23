module "composer-environment" {
  source = "./modules/create_environment_v1"

  project_id              = var.project_id
  composer_env_name       = var.composer_env_name
  region                  = var.region
  zone                    = var.zone
  network                 = data.google_compute_network.vpc.name
  subnetwork              = data.google_compute_subnetwork.composer_subnet.name
  enable_private_endpoint = var.enable_private_endpoint
}
