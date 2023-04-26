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
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_inventory.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_inventory) | resource |
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_bucket_suffix"></a> [bucket\_suffix](#input\_bucket\_suffix) | n/a | `string` | n/a | yes |
| <a name="input_enable_access_logging"></a> [enable\_access\_logging](#input\_enable\_access\_logging) | whether to enable access logging for the bucket | `bool` | `false` | no |
| <a name="input_enable_bucket_inventory"></a> [enable\_bucket\_inventory](#input\_enable\_bucket\_inventory) | whether to enable s3 bucket inventory feature | `bool` | `false` | no |
| <a name="input_enable_object_expiration"></a> [enable\_object\_expiration](#input\_enable\_object\_expiration) | whether to expire objects after 90 days with lifecycle rules | `bool` | `false` | no |
| <a name="input_enable_object_versioning"></a> [enable\_object\_versioning](#input\_enable\_object\_versioning) | whether to enable versioning for objects in the bucket | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_expire_objects_after_days"></a> [expire\_objects\_after\_days](#input\_expire\_objects\_after\_days) | required if expire\_objects is true - number of days to retain objects in the bucket | `number` | `90` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | force terraform to destroy bucket and all objects within bucket | `bool` | `false` | no |
| <a name="input_inventory_destination_bucket_arn"></a> [inventory\_destination\_bucket\_arn](#input\_inventory\_destination\_bucket\_arn) | n/a | `string` | `null` | no |
| <a name="input_inventory_destination_format"></a> [inventory\_destination\_format](#input\_inventory\_destination\_format) | format of the bucket inventory file - can be 'CSV', 'ORC', or 'Parquet' | `string` | `null` | no |
| <a name="input_inventory_filter_prefix"></a> [inventory\_filter\_prefix](#input\_inventory\_filter\_prefix) | name of the directory to narrow inventory scope to | `string` | `null` | no |
| <a name="input_inventory_included_object_versions"></a> [inventory\_included\_object\_versions](#input\_inventory\_included\_object\_versions) | use 'ALL' to inventory objects and histoical versions or 'CURRENT' for only current versions | `string` | `null` | no |
| <a name="input_inventory_schedule_frequency"></a> [inventory\_schedule\_frequency](#input\_inventory\_schedule\_frequency) | Daily or Weekly | `string` | `null` | no |
| <a name="input_logging_target_bucket"></a> [logging\_target\_bucket](#input\_logging\_target\_bucket) | destination bucket name for access logs | `string` | `null` | no |
| <a name="input_logging_target_prefix"></a> [logging\_target\_prefix](#input\_logging\_target\_prefix) | prefix of the access logs in the destination bucket | `string` | `null` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the s3 bucket |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | name of the s3 bucket |
| <a name="output_bucket_domain_name"></a> [bucket\_domain\_name](#output\_bucket\_domain\_name) | domain name of the s3 bucket |
| <a name="output_bucket_regional_domain_name"></a> [bucket\_regional\_domain\_name](#output\_bucket\_regional\_domain\_name) | regional domain name of the s3 bucket |
| <a name="output_id"></a> [id](#output\_id) | id of the s3 bucket |
<!-- END_TF_DOCS -->