resource "aws_iam_policy" "s3" {
  count = var.enable_s3_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-s3"
  description = "allow jenkins to read from specified s3 buckets"
  policy      = data.aws_iam_policy_document.s3[0].json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "s3" {
  count = var.enable_s3_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.s3[0].arn
}

data "aws_iam_policy_document" "s3" {
  count = var.enable_s3_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:GetObjectVersion",
      "s3:ListAllMyBuckets",
      "s3:ListBucket",
      "s3:ListBucketVersions",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = var.s3_bucket_arns
  }
}

variable "enable_s3_access" {
  type        = bool
  description = "allow jenkins to read from specified s3 buckets"
  default     = false
  sensitive   = false
}

variable "s3_bucket_arns" {
  type        = list(string)
  description = "list of s3 bucket arns to allow jenkins to read from"
  default     = []
  sensitive   = false
}