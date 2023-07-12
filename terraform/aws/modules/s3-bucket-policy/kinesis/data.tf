data "aws_organizations_organization" "current" {}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"

    dynamic "principals" {
      for_each = var.principal_account_ids

      content {
        type        = "AWS"
        identifiers = ["arn:aws:iam::${principals.value}:role/power-user-*"]
      }
    }

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
  }
}
