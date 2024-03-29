resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-ecs-task-role"
  description          = "ecs task role for the ${local.stack} services"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "ecr" {
  name        = "power-user-${local.stack}-task-policy-ecr"
  description = "enables ecr access for the ${local.stack} services"
  policy      = data.aws_iam_policy_document.ecr.json
}

resource "aws_iam_role_policy_attachment" "ecr" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecr.arn
}

resource "aws_iam_policy" "cloudwatch" {
  count = var.attach_cloudwatch_policy ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-cloudwatch"
  description = "enables cloudwatch logging for the ${local.stack} services"
  policy      = data.aws_iam_policy_document.cloudwatch[0].json
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  count = var.attach_cloudwatch_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.cloudwatch[0].arn
}

resource "aws_iam_policy" "opensearch" {
  count = var.attach_opensearch_policy ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-opensearch"
  description = "enables opensearch access for the ${local.stack} services"
  policy      = data.aws_iam_policy_document.opensearch[0].json
}

resource "aws_iam_role_policy_attachment" "opensearch" {
  count = var.attach_opensearch_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.opensearch[0].arn
}

resource "aws_iam_policy" "secrets_manager" {
  count = var.attach_secrets_manager_policy ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-secrets-manager"
  description = "enables secrets manager access for the ${local.stack} services"
  policy      = data.aws_iam_policy_document.secrets_manager[0].json
}

resource "aws_iam_role_policy_attachment" "secrets_manager" {
  count = var.attach_secrets_manager_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.secrets_manager[0].arn
}

resource "aws_iam_policy" "ecs_exec" {
  count = var.attach_ecs_exec_policy ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-ecs-exec"
  description = "enables ecs execute commands for the ${local.stack} services"
  policy      = data.aws_iam_policy_document.ecs_exec[0].json
}

resource "aws_iam_role_policy_attachment" "ecs_exec" {
  count = var.attach_ecs_exec_policy ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecs_exec[0].arn
}
