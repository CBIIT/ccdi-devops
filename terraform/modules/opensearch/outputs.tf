output "opensearch_endpoint" {
  value = aws_opensearch_domain.os.endpoint
}

output "opensearch_arn" {
  value = aws_opensearch_domain.os.arn
}

output "opensearch_domain_id" {
  value = aws_opensearch_domain.os.domain_id
}

output "opensearch_domain_name" {
  value = aws_opensearch_domain.os.domain_name
}