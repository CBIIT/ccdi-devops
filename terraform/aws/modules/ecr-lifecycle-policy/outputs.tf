output "repository" {
  value       = aws_ecr_lifecycle_policy.this.repository
  description = "ecr repository that the lifecycle policy is attached to"
  sensitive   = false
}

output "registry_id" {
  value       = aws_ecr_lifecycle_policy.this.registry_id
  description = "registry id of the ecr repository that the lifecycle policy is attached to"
  sensitive   = false
}