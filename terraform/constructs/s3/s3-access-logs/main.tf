module "s3" {
  source = "../../module/s3/"

  program     = var.program
  app         = var.app
  level       = var.level
  bucket_name = "s3-access-logs"
}

resource "aws_s3_bucket_policy" "s3" {
  bucket = module.s3.id
  policy = data.aws_iam_policy_document.log_delivery.json
}

# need to set-up a bucket policy to deliver logs

data "aws_iam_policy_document" "log_delivery" {
  statement {
    sid    = "S3ServerAccessLogsPolicy"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }
    actions = ["s3:PutObject"]
    resources = [
      "${module.s3.id}",
      "${module.s3.id}/*"
    ]
  }
}