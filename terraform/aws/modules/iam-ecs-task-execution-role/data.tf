data "aws_iam_policy_document" "trust" {
  count = var.create_task_execution_role || var.create_task_role ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = ["arn:aws:ecs:us-east-1:${var.account_id}:*"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [var.account_id]
    }
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:GetDownloadUrlForLayer",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:ListTagsForResource",
    ]
    resources = var.ecr_repositories
  }

  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroup"
    ]
    resources = [
      "arn:aws:logs:us-east-1:${var.account_id}:log-group:*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "logs:DescribeLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:us-east-1:${var.account_id}:log-group:*:log-stream:*"
    ]
  }
}