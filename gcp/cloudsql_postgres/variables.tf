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
  description = "The availability type for the master instance.This is only used to set up high availability for the PostgreSQL instance. Can be either `ZONAL` or `REGIONAL`."
  type        = string
  default     = "ZONAL"
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size."
  type        = bool
  default     = true
}

variable "disk_autoresize_limit" {
  description = "The maximum size to which storage can be auto increased."
  type        = number
  default     = 0
}

variable "disk_size" {
  description = "The disk size for the master instance."
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  type        = string
  default     = "PER_USE"
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  type        = number
  default     = 1
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  type        = number
  default     = 23
}