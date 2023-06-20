resource "aws_appautoscaling_policy" "this" {
  name               = "${local.stack}-${var.microservice}"
  policy_type        = var.policy_type
  resource_id        = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  scalable_dimension = var.scalable_dimension
  service_namespace  = var.service_namespace

  target_tracking_scaling_policy_configuration {
    target_value = var.target_value

    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
    }
  }
}

resource "aws_appautoscaling_target" "this" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${var.ecs_cluster_name}/${var.ecs_service_name}"
  scalable_dimension = var.scalable_dimension
  service_namespace  = var.service_namespace
  

  # lifecycle {
  #   ignore_changes = [
  #     tags_all
  #   ]
  # }
}

