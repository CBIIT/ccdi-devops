data "aws_caller_identity" "current" {

}

data "aws_iam_policy_document" "trust" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["es.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}


data "aws_iam_policy_document" "this" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [var.s3_bucket_arn]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = ["${var.s3_bucket_arn}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "iam:PassRole"
    ]
    resources = [aws_iam_role.this.arn]
    condition {
      test = "StringEquals"
      variable = "SourceAccount"
      values = [data.aws_caller_identity.current.account_id]
    }
  }

  statement {
    effect = "Allow"
    actions = ["es:ESHttpPut"]
    resources = [ 
      "arn:aws:es:us-east-1:${data.aws_caller_identity.current.account_id}:domain/*/*"
    ]
  }
}

# arn:aws:es:us-east-1:966526488680:domain/ccdi-dev-hub-opensearch
