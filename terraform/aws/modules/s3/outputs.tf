output "arn" {
  value       = aws_s3_bucket.this.arn
  description = "arn of the s3 bucket"
}

output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "name of the s3 bucket"
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "domain name of the s3 bucket"
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.this.bucket_regional_domain_name
  description = "regional domain name of the s3 bucket"
}

output "id" {
  value       = aws_s3_bucket.this.id
  description = "id of the s3 bucket"
}

