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
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | the name of the ecr repository to associate the lifecycle policy with | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | registry id of the ecr repository that the lifecycle policy is attached to |
| <a name="output_repository"></a> [repository](#output\_repository) | ecr repository that the lifecycle policy is attached to |
<!-- END_TF_DOCS -->