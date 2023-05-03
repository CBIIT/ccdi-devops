resource "aws_cloudwatch_event_target" "this" {
  rule     = var.rule_id
  arn      = var.target_arn
  role_arn = var.role_arn
}
