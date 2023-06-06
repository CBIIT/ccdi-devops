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
| [aws_s3_access_point.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_access_point) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_point_suffix"></a> [access\_point\_suffix](#input\_access\_point\_suffix) | suffix to append to the access point name to describe its use or allowed principals | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | name of the bucket to associate with the access point | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_alias"></a> [alias](#output\_alias) | dns alias of the access point |
| <a name="output_arn"></a> [arn](#output\_arn) | The arn of the access point |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | name of the bucket associated with this access point |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | the fully qualified domain name of the access point |
| <a name="output_endpoints"></a> [endpoints](#output\_endpoints) | the list of endpoints for the access point |
| <a name="output_id"></a> [id](#output\_id) | the id of the access point |
| <a name="output_name"></a> [name](#output\_name) | the name of the access point |
<!-- END_TF_DOCS -->