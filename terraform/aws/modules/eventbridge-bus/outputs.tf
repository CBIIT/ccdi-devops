output "arn" {
  value       = aws_cloudwatch_event_bus.this.arn
  description = "arn of the custom event bus"
  sensitive   = false
}

output "id" {
  value       = aws_cloudwatch_event_bus.this.id
  description = "id of the custom event bus"
  sensitive   = false
}

output "name" {
  value       = aws_cloudwatch_event_bus.this.name
  description = "name of the custom event bus"
  sensitive   = false
}
