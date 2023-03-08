resource "aws_s3_bucket" "this" {
  bucket        = "${local.stack}-${var.bucket_suffix}"
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_inventory" "this" {
  count = var.enable_bucket_inventory ? 1 : 0

  bucket                   = var.enable_bucket_inventory ? aws_s3_bucket.this.id : null
  name                     = var.enable_bucket_inventory ? "${local.stack}-${var.bucket_suffix}-inventory" : null
  included_object_versions = var.enable_bucket_inventory ? var.inventory_included_object_versions : null

  filter {
    prefix = var.enable_bucket_inventory ? var.inventory_filter_prefix : null
  }

  schedule {
    frequency = var.enable_bucket_inventory ? var.inventory_schedule_frequency : null
  }

  destination {
    bucket {
      bucket_arn = var.enable_bucket_inventory ? var.inventory_destination_bucket_arn : null
      format     = var.enable_bucket_inventory ? var.inventory_destination_format : null
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count = var.enable_object_expiration ? 1 : 0

  bucket = aws_s3_bucket.this.id

  rule {
    id     = var.enable_object_expiration ? "expire-after-90-days" : null
    status = var.enable_object_expiration ? "Enabled" : null

    expiration {
      days = var.enable_object_expiration ? var.expire_objects_after_days : null
    }
  }
}

resource "aws_s3_bucket_logging" "this" {
  count = var.enable_access_logging ? 1 : 0

  bucket        = var.enable_access_logging ? aws_s3_bucket.this.id : null
  target_bucket = var.enable_access_logging ? var.logging_target_bucket : null
  target_prefix = var.enable_access_logging ? var.logging_target_prefix : null
}

resource "aws_s3_bucket_policy" "this" {
  count = var.enable_bucket_policy ? 1 : 0

  bucket = var.enable_bucket_policy ? aws_s3_bucket.this.id : null
  policy = var.enable_bucket_policy ? var.bucket_policy : null
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.enable_object_versioning ? "Enabled" : "Disabled"
  }
}
