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
| <a name="input_program"></a> [program](#input\_program) | The name of the program that the ALB belongs to | `string` | n/a | yes |
| <a name="input_repo_type"></a> [repo\_type](#input\_repo\_type) | The repository type, based on images stored (frontend, backend, files, etc.) | `string` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | The tag mutability setting for the repository. Must be MUTABLE or IMMUTABLE | `string` | `"MUTABLE"` | no |
<!-- END_TF_DOCS -->