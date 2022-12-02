output "name" {
  value       = aws_security_group.this.name
  description = "the security group name"
  sensitive   = false
}

output "id" {
  value       = aws_security_group.this.id
  description = "the security group id"
  sensitive   = false
}

output "arn" {
  value       = aws_security_group.this.arn
  description = "the security group arn"
  sensitive   = false
}