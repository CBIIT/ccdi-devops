output "arn" {
  value       = aws_lb_target_group.this.arn
  description = "arn of the target group"
  sensitive   = false
}

output "id" {
  value       = aws_lb_target_group.this.id
  description = "id of the target group"
  sensitive   = false
}

output "name" {
  value       = aws_lb_target_group.this.name
  description = "name of the target group"
  sensitive   = false
}
