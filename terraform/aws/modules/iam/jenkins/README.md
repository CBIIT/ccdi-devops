<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.cloudwatch_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.iam](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.iam](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudwatch_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.iam](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_attach_permissions_boundary"></a> [attach\_permissions\_boundary](#input\_attach\_permissions\_boundary) | whether to attach permissions boundary to jenkins instance profile role | `bool` | `true` | no |
| <a name="input_ecr_repository_arns"></a> [ecr\_repository\_arns](#input\_ecr\_repository\_arns) | list of ecr repository arns to allow jenkins to pull and push from | `list(string)` | `[]` | no |
| <a name="input_enable_ecr_access"></a> [enable\_ecr\_access](#input\_enable\_ecr\_access) | allow jenkins to pull and push from specified ecr repositories | `bool` | n/a | yes |
| <a name="input_enable_ecs_access"></a> [enable\_ecs\_access](#input\_enable\_ecs\_access) | allow jenkins to access specified ecs clusters to perform deployment operations | `bool` | `false` | no |
| <a name="input_enable_opensearch_access"></a> [enable\_opensearch\_access](#input\_enable\_opensearch\_access) | allow jenkins to perform etl activities on specified opensearch clusters | `bool` | n/a | yes |
| <a name="input_enable_s3_access"></a> [enable\_s3\_access](#input\_enable\_s3\_access) | allow jenkins to read from specified s3 buckets | `bool` | `false` | no |
| <a name="input_enable_secrets_manager_access"></a> [enable\_secrets\_manager\_access](#input\_enable\_secrets\_manager\_access) | allow jenkins to read from specified secrets manager secrets | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_opensearch_domain_arns"></a> [opensearch\_domain\_arns](#input\_opensearch\_domain\_arns) | list of opensearch domain arns to allow jenkins to perform etl activities on | `list(string)` | `[]` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_s3_bucket_arns"></a> [s3\_bucket\_arns](#input\_s3\_bucket\_arns) | list of s3 bucket arns to allow jenkins to read from | `list(string)` | `[]` | no |
| <a name="input_secrets_manager_secret_arns"></a> [secrets\_manager\_secret\_arns](#input\_secrets\_manager\_secret\_arns) | list of secrets manager secret arns to allow jenkins to read from | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to apply to resources | `map(string)` | `{}` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_profile_arn"></a> [instance\_profile\_arn](#output\_instance\_profile\_arn) | arn of the jenkins instance profile |
| <a name="output_instance_profile_id"></a> [instance\_profile\_id](#output\_instance\_profile\_id) | id of the jenkins instance profile |
| <a name="output_instance_profile_name"></a> [instance\_profile\_name](#output\_instance\_profile\_name) | name of the jenkins instance profile |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | arn of the jenkins instance profile role |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | id of the jenkins instance profile role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | name of the jenkins instance profile role |
<!-- END_TF_DOCS -->