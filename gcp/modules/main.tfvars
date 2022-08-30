gcp_project_id                = "terraformproject-359719"
project_id_composer           = "terraformproject-359719"
project_id                    = "terraformproject-359719"
region                        = "us-central1"
region_cloudsql               = "us-central1"
region_composer               = "us-central1"
availability_type             = "ZONAL"
zone                          = "us-central1-a"
zone_composer                 = "us-central1-a"
zone_gce                      = "us-central1-a"
composer_env_name             = "composer-test"
vmname                        = "teste"
nginx_install                 = true
http_load_balancing_disabled  = true
master_ipv4_cidr_block        = "10.0.4.0/28"
cluster_secondary_range_name  = "pods"
cluster_secondary_range_cidr  = "10.0.0.0/24"
services_secondary_range_name = "services"
services_secondary_range_cidr = "10.0.1.0/24"
environment                   = "dev"


datadisk_list                 = [
    {
        name = "datadisk-01"
        size = "250"
    },
        {
        name = "datadisk-02"
        size = "100"
    }
]