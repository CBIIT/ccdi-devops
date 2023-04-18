output "arn" {
  value       = aws_cloudwatch_event_rule.this.arn
  description = "arn of the eventbridge rule"
  sensitive   = false
}

output "id" {
  value       = aws_cloudwatch_event_rule.this.id
  description = "id of the eventbridge rule"
  sensitive   = false
}

output "name" {
  value       = aws_cloudwatch_event_rule.this.name
  description = "name of the eventbridge rule"
  sensitive   = false
}
