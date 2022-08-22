#resource "google_service_account" "default" {
#  account_id   = "service_account_id"
#  display_name = "Service Account"
#}

data "google_compute_zones" "available" {
  project = var.project_id
  region  = var.region
}


resource "google_compute_instance" "default" {
  name            = var.vmname
  project         = var.project_id
  machine_type    = "e2-medium"
  zone            = "southamerica-east1-a"
  #desired_status  = "TERMINATED"
  desired_status  = "RUNNING"
  labels          = var.labels

  #tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      #image = "debian-cloud/debian-11"
      image = data.google_compute_image.my_image.self_link
    }
  }

  #// Local SSD disk
  #scratch_disk {
  #  interface = "NVME"
  #}

  network_interface {
    network     = data.google_compute_network.vpc.name
    subnetwork  = data.google_compute_subnetwork.vm_subnet.name
    subnetwork_project = data.google_compute_subnetwork.vm_subnet.project

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    env = "dev"
    purpose = "fidis"
  }

  #metadata_startup_script = "echo hi > /test.txt"
  metadata_startup_script = "nginx-install.sh"

  #service_account {
  #  # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #  email  = google_service_account.default.email
  #  scopes = ["cloud-platform"]
  #}
}

