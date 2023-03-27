resource "aws_iam_policy" "ecr" {
  count = var.enable_ecr_access ? 1 : 0

  name        = "power-user-${local.stack}-jenkins-instance-profile-role-ecr"
  description = "allow jenkins to pull and push from specified ecr repositories"
  policy      = data.aws_iam_policy_document[0].ecr
  tags        = var.tags

}

resource "aws_iam_role_policy_attachment" "ecr" {
  count = var.enable_ecr_access ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecr[0].arn
}

data "aws_iam_policy_document" "ecr" {
  count = var.enable_ecr_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "ecr:DescribeRegistry",
      "ecr:GetAuthorizationToken",
      "ecr:GetRegistryPolicy"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:UploadLayerPart"
    ]
    resources = var.ecr_repository_arns
  }
}


