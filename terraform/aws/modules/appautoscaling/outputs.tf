output "policy_alarm_arns" {
  value = aws_appautoscaling_policy.this.alarm_arns
}

output "policy_arn" {
  value = aws_appautoscaling_policy.this.arn
}

output "policy_id" {
  value = aws_appautoscaling_policy.this.id
}

output "policy_name" {
  value = aws_appautoscaling_policy.this.name
}

output "policy_policy_type" {
  value = aws_appautoscaling_policy.this.policy_type
}

output "policy_resouce_id" {
  value = aws_appautoscaling_policy.this.resource_id
}

output "policy_scalable_dimension" {
  value = aws_appautoscaling_policy.this.scalable_dimension
}

output "policy_service_namespace" {
  value = aws_appautoscaling_policy.this.service_namespace
}

output "policy_target_tracking_scaling_policy_configuration" {
  value = aws_appautoscaling_policy.this.target_tracking_scaling_policy_configuration
}

output "target_id" {
  value = aws_appautoscaling_target.this.id
}

output "target_resource_id" {
  value = aws_appautoscaling_target.this.resource_id
}

output "target_scalable_dimension" {
  value = aws_appautoscaling_target.this.scalable_dimension
}

output "target_service_namespace" {
  value = aws_appautoscaling_target.this.service_namespace
}