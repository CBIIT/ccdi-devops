output "arn" {
  value       = aws_lb.this.arn
  description = "arn of the load balancer"
  sensitive   = false
}

output "arn_suffix" {
  value       = aws_lb.this.arn_suffix
  description = "arn suffix of the load balancer"
  sensitive   = false
}

output "dns_name" {
  value       = aws_lb.this.dns_name
  description = "dns name of the load balancer"
  sensitive   = false
}

output "http_listener_arn" {
  value       = aws_lb_listener.http[0].arn
  description = "arn of the http listener"
  sensitive   = false
}

output "http_listener_id" {
  value       = aws_lb_listener.http[0].id
  description = "id of the http listener"
  sensitive   = false
}

output "https_listener_arn" {
  value       = aws_lb_listener.https[0].arn
  description = "arn of the https listener"
  sensitive   = false
}

output "https_listener_id" {
  value       = aws_lb_listener.https[0].id
  description = "id of the https listener"
  sensitive   = false
}

output "id" {
  value       = aws_lb.this.id
  description = "id of the load balancer"
  sensitive   = false
}

output "name" {
  value       = aws_lb.this.name
  description = "name of the load balancer"
  sensitive   = false
}

output "security_group_arn" {
  value       = local.security_group_arn
  description = "arn of the security group if created by this module"
  sensitive   = false
}

output "security_group_id" {
  value       = local.security_group_id
  description = "id of the security group if created by this module"
  sensitive   = false
}
