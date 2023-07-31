output "arn" {
  value       = aws_lambda_code_signing_config.this.arn
  description = "the arn of the code signing configuration"
  sensitive   = false
}

output "config_id" {
  value       = aws_lambda_code_signing_config.this.config_id
  description = "unique identifier for the code signing configuration"
  sensitive   = false
}

output "last_modified" {
  value       = aws_lambda_code_signing_config.this.last_modified
  description = "date and time that the code signing configuration was last modified"
  sensitive   = false
}
