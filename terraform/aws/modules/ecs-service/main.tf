resource "aws_ecs_service" "this" {
  name                               = "${local.stack}-${var.microservice}"
  cluster                            = var.cluster
  task_definition                    = var.task_definition
  launch_type                        = var.launch_type
  scheduling_strategy                = var.scheduling_strategy
  desired_count                      = var.desired_count
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  enable_ecs_managed_tags            = var.enable_ecs_managed_tags
  propagate_tags                     = var.propagate_tags
  platform_version                   = var.platform_version

  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  deployment_controller {
    type = var.deployment_controller_type
  }

  deployment_circuit_breaker {
    enable = true
    rollback = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "${var.program}-${var.app}-${var.container_name}"
    container_port   = var.container_port
  }

  network_configuration {
    assign_public_ip = false
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      desired_count,
      deployment_circuit_breaker
    ]
  }
}
