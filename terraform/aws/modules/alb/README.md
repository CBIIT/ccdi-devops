# Changes


- Added ability to associate tags through a variable (optional)
- Removed "type" variable - this module is designed to accomodate type of "application" only as the name suggests
- Optionally create ALB listeners. This is helpful when working in environments without an ACM certificate or when preparing infrastructure in prod prior to go-live

# Overview

A module that creates an AWS Application Load Balancer and optionally creates a set of HTTP and HTTPS listeners. Assume that all outputs relate to the Application Load Balancer unless the name of the output is prefixed with `http_listener` or `https_listener`.

This module does not contain AWS Security Group resources, and requires that the security groups are provided as an input variable. This module also does not create Load Balancer Listener Rules. In both cases, this decision was made to offer maximum configuration flexibility for each project.

# Usage 
The following provides an example of how to use this module by defining values for all required and optional variables. In the example, both HTTP and HTTPS listeners are also being created. Remember to pin the release version using the `?ref` reference trailing the url in the `source` argument.

<pre><code>
module "alb" {
  source = "git::https://github.com/NCI-CTOS/terraform-aws-alb?ref=vX.X.X"

  access_logs_enabled         = true
  access_logs_bucket          = aws_s3_bucket.log_bucket.id
  access_logs_prefix          = null
  app                         = "mtp"
  certificate_arn             = data.aws_acm_certificate.domain.arn
  create_http_listener        = true
  create_https_listener       = true
  env                         = terraform.workspace
  http_port                   = 80 
  http_protocol               = "HTTP"
  https_port                  = 443
  https_protocol              = "HTTPS"
  internal                    = terraform.workspace == "dev" || terraform.workspace == "qa" ? true : false
  desync_mitigation_mode      = true
  drop_invalid_header_fields  = true
  enable_deletion_protection  = true 
  enable_http2                = true 
  enable_waf_fail_open        = false
  idle_timeout                = 60
  preserve_host_header        = true
  program                     = "ccdi"
  security_groups             = [aws_security_group.alb.id]
  ssl_policy                  = "ELBSecurityPolicy-2016-08"
  subnets                     = data.aws_subnets.public.subnet_ids

  tags = {
    key   = "value",
    key2  = "value2"
  }
}
</code></pre>

<!-- BEGIN_TF_DOCS -->
# Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

# Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

# Resources

| Name | Type |
|------|------|
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |

# Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_bucket"></a> [access\_logs\_bucket](#input\_access\_logs\_bucket) | name of the destination bucket for load balancer access logs | `string` | `null` | no |
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | enables load balancer access logging | `bool` | `false` | no |
| <a name="input_access_logs_prefix"></a> [access\_logs\_prefix](#input\_access\_logs\_prefix) | directory prefix to store load balancer access logs within - default is root directory | `string` | `null` | no |
| <a name="input_app"></a> [app](#input\_app) | the name of the application expressed as an acronym | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | arn of the certificate for HTTPS listeners, not needed for HTTP listeners | `string` | `null` | no |
| <a name="input_create_http_listener"></a> [create\_http\_listener](#input\_create\_http\_listener) | whether to create an HTTP listener | `bool` | `true` | no |
| <a name="input_create_https_listener"></a> [create\_https\_listener](#input\_create\_https\_listener) | whether to create an HTTPS listener | `bool` | `true` | no |
| <a name="input_desync_mitigation_mode"></a> [desync\_mitigation\_mode](#input\_desync\_mitigation\_mode) | how the load balancer handles requests that might pose a security risk to an application due to HTTP desync, either monitor, defensive, or strictest | `string` | `"strictest"` | no |
| <a name="input_drop_invalid_header_fields"></a> [drop\_invalid\_header\_fields](#input\_drop\_invalid\_header\_fields) | whether HTTP headers with header fields that are not valid are removed by the load balancer | `bool` | `true` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | prevents terraform from accidentally destroying the load balancer | `bool` | `true` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | whether HTTP/2 is enabled in application load balancers | `bool` | `true` | no |
| <a name="input_enable_waf_fail_open"></a> [enable\_waf\_fail\_open](#input\_enable\_waf\_fail\_open) | whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the requests to waf | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | the target tier ('dev', 'qa', 'stage', or 'prod'.) | `string` | n/a | yes |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | port on which the load balancer is listening for HTTP requests | `number` | `80` | no |
| <a name="input_http_protocol"></a> [http\_protocol](#input\_http\_protocol) | protocol on which the load balancer is listening for HTTP requests | `string` | `"HTTP"` | no |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | port on which the load balancer is listening for HTTPS requests | `number` | `443` | no |
| <a name="input_https_protocol"></a> [https\_protocol](#input\_https\_protocol) | protocol on which the load balancer is listening for HTTPS requests | `string` | `"HTTPS"` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | in seconds, the amount of time the connection is permitted to be idle | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | whether the load balancer is internally facing | `bool` | `false` | no |
| <a name="input_preserve_host_header"></a> [preserve\_host\_header](#input\_preserve\_host\_header) | whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change | `bool` | `true` | no |
| <a name="input_program"></a> [program](#input\_program) | the program associated with the application | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | security group(s) to associate with the load balancer | `set(string)` | n/a | yes |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | the name of the SSL policy for the HTTPS listener | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | the subnets to associate with the load balancer | `set(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to apply to the load balancer and listeners (if created) | `map(string)` | `{}` | no |

# Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the load balancer |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | arn suffix of the load balancer |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | dns name of the load balancer |
| <a name="output_http_listener_arn"></a> [http\_listener\_arn](#output\_http\_listener\_arn) | arn of the http listener |
| <a name="output_http_listener_id"></a> [http\_listener\_id](#output\_http\_listener\_id) | id of the http listener |
| <a name="output_https_listener_arn"></a> [https\_listener\_arn](#output\_https\_listener\_arn) | arn of the https listener |
| <a name="output_https_listener_id"></a> [https\_listener\_id](#output\_https\_listener\_id) | id of the https listener |
| <a name="output_id"></a> [id](#output\_id) | id of the load balancer |
| <a name="output_name"></a> [name](#output\_name) | name of the load balancer |
| <a name="output_security_groups"></a> [security\_groups](#output\_security\_groups) | security groups attached to the load balancer |
<!-- END_TF_DOCS -->