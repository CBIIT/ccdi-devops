data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "trust" {
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
      values   = ["arn:aws:ecs:us-east-1:${data.aws_caller_identity.current.account_id}:*"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = data.aws_caller_identity.current.account_id
    }
  }
}

data "aws_iam_policy_document" "ecr" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "cloudwatch" {
  count = var.attach_cloudwatch_policy ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "logs:DescribeLogGroups"
    ]
    resources = [
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:*",
      "arn:aws:logs:us-east-1:${data.aws_caller_identity.current.account_id}:*:log-stream:*"
    ]
  }
}

data "aws_iam_policy_document" "opensearch" {
  count = var.attach_opensearch_policy ? 1 : 0

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
    resources = ["${var.opensearch_domain_arn}/*"]
  }
}

data "aws_iam_policy_document" "secrets_manager" {
  count = var.attach_secrets_manager_policy ? 1 : 0

  statement {
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:ListSecrets",
    ]
  }
}

data "aws_iam_policy_document" "ecs_exec" {
  count = var.attach_ecs_exec_policy ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = ["ecs:ExecuteCommand"]
    resources = [var.ecs_cluster_arn]
  }

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

  statement {
    effect = "Allow"
    actions = [
      "kms:Decrypt",
      "kms:GenerateDataKey"
    ]
    resources = [var.kms_key_arn]
  }
}