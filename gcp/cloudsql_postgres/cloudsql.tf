resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "instance" {

  name             = "private-instance-${random_id.db_name_suffix.hex}"
  region           = var.region
  database_version = var.postgres_version
  project          = var.gcp_project_id

  settings {
    tier = "db-f1-micro"
    #ip_configuration {
    #  ipv4_enabled    = false
    #  private_network = data.google_compute_network.vpc.private_network.id
    #}
    availability_type = var.availability_type
  }
}
