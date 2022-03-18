variable "resource_group_name" {
  type = string
}

variable "profile_name" {
  type = string
}

variable "traffic_routing_method" {
  type        = string
  description = "Specifies the algorithm used to route traffic, possible values are: Geographic, MultiValue, Performance, Priority, Subnet, Weighted"
}

variable "max_return" {
  type        = number
  default     = null
  description = "The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8."
}

variable "dns_ttl" {
  type    = number
  default = 60
}

variable "monitor_protocol" {
  type    = string
  default = "tcp"
}

variable "monitor_port" {
  type = number
}

variable "monitor_path" {
  type    = string
  default = ""
}

variable "monitor_probe_interval" {
  type    = number
  default = 10
}

variable "monitor_probe_timeout" {
  type    = number
  default = 5
}

variable "monitor_tolerated_failures" {
  type    = number
  default = 3
}

variable "traffic_manager_endpoints" {
  type = map(object({
    target_ip = string
    weight    = number
  }))
  default = {}
}

variable "tags" {
  type        = map(string)
  description = "Any tags can be set"
  default     = {}
}