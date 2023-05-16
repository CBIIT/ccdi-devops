output "id" {
  value       = aws_ecr_repository_policy.this.id
  description = "id of the ecr repository resource policy"
  sensitive   = false
}

output "policy" {
  value       = aws_ecr_repository_policy.this.policy
  description = "policy of the ecr repository resource policy"
  sensitive   = false
}

output "registry_id" {
  value       = aws_ecr_repository_policy.this.registry_id
  description = "registry id of the ecr repository that the repository resource policy is attached to"
  sensitive   = false
}

output "repository" {
  value       = aws_ecr_repository_policy.this.repository
  description = "ecr repository that the ecr repository resource policy is attached to"
  sensitive   = false
}