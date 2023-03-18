<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | arn of the task execution policy if one was created |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | id of the task execution policy if one was created |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | name of the task execution policy if one was created |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | arn of the task execution role if one was created |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | id of the task execution role if one was created |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | name of the task execution role if one was created |
<!-- END_TF_DOCS -->