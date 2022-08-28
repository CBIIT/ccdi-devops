<!-- BEGIN_TF_DOCS -->



# Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |


# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_level"></a> [account\_level](#input\_account\_level) | The level of the account for the repository (non-prod or prod) | `string` | n/a | yes |
| <a name="input_app"></a> [app](#input\_app) | The name of the application that the load balancer belongs to | `string` | n/a | yes |

<!-- END_TF_DOCS -->