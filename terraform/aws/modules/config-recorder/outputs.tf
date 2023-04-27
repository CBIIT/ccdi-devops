output "id" {
  value       = aws_config_configuration_recorder.this.id
  description = "id of the aws config configuration recorder"
  sensitive   = false
}

output "name" {
  value       = aws_config_configuration_recorder.this.name
  description = "name of the aws config configuration recorder"
  sensitive   = false
}

output "role_arn" {
  value       = module.role.arn
  description = "arn of the aws config configuration recorder role"
  sensitive   = false
}