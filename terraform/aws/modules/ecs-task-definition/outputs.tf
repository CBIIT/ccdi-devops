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
