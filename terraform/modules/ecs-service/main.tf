resource "aws_ecs_service" "service" {
  name                               = "${var.program}-${var.app}-${var.tier}-${var.ecs_service_name}-service"
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

variable "target_group_arn" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}

variable "enable_ecs_managed_tags" {
  type    = bool
  default = true
}
variable "deployment_controller_type" {
  type    = string
  default = "ECS"
}
variable "assign_public_ip" {
  type    = bool
  default = false
}

variable "security_group_ids" {
  type = set(string)

}

variable "webapp_subnets" {
  type = set(string)
}

variable "deployment_circuit_breaker_enable" {
  type    = bool
  default = true
}

variable "deployment_circuit_breaker_rollback" {
  type    = bool
  default = true
}

variable "deployment_minimum_healthy_percent" {
  type    = number
  default = 50
}

variable "deployment_maximum_percent" {
  type    = number
  default = 200
}

variable "launch_type" {
  type    = string
  default = "FARGATE"
}

variable "scheduling_strategy" {
  type    = string
  default = "Replica"
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "program" {

}

variable "app" {

}

variable "tier" {

}

variable "ecs_service_name" {

}

variable "cluster_id" {

}

variable "task_definition" {

}


