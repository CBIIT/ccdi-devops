resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = var.bucket_id

  rule {
    id     = "selected-objects-to-expire"
    status = "Enabled"

    filter {
      prefix = var.filter_prefix
    }
  }

  dynamic "rule" {
    for_each = var.expiration_days != null ? [1] : []

    content {
      id     = "object-expiration"
      status = "Enabled"

      expiration {
        days = var.expiration_days
      }
    }
  }

  dynamic "rule" {
    for_each = var.noncurrent_expiration_days == null ? [1] : []

    content {
      id     = "noncurrent-object-expiration"
      status = "Enabled"

      noncurrent_version_expiration {
        noncurrent_days = var.noncurrent_expiration_days
      }
    }
  }
}




