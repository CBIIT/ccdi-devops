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
      "iam:PassRole", 
      "iam:GetRole"
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/power-user*"]
  }

  statement {
    effect = "Allow"
    actions = ["es:ESHttpPut"]
    resources = [ 
      "arn:aws:es:us-east-1:${data.aws_caller_identity.current.account_id}:domain/*/*"
    ]
  }
}


