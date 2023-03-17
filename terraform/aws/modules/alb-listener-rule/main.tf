resource "aws_lb_listener_rule" "this" {
  listener_arn = var.listener_arn
  priority     = var.priority


  action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }

  dynamic "condition" {
    for_each = var.condition_host_header

    content {
      host_header {
        values = var.condition_host_header
      }
    }
  }

  dynamic "condition" {
    for_each = var.condition_path_pattern

    content {
      path_pattern {
        values = var.condition_path_pattern
      }
    }
  }
}
