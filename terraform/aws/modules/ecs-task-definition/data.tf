data "aws_iam_policy_document" "ecs_trust" {
  count = var.create_task_execution_role || var.create_task_role ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
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

data "aws_iam_policy_document" "task_execution" {
  count = var.create_task_execution_role ? 1 : 0

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
    resources = [
      "arn:aws:ecr:us-east-1:${var.account_id}:repository/*",
      "arn:aws:ecr:us-east-1:986019062625:repository/*",
      "arn:aws:ecr:us-east-1:019211168375:repository/*"
    ]
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

data "aws_iam_policy_document" "task" {
  count = var.create_task_role ? 1 : 0

  source_policy_documents = [
    aws_iam_policy_document.ecs_exec[0].json,
    aws_iam_policy_document.kms[0].json,
    aws_iam_policy_document.opensearch[0].json,
    aws_iam_policy_document.ssm[0].json
  ]
}

data "aws_iam_policy_document" "kms" {
  count = var.create_task_execution_role && var.enable_ecs_exec ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]
    resources = [
      "arn:aws:kms:us-east-1:${var.account_id}:key/*"
    ]
  }
}

data "aws_iam_policy_document" "opensearch" {
  count = var.create_task_role && var.enable_opensearch_access ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "es:ESHttpDelete",
      "es:ESHttpGet",
      "es:ESHttpHead",
      "es:ESHttpPatch",
      "es:ESHttpPost",
      "es:ESHttpPut"
    ]
    resources = [
      var.opensearch_domain_arn
    ]
  }
}

data "aws_iam_policy_document" "ssm" {
  count = var.create_task_role && var.enable_ecs_exec ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ecs_exec" {
  count = var.create_task_role && var.enable_ecs_exec ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["ecs:ExecuteCommand"]
  }
}