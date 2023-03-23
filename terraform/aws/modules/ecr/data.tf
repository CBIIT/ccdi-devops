data "aws_iam_policy_document" "this" {
  count = var.create_repository_policy ? 1 : 0

  statement {
    effect    = "Allow"
    principals = var.repository_policy_principal
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
    ]
  }
}
