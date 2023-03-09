data "aws_iam_policy_document" "base" {
  statement {
    effect    = "Allow"
    principal = [var.task_execution_role_arn, var.jenkins_instance_profile_role_arn]
    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:TagResource",
      "ecr:UntagResource"
    ]
    resources = [aws_ecr_repository.this.arn]
  }
}

data "aws_iam_policy_document" "app" {
  statement {
    effect    = "Allow"
    principal = [var.task_execution_role_arn, var.jenkins_instance_profile_role_arn]
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
