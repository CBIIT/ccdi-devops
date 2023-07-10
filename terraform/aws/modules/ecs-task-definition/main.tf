resource "aws_ecs_task_definition" "this" {
  family                   = "${var.program}-${var.app}-${var.microservice}"
  cpu                      = local.cpu
  memory                   = local.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsondecode([
    local.application_container_definition,
    local.sumologic_container_definition,
    local.newrelic_container_definition
  ])
}
