resource "aws_lambda_function" "this" {
  function_name           = "${local.stack}-${var.function_name}"
  description             = var.description
  filename                = var.filename
  source_code_hash        = var.source_code_hash
  code_signing_config_arn = var.signing_profile_version_arns != [] ? module.code_signing_config[0].arn : null
  layers                  = var.layers == [] ? null : var.layers
  s3_bucket               = var.s3_bucket
  s3_key                  = var.s3_key
  handler                 = var.handler
  role                    = module.role.arn
  runtime                 = var.runtime
  memory_size             = var.memory_size
  timeout                 = var.timeout
  architectures           = [var.architectures]

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

  depends_on = [
    module.role,
    module.logs
  ]

  lifecycle {
    ignore_changes = [last_modified]
  }
}

module "role" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/iam/lambda-function?ref=main"

  app                         = var.app
  env                         = var.env
  program                     = var.program
  attach_permissions_boundary = var.attach_permissions_boundary
  enable_vpc_access           = var.vpc_config != null ? true : false
  function_name               = var.function_name
}

module "logs" {
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/cloudwatch-log-group?ref=main"

  name        = "/aws/lambda/${local.stack}-${var.function_name}"
  kms_key_arn = var.enable_log_encryption ? module.logs_key[0].arn : null
}

module "logs_key" {
  count  = var.enable_log_encryption ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/kms?ref=main"

  app                     = var.app
  env                     = var.env
  program                 = var.program
  description             = "KMS key for ${local.stack}-${var.function_name} lambda logs"
  deletion_window_in_days = 7
  kms_suffix              = "lambda-${var.function_name}"
}

module "code_signing_config" {
  count  = var.signing_profile_version_arns != [] ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/lambda-code-signing-config?ref=main"

  signing_profile_version_arns = var.signing_profile_version_arns
}

resource "aws_lambda_permission" "api_gateway" {
  for_each = var.lambda_permissions_api_gateway_execution_arn

  principal     = "apigateway.amazonaws.com"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  source_arn    = "${each.key}/*"
}
