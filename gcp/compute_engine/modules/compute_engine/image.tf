data "google_compute_image" "my_image" {
  family  = "ubuntu-2204-lts"
  project = "ubuntu-os-cloud"
}