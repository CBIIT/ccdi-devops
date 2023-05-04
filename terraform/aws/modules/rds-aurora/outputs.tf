
output "security_group_arn" {
  value       = aws_security_group.this[0].arn
  description = "arn of the security group - if create_security_group is true"
  sensitive   = false
}

output "security_group_id" {
  value       = aws_security_group.this[0].id
  description = "id of the security group - if create_security_group is true"
  sensitive   = false
}

output "security_group_name" {
  value       = aws_security_group.this[0].name
  description = "name of the security group - if create_security_group is true"
  sensitive   = false
}

output "rds_cluster_arn" {
  value     = aws_rds_cluster.this.arn
  sensitive = false
}
output "rds_cluster_id" {
  value     = aws_rds_cluster.this.id
  sensitive = false
}
output "rds_cluster_identifier" {
  value     = aws_rds_cluster.this.cluster_identifier
  sensitive = false
}
output "rds_cluster_endpoint" {
  value     = aws_rds_cluster.this.endpoint
  sensitive = false
}
output "rds_cluster_port" {
  value     = aws_rds_cluster.this.port
  sensitive = false
}
output "rds_cluster_db_name" {
  value     = aws_rds_cluster.this.database_name
  sensitive = false
}
output "rds_cluster_master_username" {
  value     = aws_rds_cluster.this.master_username
  sensitive = false
}
output "rds_cluster_instance_arn" {
  value     = aws_rds_cluster_instance.this.arn
  sensitive = false
}
output "rds_cluster_instance_id" {
  value     = aws_rds_cluster_instance.this.id
  sensitive = false
}
output "rds_cluster_instance_identifier" {
  value     = aws_rds_cluster_instance.this.cluster_identifier
  sensitive = false
}
output "rds_cluster_instance_endpoint" {
  value     = aws_rds_cluster_instance.this.endpoint
  sensitive = false
}
output "rds_cluster_instance_port" {
  value     = aws_rds_cluster_instance.this.port
  sensitive = false
}

output "rds_password" {
  value     = random_password.master_password.result
  sensitive = true
}