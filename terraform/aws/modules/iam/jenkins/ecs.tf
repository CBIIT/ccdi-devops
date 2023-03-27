resource "aws_iam_policy" "ecs" {
  name        = "power-user-${local.stack}-jenkins-instance-profile-role-ecs"
  description = ""
  policy      = data.aws_iam_policy_document.ecs.json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "ecs" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecs.arn
}

data "aws_iam_policy_document" "ecs" {
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