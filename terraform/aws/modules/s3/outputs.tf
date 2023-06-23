output "access_point_alias" {
  value       = local.access_point_alias
  description = "alias of the access point"
  sensitive = false
}

output "access_point_arn" {
  value       = local.access_point_arn
  description = "arn of the access point if access point was created"
  sensitive = false
}

output "access_point_domain_name" {
  value       = local.access_point_domain_name
  description = "domain name of the access point if access point was created"
  sensitive = false
}

output "access_point_endpoints" {
  value       = local.access_point_endpoints
  description = "endpoints of the access point if access point was created"
  sensitive = false
}

output "access_point_id" {
  value       = local.access_point_id
  description = "id of the access point if access point was created"
  sensitive = false
}

output "access_point_name" {
  value       = local.access_point_name
  description = "name of the access point if access point was created"
  sensitive = false
}

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

