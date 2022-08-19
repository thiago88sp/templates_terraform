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
  project = var.gcp_project_id
}

#Consume existing Subnet
data "google_compute_subnetwork" "pvt_subnet" {
  name   = "pvt-subrede"
  project = var.gcp_project_id
  region = "southamerica-east1"
}