output "ecs_arn" {
  value = module.ecs_cluster.arn
}

output "securitygroup_id" {
  value = module.security_group.ecs_security_group_id
}