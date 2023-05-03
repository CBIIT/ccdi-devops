<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_rds_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rds_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [random_id.snapshot](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.master_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_kms_alias.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_alias) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Enable to allow major engine version upgrades when changing engine versions | `bool` | `false` | no |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_attach_permissions_boundary"></a> [attach\_permissions\_boundary](#input\_attach\_permissions\_boundary) | whether to attach a permissions boundary to the role - required if enable\_enhanced\_monitoring is true | `bool` | `null` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | backup retention period in days - between 0 and 35 | `number` | `35` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | ideal time to perform backups.backup window in UTC - format hh24:mi-hh24:mi | `string` | `"04:00-05:00"` | no |
| <a name="input_create_db_subnet_group"></a> [create\_db\_subnet\_group](#input\_create\_db\_subnet\_group) | whether to create a db subnet group | `bool` | `true` | no |
| <a name="input_create_security_group"></a> [create\_security\_group](#input\_create\_security\_group) | Whether to create a security group for the rds instance | `bool` | `true` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | name of the database within Aurora to create | `string` | n/a | yes |
| <a name="input_db_engine_mode"></a> [db\_engine\_mode](#input\_db\_engine\_mode) | The database engine mode. | `string` | `"serverless"` | no |
| <a name="input_db_engine_type"></a> [db\_engine\_type](#input\_db\_engine\_type) | Aurora database engine type | `string` | `"aurora-mysql"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | aurora database engine version. | `string` | `"5.6.10a"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | Instance type to use for the db | `string` | `"db.serverless"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | name of the db subnet group - required if create\_db\_subnet\_group is false | `string` | `null` | no |
| <a name="input_db_subnet_ids"></a> [db\_subnet\_ids](#input\_db\_subnet\_ids) | list of subnet IDs to usee | `list(string)` | `[]` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | prevent deletion | `bool` | `false` | no |
| <a name="input_enable_enhanced_monitoring"></a> [enable\_enhanced\_monitoring](#input\_enable\_enhanced\_monitoring) | whether to enable enhanced monitoring | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | time to perform maintenance | `string` | `"sun:00:00-sun:02:00"` | no |
| <a name="input_master_password_length"></a> [master\_password\_length](#input\_master\_password\_length) | length of master user password | `number` | `15` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | username for the database | `string` | n/a | yes |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | The maximum capacity. | `number` | `2` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | The minimum capacity. | `number` | `1` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_rds_port"></a> [rds\_port](#input\_rds\_port) | rds aurora database port | `number` | `3306` | no |
| <a name="input_rds_suffix"></a> [rds\_suffix](#input\_rds\_suffix) | suffix to append to the rds instance name | `string` | `"rds"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | map of tags to apply to the instance | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | id of the vpc to create the security group in - required if create\_security\_group is true | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | list of security group ids to associate with the instance - required if create\_security\_group is false | `list(string)` | `[]` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_cluster_arn"></a> [rds\_cluster\_arn](#output\_rds\_cluster\_arn) | n/a |
| <a name="output_rds_cluster_db_name"></a> [rds\_cluster\_db\_name](#output\_rds\_cluster\_db\_name) | n/a |
| <a name="output_rds_cluster_endpoint"></a> [rds\_cluster\_endpoint](#output\_rds\_cluster\_endpoint) | n/a |
| <a name="output_rds_cluster_id"></a> [rds\_cluster\_id](#output\_rds\_cluster\_id) | n/a |
| <a name="output_rds_cluster_identifier"></a> [rds\_cluster\_identifier](#output\_rds\_cluster\_identifier) | n/a |
| <a name="output_rds_cluster_instance_arn"></a> [rds\_cluster\_instance\_arn](#output\_rds\_cluster\_instance\_arn) | n/a |
| <a name="output_rds_cluster_instance_endpoint"></a> [rds\_cluster\_instance\_endpoint](#output\_rds\_cluster\_instance\_endpoint) | n/a |
| <a name="output_rds_cluster_instance_id"></a> [rds\_cluster\_instance\_id](#output\_rds\_cluster\_instance\_id) | n/a |
| <a name="output_rds_cluster_instance_identifier"></a> [rds\_cluster\_instance\_identifier](#output\_rds\_cluster\_instance\_identifier) | n/a |
| <a name="output_rds_cluster_instance_port"></a> [rds\_cluster\_instance\_port](#output\_rds\_cluster\_instance\_port) | n/a |
| <a name="output_rds_cluster_master_username"></a> [rds\_cluster\_master\_username](#output\_rds\_cluster\_master\_username) | n/a |
| <a name="output_rds_cluster_port"></a> [rds\_cluster\_port](#output\_rds\_cluster\_port) | n/a |
| <a name="output_rds_password"></a> [rds\_password](#output\_rds\_password) | n/a |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | arn of the security group - if create\_security\_group is true |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | id of the security group - if create\_security\_group is true |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | name of the security group - if create\_security\_group is true |
<!-- END_TF_DOCS -->