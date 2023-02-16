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
<!-- END_TF_DOCS -->