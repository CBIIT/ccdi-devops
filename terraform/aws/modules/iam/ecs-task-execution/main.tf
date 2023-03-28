resource "aws_iam_role" "this" {
  name                 = "power-user-${local.stack}-ecs-task-execution-role"
  description          = "ecs task execution role for ${local.stack} services"
  assume_role_policy   = data.aws_iam_policy_document.trust.json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "this" {
  name        = "power-user-${local.stack}-task-execution-policy"
  description = "ecs task execution policy for the ${local.stack} services"
  policy      = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
