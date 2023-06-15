output "id" {
  value       = aws_s3_bucket_lifecycle_configuration.this.id
  description = "id of the bucket lifecycle configuration"
  sensitive   = false
}