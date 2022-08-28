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

| <a name="input_warm_node_count"></a> [warm\_node\_count](#input\_warm\_node\_count) | The number of warm nodes in the cluster. Valid values are between 2 and 150 | `number` | `2` | no |
| <a name="input_warm_node_enabled"></a> [warm\_node\_enabled](#input\_warm\_node\_enabled) | Whether or not to enable warm nodes for the cluster | `bool` | `false` | no |
| <a name="input_warm_node_type"></a> [warm\_node\_type](#input\_warm\_node\_type) | Instance type for the OpenSearch cluster's warm nodes. Valid values are ultrawarm1.medium.search, ultrawarm1.large.search and ultrawarm1.xlarge.search | `string` | `"ultrawarm1.large.search"` | no |
<!-- END_TF_DOCS -->