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
| [aws_api_gateway_stage.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_log_destination_arn"></a> [access\_log\_destination\_arn](#input\_access\_log\_destination\_arn) | n/a | `string` | `null` | no |
| <a name="input_access_log_format"></a> [access\_log\_format](#input\_access\_log\_format) | n/a | `string` | `null` | no |
| <a name="input_cache_cluster_enabled"></a> [cache\_cluster\_enabled](#input\_cache\_cluster\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_cache_cluster_size"></a> [cache\_cluster\_size](#input\_cache\_cluster\_size) | n/a | `string` | `null` | no |
| <a name="input_canary_percent_traffic"></a> [canary\_percent\_traffic](#input\_canary\_percent\_traffic) | n/a | `number` | `null` | no |
| <a name="input_canary_stage_variable_overrides"></a> [canary\_stage\_variable\_overrides](#input\_canary\_stage\_variable\_overrides) | n/a | `map(string)` | `{}` | no |
| <a name="input_canary_use_stage_cache"></a> [canary\_use\_stage\_cache](#input\_canary\_use\_stage\_cache) | n/a | `bool` | `false` | no |
| <a name="input_client_certificate_id"></a> [client\_certificate\_id](#input\_client\_certificate\_id) | n/a | `string` | `null` | no |
| <a name="input_deployment_id"></a> [deployment\_id](#input\_deployment\_id) | n/a | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `null` | no |
| <a name="input_documentation_version"></a> [documentation\_version](#input\_documentation\_version) | n/a | `string` | `null` | no |
| <a name="input_rest_api_id"></a> [rest\_api\_id](#input\_rest\_api\_id) | n/a | `string` | n/a | yes |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | n/a | `string` | n/a | yes |
| <a name="input_variables"></a> [variables](#input\_variables) | n/a | `map(string)` | `{}` | no |
| <a name="input_xray_tracing_enabled"></a> [xray\_tracing\_enabled](#input\_xray\_tracing\_enabled) | n/a | `bool` | `false` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_stage_arn"></a> [stage\_arn](#output\_stage\_arn) | arn of the api gateway stage resource |
| <a name="output_stage_execution_arn"></a> [stage\_execution\_arn](#output\_stage\_execution\_arn) | execution arn to be used in lambda\_permission's source\_arn when allowing api gateway to invoke a lambda function |
| <a name="output_stage_id"></a> [stage\_id](#output\_stage\_id) | id of the api gateway stage resource |
| <a name="output_stage_invoke_url"></a> [stage\_invoke\_url](#output\_stage\_invoke\_url) | url to invoke the api pointing to the stage |
| <a name="output_stage_name"></a> [stage\_name](#output\_stage\_name) | name of the api gateway stage resource |
| <a name="output_stage_web_acl_arn"></a> [stage\_web\_acl\_arn](#output\_stage\_web\_acl\_arn) | arn of the web acl associated with the stage |
<!-- END_TF_DOCS -->