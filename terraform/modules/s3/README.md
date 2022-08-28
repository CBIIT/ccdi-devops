<!-- BEGIN_TF_DOCS -->


# Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | The name of the app or project that this bucket supports | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The suffix for the name of the bucket. Use it to describe the purpose of the bucket | `string` | n/a | yes |
| <a name="input_level"></a> [level](#input\_level) | The tier or the account-level. Tiers examples include dev, qa while account-levels are prod and nonprod | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | The name of the program this app or project supports (i.e. ccdi) | `string` | n/a | yes |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether S3 should block public ACLs for this bucket | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether S3 should block public bucket policies for this bucket | `bool` | `true` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether S3 should ignore public ACLs for this bucket | `bool` | `true` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether S3 should restrict public bucket policies for this bucket | `bool` | `true` | no |
| <a name="input_version_configuration_status"></a> [version\_configuration\_status](#input\_version\_configuration\_status) | The versioning state of the bucket. Can be 'Enabled', 'Disabled', or 'Suspended' | `string` | `"Enabled"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The S3 Bucket ARN |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The S3 Bucket name (bucket) |
| <a name="output_id"></a> [id](#output\_id) | The S3 Bucket ID |
<!-- END_TF_DOCS -->