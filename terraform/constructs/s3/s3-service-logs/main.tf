locals {
  lifecycle_rule_expiration_days = var.level == "prod" ? 90 : 14
  s3_log_prefix                  = "${var.program}-${var.app}-${var.level}-s3"
}

data "aws_elb_service_account" "main" {}

data "aws_iam_policy_document" "alb" {
  statement {
    actions   = ["s3:PutObject"]
    effect    = "Allow"
    resources = ["${module.s3.arn}/AWSLogs/${var.account_id}/*"]
    principals {
      type        = "AWS"
      identifiers = ["${data.aws_elb_service_account.main.arn}"]
    }
  }
}

module "s3" {
  source = "../../../modules/s3/"

  program     = var.program
  app         = var.app
  level       = var.level
  bucket_name = "central-log-destination-bucket"
}

resource "aws_s3_bucket_logging" "s3" {
  bucket        = module.s3.id
  target_bucket = var.target_log_bucket
  target_prefix = "${local.s3_log_prefix}/"
}

resource "aws_s3_bucket_lifecycle_configuration" "s3" {
  bucket = module.s3.id

  rule {
    id     = "expire_objects"
    status = "Enabled"

    expiration {
      days = local.lifecycle_rule_expiration_days
    }
  }
}

resource "aws_s3_bucket_policy" "s3" {
  bucket = module.s3.id
  policy = data.aws_iam_policy_document.alb.json
}