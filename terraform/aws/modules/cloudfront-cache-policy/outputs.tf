output "comment" {
  value       = aws_cloudfront_cache_policy.this.comment
  description = "comment for this cache policy"
  sensitive   = false
}

output "default_ttl" {
  value       = aws_cloudfront_cache_policy.this.default_ttl
  description = "default time to live for this cache policy"
  sensitive   = false
}

output "etag" {
  value       = aws_cloudfront_cache_policy.this.etag
  description = "etag for this cache policy"
  sensitive   = false
}

output "id" {
  value       = aws_cloudfront_cache_policy.this.id
  description = "id for this cache policy"
  sensitive   = false
}

output "max_ttl" {
  value       = aws_cloudfront_cache_policy.this.max_ttl
  description = "max time to live for this cache policy"
  sensitive   = false
}

output "min_ttl" {
  value       = aws_cloudfront_cache_policy.this.min_ttl
  description = "min time to live for this cache policy"
  sensitive   = false
}

output "name" {
  value       = aws_cloudfront_cache_policy.this.name
  description = "name for this cache policy"
  sensitive   = false
}

output "parameters_in_cache_key_and_forwarded_to_origin" {
  value       = aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin
  description = "parameters in cache key and forwarded to origin for this cache policy"
  sensitive   = false
}
