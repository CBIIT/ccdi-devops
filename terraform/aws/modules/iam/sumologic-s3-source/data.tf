data "aws_caller_identity" "current" {

}

data "aws_iam_policy_document" "trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::926226587429:root"]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["fed:0000000000014DF8"]
    }
  }
}

data "aws_iam_policy_document" "this" {
  dynamic "statement" {
    for_each = var.s3_bucket_ids

    content {
      effect = "Allow"
      actions = [
        "s3:GetObject",
        "s3:ListBucketVersions",
        "s3:ListBucket",
        "s3:GetObjectVersion"
      ]
      resources = [
        "arn:aws:s3:::${statement.value}",
        "arn:aws:s3:::${statement.value}/*"
      ]
    }
  }
}