resource "aws_s3_access_point" "this" {
  bucket = var.bucket_name
  name   = "${var.bucket_name}-${var.access_point_suffix}"
  account_id = var.account_id 
  bucket_account_id = var.bucket_account_id 

  vpc_configuration {
    vpc_id = var.vpc_id
  }

  public_access_block_configuration {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  }
}
