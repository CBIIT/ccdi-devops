resource "aws_sagemaker_notebook_instance" "this" {
  name                   = "aws-neptune-${var.resource_prefix}-notebook"
  direct_internet_access = var.direct_internet_access
  instance_type          = var.instance_type
  platform_identifier    = var.platform_identifier
  role_arn               = var.role_arn
  root_access            = var.root_access
  security_groups        = var.security_groups
  subnet_id              = var.subnet_id
  volume_size            = var.volume_size
  lifecycle_config_name  = aws_sagemaker_notebook_instance_lifecycle_configuration.this[0].name

  instance_metadata_service_configuration {
    minimum_instance_metadata_service_version = var.minimum_instance_metadata_service_version
  }
}

resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "this" {
  count = var.create_lifecycle_config ? 1 : 0

  name = "aws-neptune-${var.resource_prefix}-notebook-lifecycle-config"
  on_start = templatefile("${path.module}/templates/on-start.sh", {
    graph_notebook_auth_mode      = var.graph_notebook_auth_mode
    graph_notebook_host           = var.graph_notebook_host
    graph_notebook_port           = var.graph_notebook_port
    neptune_load_from_s3_role_arn = var.role_arn
    aws_region                    = data.aws_region.this.name
  })
}
