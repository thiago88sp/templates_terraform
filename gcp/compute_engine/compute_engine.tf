#resource "google_service_account" "default" {
#  account_id   = "service_account_id"
#  display_name = "Service Account"
#}

data "google_compute_zones" "available" {
  project = var.project_id
  region  = var.region
}

resource "random_id" "name_suffix" {
  byte_length = 2
}


resource "google_compute_instance" "default" {
  name            = var.vmname
  project         = var.project_id
  machine_type    = "e2-standard-2"
  zone            = var.zone
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
  #  interface = "SCSI"
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
    sshKeys = join("",["thiago:",file("id_rsa.pub")])
  }


  #metadata_startup_script = "echo hi > /test.txt"
  metadata_startup_script = "nginx-install.sh"

  #service_account {
  #  # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #  email  = google_service_account.default.email
  #  scopes = ["cloud-platform"]
  #}

  attached_disk {
    source = google_compute_disk.datadisk.name
    mode  = "READ_WRITE"
  }
}

resource "google_compute_disk" "datadisk" {
  name  = "datadisk-${random_id.name_suffix.hex}"
  project = var.project_id
  type  = "pd-ssd"
  zone  = var.zone
  
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
  size  = "250"
}

