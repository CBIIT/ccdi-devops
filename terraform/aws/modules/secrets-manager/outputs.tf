output "arn" {
  value       = aws_secretsmanager_secret.this.arn
  description = ""
  sensitive   = false
}

output "id" {
  value       = aws_secretsmanager_secret.this.id
  description = ""
  sensitive   = false
}

output "name" {
  value       = aws_secretsmanager_secret.this.name
  description = "value"
  sensitive   = false
}

output "kms_key_id" {
  value       = aws_secretsmanager_secret.this.kms_key_id
  description = "value"
  sensitive   = false
}

output "version_arn" {
  value       = aws_secretsmanager_secret_version.this.arn
  description = "value"
  sensitive   = false
}

output "version_id" {
  value       = aws_secretsmanager_secret_version.this.id
  description = "value"
  sensitive   = false
}

output "version_secret_string" {
  value       = aws_secretsmanager_secret_version.this.secret_string
  description = ""
  sensitive   = true
}

output "version_version_id" {
  value       = aws_secretsmanager_secret_version.this.version_id
  description = ""
  sensitive   = false
}
