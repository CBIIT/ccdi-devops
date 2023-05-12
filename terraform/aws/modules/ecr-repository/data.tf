data "aws_iam_policy_document" "this" {
  count = var.create_repository_policy ? 1 : 0

  statement {
    sid    = "AllowEcsPull"
    effect = "Allow"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:ListImages"
    ]

    principals {
      type        = "Service"
      identifiers = "ecs.amazonaws.com"
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["${var.non_prod_account_id}", "${var.prod_account_id}"]
    }
  }

  statement {
    sid    = "AllowJenkinsPushPull"
    effect = "Allow"

    actions = [
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetDownloadUrlForLayer",
      "ecr:InitiateLayerUpload",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:TagResource",
      "ecr:UploadLayerPart",
      "ecr:UntagResource"
    ]

    principals {
      type        = "AWS"
      identifiers = "ec2.amazonaws.com"
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["${var.non_prod_account_id}"]
    }

  }
}
