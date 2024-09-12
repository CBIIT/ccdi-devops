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
| [aws_cloudfront_origin_access_control.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | description of the origin access control | `string` | `"restricts the requests that cloudfront can make to your s3 bucket"` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_origin_access_control_origin_type"></a> [origin\_access\_control\_origin\_type](#input\_origin\_access\_control\_origin\_type) | the type of origin that the origin access control applies to | `string` | `"s3"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_signing_behavior"></a> [signing\_behavior](#input\_signing\_behavior) | the behavior if the origin access control requires a signed url | `string` | `"always"` | no |
| <a name="input_signing_protocol"></a> [signing\_protocol](#input\_signing\_protocol) | the protocol that the origin access control requires for signed urls | `string` | `"sigv4"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_description"></a> [description](#output\_description) | description of the origin access control |
| <a name="output_etag"></a> [etag](#output\_etag) | etag of the origin access control |
| <a name="output_id"></a> [id](#output\_id) | id of the origin access control |
| <a name="output_name"></a> [name](#output\_name) | name of the origin access control |
| <a name="output_origin_access_control_origin_type"></a> [origin\_access\_control\_origin\_type](#output\_origin\_access\_control\_origin\_type) | type of origin that the origin access control applies to |
| <a name="output_signing_behavior"></a> [signing\_behavior](#output\_signing\_behavior) | signing behavior of the origin access control |
| <a name="output_signing_protocol"></a> [signing\_protocol](#output\_signing\_protocol) | signing protocol of the origin access control |
<!-- END_TF_DOCS -->