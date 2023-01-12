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

output "s3_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.s3.bucket_domain_name
}