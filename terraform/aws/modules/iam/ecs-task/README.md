![Frederick National Laboratory](./assets/fnl.svg)

# Overview

# Usage

<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

# Resources

| Name | Type |
|------|------|
| [aws_iam_policy.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.secrets_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_attach_cloudwatch_policy"></a> [attach\_cloudwatch\_policy](#input\_attach\_cloudwatch\_policy) | whether to attach the cloudwatch policy to the role | `bool` | `false` | no |
| <a name="input_attach_ecs_exec_policy"></a> [attach\_ecs\_exec\_policy](#input\_attach\_ecs\_exec\_policy) | whether to attach the ecs exec policy to the role | `bool` | `false` | no |
| <a name="input_attach_opensearch_policy"></a> [attach\_opensearch\_policy](#input\_attach\_opensearch\_policy) | whether to attach the opensearch policy to the role | `bool` | `false` | no |
| <a name="input_attach_permissions_boundary"></a> [attach\_permissions\_boundary](#input\_attach\_permissions\_boundary) | whether or not to attach a permissions boundary to the role | `bool` | `false` | no |
| <a name="input_attach_secrets_manager_policy"></a> [attach\_secrets\_manager\_policy](#input\_attach\_secrets\_manager\_policy) | whether to attach the secrets manager policy to the role | `bool` | `false` | no |
| <a name="input_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#input\_ecs\_cluster\_arn) | the arn of the ecs cluster that the task will be running on - required if attach\_ecs\_exec\_policy is true | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_microservice"></a> [microservice](#input\_microservice) | the name to microservice that this role is attached to (i.e. 'frontend') | `string` | `null` | no |
| <a name="input_opensearch_domain_arn"></a> [opensearch\_domain\_arn](#input\_opensearch\_domain\_arn) | the arn of the opensearch domain that the role should have access to - required if attach\_opensearch\_policy is true | `string` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_secret_arns"></a> [secret\_arns](#input\_secret\_arns) | a set of secret arns that the role should have access to - required if attach\_secrets\_manager\_policy is true | `set(string)` | `[]` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_task_role_arn"></a> [task\_role\_arn](#output\_task\_role\_arn) | arn of the task role if one was created |
| <a name="output_task_role_id"></a> [task\_role\_id](#output\_task\_role\_id) | id of the task role if one was created |
| <a name="output_task_role_name"></a> [task\_role\_name](#output\_task\_role\_name) | name of the task role if one was created |
<!-- END_TF_DOCS -->