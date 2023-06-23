resource "aws_s3_bucket_inventory" "this" {
  bucket                   = var.bucket_id
  enabled                  = true
  name                     = "${var.bucket_id}-inventory"
  included_object_versions = var.included_object_versions
  optional_fields          = ["Size", "LastModifiedDate", "ETag", "ChecksumAlgorithm"]

  filter {
    prefix = var.filter_prefix
  }

  schedule {
    frequency = var.schedule_frequency
  }

  destination {
    bucket {
      bucket_arn = var.destination_bucket_arn
      prefix     = "inventory/${var.bucket_id}/"
      format     = var.destination_format
    }
  }
}
