<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_api_destination.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_api_destination) | resource |
| [aws_cloudwatch_event_connection.api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_connection) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key_name"></a> [api\_key\_name](#input\_api\_key\_name) | api key name for api destination | `string` | `"Api-Key"` | no |
| <a name="input_api_key_value"></a> [api\_key\_value](#input\_api\_key\_value) | api key value for api destination | `string` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_destination_endpoint"></a> [destination\_endpoint](#input\_destination\_endpoint) | destination endpoint for api destination | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_http_method"></a> [http\_method](#input\_http\_method) | http method for api destination | `string` | `"POST"` | no |
| <a name="input_invocation_rate_limit_per_second"></a> [invocation\_rate\_limit\_per\_second](#input\_invocation\_rate\_limit\_per\_second) | invocation rate limit per second for api destination | `number` | `300` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the api destination |
| <a name="output_connection_arn"></a> [connection\_arn](#output\_connection\_arn) | arn of the connection to be used for the api destination |
| <a name="output_id"></a> [id](#output\_id) | id of the api destination |
| <a name="output_name"></a> [name](#output\_name) | name of the api destination |
<!-- END_TF_DOCS -->