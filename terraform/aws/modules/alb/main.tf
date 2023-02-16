resource "aws_lb" "this" {
  name                       = "${local.stack}-alb"
  internal                   = var.internal
  desync_mitigation_mode     = var.desync_mitigation_mode
  drop_invalid_header_fields = var.drop_invalid_header_fields
  enable_deletion_protection = var.enable_deletion_protection
  enable_http2               = var.enable_http2
  enable_waf_fail_open       = var.enable_waf_fail_open
  idle_timeout               = var.idle_timeout
  load_balancer_type         = "application"
  preserve_host_header       = var.preserve_host_header
  security_groups            = var.security_groups
  subnets                    = var.subnets

  access_logs {
    enabled = var.access_logs_enabled
    bucket  = var.access_logs_enabled ? var.access_logs_bucket : null
    prefix  = var.access_logs_enabled ? var.access_logs_prefix : null
  }

  tags = merge(
    {
      "Name" = "${local.stack}-alb"
    },
    var.tags
  )
}

resource "aws_lb_listener" "http" {
  count = var.create_http_listener ? 1 : 0

  load_balancer_arn = aws_lb.this.arn
  port              = var.http_port
  protocol          = var.http_protocol

  default_action {
    type = "redirect"

    redirect {
      port        = var.https_port
      protocol    = var.https_protocol
      status_code = "HTTP_301"
    }
  }

  tags = var.tags
}

resource "aws_lb_listener" "https" {
  count = var.create_https_listener ? 1 : 0

  load_balancer_arn = aws_lb.this.arn
  certificate_arn   = var.certificate_arn
  port              = var.https_port
  protocol          = var.https_protocol
  ssl_policy        = var.ssl_policy

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "The requested URL was not found on this server."
      status_code  = "503"
    }
  }

  tags = var.tags
}
