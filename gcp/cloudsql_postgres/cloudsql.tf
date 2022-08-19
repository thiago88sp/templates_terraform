resource "random_id" "db_name_suffix" {
  byte_length = 4
}

# ---------------------------------------------------------------------------------------------------------------------
# NETWORK PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

#name = data.google_compute_network.name

resource "google_compute_global_address" "private_ip_address" {

  name          = "private-ip-address"
  project       = var.gcp_project_id
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = data.google_compute_network.vpc.id

}

resource "google_service_networking_connection" "private_vpc_connection" {

 network                 = data.google_compute_network.vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}


# ---------------------------------------------------------------------------------------------------------------------
# CLOUSQL (POSGRES) PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

resource "google_sql_database_instance" "instance" {

  #name                    = "private-instance-${random_id.db_name_suffix.hex}"
  name                    = "${var.gcp_project_id}-postgres"
  region                  = var.region
  database_version        = var.postgres_version
  project                 = var.gcp_project_id


  # To make it easier to test this example, we are disabling deletion protection so we can destroy the databases
  # during the tests. By default, we recommend setting deletion_protection to true, to ensure database instances are
  # not inadvertently destroyed.
  deletion_protection     = false

  depends_on = [google_service_networking_connection.private_vpc_connection]


  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = data.google_compute_network.vpc.id
      #allocated_ip_range = data.google_compute_subnetwork.postgres_subnet.secondary_ip_range.range_name
    }
    availability_type = var.availability_type
    disk_autoresize         = var.disk_autoresize
    disk_autoresize_limit   = var.disk_autoresize_limit
    disk_size               = var.disk_size
    disk_type               = var.disk_type
    pricing_plan            = var.pricing_plan
    activation_policy       = var.activation_policy

    maintenance_window {
      day  = var.maintenance_window_day
      hour = var.maintenance_window_hour  
    }

    location_preference {
      zone  = var.zone
      secondary_zone  = var.secondary_zone

    }

    user_labels = {
      env = "dev"
      purpose = "fidis"
    }

    dynamic "backup_configuration" {
      for_each = [var.backup_configuration]
      content {
        binary_log_enabled             = false
        enabled                        = local.backups_enabled
        start_time                     = lookup(backup_configuration.value, "start_time", null)
        location                       = lookup(backup_configuration.value, "location", null)
        point_in_time_recovery_enabled = local.point_in_time_recovery_enabled
        transaction_log_retention_days = lookup(backup_configuration.value, "transaction_log_retention_days", null)

        dynamic "backup_retention_settings" {
          for_each = local.retained_backups != null || local.retention_unit != null ? [var.backup_configuration] : []
          content {
            retained_backups = local.retained_backups
            retention_unit   = local.retention_unit
          }
        }
      }
    }
  }
}
