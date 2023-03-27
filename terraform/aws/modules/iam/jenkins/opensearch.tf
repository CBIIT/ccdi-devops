resource "aws_iam_policy" "opensearch" {
  count = var.enable_opensearch_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-opensearch"
  description = ""
  policy      = data.aws_iam_policy_document.opensearch[0].json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "opensearch" {
  count = var.enable_opensearch_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.opensearch[0].arn
}

data "aws_iam_policy_document" "opensearch" {
  count = var.enable_opensearch_access ? 1 : 0

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

variable "enable_opensearch_access" {
  type        = bool
  description = "allow jenkins to perform etl activities on specified opensearch clusters"
  sensitive   = false
}
