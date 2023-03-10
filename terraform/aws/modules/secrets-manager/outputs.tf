output "arn" {
  value       = aws_secretsmanager_secret.this.arn
  description = "arn of the secret"
  sensitive   = false
}

output "id" {
  value       = aws_secretsmanager_secret.this.id
  description = "id of the secret"
  sensitive   = false
}

output "name" {
  value       = aws_secretsmanager_secret.this.name
  description = "name of the secret"
  sensitive   = false
}

output "kms_key_id" {
  value       = aws_secretsmanager_secret.this.kms_key_id
  description = "id of the kms key used to encrypt the secret (if specified)"
  sensitive   = false
}

output "version_arn" {
  value       = aws_secretsmanager_secret_version.this.arn
  description = "arn of the secret version"
  sensitive   = false
}

output "version_id" {
  value       = aws_secretsmanager_secret_version.this.id
  description = "id of the secret version"
  sensitive   = false
}

output "version_secret_string" {
  value       = aws_secretsmanager_secret_version.this.secret_string
  description = "secret key-value pairs"
  sensitive   = true
}

output "version_version_id" {
  value       = aws_secretsmanager_secret_version.this.version_id
  description = "version id of the secret version"
  sensitive   = false
}
