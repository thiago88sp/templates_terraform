## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.32.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | ./modules/gke | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/4.32.0/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.gke_subnet](https://registry.terraform.io/providers/hashicorp/google/4.32.0/docs/data-sources/compute_subnetwork) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_secondary_range_cidr"></a> [cluster\_secondary\_range\_cidr](#input\_cluster\_secondary\_range\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_cluster_secondary_range_name"></a> [cluster\_secondary\_range\_name](#input\_cluster\_secondary\_range\_name) | The name of the secondary range to be used as for the cluster CIDR block.<br>The secondary range will be used for pod IP addresses. This must be an<br>existing secondary range associated with the cluster subnetwork. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_http_load_balancing_disabled"></a> [http\_load\_balancing\_disabled](#input\_http\_load\_balancing\_disabled) | The status of the HTTP (L7) load balancing controller addon, which makes it <br>easy to set up HTTP load balancers for services in a cluster. It is enabled <br>by default; set disabled = true to disable. | `bool` | `false` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The IP range in CIDR notation to use for the hosted master network. This <br>range will be used for assigning internal IP addresses to the master or set <br>of masters, as well as the ILB VIP. This range must not overlap with any <br>other ranges in use within the cluster's network. | `string` | `"10.0.3.0/28"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | project id | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | region | `string` | `"us-central1"` | no |
| <a name="input_services_secondary_range_cidr"></a> [services\_secondary\_range\_cidr](#input\_services\_secondary\_range\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_services_secondary_range_name"></a> [services\_secondary\_range\_name](#input\_services\_secondary\_range\_name) | The name of the secondary range to be used as for the services CIDR block.<br>The secondary range will be used for service ClusterIPs. This must be an<br>existing secondary range associated with the cluster subnetwork. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_cluster_host"></a> [kubernetes\_cluster\_host](#output\_kubernetes\_cluster\_host) | GKE Cluster Host |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | GKE Cluster Name |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | GCloud Project ID |
| <a name="output_region"></a> [region](#output\_region) | GCloud Region |
