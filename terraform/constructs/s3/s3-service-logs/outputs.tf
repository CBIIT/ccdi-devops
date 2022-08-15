output "id" {
  value       = module.s3.id
  description = "The S3 Bucket ID"
}

output "arn" {
  value       = module.s3.arn
  description = "The S3 Bucket ARN"
}

output "bucket" {
  value       = module.s3.bucket
  description = "The S3 Bucket name (bucket)"
}
