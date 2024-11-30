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
| [aws_cloudfront_response_headers_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_control_allow_credentials"></a> [access\_control\_allow\_credentials](#input\_access\_control\_allow\_credentials) | whether to include the access-control-allow-credentials header in responses | `bool` | `false` | no |
| <a name="input_access_control_allow_headers"></a> [access\_control\_allow\_headers](#input\_access\_control\_allow\_headers) | the headers to allow in the access-control-allow-headers header | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_access_control_allow_methods"></a> [access\_control\_allow\_methods](#input\_access\_control\_allow\_methods) | the methods to allow in the access-control-allow-methods header | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD",<br>  "OPTIONS",<br>  "PATCH",<br>  "POST",<br>  "PUT"<br>]</pre> | no |
| <a name="input_access_control_allow_origins"></a> [access\_control\_allow\_origins](#input\_access\_control\_allow\_origins) | the origins to allow in the access-control-allow-origins header | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_origin_override"></a> [origin\_override](#input\_origin\_override) | whether to override the origin's cache-control headers | `bool` | `true` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_comment"></a> [comment](#output\_comment) | comment for this response headers policy |
| <a name="output_cors_config"></a> [cors\_config](#output\_cors\_config) | cors config for this response headers policy |
| <a name="output_etag"></a> [etag](#output\_etag) | etag for this response headers policy |
| <a name="output_id"></a> [id](#output\_id) | id for this response headers policy |
| <a name="output_name"></a> [name](#output\_name) | name for this response headers policy |
<!-- END_TF_DOCS -->