resource "aws_ecs_service" "service" {
  name                               = "${var.program}-${var.tier}-${var.app}-${var.ecs_service_name}-service"
  cluster                            = var.cluster_id
  task_definition                    = var.task_definition
  desired_count                      = var.desired_count
  launch_type                        = var.launch_type
  scheduling_strategy                = var.scheduling_strategy
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.deployment_maximum_percent
  enable_ecs_managed_tags            = var.enable_ecs_managed_tags

  deployment_controller {
    type = var.deployment_controller_type
  }

  network_configuration {
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_group_ids
    subnets          = var.webapp_subnets
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  deployment_circuit_breaker {
    enable   = deployment_circuit_breaker_enable
    rollback = deployment_circuit_breaker_rollback
  }

  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}




