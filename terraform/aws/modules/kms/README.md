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
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days | `number` | `0` | no |
| <a name="input_description"></a> [description](#input\_description) | description of how the key will be used | `string` | n/a | yes |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | whether to enable automatic rotation of the key | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_kms_suffix"></a> [kms\_suffix](#input\_kms\_suffix) | suffix to append to the kms alias | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias_arn"></a> [alias\_arn](#output\_alias\_arn) | arn of the kms key alias |
| <a name="output_alias_id"></a> [alias\_id](#output\_alias\_id) | id of the kms key alias |
| <a name="output_alias_name"></a> [alias\_name](#output\_alias\_name) | name of the kms key alias |
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the kms key |
| <a name="output_id"></a> [id](#output\_id) | id of the kms key |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | key id of the kms key |
<!-- END_TF_DOCS -->