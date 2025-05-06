<!-- BEGIN_TF_DOCS -->


# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

# Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_comment"></a> [comment](#input\_comment) | the comment for the cloudfront distribution | `string` | n/a | yes |
| <a name="input_default_cache_behavior"></a> [default\_cache\_behavior](#input\_default\_cache\_behavior) | the default cache behavior for the cloudfront distribution | <pre>map({<br>    allowed_methods        = optional(list(string), ["GET", "HEAD", "OPTIONS"])<br>    cached_methods         = optional(list(string), ["GET", "HEAD", "OPTIONS"])<br>    target_origin_id       = string<br>    viewer_protocol_policy = optional(string, "redirect-to-https")<br>  })</pre> | n/a | yes |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | the default root object for the cloudfront distribution | `string` | `"index.html"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', 'nonprod' or 'prod'.) | `string` | n/a | yes |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | whether ipv6 is enabled for the cloudfront distribution | `bool` | `true` | no |
| <a name="input_logging_config_include_cookies"></a> [logging\_config\_include\_cookies](#input\_logging\_config\_include\_cookies) | whether to include cookies in the cloudfront distribution logs | `bool` | `false` | no |
| <a name="input_origin"></a> [origin](#input\_origin) | the origin for the cloudfront distribution | <pre>map({<br>    connection_attempts = optional(number, 3)<br>    connection_timeout  = optional(number, 10)<br>    domain_name         = string<br>    origin_id           = string<br>  })</pre> | n/a | yes |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | n/a | `string` | `"PriceClass_100"` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_restrictions_locations"></a> [restrictions\_locations](#input\_restrictions\_locations) | the list of locations to whitelist for the cloudfront distribution | `list(string)` | <pre>[<br>  "US"<br>]</pre> | no |
| <a name="input_retain_on_delete"></a> [retain\_on\_delete](#input\_retain\_on\_delete) | n/a | `bool` | `true` | no |
| <a name="input_viewer_certificate"></a> [viewer\_certificate](#input\_viewer\_certificate) | the viewer certificate for the cloudfront distribution | <pre>map({<br>    acm_certificate_arn      = optional(string, null)<br>    minimum_protocol_version = optional(string, "TLSv1.2_2019")<br>    ssl_support_method       = optional(string, "sni-only")<br>  })</pre> | n/a | yes |
| <a name="input_wait_for_deployment"></a> [wait\_for\_deployment](#input\_wait\_for\_deployment) | n/a | `bool` | `true` | no |
<!-- END_TF_DOCS -->