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
| <a name="module_cloudsqlpostgres"></a> [cloudsqlpostgres](#module\_cloudsqlpostgres) | ./modules/postgres | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The project ID to host the database in. | `string` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The project ID to host the database in. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The project ID to host the database in. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The project ID to host the database in. | `string` | n/a | yes |

## Outputs

No outputs.
