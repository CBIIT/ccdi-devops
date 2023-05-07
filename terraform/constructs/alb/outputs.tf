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
