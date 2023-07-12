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
| <a name="input_description"></a> [description](#input\_description) | n/a | `any` | n/a | yes |
| <a name="input_rest_api_id"></a> [rest\_api\_id](#input\_rest\_api\_id) | n/a | `any` | n/a | yes |
| <a name="input_stage_description"></a> [stage\_description](#input\_stage\_description) | n/a | `any` | n/a | yes |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | n/a | `any` | n/a | yes |
| <a name="input_triggers"></a> [triggers](#input\_triggers) | n/a | `any` | n/a | yes |
| <a name="input_variables"></a> [variables](#input\_variables) | n/a | `any` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_date"></a> [created\_date](#output\_created\_date) | creation date of the deployment |
| <a name="output_execution_arn"></a> [execution\_arn](#output\_execution\_arn) | execution arn to be used in lambda\_permission's source\_arn when allowing API Gateway to invoke a Lambda function |
| <a name="output_id"></a> [id](#output\_id) | id of the deployment |
| <a name="output_invoke_url"></a> [invoke\_url](#output\_invoke\_url) | url to invoke the api pointing to the stage |
<!-- END_TF_DOCS -->