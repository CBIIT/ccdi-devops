output "arn" {
  value       = aws_sagemaker_notebook_instance.this.arn
  description = "the arn of the notebook instance"
  sensitive   = false
}

output "id" {
  value       = aws_sagemaker_notebook_instance.this.id
  description = "the id of the notebook instance"
  sensitive   = false
}

output "kms_key_id" {
  value       = aws_sagemaker_notebook_instance.this.kms_key_id
  description = "the kms key id of the notebook instance"
  sensitive   = false
}

output "name" {
  value       = aws_sagemaker_notebook_instance.this.name
  description = "the name of the notebook instance"
  sensitive   = false
}

output "network_interface_id" {
  value       = aws_sagemaker_notebook_instance.this.network_interface_id
  description = "the network interface id of the notebook instance"
  sensitive   = false
}

output "role_arn" {
  value       = aws_sagemaker_notebook_instance.this.role_arn
  description = "the role arn of the notebook instance"
  sensitive   = false
}

output "url" {
  value       = aws_sagemaker_notebook_instance.this.url
  description = "the url of the notebook instance"
  sensitive   = false
}

output "lifecycle_config_arn" {
  value       = local.lifecycle_config_arn
  description = "the arn of the lifecycle configuration"
  sensitive   = false
}

output "lifecycle_config_name" {
  value       = local.lifecycle_config_name
  description = "the name of the lifecycle configuration"
  sensitive   = false
}

output "lifecycle_config_onstart_script" {
  value       = local.lifecycle_config_onstart_script
  description = "the on start script of the lifecycle configuration"
  sensitive   = false
}
