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
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | the id of the bucket to apply encryption to | `string` | n/a | yes |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | The duration in days after which the key is deleted after destruction of the resource - required if ss3\_algorithm is 'aws:kms' | `number` | `7` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled - required if ss3\_algorithm is 'aws:kms' | `bool` | `true` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | the server-side encryption algorithm to use - either 'AES256' and 'aws:kms' | `string` | `"AES256"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | id of the s3 bucket server side encryption configuration |
| <a name="output_kms_arn"></a> [kms\_arn](#output\_kms\_arn) | arn of the kms key used to encrypt the s3 bucket |
| <a name="output_kms_id"></a> [kms\_id](#output\_kms\_id) | id of the kms key used to encrypt the s3 bucket |
| <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id) | key id of the kms key used to encrypt the s3 bucket |
<!-- END_TF_DOCS -->