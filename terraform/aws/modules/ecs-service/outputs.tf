output "id" {
  value = aws_ecs_service.this.id
  description = "id of the service"
}

output "name" {
  value = aws_ecs_service.this.name
  description = "name of the service"
}
