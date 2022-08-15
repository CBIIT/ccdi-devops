output "id" {
  value       = module.s3.id
  description = "The S3 Bucket ID"
}

output "arn" {
  value = module.s3.arn 
  description = "The S3 Bucket ARN"
}