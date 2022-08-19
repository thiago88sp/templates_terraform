resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {

  name                    = "private-instance-${random_id.db_name_suffix.hex}"
  region                  = var.region
  database_version        = var.postgres_version
  project                 = var.gcp_project_id

  settings {
    tier = "db-f1-micro"
    #ip_configuration {
    #  ipv4_enabled    = false
    #  private_network = data.google_compute_network.vpc.private_network.id
    #}
    availability_type = var.availability_type
    disk_autoresize         = var.disk_autoresize
    disk_autoresize_limit   = var.disk_autoresize_limit
    disk_size               = var.disk_size
    disk_type               = var.disk_type
    pricing_plan            = var.pricing_plan

    maintenance_window {
      day  = var.maintenance_window_day
      hour = var.maintenance_window_hour  
    }

  }


}
