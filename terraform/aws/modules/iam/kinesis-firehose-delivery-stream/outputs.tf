output "arn" {
  value       = aws_iam_role.this.arn
  description = "arn of the iam role"
  sensitive   = false
}

output "id" {
  value       = aws_iam_role.this.id
  description = "id of the iam role"
  sensitive   = false
}

output "name" {
  value       = aws_iam_role.this.name
  description = "name of the iam role"
  sensitive   = false
}
