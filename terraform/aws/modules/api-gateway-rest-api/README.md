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
| [aws_api_gateway_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_account) | resource |
| [aws_api_gateway_deployment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_method_settings.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_rest_api.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_access_log_format"></a> [api\_access\_log\_format](#input\_api\_access\_log\_format) | The format of the access log file. | `string` | `"  {\n\t\"requestTime\": \"$context.requestTime\",\n\t\"requestId\": \"$context.requestId\",\n\t\"httpMethod\": \"$context.httpMethod\",\n\t\"path\": \"$context.path\",\n\t\"resourcePath\": \"$context.resourcePath\",\n\t\"status\": $context.status,\n\t\"responseLatency\": $context.responseLatency,\n  \"xrayTraceId\": \"$context.xrayTraceId\",\n  \"integrationRequestId\": \"$context.integration.requestId\",\n\t\"functionResponseStatus\": \"$context.integration.status\",\n  \"integrationLatency\": \"$context.integration.latency\",\n\t\"integrationServiceStatus\": \"$context.integration.integrationStatus\",\n  \"authorizeResultStatus\": \"$context.authorize.status\",\n\t\"authorizerServiceStatus\": \"$context.authorizer.status\",\n\t\"authorizerLatency\": \"$context.authorizer.latency\",\n\t\"authorizerRequestId\": \"$context.authorizer.requestId\",\n  \"ip\": \"$context.identity.sourceIp\",\n\t\"userAgent\": \"$context.identity.userAgent\",\n\t\"principalId\": \"$context.authorizer.principalId\",\n\t\"cognitoUser\": \"$context.identity.cognitoIdentityId\",\n  \"user\": \"$context.identity.user\"\n}\n"` | no |
| <a name="input_api_key_source"></a> [api\_key\_source](#input\_api\_key\_source) | the source of the API key for this API Gateway | `string` | `null` | no |
| <a name="input_api_logging_level"></a> [api\_logging\_level](#input\_api\_logging\_level) | The logging level for this API Gateway | `string` | `"INFO"` | no |
| <a name="input_api_suffix"></a> [api\_suffix](#input\_api\_suffix) | the suffix to append to the API Gateway name after the stack name | `string` | `"api"` | no |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_binary_media_types"></a> [binary\_media\_types](#input\_binary\_media\_types) | the list of binary media types supported by the RestApi | `list(string)` | `[]` | no |
| <a name="input_body"></a> [body](#input\_body) | the rendered OpenAPI specification of the API Gateway | `string` | n/a | yes |
| <a name="input_client_certificate_id"></a> [client\_certificate\_id](#input\_client\_certificate\_id) | the ID of the client certificate to use for the stage | `string` | `null` | no |
| <a name="input_cluster_cache_enabled"></a> [cluster\_cache\_enabled](#input\_cluster\_cache\_enabled) | whether to enable the cache cluster for the stage | `bool` | `false` | no |
| <a name="input_cluster_cache_size"></a> [cluster\_cache\_size](#input\_cluster\_cache\_size) | the size of the cache cluster for the stage, if enabled | `string` | `"0.5"` | no |
| <a name="input_create_cloudwatch_role"></a> [create\_cloudwatch\_role](#input\_create\_cloudwatch\_role) | whether to create a role for CloudWatch logging - only one role is needed per account | `bool` | `false` | no |
| <a name="input_disable_execute_api_endpoint"></a> [disable\_execute\_api\_endpoint](#input\_disable\_execute\_api\_endpoint) | n/a | `bool` | `false` | no |
| <a name="input_endpoint_configuration_types"></a> [endpoint\_configuration\_types](#input\_endpoint\_configuration\_types) | the type of endpoint deployment configuration | `list(string)` | <pre>[<br>  "REGIONAL"<br>]</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_fail_on_warnings"></a> [fail\_on\_warnings](#input\_fail\_on\_warnings) | whether to fail the Terraform plan if there are any warnings | `bool` | `true` | no |
| <a name="input_minimum_compression_size"></a> [minimum\_compression\_size](#input\_minimum\_compression\_size) | the minimum size in bytes of a response before compression is enabled | `number` | `0` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | a map of parameters that are passed to the integration endpoint or method request from the method | `map(string)` | `{}` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_put_rest_api_mode"></a> [put\_rest\_api\_mode](#input\_put\_rest\_api\_mode) | the mode to use when updating the RestApi resource | `string` | `null` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | a map of variables for the stage | `map(string)` | `{}` | no |
| <a name="input_xray_tracing_enabled"></a> [xray\_tracing\_enabled](#input\_xray\_tracing\_enabled) | whether to enable xray tracing for the stage | `bool` | `false` | no |

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