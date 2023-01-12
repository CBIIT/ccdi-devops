output "alb_id" {
  value = module.alb.id
}

output "alb_arn" {
  value = module.alb.arn
}

output "alb_domain_name" {
  value = module.alb.dns_name
}

output "securitygroup_id" {
  value = module.security_group.id
}

output "security_group_arn" {
  value = module.security_group.arn
}

#output "https_listener_arn" {
#  value       = module.alb.https_listener_arn
#  description = "The HTTPS listener ARN"
#}

output "frontend_target_group_arn" {
  value = module.frontend_target_group.arn
}

output "backend_target_group_arn" {
  value = module.backend_target_group.arn
}