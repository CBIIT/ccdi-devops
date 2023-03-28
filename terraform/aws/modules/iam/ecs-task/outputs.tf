output "arn" {
  value       = aws_iam_role.this.arn
  description = "arn of the task role if one was created"
  sensitive   = false
}

output "id" {
  value       = aws_iam_role.this.id
  description = "id of the task role if one was created"
  sensitive   = false
}

output "name" {
  value       = aws_iam_role.this.name
  description = "name of the task role if one was created"
  sensitive   = false
}
