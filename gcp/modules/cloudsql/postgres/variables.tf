variable "cloudsql_projectid" {
  description = "The project ID to host the database in."
  type        = string
}

variable "net_project_id" {
  description = "The project ID from Network."
  type        = string
  default     = "terraformproject-359719"
}

variable "postgres_version" {
  description = "The engine version of the database, e.g. `POSTGRES_14`. See https://cloud.google.com/sql/docs/db-versions for supported versions."
  type        = string
  default     = "POSTGRES_14"
}

variable "region_cloudsql" {
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

variable "zone_cloudsql" {
  type        = string
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
}

variable "secondary_zone_cloudsql" {
  type        = string
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  default     = ""
}

variable "activation_policy" {
  description = "The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  type        = string
  default     = "ALWAYS"
}

variable "backup_configuration" {
  description = "The backup_configuration settings subblock for the database setings"
  type = object({
    enabled                        = bool
    start_time                     = string
    location                       = string
    point_in_time_recovery_enabled = bool
    transaction_log_retention_days = string
    retained_backups               = number
    retention_unit                 = string
  })
  default = {
    enabled                        = false
    start_time                     = null
    location                       = null
    point_in_time_recovery_enabled = false
    transaction_log_retention_days = null
    retained_backups               = null
    retention_unit                 = null
  }
}

variable "user_labels" {
  description = "The key/value labels for the master instances."
  type        = map(string)
  default     = {}
}

variable "purpose" {
  type        = string
  description = "The purpose of the resource. Possible values include: VPC_PEERING - for peer networks and PRIVATE_SERVICE_CONNECT - for (Beta only) Private Service Connect networks"
  default     = "VPC_PEERING"
}

variable "address_type" {
  type        = string
  description = "The type of the address to reserve. EXTERNAL indicates public/external single IP address. INTERNAL indicates internal IP ranges belonging to some network. Default value is EXTERNAL. Possible values are EXTERNAL and INTERNAL."
  default     = "INTERNAL"
}

variable "prefix_length" {
  type        = number
  description = "The prefix length of the IP range. If not present, it means the address field is a single IP address. This field is not applicable to addresses with addressType=EXTERNAL, or addressType=INTERNAL when purpose=PRIVATE_SERVICE_CONNECT"
  default     = 16
}