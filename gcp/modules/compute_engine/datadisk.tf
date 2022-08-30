# ---------------------------------------------------------------------------------------------------------------------
# DATA DISK
# ---------------------------------------------------------------------------------------------------------------------

resource "google_compute_disk" "datadisk" {
  for_each = { for disk in var.datadisk_list : disk.name => disk }
  name    = each.value.name
  project = var.project_id_gce
  type    = "pd-ssd"
  zone    = var.zone_gce

  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
  size                      = each.value.size
}
