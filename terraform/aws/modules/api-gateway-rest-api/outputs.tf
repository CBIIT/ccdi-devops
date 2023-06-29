output "arn" {
  value       = aws_api_gateway_rest_api.this.arn
  description = "arn of the api gateway resource"
  sensitive   = false
}

output "created_date" {
  value       = aws_api_gateway_rest_api.this.created_date
  description = "creation date of the api gateway resource"
  sensitive   = false
}

output "execution_arn" {
  value       = aws_api_gateway_rest_api.this.execution_arn
  description = "execution arn of the api gateway resource"
  sensitive   = false
}

output "id" {
  value       = aws_api_gateway_rest_api.this.id
  description = "id of the api gateway resource"
  sensitive   = false
}

output "name" {
  value       = aws_api_gateway_rest_api.this.name
  description = "name of the api gateway resource"
  sensitive   = false
}

output "root_resource_id" {
  value       = aws_api_gateway_rest_api.this.root_resource_id
  description = "root resource id of the api gateway resource"
  sensitive   = false
}
