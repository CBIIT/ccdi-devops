output "arn" {
  value       = aws_cloudwatch_log_group.this.arn
  description = "arn of the cloudwatch log group"
  sensitive   = false
}

output "id" {
  value       = aws_cloudwatch_log_group.this.id
  description = "id of the cloudwatch log group"
  sensitive   = false
}

output "name" {
  value       = aws_cloudwatch_log_group.this.name
  description = "name of the cloudwatch log group"
  sensitive   = false
}
