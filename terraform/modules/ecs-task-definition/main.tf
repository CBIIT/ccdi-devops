resource "aws_ecs_task_definition" "task" {
  family                   = "${var.program}-${var.app}-${var.tier}-${var.family}"
  requires_compatibilities = [var.requires_compatibilities]
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "${var.container_definition_name}"
      image     = "${var.container_definition_image}"
      essential = "${var.container_definition_essential}"

      portMappings = [
        {
          protocol      = "tcp"
          containerPort = "${var.container_port}"
          hostPort      = "${var.host_port}"
        }
      ]

    }
  ])
}
