## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.53, < 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute_engine"></a> [compute\_engine](#module\_compute\_engine) | ./modules/compute_engine | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_desired_status"></a> [desired\_status](#input\_desired\_status) | Desired status of the instance. Either RUNNING or TERMINATED | `string` | `"RUNNING"` | no |
| <a name="input_instances_details"></a> [instances\_details](#input\_instances\_details) | Zone where the instances should be created. If not specified, instances will be spread across available zones in the region. | `string` | `null` | no |
| <a name="input_instances_self_links"></a> [instances\_self\_links](#input\_instances\_self\_links) | Zone where the instances should be created. If not specified, instances will be spread across available zones in the region. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(string)` | <pre>{<br>  "app": "test",<br>  "environment": "test",<br>  "owner": "testusr",<br>  "ttl": "24"<br>}</pre> | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type to create. | `string` | `"e2-standard-2"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Either READ\_ONLY or READ\_WRITE, defaults to READ\_WRITE If you have a persistent disk with data that you want to share between multiple instances, detach it from any read-write instances and attach it to one or more instances in read-only mode. | `string` | `"READ_WRITE"` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Sufix. | `string` | `null` | no |
| <a name="input_nginx_install"></a> [nginx\_install](#input\_nginx\_install) | Nginx install or not? | `bool` | `false` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | project id | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | project id | `any` | n/a | yes |
| <a name="input_vmname"></a> [vmname](#input\_vmname) | The name of VM. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone where the instances should be created. If not specified, instances will be spread across available zones in the region. | `string` | `null` | no |

## Outputs

No outputs.
