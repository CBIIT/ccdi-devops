resource "aws_iam_policy" "secrets" {
  name        = "power-user-${local.stack}-jenkins-instance-profile-role-secrets"
  description = ""
  policy      = data.aws_iam_policy_document.secrets.json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "secrets" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.secrets.arn
}

data "aws_iam_policy_document" "secrets" {
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
