<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dev_image_limit"></a> [dev\_image\_limit](#input\_dev\_image\_limit) | the number of non-prod images to retain in the repo | `number` | `30` | no |
| <a name="input_prod_image_limit"></a> [prod\_image\_limit](#input\_prod\_image\_limit) | the number of prod images to retain in the repo | `number` | `10` | no |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | the name of the ecr repository to associate the lifecycle policy with | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | registry id of the ecr repository that the lifecycle policy is attached to |
| <a name="output_repository"></a> [repository](#output\_repository) | ecr repository that the lifecycle policy is attached to |
<!-- END_TF_DOCS -->