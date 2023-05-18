data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["logdelivery.elasticloadbalancing.amazonaws.com"]
    }
    actions   = ["s3:PutObject"]
    resources = ["${var.s3_bucket_arn}/*"]
    condition {
      test     = "StringEquals"
      variable = "aws:ResourceOrgID"
      values   = ["o-apmg88xkzx"]
    }
  }

  statement {
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::127311923021:root"]
    }
    actions   = ["s3:PutObject"]
    resources = ["${var.s3_bucket_arn}/*"]
    condition {
      test     = "StringEquals"
      variable = "aws:ResourceOrgID"
      values   = ["o-apmg88xkzx"]
    }
  }
}
