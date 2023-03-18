output "policy_arn" {
  value       = aws_iam_policy.task_execution[0].arn
  description = "arn of the task execution policy if one was created"
  sensitive   = false
}

output "policy_id" {
  value       = aws_iam_policy.task_execution[0].id
  description = "id of the task execution policy if one was created"
  sensitive   = false
}

output "policy_name" {
  value       = aws_iam_policy.task_execution[0].name
  description = "name of the task execution policy if one was created"
  sensitive   = false
}

output "role_arn" {
  value       = aws_iam_role.task_execution[0].arn
  description = "arn of the task execution role if one was created"
  sensitive   = false
}

output "role_id" {
  value       = aws_iam_role.task_execution[0].id
  description = "id of the task execution role if one was created"
  sensitive   = false
}

output "role_name" {
  value       = aws_iam_role.task_execution[0].name
  description = "name of the task execution role if one was created"
  sensitive   = false
}