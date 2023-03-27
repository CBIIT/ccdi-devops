output "role_arn" {
  value       = aws_iam_role.this.arn
  description = "arn of the task execution role if one was created"
  sensitive   = false
}

output "role_id" {
  value       = aws_iam_role.this.id
  description = "id of the task execution role if one was created"
  sensitive   = false
}

output "role_name" {
  value       = aws_iam_role.this.name
  description = "name of the task execution role if one was created"
  sensitive   = false
}