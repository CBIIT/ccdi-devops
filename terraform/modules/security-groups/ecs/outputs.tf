output "ecs_security_group_id" {
  value = aws_security_group.app_sg.id
}

output "ecs_security_group_arn" {
  value = aws_security_group.app_sg.arn
}