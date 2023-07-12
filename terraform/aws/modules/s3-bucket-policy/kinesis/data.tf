data "aws_organizations_organization" "current" {}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"

    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]

    resources = [var.s3_bucket_arn]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::*:role/power-user-*-kinesis-firehose-delivery-stream"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = [data.aws_organizations_organization.current.id]
    }
  }
}
