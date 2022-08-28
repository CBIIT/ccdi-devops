<!-- BEGIN_TF_DOCS -->


# Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.os_app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.os_index_slow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.os_search_slow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_iam_service_linked_role.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_opensearch_domain.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_opensearch_domain_policy.os](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain_policy) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the application, often times an acronym in all lower case characters (i.e. 'mtp') | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version of the OpenSearch cluster (i.e. '1.2') | `string` | n/a | yes |
| <a name="input_hot_node_count"></a> [hot\_node\_count](#input\_hot\_node\_count) | The number of hot data nodes to provision to the cluster | `number` | n/a | yes |
| <a name="input_hot_node_type"></a> [hot\_node\_type](#input\_hot\_node\_type) | The instance type to provision for the hot data nodes in the cluster (i.e m6g.large.search) | `string` | n/a | yes |
| <a name="input_master_node_count"></a> [master\_node\_count](#input\_master\_node\_count) | The number of dedicated master nodes to support the cluster | `number` | n/a | yes |
| <a name="input_master_node_enabled"></a> [master\_node\_enabled](#input\_master\_node\_enabled) | Set to true to provision dedicated master nodes for the cluster | `bool` | n/a | yes |
| <a name="input_master_node_type"></a> [master\_node\_type](#input\_master\_node\_type) | The instance type to provision for the dedicated master nodes in the cluster (i.e m6g.large.search) | `string` | n/a | yes |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Set to true to distribute cluster resources across multiple availability zones | `bool` | n/a | yes |
| <a name="input_opensearch_security_group_id"></a> [opensearch\_security\_group\_id](#input\_opensearch\_security\_group\_id) | The ID security group(s) associated with the OpenSearch cluster | `set(string)` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | The name of the program this app or project supports (i.e. ccdi) | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The subnets which OpenSearch will be deployed to | `set(string)` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | The target tier for the deployment. If using workspaces, provide 'terraform.workspace' when providing a value for this variable | `string` | n/a | yes |
| <a name="input_availability_zone_count"></a> [availability\_zone\_count](#input\_availability\_zone\_count) | The number of availability zones to distribute cluster resources across | `number` | `2` | no |
| <a name="input_cold_storage_enabled"></a> [cold\_storage\_enabled](#input\_cold\_storage\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_create_domain_policy"></a> [create\_domain\_policy](#input\_create\_domain\_policy) | n/a | `bool` | `true` | no |
| <a name="input_custom_domain_endpoint_enabled"></a> [custom\_domain\_endpoint\_enabled](#input\_custom\_domain\_endpoint\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | Set to true to enable elastic block storage for your OpenSearch data nodes | `bool` | `true` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | Specify the ebs volume size for each data node (in GiB) | `number` | `30` | no |
| <a name="input_enable_os_application_logs"></a> [enable\_os\_application\_logs](#input\_enable\_os\_application\_logs) | Set to true to forward application (error) logs to CloudWatch | `bool` | `true` | no |
| <a name="input_enable_os_index_slow_logs"></a> [enable\_os\_index\_slow\_logs](#input\_enable\_os\_index\_slow\_logs) | Set to true to forward index slow logs to CloudWatch | `bool` | `true` | no |
| <a name="input_enable_os_search_slow_logs"></a> [enable\_os\_search\_slow\_logs](#input\_enable\_os\_search\_slow\_logs) | Set to true to forward search slow logs to CloudWatch | `bool` | `true` | no |
| <a name="input_enforce_https"></a> [enforce\_https](#input\_enforce\_https) | n/a | `bool` | `true` | no |
| <a name="input_iam_prefix"></a> [iam\_prefix](#input\_iam\_prefix) | The string used to prefix the IAM role or policy name according to NCI power user governance | `string` | `"power-user"` | no |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | The number of days to save OpenSearch logs sent to CloudWatch | `number` | `90` | no |
| <a name="input_snapshot_hour"></a> [snapshot\_hour](#input\_snapshot\_hour) | The hour in which OpenSearch will perform automated snapshot operations | `number` | `23` | no |
| <a name="input_warm_node_count"></a> [warm\_node\_count](#input\_warm\_node\_count) | The number of warm nodes in the cluster. Valid values are between 2 and 150 | `number` | `2` | no |
| <a name="input_warm_node_enabled"></a> [warm\_node\_enabled](#input\_warm\_node\_enabled) | Whether or not to enable warm nodes for the cluster | `bool` | `false` | no |
| <a name="input_warm_node_type"></a> [warm\_node\_type](#input\_warm\_node\_type) | Instance type for the OpenSearch cluster's warm nodes. Valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search | `string` | `"ultrawarm1.large.search"` | no |
<!-- END_TF_DOCS -->