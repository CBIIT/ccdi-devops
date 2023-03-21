output "task_role_arn" {
  value       = aws_iam_role.task[0].arn
  description = "arn of the task role if one was created"
  sensitive   = false
}

output "task_role_id" {
  value       = aws_iam_role.task[0].id
  description = "id of the task role if one was created"
  sensitive   = false
}

output "task_role_name" {
  value       = aws_iam_role.task[0].name
  description = "name of the task role if one was created"
  sensitive   = false
}
