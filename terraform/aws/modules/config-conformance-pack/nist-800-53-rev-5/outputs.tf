output "arn" {
  value       = aws_config_conformance_pack.this.arn
  description = "arn of the config conformance pack"
  sensitive   = false
}

output "id" {
  value       = aws_config_conformance_pack.this.id
  description = "id of the config conformance pack"
  sensitive   = false
}

output "name" {
  value       = aws_config_conformance_pack.this.name
  description = "name of the config conformance pack"
  sensitive   = false
}