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
| [aws_cloudfront_cache_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_cache_policy) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_cookie_behavior"></a> [cookie\_behavior](#input\_cookie\_behavior) | cookie behavior for this cache behavior (allowed values are none, whitelist, all) | `string` | `"none"` | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | default time to live in seconds for objects in the cache | `number` | `86400` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_header_behavior"></a> [header\_behavior](#input\_header\_behavior) | header behavior for this cache behavior (allowed values are none, whitelist, all) | `string` | `"whitelist"` | no |
| <a name="input_header_items"></a> [header\_items](#input\_header\_items) | header items for this cache behavior | `list(string)` | <pre>[<br>  "Origin",<br>  "Access-Control-Request-Headers",<br>  "Access-Control-Request-Method"<br>]</pre> | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | maximum time to live in seconds for objects in the cache | `number` | `31536000` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | minimum time to live in seconds for objects in the cache | `number` | `1` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_query_string_behavior"></a> [query\_string\_behavior](#input\_query\_string\_behavior) | query string behavior for this cache behavior (allowed values are none, whitelist, all) | `string` | `"none"` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_comment"></a> [comment](#output\_comment) | comment for this cache policy |
| <a name="output_default_ttl"></a> [default\_ttl](#output\_default\_ttl) | default time to live for this cache policy |
| <a name="output_etag"></a> [etag](#output\_etag) | etag for this cache policy |
| <a name="output_id"></a> [id](#output\_id) | id for this cache policy |
| <a name="output_max_ttl"></a> [max\_ttl](#output\_max\_ttl) | max time to live for this cache policy |
| <a name="output_min_ttl"></a> [min\_ttl](#output\_min\_ttl) | min time to live for this cache policy |
| <a name="output_name"></a> [name](#output\_name) | name for this cache policy |
| <a name="output_parameters_in_cache_key_and_forwarded_to_origin"></a> [parameters\_in\_cache\_key\_and\_forwarded\_to\_origin](#output\_parameters\_in\_cache\_key\_and\_forwarded\_to\_origin) | parameters in cache key and forwarded to origin for this cache policy |
<!-- END_TF_DOCS -->