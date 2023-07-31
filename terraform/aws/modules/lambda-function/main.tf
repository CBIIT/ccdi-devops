resource "aws_lambda_function" "this" {
  function_name    = "${local.stack}-${var.function_name}"
  description      = var.description
  filename         = var.filename
  source_code_hash = var.source_code_hash
  layers           = var.layers == [] ? null : var.layers
  s3_bucket        = var.s3_bucket
  s3_key           = var.s3_key
  handler          = var.handler
  role             = module.role.arn
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

  dynamic "environment" {
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
      security_group_ids = var.vpc_config.value.security_group_ids
      subnet_ids         = var.vpc_config.value.subnet_ids
    }
  }

  lifecycle {
    ignore_changes = [last_modified]
  }
}

module "role" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/iam/lambda-function?ref=main"

  app                        = var.app
  env                        = var.env
  program                    = var.program
  attach_permission_boundary = var.attach_permission_boundary
  enable_vpc_access          = var.vpc_config != null ? true : false
  function_name              = var.function_name
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${local.stack}-${var.function_name}"
  retention_in_days = 90
  kms_key_id        = ""
}
