data "aws_caller_identity" "current" {
}

data "aws_s3_bucket" "this" {
  bucket = var.config_s3_bucket_name
}

data "aws_iam_policy_document" "trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = ["${data.aws_s3_bucket.this.arn}/config/AWSLogs/${data.aws_caller_identity.current.account_id}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketAcl",
      "s3:ListBucket"
    ]
    resources = [data.aws_s3_bucket.this.arn]
  }
}
