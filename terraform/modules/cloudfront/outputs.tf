output "cloudfront_distribution_id" {
  description = "The identifier for the distribution."
  value       = try(aws_cloudfront_distribution.this[0].id, "")
}

output "cloudfront_distribution_arn" {
  description = "The ARN (Amazon Resource Name) for the distribution."
  value       = try(aws_cloudfront_distribution.this[0].arn, "")
}

output "cloudfront_distribution_caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the distribution configuration."
  value       = try(aws_cloudfront_distribution.this[0].caller_reference, "")
}

output "cloudfront_distribution_status" {
  description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
  value       = try(aws_cloudfront_distribution.this[0].status, "")
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = try(aws_cloudfront_distribution.this[0].domain_name, "")
}

output "cloudfront_distribution_last_modified_time" {
  description = "The date and time the distribution was last modified."
  value       = try(aws_cloudfront_distribution.this[0].last_modified_time, "")
}