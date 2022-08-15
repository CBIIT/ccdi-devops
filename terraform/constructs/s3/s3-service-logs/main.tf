module "s3" {
  source = "../../module/s3/"

  program     = var.program
  app         = var.app
  level       = var.level
  bucket_name = "central-log-destination-bucket"
}

resource "aws_s3_bucket_logging" "s3" {
  bucket        = module.s3.id
  target_bucket = var.target_log_bucket
  target_prefix = "${var.level}/s3-access-logs/${module.s3.bucket}/"
}
