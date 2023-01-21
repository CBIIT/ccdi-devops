output "id" {
  value       = aws_s3_bucket.s3.id
  description = "The S3 Bucket ID"
}

output "arn" {
  value       = aws_s3_bucket.s3.arn
  description = "The S3 Bucket ARN"
}

output "bucket" {
  value       = aws_s3_bucket.s3.bucket
  description = "The S3 Bucket name (bucket)"
}


output "bucket_regional_domain_name" {
  value = aws_s3_bucket.s3.bucket_regional_domain_name 
  description = "the s3 bucket domain name"
}