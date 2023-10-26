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
| [aws_neptune_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster_instance) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | specifies whether any instance modifications are applied immediately, or during the next maintenance window | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | indicates that minor engine upgrades are applied automatically to the instance during the maintenance window | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | the Availability Zone where the instance will be created | `string` | `null` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | the name of the neptune cluster | `string` | `null` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | the name of the database engine to be used for this instance | `string` | `"neptune"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | the version number of the database engine to use | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_identifier_prefix"></a> [identifier\_prefix](#input\_identifier\_prefix) | creates a unique identifier beginning with the specified prefix | `string` | `null` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | the instance class to use | `string` | `null` | no |
| <a name="input_neptune_parameter_group_name"></a> [neptune\_parameter\_group\_name](#input\_neptune\_parameter\_group\_name) | the name of the neptune parameter group | `string` | `null` | no |
| <a name="input_neptune_subnet_group_name"></a> [neptune\_subnet\_group\_name](#input\_neptune\_subnet\_group\_name) | the name of the neptune subnet group | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | the port on which the DB accepts connections | `number` | `null` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | the daily time range during which automated backups are created if automated backups are enabled | `string` | `null` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | the weekly time range (in UTC) during which system maintenance can occur | `string` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_promotion_tier"></a> [promotion\_tier](#input\_promotion\_tier) | a value that specifies the order in which an instance is promoted to the primary instance after a failure of the existing primary instance | `number` | `null` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output\_address) | The hostname of the instance. See also endpoint and port. |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the neptune instance |
| <a name="output_cluster_identifier"></a> [cluster\_identifier](#output\_cluster\_identifier) | The neptune cluster identifier |
| <a name="output_dbi_resource_id"></a> [dbi\_resource\_id](#output\_dbi\_resource\_id) | The neptune instance resource ID |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The hostname of the instance. See also address and port. |
| <a name="output_id"></a> [id](#output\_id) | The neptune instance ID |
| <a name="output_identifier"></a> [identifier](#output\_identifier) | The neptune instance identifier |
<!-- END_TF_DOCS -->