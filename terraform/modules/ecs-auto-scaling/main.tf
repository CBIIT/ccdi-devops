resource "aws_appautoscaling_target" "target" {
  resource_id        = "service/${aws_ecs_cluster.ecs_cluster.name}/${aws_ecs_service.ecs_service_frontend.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  max_capacity       = 5
  min_capacity       = 1
}

resource "aws_appautoscaling_policy" "policy" {
  name               = "cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.backend_target.resource_id
  scalable_dimension = aws_appautoscaling_target.backend_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.backend_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value = 80
  }
}

variable "cluster_name" {
  type        = string
  description = "The name of the associated cluster (i.e. aws_ecs_cluster.cluster.name)"
}

variable "service_name" {
  type        = string
  description = "The name of the associated service (i.e. aws_ecs_service.service.name)"
}