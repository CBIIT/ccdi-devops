resource "aws_ecs_task_definition" "this" {
  family                   = "${local.stack}-${var.microservice}"
  requires_compatibilities = var.requires_compatibilities
  container_definitions    = var.container_definitions
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.create_task_execution_role ? aws_iam_role.task_execution[0].arn : var.task_execution_role_arn
  task_role_arn            = var.create_task_role ? aws_iam_role.task[0].arn : var.task_role_arn

  runtime_platform {
    operating_system_family = var.operating_system_family
    cpu_architecture        = var.cpu_architecture
  }
}

resource "aws_iam_role" "task_execution" {
  count = var.create_task_execution_role ? 1 : 0

  name                 = "power-user-${local.stack}-task-execution-role-${var.microservice}"
  description          = "ecs task execution role for ${var.microservice} in the ${var.env} tier"
  assume_role_policy   = data.aws_iam_policy_document.ecs_trust[0].json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "task_execution" {
  count = var.create_task_execution_role ? 1 : 0

  name        = "power-user-${local.stack}-task-execution-policy-${var.microservice}"
  description = "ecs task execution policy for ${var.microservice} in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.task_execution[0].json
}

resource "aws_iam_role_policy_attachment" "task_execution" {
  count = var.create_task_execution_role ? 1 : 0

  role       = aws_iam_role.task_execution[0].name
  policy_arn = aws_iam_policy.task_execution[0].arn
}

resource "aws_iam_role" "task" {
  count = var.create_task_role ? 1 : 0

  name                 = "power-user-${local.stack}-task-role-${var.microservice}"
  description          = "ecs task role for ${var.microservice} in the ${var.env} tier"
  assume_role_policy   = data.aws_iam_policy_document.ecs_trust[0].json
  permissions_boundary = local.permissions_boundary_arn
}

resource "aws_iam_policy" "task" {
  count = var.create_task_role ? 1 : 0

  name        = "power-user-${local.stack}-task-policy-${var.microservice}"
  description = "ecs task policy for ${var.microservice} in the ${var.env} tier"
  policy      = data.aws_iam_policy_document.task[0].json
}

resource "aws_iam_role_policy_attachment" "task" {
  count = var.create_task_role ? 1 : 0

  role       = aws_iam_role.task[0].name
  policy_arn = aws_iam_policy.task[0].arn
}

