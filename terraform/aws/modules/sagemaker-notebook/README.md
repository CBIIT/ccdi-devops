<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_sagemaker_notebook_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance) | resource |
| [aws_sagemaker_notebook_instance_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance_lifecycle_configuration) | resource |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [template_file.this](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_direct_internet_access"></a> [direct\_internet\_access](#input\_direct\_internet\_access) | Whether the notebook instance is directly accessible via the internet. The default value is Disabled | `bool` | `false` | no |
| <a name="input_graph_notebook_auth_mode"></a> [graph\_notebook\_auth\_mode](#input\_graph\_notebook\_auth\_mode) | The authentication mode to use when connecting to the Neptune Cluster | `string` | `"DEFAULT"` | no |
| <a name="input_graph_notebook_host"></a> [graph\_notebook\_host](#input\_graph\_notebook\_host) | The endpoint for the Neptune Cluster that this notebook instance will connect to | `string` | n/a | yes |
| <a name="input_graph_notebook_port"></a> [graph\_notebook\_port](#input\_graph\_notebook\_port) | The port number on which the notebook server will listen | `number` | `8182` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of ML compute instance to launch for the notebook instance | `string` | `"ml.t3.medium"` | no |
| <a name="input_minimum_instance_metadata_service_version"></a> [minimum\_instance\_metadata\_service\_version](#input\_minimum\_instance\_metadata\_service\_version) | The minimum version of the instance metadata service to use for the notebook instance | `number` | `2` | no |
| <a name="input_platform_identifier"></a> [platform\_identifier](#input\_platform\_identifier) | The identifier of the notebook instance platform. | `string` | `"notebook-al2-v2"` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | The prefix to use for the name of the resources that are created | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | The Amazon Resource Name (ARN) of the IAM role to associate with the instance. This is the role that has permissions to be able to access data sources and resources that you specify in your notebook instance | `string` | n/a | yes |
| <a name="input_root_access"></a> [root\_access](#input\_root\_access) | Whether root access is enabled or disabled for the notebook instance. The default value is Disabled | `string` | `"Disabled"` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | The security group IDs to associate with the instance | `set(string)` | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID in which to launch the instance | `string` | `null` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the EBS volume, in GB | `number` | `5` | no |
<!-- END_TF_DOCS -->