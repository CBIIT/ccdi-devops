resource "aws_ecs_cluster" "this" {
  name = "${local.stack}-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = var.container_insights_enabled ? "enabled" : "disabled"
  }
}

resource "aws_ecs_service" "this" {
  for_each = var.microservices

  name                               = "${local.stack}-ecs-service-${each.value.name}"
  cluster                            = aws_ecs_cluster.this.id
  task_definition                    = each.value.task_definition
  desired_count                      = each.value.desired_count
  deployment_maximum_percent         = each.value.deployment_maximum_percent
  deployment_minimum_healthy_percent = each.value.deployment_minimum_healthy_percent
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  launch_type                        = each.value.launch_type
  platform_version                   = var.launch_type == "FARGATE" ? var.platform_version : null
  scheduling_strategy                = var.launch_type == "FARGATE" ? "REPLICA" : var.scheduling_strategy
  enable_ecs_managed_tags            = ""
  iam_role                           = ""
  wait_for_steady_state              = ""
  force_new_deployment               = ""
  enable_execute_command             = ""

}

#########################

variable "container_insights_enabled" {
  type        = bool
  description = "whether to enable container insights"
  default     = false
}

variable "microservices" {
  type = map(object)
  default = {
    "key" = ""
  }
}