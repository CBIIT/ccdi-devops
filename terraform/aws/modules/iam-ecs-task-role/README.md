![Frederick National Laboratory](./assets/fnl.svg)

# Overview

# Usage

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
| [aws_iam_policy_document.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_task_policy_arn"></a> [task\_policy\_arn](#output\_task\_policy\_arn) | arn of the task policy if one was created |
| <a name="output_task_policy_id"></a> [task\_policy\_id](#output\_task\_policy\_id) | id of the task policy if one was created |
| <a name="output_task_policy_name"></a> [task\_policy\_name](#output\_task\_policy\_name) | name of the task policy if one was created |
| <a name="output_task_role_arn"></a> [task\_role\_arn](#output\_task\_role\_arn) | arn of the task role if one was created |
| <a name="output_task_role_id"></a> [task\_role\_id](#output\_task\_role\_id) | id of the task role if one was created |
| <a name="output_task_role_name"></a> [task\_role\_name](#output\_task\_role\_name) | name of the task role if one was created |
<!-- END_TF_DOCS -->