resource "aws_iam_policy" "iam" {
  name        = "power-user-${local.stack}-jenkins-instance-profile-role-iam"
  description = "allow jenkins to get and pass iam roles required for deployment operations"
  policy      = data.aws_iam_policy_document.iam.json
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "iam" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.iam.arn
}

data "aws_iam_policy_document" "iam" {
  count = terraform.workspace == "dev" || terraform.workspace == "stage" ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "iam:GetRole"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "iam:PassRole"
    ]
    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/*"
    ]
  }
}
