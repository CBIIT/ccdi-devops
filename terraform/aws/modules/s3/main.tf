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
    status = var.versioning_enabled ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_logging" "this" {
  count = var.access_logs_enabled ? 1 : 0

  bucket        = aws_s3_bucket.this.id
  target_bucket = var.access_logs_target_bucket
  target_prefix = var.access_logs_target_prefix
}

module "inventory" {
  count  = var.inventory_enabled ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-bucket-inventory?ref=main"

  bucket_id                = aws_s3_bucket.this.id
  included_object_versions = var.inventory_included_object_versions
  filter_prefix            = var.inventory_filter_prefix
  schedule_frequency       = var.inventory_schedule_frequency
  destination_bucket_arn   = var.inventory_destination_bucket_arn
  destination_format       = var.inventory_destination_format
}

module "lifecycle_configuration" {
  count  = var.lifecycle_policy_enabled ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-bucket-lifecycle?ref=main"

  bucket_id                  = aws_s3_bucket.this.id
  expiration_days            = var.lifecycle_expiration_days
  noncurrent_expiration_days = var.lifecycle_noncurrent_expiration_days
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
  count  = var.access_point_enabled ? 1 : 0
  source = "git::https://github.com/CBIIT/ccdi-devops.git//terraform/aws/modules/s3-access-point?ref=v3.1.5"

  access_point_suffix = var.access_point_suffix
  account_id          = data.aws_caller_identity.current.account_id
  bucket_account_id   = data.aws_caller_identity.current.account_id
  bucket_name         = aws_s3_bucket.this.id
  vpc_id              = var.access_point_vpc_id
}

resource "aws_s3_bucket_website_configuration" "this" {
  count = var.website_configuration_enabled ? 1 : 0 

  bucket = aws_s3_bucket.this.id
  
  index_document {
    suffix = "index.html"
  }
}
