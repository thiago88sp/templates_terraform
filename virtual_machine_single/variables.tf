variable "prefix" {
  type        = string
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
}

variable "size" {
  type        = string
  description = "The VM Size in which you need choose for your VM."
}

#variable "rsg" {
#  type        = string
#  description = "RSG where the resources are be allocated."
#}