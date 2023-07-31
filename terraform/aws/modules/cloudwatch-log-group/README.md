<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | arn of the kms key used to encrypt the log group | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | name of the log group | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | number of days to retain the log events | `number` | `90` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the cloudwatch log group |
| <a name="output_id"></a> [id](#output\_id) | id of the cloudwatch log group |
| <a name="output_name"></a> [name](#output\_name) | name of the cloudwatch log group |
<!-- END_TF_DOCS -->