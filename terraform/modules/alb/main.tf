resource "aws_lb" "alb" {
  name                       = "${var.program}-${var.app}-${var.env}-lb"
  internal                   = var.internal
  load_balancer_type         = "application"
  drop_invalid_header_fields = true
  desync_mitigation_mode     = "strictest"
  enable_deletion_protection = true
  enable_http2               = true
  enable_waf_fail_open       = false
  security_groups            = var.security_group_id
  subnets                    = var.subnets

  access_logs {
    bucket  = var.access_logs_bucket
    enabled = true
  }
}
