output "arn" {
  value       = aws_iam_role.this.arn
  description = "arn of the opensearch role"
  sensitive   = false
}

output "id" {
  value       = aws_iam_role.this.id
  description = "id of the opensearch role"
  sensitive   = false
}

output "name" {
  value       = aws_iam_role.this.name
  description = "name of the opensearch role"
  sensitive   = false
}