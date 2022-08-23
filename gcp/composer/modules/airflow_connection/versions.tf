terraform {
  required_version = ">= 0.13"

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-composer:airflow_connection/v3.3.0"
  }
}
