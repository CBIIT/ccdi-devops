resource "aws_iam_policy" "ecs_exec" {
  count = var.enable_ecs_exec ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-ecs-exec-${var.microservice}"
  description = "enables ecs execute commands for the ${var.microservice} service in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.ecs_exec[0].json
}

resource "aws_iam_role_policy_attachment" "ecs_exec" {
  count = var.enable_ecs_exec ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecs_exec[0].arn
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