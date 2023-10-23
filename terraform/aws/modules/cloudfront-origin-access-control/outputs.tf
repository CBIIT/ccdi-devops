output "description" {
  value       = aws_cloudfront_origin_access_control.this.description
  description = "description of the origin access control"
  sensitive   = false
}

output "etag" {
  value       = aws_cloudfront_origin_access_control.this.etag
  description = "etag of the origin access control"
  sensitive   = false
}

output "id" {
  value       = aws_cloudfront_origin_access_control.this.id
  description = "id of the origin access control"
  sensitive   = false
}

output "name" {
  value       = aws_cloudfront_origin_access_control.this.name
  description = "name of the origin access control"
  sensitive   = false
}

output "origin_access_control_origin_type" {
  value       = aws_cloudfront_origin_access_control.this.origin_access_control_origin_type
  description = "type of origin that the origin access control applies to"
  sensitive   = false
}

output "signing_behavior" {
  value       = aws_cloudfront_origin_access_control.this.signing_behavior
  description = "signing behavior of the origin access control"
  sensitive   = false
}

output "signing_protocol" {
  value       = aws_cloudfront_origin_access_control.this.signing_protocol
  description = "signing protocol of the origin access control"
  sensitive   = false
}