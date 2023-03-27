resource "aws_iam_policy" "ecr" {
  name        = "power-user-${local.stack}-jenkins-instance-profile-role-ecr"
  description = ""
  policy      = data.aws_iam_policy_document.ecr
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "ecr" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecr.arn
}

data "aws_iam_policy_document" "ecr" {
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