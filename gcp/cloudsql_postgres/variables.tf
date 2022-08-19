variable "gcp_project_id" {
  description = "The project ID to host the database in."
  type = string
}

variable "postgres_version" {
  description = "The engine version of the database, e.g. `POSTGRES_14`. See https://cloud.google.com/sql/docs/db-versions for supported versions."
  type        = string
  default     = "POSTGRES_14"
}

variable "region" {
  description = "The region to host the database in."
  type        = string
}

variable "availability_type" {
  description = "The availability type of the Cloud SQL instance"
  type        = string
}
