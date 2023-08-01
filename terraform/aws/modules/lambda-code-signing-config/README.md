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
| [aws_lambda_code_signing_config.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_code_signing_config) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | description of the code signing config | `string` | `null` | no |
| <a name="input_signing_profile_version_arns"></a> [signing\_profile\_version\_arns](#input\_signing\_profile\_version\_arns) | list of signing profile version arns to allow | `list(string)` | `[]` | no |
| <a name="input_untrusted_artifact_on_deployment"></a> [untrusted\_artifact\_on\_deployment](#input\_untrusted\_artifact\_on\_deployment) | whether to allow untrusted artifacts to be deployed - either 'Warn' or 'Enforce' | `bool` | `"Enforce"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | the arn of the code signing configuration |
| <a name="output_config_id"></a> [config\_id](#output\_config\_id) | unique identifier for the code signing configuration |
| <a name="output_last_modified"></a> [last\_modified](#output\_last\_modified) | date and time that the code signing configuration was last modified |
<!-- END_TF_DOCS -->