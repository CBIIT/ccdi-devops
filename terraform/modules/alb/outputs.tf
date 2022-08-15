output "id" {
  value = aws_lb.alb.id
}

output "arn" {
  value = aws_lb.alb.arn
}

output "arn_suffix" {
  value = aws_lb.alb.arn_suffix
}

output "dns_name" {
  value = aws_lb.alb.dns_name
}

output "http_listener_arn" {
  value = aws_lb_listener.http.arn
  description = "The HTTP listener ARN"
}

output "https_listener_arn" {
  value = aws_lb_listener.https.arn
  description = "The HTTPS listener ARN"
}
