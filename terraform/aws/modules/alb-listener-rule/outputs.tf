output "arn" {
  value       = aws_lb_listener_rule.this.arn
  description = "arn of the listener rule"
  sensitive   = false
}

output "id" {
  value       = aws_lb_listener_rule.this.id
  description = "id of the listener rule"
  sensitive   = false
}
