output "arn" {
  value       = aws_ecs_task_definition.this.arn
  description = "arn of the task definition"
  sensitive   = false
}

output "family" {
  value       = aws_ecs_task_definition.this.family
  description = "task definition family"
  sensitive   = false
}

output "id" {
  value       = aws_ecs_task_definition.this.id
  description = "task definition id"
  sensitive   = false
}

output "revision" {
  value       = aws_ecs_task_definition.this.revision
  description = "task definition revision"
  sensitive   = false
}

output "task_execution_policy_arn" {
  value       = aws_iam_policy.task_execution[0].arn
  description = "arn of the task execution policy if one was created"
  sensitive   = false
}

output "task_execution_policy_id" {
  value       = aws_iam_policy.task_execution[0].id
  description = "id of the task execution policy if one was created"
  sensitive   = false
}

output "task_execution_policy_name" {
  value       = aws_iam_policy.task_execution[0].name
  description = "name of the task execution policy if one was created"
  sensitive   = false
}

output "task_execution_role_arn" {
  value       = aws_iam_role.task_execution[0].arn
  description = "arn of the task execution role if one was created"
  sensitive   = false
}

output "task_execution_role_id" {
  value       = aws_iam_role.task_execution[0].id
  description = "id of the task execution role if one was created"
  sensitive   = false
}

output "task_execution_role_name" {
  value       = aws_iam_role.task_execution[0].name
  description = "name of the task execution role if one was created"
  sensitive   = false
}

output "task_policy_arn" {
  value       = aws_iam_policy.task[0].arn
  description = "arn of the task policy if one was created"
  sensitive   = false
}

output "task_policy_id" {
  value       = aws_iam_policy.task[0].id
  description = "id of the task policy if one was created"
  sensitive   = false
}

output "task_policy_name" {
  value       = aws_iam_policy.task[0].name
  description = "name of the task policy if one was created"
  sensitive   = false
}

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

