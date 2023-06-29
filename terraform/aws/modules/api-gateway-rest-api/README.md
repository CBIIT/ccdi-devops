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
| [aws_api_gateway_rest_api.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_source"></a> [api\_key\_source](#input\_api\_key\_source) | n/a | `string` | `null` | no |
| <a name="input_api_suffix"></a> [api\_suffix](#input\_api\_suffix) | n/a | `string` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_binary_media_types"></a> [binary\_media\_types](#input\_binary\_media\_types) | n/a | `list(string)` | `[]` | no |
| <a name="input_body"></a> [body](#input\_body) | n/a | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | n/a | yes |
| <a name="input_disable_execute_api_endpoint"></a> [disable\_execute\_api\_endpoint](#input\_disable\_execute\_api\_endpoint) | n/a | `bool` | `false` | no |
| <a name="input_endpoint_configuration_types"></a> [endpoint\_configuration\_types](#input\_endpoint\_configuration\_types) | n/a | `list(string)` | `[]` | no |
| <a name="input_endpoint_configuration_vpc_endpoint_ids"></a> [endpoint\_configuration\_vpc\_endpoint\_ids](#input\_endpoint\_configuration\_vpc\_endpoint\_ids) | n/a | `set(string)` | `[]` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_fail_on_warnings"></a> [fail\_on\_warnings](#input\_fail\_on\_warnings) | n/a | `bool` | `false` | no |
| <a name="input_minimum_compression_size"></a> [minimum\_compression\_size](#input\_minimum\_compression\_size) | n/a | `number` | `0` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | n/a | `map(string)` | `{}` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_put_rest_api_mode"></a> [put\_rest\_api\_mode](#input\_put\_rest\_api\_mode) | n/a | `string` | `null` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the api gateway resource |
| <a name="output_created_date"></a> [created\_date](#output\_created\_date) | creation date of the api gateway resource |
| <a name="output_execution_arn"></a> [execution\_arn](#output\_execution\_arn) | execution arn of the api gateway resource |
| <a name="output_id"></a> [id](#output\_id) | id of the api gateway resource |
| <a name="output_name"></a> [name](#output\_name) | name of the api gateway resource |
| <a name="output_root_resource_id"></a> [root\_resource\_id](#output\_root\_resource\_id) | root resource id of the api gateway resource |
<!-- END_TF_DOCS -->