## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.83 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.83 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_traffic_manager_endpoint.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_endpoint) | resource |
| [azurerm_traffic_manager_profile.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | n/a | `number` | `60` | no |
| <a name="input_max_return"></a> [max\_return](#input\_max\_return) | The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8. | `number` | `null` | no |
| <a name="input_monitor_path"></a> [monitor\_path](#input\_monitor\_path) | n/a | `string` | `""` | no |
| <a name="input_monitor_port"></a> [monitor\_port](#input\_monitor\_port) | n/a | `number` | n/a | yes |
| <a name="input_monitor_probe_interval"></a> [monitor\_probe\_interval](#input\_monitor\_probe\_interval) | n/a | `number` | `10` | no |
| <a name="input_monitor_probe_timeout"></a> [monitor\_probe\_timeout](#input\_monitor\_probe\_timeout) | n/a | `number` | `5` | no |
| <a name="input_monitor_protocol"></a> [monitor\_protocol](#input\_monitor\_protocol) | n/a | `string` | `"tcp"` | no |
| <a name="input_monitor_tolerated_failures"></a> [monitor\_tolerated\_failures](#input\_monitor\_tolerated\_failures) | n/a | `number` | `3` | no |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags can be set | `map(string)` | `{}` | no |
| <a name="input_traffic_manager_endpoints"></a> [traffic\_manager\_endpoints](#input\_traffic\_manager\_endpoints) | n/a | <pre>map(object({<br>    target_ip = string<br>    weight    = number<br>  }))</pre> | `{}` | no |
| <a name="input_traffic_routing_method"></a> [traffic\_routing\_method](#input\_traffic\_routing\_method) | Specifies the algorithm used to route traffic, possible values are: Geographic, MultiValue, Performance, Priority, Subnet, Weighted | `string` | n/a | yes |

## Outputs

No outputs.
