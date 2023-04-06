data "aws_organizations_organization" "current" {}

data "aws_iam_policy_document" "this" {
  statement {
    effect  = "Allow"
    actions = ["s3:PutObject"]

    principals {
      type        = "Service"
      identifiers = ["logging.s3.amazonaws.com"]
    }
  }

  resources = ["${var.s3_bucket_arn}/*"]

  condition {
    test     = "StringEquals"
    variable = "aws:PrincipalOrgID"
    values   = [data.aws_organizations_organization.current.id]
  }
}