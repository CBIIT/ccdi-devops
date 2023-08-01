resource "aws_kms_key" "this" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = true
  enable_key_rotation     = var.enable_key_rotation
}

resource "aws_kms_key_policy" "this" {
  key_id = aws_kms_key.this.key_id
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_kms_alias" "this" {
  name          = "${local.stack}-${var.kms_suffix}"
  target_key_id = aws_kms_key.this.key_id
}
