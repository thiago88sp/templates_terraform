# ---------------------------------------------------------------------------------------------------------------------
# COMPOSER V2
# ---------------------------------------------------------------------------------------------------------------------

module "composer-environment" {
  source                           = "./modules/create_environment_v2"
  project_id                       = var.project_id
  composer_env_name                = var.composer_env_name
  region                           = var.region
  composer_service_account         = var.composer_service_account
  network                          = data.google_compute_network.vpc.name
  subnetwork                       = data.google_compute_subnetwork.composer_subnet.name
  #pod_ip_allocation_range_name     = var.pod_ip_allocation_range_name
  #service_ip_allocation_range_name = var.service_ip_allocation_range_name
  pod_ip_allocation_range_name     = "pods"
  service_ip_allocation_range_name = "services"
  grant_sa_agent_permission        = true
  environment_size                 = "ENVIRONMENT_SIZE_SMALL"
  scheduler = {
    cpu        = 0.5
    memory_gb  = 1.875
    storage_gb = 1
    count      = 1
  }
  web_server = {
    cpu        = 0.5
    memory_gb  = 1.875
    storage_gb = 1
  }
  worker = {
    cpu        = 0.5
    memory_gb  = 1.875
    storage_gb = 1
    min_count  = 1
    max_count  = 3
  }
}