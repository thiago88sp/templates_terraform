variable "gcp_project_id" {
  description = "The project ID to host the database in."
  type        = string
}

variable "project_id_composer" {
  description = "The project ID to host the Composer."
  type        = string
}

#variable "network_project_id" {
#  description = "The project ID from VPCs."
#  type        = string
#}

/* variable "network" {
  description = "Network where Cloud Composer is created."
  type        = string
}

variable "subnetwork" {
  description = "Subetwork where Cloud Composer is created."
  type        = string
} */


variable "region" {
  description = "The project ID to host the database in."
  type        = string
}


variable "region_composer" {
  description = "The Region to host the Composer."
  type        = string
}

variable "region_cloudsql" {
  description = "The Region to host the CloudSQL."
  type        = string
}

variable "zone_composer" {
  description = "The Zone to host the Composer."
  type        = string
}


variable "availability_type" {
  description = "The project ID to host the database in."
  type        = string
}

variable "zone" {
  description = "The project ID to host the database in."
  type        = string
}


variable "project_id" {
  description = "Project ID where Cloud Composer Environment is created."
  type        = string
}

variable "composer_env_name" {
  description = "Name of Cloud Composer Environment"
  type        = string
}

#variable "network" {
#  description = "Network where Cloud Composer is created."
#  type        = string
#}

#variable "subnetwork" {
#  description = "Subetwork where Cloud Composer is created."
#  type        = string
#}

variable "enable_private_endpoint" {
  description = "Configure public access to the cluster endpoint."
  type        = bool
  default     = false
}


variable "vmname" {
  description = "The name of VM."
  type        = string
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


variable "http_load_balancing_disabled" {
  type    = bool
  default = false

  description = <<EOF
The status of the HTTP (L7) load balancing controller addon, which makes it 
easy to set up HTTP load balancers for services in a cluster. It is enabled 
by default; set disabled = true to disable.
EOF
}


variable "master_ipv4_cidr_block" {
  type    = string
  default = "10.0.3.0/28"

  description = <<EOF
The IP range in CIDR notation to use for the hosted master network. This 
range will be used for assigning internal IP addresses to the master or set 
of masters, as well as the ILB VIP. This range must not overlap with any 
other ranges in use within the cluster's network.
EOF
}

variable "cluster_secondary_range_name" {
  type = string

  description = <<EOF
The name of the secondary range to be used as for the cluster CIDR block.
The secondary range will be used for pod IP addresses. This must be an
existing secondary range associated with the cluster subnetwork.
EOF
}

variable "cluster_secondary_range_cidr" {
  type = string
}

variable "services_secondary_range_name" {
  type = string

  description = <<EOF
The name of the secondary range to be used as for the services CIDR block.
The secondary range will be used for service ClusterIPs. This must be an
existing secondary range associated with the cluster subnetwork.
EOF
}

variable "services_secondary_range_cidr" {
  type = string
}


variable "environment" {
  type        = string
  description = ""
  default     = ""
}

