output "name" {
  value       = aws_ecs_cluster.this.name
  description = "the name of the cluster"
}

output "id" {
  value       = aws_ecs_cluster.this.id
  description = "the id is the same as the arn for the cluster"
}

output "arn" {
  value       = aws_ecs_cluster.this.arn
  description = "the arn of the cluster"
}
