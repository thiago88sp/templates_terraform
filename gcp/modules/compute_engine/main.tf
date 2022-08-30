#resource "google_service_account" "default" {
#  account_id   = "service_account_id"
#  display_name = "Service Account"
#}

data "google_compute_zones" "available" {
  project = var.project_id_gce
  region  = var.region_gce
}

resource "random_id" "name_suffix" {
  byte_length = 2
}

# ---------------------------------------------------------------------------------------------------------------------
# GOOGLE COMPUTE INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_instance" "default" {
  name           = var.vmname
  project        = var.project_id_gce
  machine_type   = var.machine_type
  zone           = var.zone_gce
  desired_status = var.desired_status
  labels         = var.labels

  #tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  #// Local SSD disk
  #scratch_disk {
  #  interface = "SCSI"
  #}

  network_interface {
    network            = data.google_compute_network.vpc.name
    subnetwork         = data.google_compute_subnetwork.vm_subnet.name
    subnetwork_project = data.google_compute_subnetwork.vm_subnet.project

    access_config {
      // Ephemeral public IP
    }
  }

  #metadata = {
  #  sshKeys = join("",["thiago:",file("id_rsa.pub")])
  #}

  # ---------------------------------------------------------------------------------------------------------------------
  # NGINX INSTALL OR NOT
  # ---------------------------------------------------------------------------------------------------------------------

  metadata_startup_script = var.nginx_install ? file("${path.module}/nginx-install.sh") : ""

  # ---------------------------------------------------------------------------------------------------------------------
  # Service account to attach to the instance.
  # ---------------------------------------------------------------------------------------------------------------------

  #service_account {
  #  # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
  #  email  = google_service_account.default.email
  #  scopes = ["cloud-platform"]
  #}

  # ---------------------------------------------------------------------------------------------------------------------
  # Additional disks to attach to the instance
  # ---------------------------------------------------------------------------------------------------------------------


  dynamic "attached_disk" {
    for_each = { for disk in var.datadisk_list : disk.name => disk }
    content {
      source = attached_disk.value.name
      mode   = var.mode
    }
  }

  depends_on = [google_compute_disk.datadisk]
}
