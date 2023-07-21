output "arn" {
  value       = aws_lambda_function.this.arn
  description = "the arn of the lambda function"
  sensitive   = false
}

output "description" {
  value       = aws_lambda_function.this.description
  description = "the description of the lambda function"
  sensitive   = false
}

output "filename" {
  value       = aws_lambda_function.this.filename
  description = "the filename of the lambda function"
  sensitive   = false
}

output "function_name" {
  value       = aws_lambda_function.this.function_name
  description = "the name of the lambda function"
  sensitive   = false
}

output "handler" {
  value       = aws_lambda_function.this.handler
  description = "the handler of the lambda function"
  sensitive   = false
}

output "id" {
  value       = aws_lambda_function.this.id
  description = "the id of the lambda function"
  sensitive   = false
}

output "image_uri" {
  value       = aws_lambda_function.this.image_uri
  description = "the image uri of the lambda function"
  sensitive   = false
}

output "invoke_arn" {
  value       = aws_lambda_function.this.invoke_arn
  description = "the invoke arn of the lambda function"
  sensitive   = false
}

output "last_modified" {
  value       = aws_lambda_function.this.last_modified
  description = "the last modified date of the lambda function"
  sensitive   = false
}

output "memory_size" {
  value       = aws_lambda_function.this.memory_size
  description = "the memory size of the lambda function"
  sensitive   = false
}

output "qualified_arn" {
  value       = aws_lambda_function.this.qualified_arn
  description = "the qualified arn of the lambda function"
  sensitive   = false
}

output "qualified_invoke_arn" {
  value       = aws_lambda_function.this.qualified_invoke_arn
  description = "the qualified invoke arn of the lambda function"
  sensitive   = false
}

output "role" {
  value       = aws_lambda_function.this.role
  description = "the role of the lambda function"
  sensitive   = false
}

output "version" {
  value       = aws_lambda_function.this.version
  description = "the version of the lambda function"
  sensitive   = false
}
