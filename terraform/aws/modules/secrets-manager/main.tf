resource "aws_secretsmanager_secret" "this" {
  name                    = "${local.stack}-${var.secret_suffix}"
  description             = var.description
  recovery_window_in_days = var.recovery_window_in_days
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode(var.secret_string)
}

resource "aws_secretsmanager_secret_policy" "this" {
  count = var.enable_secret_policy ? 1 : 0

  secret_arn = var.enable_secret_policy ? aws_secretsmanager_secret.this.arn : null
  policy     = var.secret_policy
}

resource "aws_secretsmanager_secret_rotation" "this" {
  count = var.enable_secret_rotation ? 1 : 0

  secret_id           = var.enable_secret_rotation ? aws_secretsmanager_secret.this.id : null
  rotation_lambda_arn = var.rotation_lambda_arn

  rotation_rules {
    automatically_after_days = var.rotation_automatically_after_days
  }
}
