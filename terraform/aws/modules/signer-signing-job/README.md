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
| [aws_signer_signing_job.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/signer_signing_job) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_bucket"></a> [destination\_bucket](#input\_destination\_bucket) | the name of the S3 bucket where the signed code should be saved | `string` | n/a | yes |
| <a name="input_destination_prefix"></a> [destination\_prefix](#input\_destination\_prefix) | the prefix to be used when saving the signed code in the s3 bucket | `string` | n/a | yes |
| <a name="input_ignore_signing_job_failure"></a> [ignore\_signing\_job\_failure](#input\_ignore\_signing\_job\_failure) | indicates whether the signing job should continue if signature generation fails | `bool` | `false` | no |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | the name of the signing profile to initiate the signing operation | `string` | n/a | yes |
| <a name="input_source_bucket"></a> [source\_bucket](#input\_source\_bucket) | the name of the S3 bucket where the unsigned code is located | `string` | n/a | yes |
| <a name="input_source_key"></a> [source\_key](#input\_source\_key) | the key name of the unsigned code object in S3 | `string` | n/a | yes |
| <a name="input_source_version"></a> [source\_version](#input\_source\_version) | the version of the unsigned code object to be signed | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_completed_at"></a> [completed\_at](#output\_completed\_at) | date and time that the signing job was completed |
| <a name="output_created_at"></a> [created\_at](#output\_created\_at) | date and time that the signing job was created |
| <a name="output_job_id"></a> [job\_id](#output\_job\_id) | the id of the signing job |
| <a name="output_job_invoker"></a> [job\_invoker](#output\_job\_invoker) | the iam principal that requested the signing job |
| <a name="output_job_owner"></a> [job\_owner](#output\_job\_owner) | the iam principal that owns the signing job |
| <a name="output_platform_display_name"></a> [platform\_display\_name](#output\_platform\_display\_name) | the display name of the signing platform |
| <a name="output_requested_by"></a> [requested\_by](#output\_requested\_by) | the iam principal that requested the signing job |
| <a name="output_revocation_record"></a> [revocation\_record](#output\_revocation\_record) | the revocation record for the signing job |
| <a name="output_signature_expires_at"></a> [signature\_expires\_at](#output\_signature\_expires\_at) | the date and time that the signing job signature expires |
| <a name="output_signed_object"></a> [signed\_object](#output\_signed\_object) | name of the s3 bucket where the signed code is located |
| <a name="output_status"></a> [status](#output\_status) | status of the signing job |
| <a name="output_status_reason"></a> [status\_reason](#output\_status\_reason) | status reason of the signing job |
<!-- END_TF_DOCS -->