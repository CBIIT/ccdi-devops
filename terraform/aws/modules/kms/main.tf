resource "aws_kms_key" "this" {
  customer_master_key_spec = var.customer_master_key_spec
  deletion_window_in_days  = var.deletion_window_in_days
  description              = "kms key used to encrypt images in the ${local.repository_name} repository"
  enabled                  = true
  enable_key_rotation      = true
  key_usage                = "ENCRYPT_DECRYPT"

  tags = {
    app     = var.app
    program = var.program
    alias   = var.alias
  }
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.this.key_id
}

resource "aws_kms_key_policy" "this" {
  key_id = aws_kms_key.this.key_id
  policy = var.policy
}