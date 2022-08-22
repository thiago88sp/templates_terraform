variable "vmname" {
  description = "The name of VM."
  type = string
}

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "project id"
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


