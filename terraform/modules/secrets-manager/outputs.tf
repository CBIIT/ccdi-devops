output "secret_manager_arn" {
  value       = aws_secretsmanager_secret_version.secret.arn
  description = "The arn of the AWS Secrets Manager secret"
}

output "secret_manager_id" {
  value       = aws_secretsmanager_secret_version.secret.id
  description = "The ID of the AWS Secrets Manager secret"
}

output "secret_manager_version_id" {
  value       = aws_secretsmanager_secret_version.secret.version_id
  description = "The ID of the AWS Secrets Manager secret version"
}

output "neo4j_password" {
  value     = random_password.neo4j_password.result
  sensitive = true
}