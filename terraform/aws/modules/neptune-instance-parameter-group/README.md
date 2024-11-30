<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

# Resources

| Name | Type |
|------|------|
| [aws_neptune_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_parameter_group) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_enable_caching"></a> [enable\_caching](#input\_enable\_caching) | enable neptune query caching | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_family"></a> [family](#input\_family) | the neptune parameter group family | `string` | `"neptune1.2"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_query_timeout"></a> [query\_timeout](#input\_query\_timeout) | the timeout for neptune queries | `string` | `"120,000"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | the neptune instance parameter group arn |
| <a name="output_family"></a> [family](#output\_family) | the neptune instance parameter group family |
| <a name="output_id"></a> [id](#output\_id) | the neptune instance parameter group id |
| <a name="output_name"></a> [name](#output\_name) | the neptune instance parameter group name |
<!-- END_TF_DOCS -->