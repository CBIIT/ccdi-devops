resource "aws_sagemaker_notebook_instance" "this" {
  name                   = "${var.resource_prefix}-neptune-notebook"
  direct_internet_access = var.direct_internet_access
  instance_type          = var.instance_type
  platform_identifier    = var.platform_identifier
  role_arn               = var.role_arn
  root_access            = var.root_access
  security_groups        = var.security_groups
  subnet_id              = var.subnet_id 
  volume_size            = var.volume_size

  instance_metadata_service_configuration {
    minimum_instance_metadata_service_version = var.minimum_instance_metadata_service_version
  }
}

resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "this" {
  name     = "${var.resource_prefix}-neptune-notebook-lifecycle-config"
  on_start = data.template_file.this.rendered
}

data "template_file" "this" {
  template = filebase64("${path.module}/templates/on-start.sh")

  vars = {
    graph_notebook_auth_mode      = var.graph_notebook_auth_mode
    graph_notebook_host           = var.graph_notebook_host
    graph_notebook_port           = var.graph_notebook_port
    neptune_load_from_s3_role_arn = var.role_arn
    aws_region                    = data.aws_region.this.name
  }
}
