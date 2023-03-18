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
  source_policy_documents = [
    aws_iam_policy_document.ecs_exec[0].json,
    aws_iam_policy_document.kms[0].json,
    aws_iam_policy_document.opensearch[0].json,
    aws_iam_policy_document.ssm[0].json
  ]
}

data "aws_iam_policy_document" "kms" {
  count = var.enable_ecs_exec ? 1 : 0

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
  count = var.enable_opensearch_access ? 1 : 0

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
  count = var.enable_ecs_exec ? 1 : 0

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
  count = var.enable_ecs_exec ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["ecs:ExecuteCommand"]
  }
}
