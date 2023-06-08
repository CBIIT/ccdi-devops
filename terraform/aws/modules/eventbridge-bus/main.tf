resource "aws_cloudwatch_event_bus" "this" {
  name = "${local.stack}-${var.eventbus_suffix}"
}

resource "aws_cloudwatch_event_permission" "this" {
  count = var.create_eventbridge_permission ? 1 : 0

  event_bus_name = aws_cloudwatch_event_bus.this.name
  statement_id   = "AllowPutEvents"
  action         = "events:PutEvents"
  principal      = "*"

  condition {
    type  = "StringEquals"
    key   = "aws:PrincipalOrgID"
    value = data.aws_organizations_organization.current.id
  }
}
