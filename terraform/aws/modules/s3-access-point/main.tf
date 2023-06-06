resource "aws_s3_access_point" "this" {
  bucket = var.bucket_name
  name   = "${var.bucket_name}-ap-${var.access_point_suffix}"

  public_access_block_configuration {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
}
