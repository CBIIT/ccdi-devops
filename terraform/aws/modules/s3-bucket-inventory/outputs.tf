output "id" {
  value       = aws_s3_bucket_inventory.this.id
  description = "id of the inventory configuration"
  sensitive   = false
}

output "name" {
  value       = aws_s3_bucket_inventory.this.name
  description = "name of the inventory configuration"
  sensitive   = false
}
  