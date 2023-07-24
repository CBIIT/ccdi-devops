resource "aws_lambda_function" "this" {
  function_name    = "${local.stack}-${var.function_name}"
  description      = var.description
  filename         = var.filename
  source_code_hash = var.source_code_hash
  handler          = var.handler
  role             = var.role
  runtime          = var.runtime
  memory_size      = var.memory_size
  timeout          = var.timeout
  architectures    = [var.architectures]

  vpc_config {
    subnet_ids         = var.subnet_ids == [] ? null : var.subnet_ids
    security_group_ids = var.security_group_ids == [] ? null : var.security_group_ids
  }

  environment {
    variables = var.environment_variables
  }

  depends_on = [
    aws_cloudwatch_log_group.this,
    aws_iam_role_policy_attachment.this
  ]
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${local.stack}-${var.function_name}"
  retention_in_days = 30
}

resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-lambda-${var.function_name}"
  description          = "the role for the lambda function named ${local.stack}-${var.function_name}"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = var.attach_permission_boundary ? local.permissions_boundary_arn : null
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-lambda-${var.function_name}"
  description = "iam policy for the lambda function named ${local.stack}-${var.function_name}"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
