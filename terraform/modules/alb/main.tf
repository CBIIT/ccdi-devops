resource "aws_lb" "alb" {
  # checkov:skip=CKV_AWS_152: ADD REASON
  name                       = "${var.program}-${var.app}-${var.tier}-lb"
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  drop_invalid_header_fields = var.drop_invalid_header_fields
  enable_deletion_protection = var.enable_deletion_protection
  security_groups            = var.security_group_id
  subnets                    = var.public_subnets

  access_logs {
    bucket  = var.access_logs_bucket
    prefix  = "${var.program}/${var.tier}/${var.app}/alb-access-logs"
    enabled = true
  }

  timeouts {
    create = var.timeout_create
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.http_port
  protocol          = var.http_protocol


  default_action {
    type = "redirect"

    redirect {
      port        = var.https_port
      protocol    = var.https_protocol
      status_code = var.http_redirect_status_code
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.https_port
  protocol          = var.https_protocol
  ssl_policy        = var.alb_listener_ssl_policy
  certificate_arn   = var.domain_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = var.fixed_response_content_type
      message_body = var.fixed_response_message_body
      status_code  = var.fixed_response_status_code
    }
  }
}
