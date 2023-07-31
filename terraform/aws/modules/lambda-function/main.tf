resource "aws_lambda_function" "this" {
  function_name    = "${local.stack}-${var.function_name}"
  description      = var.description
  filename         = var.filename
  source_code_hash = var.source_code_hash
  layers           = var.layers == [] ? null : var.layers
  s3_bucket        = var.s3_bucket
  s3_key           = var.s3_key
  handler          = var.handler
  role             = aws_iam_role.this.arn
  runtime          = var.runtime
  memory_size      = var.memory_size
  timeout          = var.timeout
  architectures    = [var.architectures]

  tracing_config {
    mode = var.tracing_mode
  }

  ephemeral_storage {
    size = var.ephemeral_storage_size
  }

  dynamic environment {
    for_each = var.environment_variables != {} ? [true] : []

    content {
      variables = var.environment_variables
    }
  }

  dynamic "dead_letter_config" {
    for_each = var.dead_letter_config_target_arn != null ? [true] : []

    content {
      target_arn = var.dead_letter_config_target_arn
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config != null ? [var.vpc_config] : []

    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.cloudwatch,
    aws_iam_role_policy_attachment.xray,
    aws_iam_role_policy_attachment.vpc
  ]
}

resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-lambda-${var.function_name}"
  description          = "the role for the lambda function named ${local.stack}-${var.function_name}"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = var.attach_permission_boundary ? local.permissions_boundary_arn : null
}

resource "aws_iam_policy" "cloudwatch" {
  name        = "power-user-${local.stack}-lambda-${var.function_name}-cloudwatch"
  description = "allows the lambda function named ${local.stack}-${var.function_name} to write to cloudwatch logs"
  policy      = data.aws_iam_policy_document.cloudwatch.json
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.cloudwatch.arn
}

resource "aws_iam_policy" "xray" {
  name        = "power-user-${local.stack}-lambda-${var.function_name}-xray"
  description = "allows the lambda function named ${local.stack}-${var.function_name} to write to xray"
  policy      = data.aws_iam_policy_document.xray.json
}

resource "aws_iam_role_policy_attachment" "xray" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.xray.arn
}

resource "aws_iam_policy" "vpc" {
  name        = "power-user-${local.stack}-lambda-${var.function_name}-vpc"
  description = "allows the lambda function named ${local.stack}-${var.function_name} to access the vpc"
  policy      = data.aws_iam_policy_document.vpc.json
}

resource "aws_iam_role_policy_attachment" "vpc" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.vpc.arn
}
