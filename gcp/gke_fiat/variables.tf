variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

#variable "vpc" {
#    type = string
#    description = "VPC name to used in GKE cluster"
#}

#variable "gke_subnet" {
#    type = string
#    description = "VPC name to used in GKE cluster"
#}