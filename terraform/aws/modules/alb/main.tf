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
  security_groups            = var.create_security_group ? [aws_security_group.this[0].id] : var.security_group_ids
  subnets                    = var.subnets

  access_logs {
    enabled = true
    bucket  = "fnl-nonprod-manager-alb-server-access-logs"
  }
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
}

resource "aws_security_group" "this" {
  count = var.create_security_group ? 1 : 0

  name        = "${local.stack}-alb-sg"
  description = "security group associated with the alb named ${local.stack}-alb"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${local.stack}-alb-sg"
  }
}

resource "aws_security_group_rule" "inbound_http" {
  count = var.create_security_group ? 1 : 0

  security_group_id = aws_security_group.this[0].id
  description       = "allow inbound traffic from http"
  type              = "ingress"
  from_port         = "80"
  protocol          = "tcp"
  to_port           = "80"
  cidr_blocks       = var.create_security_group ? var.security_group_ingress_cidr : null
}

resource "aws_security_group_rule" "inbound_https" {
  count = var.create_security_group ? 1 : 0

  security_group_id = aws_security_group.this[0].id
  description       = "allow inbound traffic from https"
  type              = "ingress"
  from_port         = "443"
  protocol          = "tcp"
  to_port           = "443"
  cidr_blocks       = var.create_security_group ? var.security_group_ingress_cidr : null
}
