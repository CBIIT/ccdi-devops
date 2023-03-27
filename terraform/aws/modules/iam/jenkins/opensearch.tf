resource "aws_iam_policy" "opensearch" {
  name        = "power-user-${local.stack}-jenkins-instance-profile-role-opensearch"
  description = ""
  policy      = data.aws_iam_policy_document.opensearch.json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "opensearch" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.opensearch.arn
}

data "aws_iam_policy_document" "opensearch" {
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