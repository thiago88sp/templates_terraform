terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.32.0"
    }
  }
}

provider "google" {
  credentials = file("terraformproject.json")
}

terraform {
  backend "gcs" {
  }
}