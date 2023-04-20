resource "aws_cloudwatch_event_api_destination" "this" {
  name                             = "${local.stack}-${var.api_destination_name}"
  description                      = "api destination for ${var.api_destination_name}"
  invocation_endpoint              = var.destination_endpoint
  http_method                      = var.http_method
  invocation_rate_limit_per_second = var.invocation_rate_limit_per_second
  connection_arn                   = aws_cloudwatch_event_connection.api_key.arn
}

resource "aws_cloudwatch_event_connection" "api_key" {
  name               = "${local.stack}-${var.api_destination_name}"
  description        = "api connection for ${var.api_destination_name}"
  authorization_type = "API_KEY"

  auth_parameters {
    api_key {
      key   = var.api_key_name
      value = var.api_key_value
    }
  }
}
