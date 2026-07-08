resource "aws_api_gateway_stage" "this" {
  rest_api_id           = var.rest_api_id
  cache_cluster_enabled = var.cache_cluster_enabled
  cache_cluster_size    = var.cache_cluster_size
  client_certificate_id = var.client_certificate_id
  deployment_id         = aws_api_gateway_deployment.this.id
  description           = var.description
  stage_name            = var.stage_name
  variables             = var.variables
  xray_tracing_enabled  = var.xray_tracing_enabled

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.this.arn
    format          = replace(var.api_access_log_format, "\n", "")
  }

  depends_on = [aws_cloudwatch_log_group.this]
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = var.rest_api_id

  triggers = {
    redeployment = var.redeployment_trigger
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "API-Gateway-Execution-Logs_${var.rest_api_id}/${var.stage_name}"
  retention_in_days = var.log_retention_in_days
}
