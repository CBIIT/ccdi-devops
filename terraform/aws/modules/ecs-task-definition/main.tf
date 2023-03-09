resource "aws_ecs_task_definition" "this" {
  family                   = "${local.stack}-${var.task_name}"
  requires_compatibilities = var.requires_compatibilities
  container_definitions    = var.container_definitions
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.task_role_arn
  task_role_arn            = var.execution_role_arn

  runtime_platform {
    operating_system_family = var.operating_system_family
    cpu_architecture        = var.cpu_architecture
  }
}
