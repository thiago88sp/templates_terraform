# ---------------------------------------------------------------------------------------------------------------------
# Compute Engine
# ---------------------------------------------------------------------------------------------------------------------

module "compute_engine" {
  source = "./modules/compute_engine" 

  project_id    = "terraformproject-359719"
  region        = "southamerica-east1"
  vmname        = "teste"
  zone          = "southamerica-east1-a"
  nginx_install = true

}