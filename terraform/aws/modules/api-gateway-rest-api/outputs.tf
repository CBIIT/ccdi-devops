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

output "stage_arn" {
  value       = aws_api_gateway_stage.this.arn
  description = "arn of the api gateway stage resource"
  sensitive   = false
}

output "stage_id" {
  value       = aws_api_gateway_stage.this.id
  description = "id of the api gateway stage resource"
  sensitive   = false
}

output "stage_invoke_url" {
  value       = aws_api_gateway_stage.this.invoke_url
  description = "url to invoke the api pointing to the stage"
  sensitive   = false
}

output "stage_execution_arn" {
  value       = aws_api_gateway_stage.this.execution_arn
  description = "execution arn to be used in lambda_permission's source_arn when allowing api gateway to invoke a lambda function"
  sensitive   = false
}

output "stage_name" {
  value       = aws_api_gateway_stage.this.stage_name
  description = "name of the api gateway stage resource"
  sensitive   = false
}

output "stage_web_acl_arn" {
  value       = aws_api_gateway_stage.this.web_acl_arn
  description = "arn of the web acl associated with the stage"
  sensitive   = false
}

output "access_log_group_arn" {
  value       = aws_cloudwatch_log_group.access_logs.arn
  description = "arn of the access log group"
  sensitive   = false
}

output "access_log_group_id" {
  value       = aws_cloudwatch_log_group.access_logs.id
  description = "id of the access log group"
  sensitive   = false
}

output "access_log_group_name" {
  value       = aws_cloudwatch_log_group.access_logs.name
  description = "name of the access log group"
  sensitive   = false
}