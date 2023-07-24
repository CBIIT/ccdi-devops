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

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the api | `string` | `null` | no |
| <a name="input_rest_api_id"></a> [rest\_api\_id](#input\_rest\_api\_id) | The ID of the associated REST API | `string` | n/a | yes |
| <a name="input_stage_description"></a> [stage\_description](#input\_stage\_description) | The description of the stage | `string` | `null` | no |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | The name of the stage | `string` | n/a | yes |
| <a name="input_triggers"></a> [triggers](#input\_triggers) | A map of triggers to re-deploy the API Gateway | `map(any)` | `null` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | A map of variables to be used for the stage | `map(any)` | `{}` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment_created_date"></a> [deployment\_created\_date](#output\_deployment\_created\_date) | creation date of the deployment |
| <a name="output_deployment_execution_arn"></a> [deployment\_execution\_arn](#output\_deployment\_execution\_arn) | execution arn to be used in lambda\_permission's source\_arn when allowing API Gateway to invoke a Lambda function |
| <a name="output_deployment_id"></a> [deployment\_id](#output\_deployment\_id) | id of the deployment |
| <a name="output_deployment_invoke_url"></a> [deployment\_invoke\_url](#output\_deployment\_invoke\_url) | url to invoke the api pointing to the stage |
<!-- END_TF_DOCS -->