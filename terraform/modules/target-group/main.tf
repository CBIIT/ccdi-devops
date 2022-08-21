resource "aws_lb_target_group" "tg" {
  name        = "${var.program}-${var.app}-${var.tier}-${var.target_description}"
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  stickiness {
    type            = var.stickiness_type
    cookie_duration = var.stickiness_cookie_duration
    enabled         = var.stickiness_enabled
  }

  health_check {
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    port                = var.health_check_port
    matcher             = var.health_check_matcher
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }
}
