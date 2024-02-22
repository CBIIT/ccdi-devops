locals {
  lifecycle_config_arn            = var.create_lifecycle_config ? aws_sagemaker_notebook_instance_lifecycle_configuration.this[0].arn : "lifecycle config was not created"
  lifecycle_config_name           = var.create_lifecycle_config ? aws_sagemaker_notebook_instance_lifecycle_configuration.this[0].name : "lifecycle config was not created"
  lifecycle_config_onstart_script = var.create_lifecycle_config ? aws_sagemaker_notebook_instance_lifecycle_configuration.this[0].on_start : "lifecycle config was not created"
  permissions_boundary_arn        = var.attach_permissions_boundary ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/PermissionBoundary_PowerUser" : null

}