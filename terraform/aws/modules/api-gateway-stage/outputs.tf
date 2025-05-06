output "deployment_execution_arn" {
  value       = aws_api_gateway_deployment.this.execution_arn
  description = "the execution arn of the api gateway deployment"
  sensitive   = false
}

output "deployment_id" {
  value       = aws_api_gateway_deployment.this.id
  description = "the id of the api gateway deployment"
  sensitive   = false
}

output "deployment_invoke_url" {
  value       = aws_api_gateway_deployment.this.invoke_url
  description = "the invoke url of the api gateway deployment"
  sensitive   = false
}

output "stage_arn" {
  value       = aws_api_gateway_stage.this.arn
  description = "the arn of the api gateway stage"
  sensitive   = false
}

output "stage_execution_arn" {
  value       = aws_api_gateway_stage.this.execution_arn
  description = "the execution arn of the api gateway stage"
  sensitive   = false
}

output "stage_id" {
  value       = aws_api_gateway_stage.this.id
  description = "the id of the api gateway stage"
  sensitive   = false
}

output "stage_name" {
  value       = aws_api_gateway_stage.this.stage_name
  description = "the name of the api gateway stage"
  sensitive   = false
}
