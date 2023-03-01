output "policy_alarm_arns" {
  value     = aws_appautoscaling_policy.this.alarm_arns
  sensitive = false
}

output "policy_arn" {
  value     = aws_appautoscaling_policy.this.arn
  sensitive = false
}

output "policy_id" {
  value     = aws_appautoscaling_policy.this.id
  sensitive = false
}

output "policy_name" {
  value     = aws_appautoscaling_policy.this.name
  sensitive = false
}

output "policy_policy_type" {
  value     = aws_appautoscaling_policy.this.policy_type
  sensitive = false
}

output "policy_resouce_id" {
  value     = aws_appautoscaling_policy.this.resource_id
  sensitive = false
}

output "policy_scalable_dimension" {
  value     = aws_appautoscaling_policy.this.scalable_dimension
  sensitive = false
}

output "policy_service_namespace" {
  value     = aws_appautoscaling_policy.this.service_namespace
  sensitive = false
}

output "policy_target_tracking_scaling_policy_configuration" {
  value     = aws_appautoscaling_policy.this.target_tracking_scaling_policy_configuration
  sensitive = false
}

output "target_id" {
  value     = aws_appautoscaling_target.this.id
  sensitive = false
}

output "target_resource_id" {
  value     = aws_appautoscaling_target.this.resource_id
  sensitive = false
}

output "target_scalable_dimension" {
  value     = aws_appautoscaling_target.this.scalable_dimension
  sensitive = false
}

output "target_service_namespace" {
  value     = aws_appautoscaling_target.this.service_namespace
  sensitive = false
}