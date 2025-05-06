<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | id of the S3 bucket to attach the policy to | `string` | n/a | yes |
| <a name="input_source_replication_role_arn"></a> [source\_replication\_role\_arn](#input\_source\_replication\_role\_arn) | ARN of the IAM role that the source bucket uses to replicate objects | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | the name of the bucket to which the policy applies |
| <a name="output_id"></a> [id](#output\_id) | the name or id of the policy |
| <a name="output_policy"></a> [policy](#output\_policy) | the policy document as a JSON formatted string |
<!-- END_TF_DOCS -->