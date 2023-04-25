output "arn" {
  value       = aws_cloudwatch_event_api_destination.this.arn
  description = "arn of the api destination"
  sensitive   = false
}

output "id" {
  value       = aws_cloudwatch_event_api_destination.this.id
  description = "id of the api destination"
  sensitive   = false
}

output "name" {
  value       = aws_cloudwatch_event_api_destination.this.name
  description = "name of the api destination"
  sensitive   = false
}

output "connection_arn" {
  value       = aws_cloudwatch_event_api_destination.this.connection_arn
  description = "arn of the connection to be used for the api destination"
  sensitive   = false
}