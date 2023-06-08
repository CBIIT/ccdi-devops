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
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | arn of the role that will be assumed by the eventbridge target resource | `string` | n/a | yes |
| <a name="input_rule_id"></a> [rule\_id](#input\_rule\_id) | id of the eventbridge rule that will send event data to the target resource | `string` | n/a | yes |
| <a name="input_target_arn"></a> [target\_arn](#input\_target\_arn) | arn of the target resource, such as another event bus, a lambda function, or an sns topic | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the eventbridge target resource |
| <a name="output_id"></a> [id](#output\_id) | id of the eventbridge target resource |
<!-- END_TF_DOCS -->