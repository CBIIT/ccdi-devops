resource "aws_lambda_function" "this" {
  function_name    = "${local.stack}-${var.function_name}"
  description      = var.description
  filename         = var.filename
  source_code_hash = var.source_code_hash
  handler          = var.handler
  role             = var.role
  runtime          = var.runtime

  memory_size   = var.memory_size
  timeout       = var.timeout
  architectures = [var.architectures]

  vpc_config {
    subnet_ids         = var.subnet_ids == [] ? null : var.subnet_ids
    security_group_ids = var.security_group_ids == [] ? null : var.security_group_ids
  }

  environment {
    variables = var.environment_variables
  }
}
