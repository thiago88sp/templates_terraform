terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.32.0"
    }
  }
}

terraform {
  backend "gcs" {
  }
}

#provider "google" {
#  project = var.project_id
#  region  = var.region
#}