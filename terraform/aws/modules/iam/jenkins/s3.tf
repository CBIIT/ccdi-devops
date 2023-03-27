resource "aws_iam_policy" "s3" {
  count = var.enable_s3_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-s3"
  description = ""
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
    effect    = "Allow"
    actions   = []
    resources = []
  }

  statement {
    effect    = "Allow"
    actions   = []
    resources = []
  }
}

variable "enable_s3_access" {
  type        = bool
  description = "allow jenkins to read from specified s3 buckets"
  sensitive   = false
}