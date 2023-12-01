locals {
  kms_arn    = var.sse_algorithm == "aws:kms" ? aws_kms_key.this[0].arn : null
  kms_id     = var.sse_algorithm == "aws:kms" ? aws_kms_key.this[0].id : null
  kms_key_id = var.sse_algorithm == "aws:kms" ? aws_kms_key.this[0].key_id : null
}