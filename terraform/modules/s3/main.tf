resource "aws_s3_bucket" "s3" {
	# checkov:skip=CKV_AWS_18: This module supports S3 bucket access log use cases, not defining logging to prevent log loop
  # checkov:skip=CKV_AWS_145: AES256 is sufficient, KMS not required
  # checkov:skip=CKV_AWS_144: Cross-region replication is not permitted at NCI
  bucket = "${var.program}-${var.app}-${var.level}-${var.bucket_name}"
}

resource "aws_s3_bucket_public_access_block" "s3" {
  bucket                  = aws_s3_bucket.s3.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_versioning" "s3" {
  bucket = aws_s3_bucket.s3.id

  versioning_configuration {
    status = var.version_configuration_status
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3" {
  bucket = aws_s3_bucket.s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
