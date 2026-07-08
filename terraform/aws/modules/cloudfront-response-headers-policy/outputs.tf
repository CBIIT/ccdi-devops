output "comment" {
  value       = aws_cloudfront_response_headers_policy.this.comment
  description = "comment for this response headers policy"
  sensitive   = false
}

output "cors_config" {
  value       = aws_cloudfront_response_headers_policy.this.cors_config
  description = "cors config for this response headers policy"
  sensitive   = false
}

output "etag" {
  value       = aws_cloudfront_response_headers_policy.this.etag
  description = "etag for this response headers policy"
  sensitive   = false
}

output "id" {
  value       = aws_cloudfront_response_headers_policy.this.id
  description = "id for this response headers policy"
  sensitive   = false
}

output "name" {
  value       = aws_cloudfront_response_headers_policy.this.name
  description = "name for this response headers policy"
  sensitive   = false
}