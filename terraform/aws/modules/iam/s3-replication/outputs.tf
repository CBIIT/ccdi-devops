output "arn" {
  value       = aws_iam_role.this.arn
  description = "The ARN of the role"
  sensitive   = false
}

output "id" {
  value       = aws_iam_role.this.id
  description = "The role's ID"
  sensitive   = false
}

output "name" {
  value       = aws_iam_role.this.name
  description = "The name of the role"
  sensitive   = false
}

output "unique_id" {
  value       = aws_iam_role.this.unique_id
  description = "The stable and unique string identifying the role"
  sensitive   = false
}
