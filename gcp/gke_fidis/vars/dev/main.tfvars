project_id = "terraformproject-359719"
region     = "southamerica-east1"
http_load_balancing_disabled = true
#region     = "us-central1"
master_ipv4_cidr_block = "172.16.0.0/28"

cluster_secondary_range_name = "pods"

cluster_secondary_range_cidr = "10.0.1.0/24"

services_secondary_range_name = "services"

services_secondary_range_cidr = "10.0.2.0/24"
