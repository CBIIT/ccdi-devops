output "arn" {
  value     = aws_ecs_cluster.this.arn
  sensitive = false
}

output "id" {
  value     = aws_ecs_cluster.this.id
  sensitive = false
}

output "name" {
  value     = aws_ecs_cluster.this.name
  sensitive = false
}
