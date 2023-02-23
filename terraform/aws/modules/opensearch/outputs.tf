output "arn" {
  value       = aws_opensearch_domain.this.arn
  description = "arn of the opensearch domain"
}

output "domain_id" {
  value       = aws_opensearch_domain.this.domain_id
  description = "domain_id of the opensearch domain"
}

output "domain_name" {
  value       = aws_opensearch_domain.this.domain_name
  description = "domain name of the opensearch domain"
}

output "endpoint" {
  value       = aws_opensearch_domain.this.endpoint
  description = "domain-specific endpoint used to submit index, search, and data upload requests"
}

output "id" {
  value       = aws_opensearch_domain.this.id
  description = "id of the opensearch domain"
}

output "security_group_arn" {
  value       = aws_security_group.this[0].arn
  description = "arn of the security group if created by this module"
}

output "security_group_id" {
  value       = aws_security_group.this[0].id
  description = "id of the security group if created by this module"
}