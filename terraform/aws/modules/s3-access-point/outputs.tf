output "alias" {
  value       = aws_s3_access_point.this.alias
  description = "dns alias of the access point"
  sensitive   = false
}

output "arn" {
  value       = aws_s3_access_point.this.arn
  description = "The arn of the access point"
  sensitive   = false
}

output "bucket" {
  value       = aws_s3_access_point.this.bucket
  description = "name of the bucket associated with this access point"
  sensitive   = false
}

output "domain_name" {
  value       = aws_s3_access_point.this.domain_name
  description = "the fully qualified domain name of the access point"
  sensitive   = false
}

output "endpoints" {
  value       = aws_s3_access_point.this.endpoints
  description = "the list of endpoints for the access point"
  sensitive   = false

}

output "id" {
  value       = aws_s3_access_point.this.id
  description = "the id of the access point"
  sensitive   = false
}

output "name" {
  value       = aws_s3_access_point.this.name
  description = "the name of the access point"
  sensitive   = false
}