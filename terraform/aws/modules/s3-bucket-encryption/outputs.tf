output "id" {
  value       = aws_s3_bucket_server_side_encryption_configuration.this.id
  description = "id of the s3 bucket server side encryption configuration"
  sensitive   = false
}

output "kms_arn" {
  value       = aws_kms_key.this[0].arn
  description = "arn of the kms key used to encrypt the s3 bucket"
  sensitive   = false
}

output "kms_id" {
  value       = aws_kms_key.this[0].id
  description = "id of the kms key used to encrypt the s3 bucket"
  sensitive   = false
}

output "kms_key_id" {
  value       = aws_kms_key.this[0].key_id
  description = "key id of the kms key used to encrypt the s3 bucket"
  sensitive   = false
}

