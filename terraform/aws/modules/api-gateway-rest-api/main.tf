resource "aws_api_gateway_account" "this" {
  count = var.create_cloudwatch_role ? 1 : 0

  cloudwatch_role_arn = aws_iam_role.this.arn
}

resource "aws_api_gateway_rest_api" "this" {
  api_key_source               = var.api_key_source
  binary_media_types           = var.binary_media_types
  body                         = var.body
  disable_execute_api_endpoint = var.disable_execute_api_endpoint
  fail_on_warnings             = var.fail_on_warnings
  minimum_compression_size     = var.minimum_compression_size
  name                         = "${local.stack}-${var.api_suffix}"
  put_rest_api_mode            = var.put_rest_api_mode

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  parameters = var.parameters
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  triggers = {
    redeployment = sha1(var.body)
  }
}

resource "aws_api_gateway_stage" "this" {
  rest_api_id           = aws_api_gateway_rest_api.this.id
  cache_cluster_enabled = var.cluster_cache_enabled
  cache_cluster_size    = var.cluster_cache_size
  client_certificate_id = var.client_certificate_id
  deployment_id         = ""
  description           = "The ${var.env} stage for the ${local.stack} API Gateway"
  stage_name            = var.env
  variables             = var.variables
  xray_tracing_enabled  = var.xray_tracing_enabled

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.this.arn
    format          = replace(var.api_access_log_format, "\n", "")
  }

  depends_on = [aws_cloudwatch_log_group.this]
}

resource "aws_api_gateway_method_settings" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  stage_name  = aws_api_gateway_stage.this.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled = true
    logging_level   = var.api_logging_level
  }
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.this.id}/${var.env}"
  retention_in_days = 90
}

resource "aws_iam_role" "this" {
  name                 = "power-user-${var.program}-${local.level}-${var.app}-rest-api-logs"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.level == "prod" ? null : local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name   = "power-user-${var.program}-${local.level}-${var.app}-rest-api-logs"
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
