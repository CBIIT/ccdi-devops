output "arn" {
  value       = aws_cloudwatch_event_target.this.arn
  description = "arn of the eventbridge target resource"
  sensitive   = false
}

output "id" {
  value       = aws_cloudwatch_event_target.this.id
  description = "id of the eventbridge target resource"
  sensitive   = false
}
