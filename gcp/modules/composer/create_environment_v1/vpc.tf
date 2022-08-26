# Create VPC
#resource "google_compute_network" "vpc" {
#  name                    = "${var.project_id}-vpc"
#  auto_create_subnetworks = "false"
#}

# Create Subnet
#resource "google_compute_subnetwork" "subnet" {
#  name          = "${var.project_id}-subnet"
#  region        = var.region
#  network       = google_compute_network.vpc.name
#  ip_cidr_range = "10.10.0.0/24"
#}

#Consume existing VPC
data "google_compute_network" "vpc" {
  name = "vpc-banco-fidis-nonprod"
  project = var.project_id
}

#Consume existing Subnet
data "google_compute_subnetwork" "composer_subnet" {
  name   = "subnet-bancofidis-nonprod-invalid"
  project = var.project_id
  region = "southamerica-east1"
#  secondary_ip_range  {
#    range_name  = ""
#    ip_cidr_range = ""
#  }
}