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
| <a name="module_access_point"></a> [access\_point](#module\_access\_point) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-access-point | v3.1.5 |
| <a name="module_encryption"></a> [encryption](#module\_encryption) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-bucket-encryption | main |
| <a name="module_inventory"></a> [inventory](#module\_inventory) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-bucket-inventory | main |
| <a name="module_lifecycle_configuration"></a> [lifecycle\_configuration](#module\_lifecycle\_configuration) | git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-bucket-lifecycle | main |

# Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_point_enabled"></a> [access\_point\_enabled](#input\_access\_point\_enabled) | whether to create access points for the bucket | `bool` | `false` | no |
| <a name="input_access_point_suffix"></a> [access\_point\_suffix](#input\_access\_point\_suffix) | suffix to append to the access point name to describe its use or allowed principals - required if access\_point\_enabled is true | `string` | `null` | no |
| <a name="input_access_point_vpc_id"></a> [access\_point\_vpc\_id](#input\_access\_point\_vpc\_id) | the vpc id from which to allow access to the bucket via the access point - required if access\_point\_enabled is true | `string` | `null` | no |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_bucket_suffix"></a> [bucket\_suffix](#input\_bucket\_suffix) | n/a | `string` | n/a | yes |
| <a name="input_enable_access_logging"></a> [enable\_access\_logging](#input\_enable\_access\_logging) | whether to enable access logging for the bucket | `bool` | `false` | no |
| <a name="input_enable_bucket_inventory"></a> [enable\_bucket\_inventory](#input\_enable\_bucket\_inventory) | whether to enable s3 bucket inventory feature | `bool` | `false` | no |
| <a name="input_enable_object_versioning"></a> [enable\_object\_versioning](#input\_enable\_object\_versioning) | whether to enable versioning for objects in the bucket | `bool` | `true` | no |
| <a name="input_encryption_deletion_window_in_days"></a> [encryption\_deletion\_window\_in\_days](#input\_encryption\_deletion\_window\_in\_days) | number of days to wait before deleting an encryption key - required if encryption\_enabled is true and encryption\_sse\_algorithm is aws:kms | `number` | `7` | no |
| <a name="input_encryption_enable_key_rotation"></a> [encryption\_enable\_key\_rotation](#input\_encryption\_enable\_key\_rotation) | enable key rotation - required if encryption is true encryption\_sse\_algorithm is aws:kms | `bool` | `false` | no |
| <a name="input_encryption_enabled"></a> [encryption\_enabled](#input\_encryption\_enabled) | enable s3 object encryption | `bool` | `false` | no |
| <a name="input_encryption_sse_algorithm"></a> [encryption\_sse\_algorithm](#input\_encryption\_sse\_algorithm) | server-side encryption algorithm - required if encryption\_enabled is true | `string` | `"AES256"` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | force terraform to destroy bucket and all objects within bucket | `bool` | `false` | no |
| <a name="input_inventory_destination_bucket_arn"></a> [inventory\_destination\_bucket\_arn](#input\_inventory\_destination\_bucket\_arn) | arn of the bucket to store inventory reports - required if inventory\_enabled is true | `string` | `null` | no |
| <a name="input_inventory_destination_format"></a> [inventory\_destination\_format](#input\_inventory\_destination\_format) | format of the bucket inventory file ('CSV', 'ORC', or 'Parquet') - required if inventory\_enabled is true | `string` | `null` | no |
| <a name="input_inventory_enabled"></a> [inventory\_enabled](#input\_inventory\_enabled) | whether to enable inventory configuration for the bucket | `bool` | `false` | no |
| <a name="input_inventory_filter_prefix"></a> [inventory\_filter\_prefix](#input\_inventory\_filter\_prefix) | name of the directory to narrow inventory scope to - required if inventory\_enabled is true | `string` | `null` | no |
| <a name="input_inventory_included_object_versions"></a> [inventory\_included\_object\_versions](#input\_inventory\_included\_object\_versions) | use 'ALL' to inventory objects and histoical versions or 'CURRENT' for only current versions - required if inventory\_enabled is true | `string` | `null` | no |
| <a name="input_inventory_schedule_frequency"></a> [inventory\_schedule\_frequency](#input\_inventory\_schedule\_frequency) | frequency in which inventory reports are produced ('Daily' or 'Weekly') - required if inventory\_enabled is true | `string` | `null` | no |
| <a name="input_lifecycle_expiration_days"></a> [lifecycle\_expiration\_days](#input\_lifecycle\_expiration\_days) | number of days before objects expire - required if lifecycle\_policy\_enabled is true | `number` | `null` | no |
| <a name="input_lifecycle_noncurrent_expiration_days"></a> [lifecycle\_noncurrent\_expiration\_days](#input\_lifecycle\_noncurrent\_expiration\_days) | number of days before noncurrent object versions expire - required if lifecycle\_policy\_enabled is true | `number` | `null` | no |
| <a name="input_lifecycle_policy_enabled"></a> [lifecycle\_policy\_enabled](#input\_lifecycle\_policy\_enabled) | whether to enable lifecycle configuration for the bucket | `bool` | `false` | no |
| <a name="input_logging_target_bucket"></a> [logging\_target\_bucket](#input\_logging\_target\_bucket) | destination bucket name for access logs | `string` | `null` | no |
| <a name="input_logging_target_prefix"></a> [logging\_target\_prefix](#input\_logging\_target\_prefix) | prefix of the access logs in the destination bucket | `string` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_point_alias"></a> [access\_point\_alias](#output\_access\_point\_alias) | alias of the access point |
| <a name="output_access_point_arn"></a> [access\_point\_arn](#output\_access\_point\_arn) | arn of the access point if access point was created |
| <a name="output_access_point_domain_name"></a> [access\_point\_domain\_name](#output\_access\_point\_domain\_name) | domain name of the access point if access point was created |
| <a name="output_access_point_endpoints"></a> [access\_point\_endpoints](#output\_access\_point\_endpoints) | endpoints of the access point if access point was created |
| <a name="output_access_point_id"></a> [access\_point\_id](#output\_access\_point\_id) | id of the access point if access point was created |
| <a name="output_access_point_name"></a> [access\_point\_name](#output\_access\_point\_name) | name of the access point if access point was created |
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the s3 bucket |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | name of the s3 bucket |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | domain name of the s3 bucket |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | regional domain name of the s3 bucket |
| <a name="output_id"></a> [id](#output\_id) | id of the s3 bucket |
<!-- END_TF_DOCS -->