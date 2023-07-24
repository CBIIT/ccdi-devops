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
