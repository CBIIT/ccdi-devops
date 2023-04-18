resource "aws_cloudwatch_event_rule" "this" {
  name                = "${local.stack}-${var.rule_suffix}"
  event_bus_name      = var.event_bus_name
  description         = var.description
  schedule_expression = var.trigger_type == "schedule" ? var.schedule_expression : null
  event_pattern       = var.trigger_type == "event_pattern" ? var.event_pattern : null
  is_enabled          = var.enable ? true : false
  role_arn            = var.role_arn
}
