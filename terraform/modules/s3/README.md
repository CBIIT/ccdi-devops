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
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether S3 should restrict public bucket policies for this bucket | `bool` | `true` | no |
| <a name="input_version_configuration_status"></a> [version\_configuration\_status](#input\_version\_configuration\_status) | The versioning state of the bucket. Can be 'Enabled', 'Disabled', or 'Suspended' | `string` | `"Enabled"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The S3 Bucket ARN |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The S3 Bucket name (bucket) |
| <a name="output_id"></a> [id](#output\_id) | The S3 Bucket ID |
<!-- END_TF_DOCS -->