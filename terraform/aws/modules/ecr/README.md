![Frederick National Laboratory](./assets/banner.svg)

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
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_iam_policy_document.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_create_lifecycle_policy"></a> [create\_lifecycle\_policy](#input\_create\_lifecycle\_policy) | if true, applies a lifecycle policy that only keeps the last 30 images | `bool` | `true` | no |
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | encryption type to use for the repository - either AES256 or KMS - if KMS, must provide arn of the key | `string` | `"AES256"` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | whether to allow terraform to delete a repository, even if contains images | `bool` | `false` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | name of the image, such as 'frontend', 'backend', or 'files' | `string` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | tag mutability setting for the repository - must be 'MUTABLE' or 'IMMUTABLE' | `string` | `"MUTABLE"` | no |
| <a name="input_is_base_image"></a> [is\_base\_image](#input\_is\_base\_image) | whether the repository is used to manage a base image | `bool` | n/a | yes |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | arn of the kms key used to encrypt images - required if encryption type is KMS | `string` | `null` | no |
| <a name="input_product_family"></a> [product\_family](#input\_product\_family) | if is\_base\_image is true, then provide a product family or archetype (i.e. 'bento') | `string` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | the map of key value pairs to provide as tags | `map(any)` | `{}` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the repository |
| <a name="output_id"></a> [id](#output\_id) | id of the repository |
| <a name="output_name"></a> [name](#output\_name) | name of the repository |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | id of the registry that the repository belongs to |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | url of the repository |
<!-- END_TF_DOCS -->