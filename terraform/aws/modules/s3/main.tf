resource "aws_s3_bucket" "this" {
  bucket        = "${local.stack}-${var.bucket_suffix}"
  force_destroy = var.force_destroy
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

resource "aws_s3_bucket_logging" "this" {
  count = var.enable_access_logging ? 1 : 0

  bucket        = var.enable_access_logging ? aws_s3_bucket.this.id : null
  target_bucket = var.enable_access_logging ? var.logging_target_bucket : null
  target_prefix = var.enable_access_logging ? var.logging_target_prefix : null
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

module "encryption" {
  count  = var.encryption_enabled ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-bucket-encryption?ref=main"

  bucket_id               = aws_s3_bucket.this.id
  deletion_window_in_days = var.encryption_deletion_window_in_days
  enable_key_rotation     = var.encryption_enable_key_rotation
  sse_algorithm           = var.encryption_sse_algorithm
}

module "access_point" {
  count = var.create_access_point ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-access-point?ref=v3.1.5"

  access_point_suffix = var.access_point_suffix
  account_id = data.aws_caller_identity.current.account_id
  bucket_account_id = data.aws_caller_identity.current.account_id
  bucket_name = aws_s3_bucket.this.id
  vpc_id = var.access_point_vpc_id
}

variable "access_point_suffix" {
  type        = string
  description = "suffix to append to the access point name to describe its use or allowed principals - required if create_access_point is true"
  default = "null"
  sensitive   = false
}

variable "access_point_vpc_id" {
    type        = string
  description = "the vpc id from which to allow access to the bucket via the access point - required if create_access_point is true"
  default = null
  sensitive   = false
}