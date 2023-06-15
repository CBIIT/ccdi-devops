resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = var.bucket_id

  rule {
    bucket_key_enabled = var.ss3_algorithm == "aws:kms" ? true : false

    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.ss3_algorithm == "aws:kms" ? aws_kms_key.this[0].arn : null
    }
  }
}

resource "aws_kms_key" "this" {
  count = var.ss3_algorithm == "aws:kms" ? 1 : 0

  deletion_window_in_days  = var.deletion_window_in_days
  description              = "kms key applying encryption to s3 bucket ${var.bucket_id}"
  enable_key_rotation      = var.enable_key_rotation
  is_enabled               = true
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  multi_region             = false
}

