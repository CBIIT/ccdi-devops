output "deployment_id" {
  value       = aws_api_gateway_deployment.this.id
  description = "id of the deployment"
  sensitive   = false
}

output "deployment_invoke_url" {
  value       = aws_api_gateway_deployment.this.invoke_url
  description = "url to invoke the api pointing to the stage"
  sensitive   = false
}

output "deployment_execution_arn" {
  value       = aws_api_gateway_deployment.this.execution_arn
  description = "execution arn to be used in lambda_permission's source_arn when allowing API Gateway to invoke a Lambda function"
  sensitive   = false
}

output "deployment_created_date" {
  value       = aws_api_gateway_deployment.this.created_date
  description = "creation date of the deployment"
  sensitive   = false
}
