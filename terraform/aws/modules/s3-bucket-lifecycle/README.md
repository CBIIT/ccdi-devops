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
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | bucket id to apply lifecycle configuration | `string` | n/a | yes |
| <a name="input_expiration_days"></a> [expiration\_days](#input\_expiration\_days) | number of days before objects expire | `number` | `null` | no |
| <a name="input_filter_prefix"></a> [filter\_prefix](#input\_filter\_prefix) | prefix to filter objects | `string` | `null` | no |
| <a name="input_noncurrent_expiration_days"></a> [noncurrent\_expiration\_days](#input\_noncurrent\_expiration\_days) | number of days before noncurrent object versions expire | `number` | `null` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | id of the bucket lifecycle configuration |
<!-- END_TF_DOCS -->