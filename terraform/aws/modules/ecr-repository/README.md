![Frederick National Laboratory](./assets/fnl.svg)

# Overview 

# Usage 

<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

# Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_access_policy"></a> [access\_policy](#module\_access\_policy) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/ecr-access-policy | n/a |
| <a name="module_lifecycle_policy"></a> [lifecycle\_policy](#module\_lifecycle\_policy) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/ecr-lifecycle-policy | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policy_type"></a> [access\_policy\_type](#input\_access\_policy\_type) | access policy type is to define what kind of policy to apply either standard or alternate | `string` | `"standard"` | no |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_create_access_policy"></a> [create\_access\_policy](#input\_create\_access\_policy) | whether to create an ecr repository policy to control access | `bool` | `true` | no |
| <a name="input_create_lifecycle_policy"></a> [create\_lifecycle\_policy](#input\_create\_lifecycle\_policy) | whether to create a lifecycle policy for the ecr repository with standard expiration rules | `bool` | `true` | no |
| <a name="input_customer_master_key_spec"></a> [customer\_master\_key\_spec](#input\_customer\_master\_key\_spec) | whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | days before the key is permanently deleted after destruction of the resource | `number` | `7` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | whether to allow terraform to delete a repository, even if contains images | `bool` | `false` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | tag mutability setting for the repository - must be 'MUTABLE' or 'IMMUTABLE' | `string` | `"IMMUTABLE"` | no |
| <a name="input_microservice"></a> [microservice](#input\_microservice) | name of the image, such as 'frontend', 'backend', or 'files' | `string` | n/a | yes |
| <a name="input_nonprod_account_id"></a> [nonprod\_account\_id](#input\_nonprod\_account\_id) | the nonprod project account id - required if create\_access\_policy is true | `string` | `null` | no |
| <a name="input_prod_account_id"></a> [prod\_account\_id](#input\_prod\_account\_id) | the prod project account id - required if create\_access\_policy is true | `string` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_tpm_email"></a> [tpm\_email](#input\_tpm\_email) | the email address of the technical project manager for the application | `string` | n/a | yes |
| <a name="input_tpm_first_name"></a> [tpm\_first\_name](#input\_tpm\_first\_name) | the first name of the technical project manager for the application | `string` | n/a | yes |
| <a name="input_tpm_last_name"></a> [tpm\_last\_name](#input\_tpm\_last\_name) | the last name of the technical project manager for the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the repository |
| <a name="output_id"></a> [id](#output\_id) | id of the repository |
| <a name="output_name"></a> [name](#output\_name) | name of the repository |
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | id of the registry that the repository belongs to |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | url of the repository |
<!-- END_TF_DOCS -->