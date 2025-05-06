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
| [aws_api_gateway_deployment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_stage.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_access_log_format"></a> [api\_access\_log\_format](#input\_api\_access\_log\_format) | The format of the access log file. | `string` | `"  {\n\t\"requestTime\": \"$context.requestTime\",\n\t\"requestId\": \"$context.requestId\",\n\t\"httpMethod\": \"$context.httpMethod\",\n\t\"path\": \"$context.path\",\n\t\"resourcePath\": \"$context.resourcePath\",\n\t\"status\": $context.status,\n\t\"responseLatency\": $context.responseLatency,\n  \"xrayTraceId\": \"$context.xrayTraceId\",\n  \"integrationRequestId\": \"$context.integration.requestId\",\n\t\"functionResponseStatus\": \"$context.integration.status\",\n  \"integrationLatency\": \"$context.integration.latency\",\n\t\"integrationServiceStatus\": \"$context.integration.integrationStatus\",\n  \"authorizeResultStatus\": \"$context.authorize.status\",\n\t\"authorizerServiceStatus\": \"$context.authorizer.status\",\n\t\"authorizerLatency\": \"$context.authorizer.latency\",\n\t\"authorizerRequestId\": \"$context.authorizer.requestId\",\n  \"ip\": \"$context.identity.sourceIp\",\n\t\"userAgent\": \"$context.identity.userAgent\",\n\t\"principalId\": \"$context.authorizer.principalId\",\n\t\"cognitoUser\": \"$context.identity.cognitoIdentityId\",\n  \"user\": \"$context.identity.user\"\n}\n"` | no |
| <a name="input_cache_cluster_enabled"></a> [cache\_cluster\_enabled](#input\_cache\_cluster\_enabled) | whether or not to enable the cache cluster | `bool` | `false` | no |
| <a name="input_cache_cluster_size"></a> [cache\_cluster\_size](#input\_cache\_cluster\_size) | the size of the cache cluster for the stage if enabled - either 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 or 237 | `string` | `null` | no |
| <a name="input_client_certificate_id"></a> [client\_certificate\_id](#input\_client\_certificate\_id) | the id of the client certificate to use for the stage | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | the description of the stage | `string` | `null` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | the number of days to retain access and execution logs for the stage | `number` | `180` | no |
| <a name="input_redeployment_trigger"></a> [redeployment\_trigger](#input\_redeployment\_trigger) | the trigger to use for redeploying the stage - either a sha1 of the openapi spec (api body) or a timestamp | `string` | `null` | no |
| <a name="input_rest_api_id"></a> [rest\_api\_id](#input\_rest\_api\_id) | the id of the api gateway rest api | `string` | n/a | yes |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | the name of the stage | `string` | `null` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | the variables to define for the stage | `map(string)` | `{}` | no |
| <a name="input_xray_tracing_enabled"></a> [xray\_tracing\_enabled](#input\_xray\_tracing\_enabled) | whether or not to enable xray tracing for the stage | `bool` | `false` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment_execution_arn"></a> [deployment\_execution\_arn](#output\_deployment\_execution\_arn) | the execution arn of the api gateway deployment |
| <a name="output_deployment_id"></a> [deployment\_id](#output\_deployment\_id) | the id of the api gateway deployment |
| <a name="output_deployment_invoke_url"></a> [deployment\_invoke\_url](#output\_deployment\_invoke\_url) | the invoke url of the api gateway deployment |
| <a name="output_stage_arn"></a> [stage\_arn](#output\_stage\_arn) | the arn of the api gateway stage |
| <a name="output_stage_execution_arn"></a> [stage\_execution\_arn](#output\_stage\_execution\_arn) | the execution arn of the api gateway stage |
| <a name="output_stage_id"></a> [stage\_id](#output\_stage\_id) | the id of the api gateway stage |
| <a name="output_stage_name"></a> [stage\_name](#output\_stage\_name) | the name of the api gateway stage |
<!-- END_TF_DOCS -->