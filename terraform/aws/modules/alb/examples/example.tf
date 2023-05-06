module "alb" {
  source = "../"

  app                        = "mtp"
  certificate_arn            = data.aws_acm_certificate.domain.arn
  create_http_listener       = true
  create_https_listener      = true
  env                        = "prod"
  http_port                  = 80
  http_protocol              = "HTTP"
  https_port                 = 443
  https_protocol             = "HTTPS"
  internal                   = terraform.workspace == "dev" || terraform.workspace == "qa" ? true : false
  desync_mitigation_mode     = true
  drop_invalid_header_fields = true
  enable_deletion_protection = true
  enable_http2               = true
  enable_waf_fail_open       = false
  idle_timeout               = 60
  preserve_host_header       = true
  program                    = "ccdi"
  security_groups            = [aws_security_group.alb.id]
  ssl_policy                 = "ELBSecurityPolicy-2016-08"
  subnets                    = data.aws_subnets.public.subnet_ids
}
