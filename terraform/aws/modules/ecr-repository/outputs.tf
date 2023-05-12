output "arn" {
  value       = aws_ecr_repository.this.arn
  description = "arn of the repository"
}

output "id" {
  value       = aws_ecr_repository.this.id
  description = "id of the repository"
}

output "name" {
  value       = aws_ecr_repository.this.name
  description = "name of the repository"
}

output "registry_id" {
  value       = aws_ecr_repository.this.registry_id
  description = "id of the registry that the repository belongs to"
}

output "repository_url" {
  value       = aws_ecr_repository.this.repository_url
  description = "url of the repository"
}
