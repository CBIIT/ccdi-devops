<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_signer_signing_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/signer_signing_profile) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_platform"></a> [platform](#input\_platform) | the platform to be used for signing - either 'lambda' or 'container' | `string` | `"lambda"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the signing profile |
| <a name="output_name"></a> [name](#output\_name) | name of the signing profile |
| <a name="output_platform_display_name"></a> [platform\_display\_name](#output\_platform\_display\_name) | platform display name of the signing profile |
| <a name="output_revocation_record"></a> [revocation\_record](#output\_revocation\_record) | revocation record of the signing profile |
| <a name="output_status"></a> [status](#output\_status) | status of the signing profile |
| <a name="output_version"></a> [version](#output\_version) | version of the signing profile |
| <a name="output_version_arn"></a> [version\_arn](#output\_version\_arn) | version arn of the signing profile |
<!-- END_TF_DOCS -->