variable "vmname" {
  description = "The name of VM."
  type        = string
}

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "project id"
}

variable "machine_type" {
  type        = string
  description = "The machine type to create."
  default     = "e2-standard-2"
}

variable "labels" {
  type = map(string)
  default = {
    owner       = "testusr"
    environment = "test"
    app         = "test"
    ttl         = "24"
  }
}

variable "instances_self_links" {
  type        = string
  description = "Zone where the instances should be created. If not specified, instances will be spread across available zones in the region."
  default     = null
}

variable "instances_details" {
  type        = string
  description = "Zone where the instances should be created. If not specified, instances will be spread across available zones in the region."
  default     = null
}

variable "zone" {
  type        = string
  description = "Zone where the instances should be created. If not specified, instances will be spread across available zones in the region."
  default     = null
}

variable "name_suffix" {
  type        = string
  description = "Sufix."
  default     = null
}


variable "nginx_install" {
  type        = bool
  description = "Nginx install or not?"
  default     = false
}


variable "desired_status" {
  type        = string
  description = "Desired status of the instance. Either RUNNING or TERMINATED"
  default     = "RUNNING"
}

variable "mode" {
  type        = string
  description = "Either READ_ONLY or READ_WRITE, defaults to READ_WRITE If you have a persistent disk with data that you want to share between multiple instances, detach it from any read-write instances and attach it to one or more instances in read-only mode."
  default     = "READ_WRITE"
}
