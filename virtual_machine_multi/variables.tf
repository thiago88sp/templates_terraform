variable "size" {
  type        = string
  description = "The VM Size in which you need choose for your VM."
}

variable "node_count" {
type = number
}

variable "node_location"  {
  type = string
  description = "The Azure Region in which all resources in this example should be created."
}

variable "resource_prefix" {
  type = string
  description = "The prefix which should be used for all resources in this example"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

#variable for network range
variable "address_prefixes" {
  default = ["10.0.2.0/24"]
}

#variable for Environment
variable "Environment" {
  type = string
}

