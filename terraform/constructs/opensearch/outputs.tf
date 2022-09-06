output "securitygroup_id" {
  value = module.opensearch_security_group.id
}
output "opensearch_endpoint" {
  value = module.opensearch.endpoint
}

output "opensearch_arn" {
  value = module.opensearch.arn
}

output "opensearch_domain_id" {
  value = module.opensearch.domain_id
}

output "opensearch_domain_name" {
  value = module.opensearch.domain_name
}
