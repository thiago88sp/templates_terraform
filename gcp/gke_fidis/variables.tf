variable "project_id" {
  description = "project id"
}


variable "region" {
  description = "region"
  default     = "us-central1"
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

