output "task_role_arn" {
  value       = aws_iam_role.this.arn
  description = "arn of the task role if one was created"
  sensitive   = false
}

output "task_role_id" {
  value       = aws_iam_role.this.id
  description = "id of the task role if one was created"
  sensitive   = false
}

output "task_role_name" {
  value       = aws_iam_role.this.name
  description = "name of the task role if one was created"
  sensitive   = false
}
