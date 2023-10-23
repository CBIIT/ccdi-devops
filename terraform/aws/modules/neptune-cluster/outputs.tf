output "arn" {
  value       = aws_neptune_cluster.this.arn
  description = "the neptune cluster arn"
  sensitive   = false
}

output "cluster_identifier" {
  value       = aws_neptune_cluster.this.cluster_identifier
  description = "the neptune cluster identifier"
  sensitive   = false
}

output "cluster_members" {
  value       = aws_neptune_cluster.this.cluster_members
  description = "the neptune cluster members"
  sensitive   = false
}

output "cluster_resource_id" {
  value       = aws_neptune_cluster.this.cluster_resource_id
  description = "the neptune cluster resource id"
  sensitive   = false
}

output "endpoint" {
  value       = aws_neptune_cluster.this.endpoint
  description = "the neptune cluster endpoint"
  sensitive   = false
}

output "id" {
  value       = aws_neptune_cluster.this.id
  description = "the neptune cluster id"
  sensitive   = false
}

output "port" {
  value       = aws_neptune_cluster.this.port
  description = "the neptune cluster port"
  sensitive   = false
}

output "reader_endpoint" {
  value       = aws_neptune_cluster.this.reader_endpoint
  description = "the neptune cluster reader endpoint"
  sensitive   = false
}

output "kms_key_arn" {
  value       = aws_kms_key.this.arn
  description = "the neptune cluster kms key arn"
  sensitive   = false
}

output "kms_key_id" {
  value       = aws_kms_key.this.key_id
  description = "the neptune cluster kms key id"
  sensitive   = false
}

output "kms_alias_arn" {
  value       = aws_kms_alias.this.arn
  description = "the neptune cluster kms key alias arn"
  sensitive   = false
}

output "kms_alias_id" {
  value       = aws_kms_alias.this.id
  description = "the neptune cluster kms key alias id"
  sensitive   = false
}

output "kms_alias_name" {
  value       = aws_kms_alias.this.name
  description = "the neptune cluster kms key alias name"
  sensitive   = false
}
