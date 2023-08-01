output "arn" {
  value       = aws_kms_key.this.arn
  description = "arn of the kms key"
  sensitive   = false
}

output "id" {
  value       = aws_kms_key.this.id
  description = "id of the kms key"
  sensitive   = false
}

output "key_id" {
  value       = aws_kms_key.this.key_id
  description = "key id of the kms key"
  sensitive   = false
}

output "alias_arn" {
  value       = aws_kms_alias.this.arn
  description = "arn of the kms key alias"
  sensitive   = false
}

output "alias_id" {
  value       = aws_kms_alias.this.id
  description = "id of the kms key alias"
  sensitive   = false
}

output "alias_name" {
  value       = aws_kms_alias.this.name
  description = "name of the kms key alias"
  sensitive   = false
}
